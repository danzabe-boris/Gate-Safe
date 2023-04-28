package com.gate.gatesafe.jaas;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "logoutServlet", value = "/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        // Invalidate current HTTP session.
        // Will call JAAS LoginModule logout() method
        if (session != null) session.invalidate();

        String userName = request.getRemoteUser();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/webgate", "root", "");

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select id_user from users where name='"+ userName +"'");
            rs.next();

            String current_user = rs.getString(1);
            java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
            int i = st.executeUpdate("update login set date_logout = '"+ date +"' where id_user = '" + current_user + "' and date_login = date_logout");

            conn.close();

        } catch (Exception e) {
            System.out.print(e);
            e.printStackTrace();
        }


        // Redirect the user to the secure web page.
        // Since the user is now logged out the
        // authentication form will be shown
        response.sendRedirect(request.getContextPath() + "/redirect.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
