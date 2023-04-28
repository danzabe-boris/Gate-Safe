package com.gate.gatesafe.delete;

import com.gate.gatesafe.log.Activity;

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

@WebServlet(name = "deleteProductServlet", value = "/deleteProduct")
public class DeleteProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("id");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/webgate", "root", "");
            conn.setAutoCommit(false);

            Statement st = conn.createStatement();
            int a = st.executeUpdate("delete from catalog where id_product = '"+ productId +"'");

            int i = st.executeUpdate("delete from products where id_product = '"+ productId +"'");

            if (i > 0 && a > 0) {
                String user = request.getRemoteUser();

                ResultSet rs = st.executeQuery("select id_user from users where name = '"+ user +"'");
                rs.next();
                String current_user_id = rs.getString(1);

                String activity = "Delete Product";
                Activity log = new Activity(current_user_id, activity, productId);
                String description = log.getDescription();
                Date date = log.getDate();

                i = st.executeUpdate("insert into activity(author, type, description, date_log, concern) values ('" + current_user_id + "', '" + activity + "', '" + description + "', '" + date + "', '" + productId + "')");
            }

            conn.commit();

            response.sendRedirect(request.getContextPath() + "/admin/view-products.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
