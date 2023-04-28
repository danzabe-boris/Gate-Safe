package com.gate.gatesafe.create;

import com.gate.gatesafe.log.Activity;
import com.gate.gatesafe.jaas.PasswordSecure;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.Date;

@WebServlet(name = "registerUserServlet", value = "/registerUser")
public class RegisterUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName=request.getParameter("user_name");
        String userEmail=request.getParameter("user_email");
        String userPassword=request.getParameter("user_password");
        String account=request.getParameter("user_account");

        String idUser;
        if (account.equals("partners")) {
            idUser = "PTN";
        } else if (account.equals("admin")) {
            idUser = "ADM";
        } else {
            idUser = "REC";
        }

        String pass=null;
        try {
            PasswordSecure password = new PasswordSecure(userPassword);
            pass=password.getPass();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        String current_user = request.getRemoteUser();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/webgate", "root", "");
            Statement st = conn.createStatement();

            String strQuery = "select count(*) from users where name='"+userName+"'";
            ResultSet rs = st.executeQuery(strQuery);
            rs.next();
            String Count = rs.getString(1);

            if(Count.equals("0")) {
                rs = st.executeQuery("select count(*) from users where role='" + account + "'");
                rs.next();
                int tpm = rs.getInt(1);
                tpm++;
                idUser += Integer.toString(tpm);

                if (current_user == null) {

                    int i = st.executeUpdate("insert into users(id_user, name, password, role, email) values ('" + idUser + "','" + userName + "','" + pass + "','" + account + "','" + userEmail + "')");
                    response.sendRedirect(request.getContextPath() + "/redirect.jsp");

                } else {
                    rs = st.executeQuery("select id_user from users where name='" + current_user + "'");
                    rs.next();

                    String current_user_id = rs.getString(1);
                    String activity = "Create User";
                    Activity trace = new Activity(current_user_id, activity, idUser);
                    String description = trace.getDescription();
                    Date date = trace.getDate();

                    int i = st.executeUpdate("insert into users(id_user, name, password, role, email) values ('" + idUser + "','" + userName + "','" + pass + "','" + account + "','" + userEmail + "')");

                    i = st.executeUpdate("insert into activity(author, type, description, date_log, concern) values ('" + current_user_id + "', '" + activity + "', '" + description + "', '" + date + "', '" + idUser + "')");

                    response.sendRedirect(request.getContextPath() + "/admin/create-user.jsp");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/register-error.jsp");
            }
            conn.close();
        } catch (Exception e) {
            System.out.print(e);
            e.printStackTrace();

        }
    }
}
