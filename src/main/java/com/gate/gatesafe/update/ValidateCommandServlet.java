package com.gate.gatesafe.update;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

@WebServlet(name = "validateCommandServlet", value = "/validateCommand")
public class ValidateCommandServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idCommand = request.getParameter("id");
        String user = request.getRemoteUser();

        System.out.print("1");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/webgate", "root", "");

            Statement st = conn.createStatement();

            java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
            int val = 1;
            int i = st.executeUpdate("update commands set status = '"+ val +"', date_delivery = '"+ date +"' where id_command = '"+ idCommand +"'");

            System.out.print("2");

            if (i > 0) {
                ResultSet rs = st.executeQuery("select id_user from users where name = '" + user + "'");
                rs.next();
                String current_user_id = rs.getString(1);

                i = st.executeUpdate("insert into validate (id_command, id_manager) values ('" + idCommand + "', '" + current_user_id + "') ");
            }
            System.out.print("3");
            response.sendRedirect(request.getContextPath() + "/responsible_client/current_command.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}