package com.gate.gatesafe.jaas;

import javax.security.auth.Subject;
import javax.security.auth.callback.*;
import javax.security.auth.login.LoginException;
import javax.security.auth.spi.LoginModule;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class GateLoginModule implements LoginModule {
    private CallbackHandler handler;
    private Subject subject;
    private UserPrincipal userPrincipal;
    private RolePrincipal rolePrincipal;
    private String login;
    private List<String> userGroups;

    @Override
    public void initialize(Subject subject, CallbackHandler callbackHandler, Map<String, ?> sharedState, Map<String, ?> options) {
        handler = callbackHandler;
        this.subject = subject;
    }

    @Override
    public boolean login() throws LoginException {
        Callback[] callbacks = new Callback[2];
        callbacks[0] = new NameCallback("login");
        callbacks[1] = new PasswordCallback("password", true);

        try {
            //Variable entrer dans la formulaire de login
            handler.handle(callbacks);
            String name = ((NameCallback) callbacks[0]).getName();
            String password = String.valueOf(((PasswordCallback) callbacks[1])
                    .getPassword());

            String role = null;
            String pass = null;
            String current_user;

            // Convertion du mot de password d'authentifiaction par le SHA-256
            try {
                PasswordSecure passwordSecure = new PasswordSecure(password);
                pass = passwordSecure.getPass();
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            }

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/webgate", "root", "");
                conn.setAutoCommit(false);

                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery("select id_user, role from users where name = '"+name+"' and password = '"+pass+"'");

                if (rs.next()){
                    current_user = rs.getString(1);
                    role = rs.getString(2);

                    java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
                    int i = st.executeUpdate("update login set date_logout = '"+ date +"' where id_user = '" + current_user + "' and date_login = date_logout");
                    i = st.executeUpdate("insert into login (id_user, date_login, date_logout) values ('"+ current_user +"', '"+ date +"', '"+ date +"')");
                }
                conn.commit();

                conn.close();
            } catch (Exception e) {
                System.out.print(e);
                e.printStackTrace();
            }

            if (role != null) {
                login = name;
                userGroups = new ArrayList<String>();
                userGroups.add(role);
                return true;
            }

            // If credentials are NOT OK we throw a LoginException
            throw new LoginException("Authentication failed");

        } catch (IOException e) {
            throw new LoginException(e.getMessage());
        } catch (UnsupportedCallbackException e) {
            throw new LoginException(e.getMessage());
        }
    }

    @Override
    public boolean commit() throws LoginException {
        userPrincipal = new UserPrincipal(login);
        subject.getPrincipals().add(userPrincipal);

        if (userGroups != null && userGroups.size() > 0) {
            for (String groupName : userGroups) {
                rolePrincipal = new RolePrincipal(groupName);
                subject.getPrincipals().add(rolePrincipal);
            }
        }

        return true;
    }

    @Override
    public boolean abort() throws LoginException {
        return false;
    }

    @Override
    public boolean logout() throws LoginException {
        subject.getPrincipals().remove(userPrincipal);
        subject.getPrincipals().remove(rolePrincipal);
        return true;
    }
}
