package com.gate.gatesafe.create;

import com.gate.gatesafe.log.Activity;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

@WebServlet(name = "createProductServlet", value = "/createProduct")
public class CreateProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String imageProduct = request.getParameter("image");
        String nameProduct = request.getParameter("product");
        String priceProduct = request.getParameter("price");
        String numberProduct = request.getParameter("quantity");
        String describeProduct = request.getParameter("description");
        String categoryProduct = request.getParameter("category");
        String subCategoryProduct = request.getParameter("sub-category");

        if (imageProduct == null) {
            imageProduct = "../img/placeholder.png";
        }
        String idProduct = "PD";
        String current_user = request.getRemoteUser();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/webgate", "root", "");

            Statement st = conn.createStatement();

            ResultSet rs = st.executeQuery("select count(*) from products where name='"+ nameProduct +"'");
            rs.next();
            String Count = rs.getString(1);

            if(Count.equals("0")) {
                rs = st.executeQuery("select count(*) from products");
                rs.next();
                int tmp = rs.getInt(1) + 1;
                idProduct += Integer.toString(tmp);

                if (current_user == null) {

                    response.sendRedirect(request.getContextPath() + "/redirect.jsp");

                } else {
                    rs = st.executeQuery("select id_user from users where name ='" + current_user + "'");
                    rs.next();
                    String current_user_id = rs.getString(1);

                    rs = st.executeQuery("select id_catalog from catalog where category = '"+ categoryProduct +"' and sub_category = '"+ subCategoryProduct +"' ");
                    rs.next();
                    int idCatalog = rs.getInt(1);

                    String activity = "Create Product";
                    Activity log = new Activity(current_user_id, activity, idProduct);
                    String description = log.getDescription();
                    Date date = log.getDate();

                    int i = st.executeUpdate("insert into products (id_product, id_catalog, name, price, quantity, description, image) values ('" + idProduct + "', '"+ idCatalog +"' ,'" + nameProduct + "','" + priceProduct + "', '"+ numberProduct +"' ,'" + describeProduct + "','" + imageProduct + "')");

                    if (i > 0) {
                        i = st.executeUpdate("insert into activity (author, type, description, date_log, concern) values ('" + current_user_id + "', '" + activity + "', '" + description + "', '" + date + "', '" + idProduct + "')");
                    }
                    response.sendRedirect(request.getContextPath() + "/admin/create-product.jsp");
                }

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
