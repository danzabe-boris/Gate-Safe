package com.gate.gatesafe.create;

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

@WebServlet(name = "createCatalogServlet", value = "/createCatalog")
public class CreateCatalogServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryCatalog = request.getParameter("category");
        String subCategoryCatalog = request.getParameter("sub-category");
        String describeCatalog = request.getParameter("description");


        String current_user = request.getRemoteUser();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/webgate", "root", "");

            Statement st = conn.createStatement();

            ResultSet rs = st.executeQuery("select count(*) from catalog where category ='"+ categoryCatalog +"' and sub_category = '"+ subCategoryCatalog +"' ");
            rs.next();
            String Count = rs.getString(1);

            if(Count.equals("0") ) {

                rs = st.executeQuery("select id_user from users where name ='" + current_user + "'");
                rs.next();
                String current_user_id = rs.getString(1);


                int i = st.executeUpdate("insert into catalog (category, sub_category, description) values ('" + categoryCatalog + "', '"+ subCategoryCatalog +"', '"+ describeCatalog +"') ");

                response.sendRedirect(request.getContextPath() + "/admin/create-catalog.jsp");


                conn.close();

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
