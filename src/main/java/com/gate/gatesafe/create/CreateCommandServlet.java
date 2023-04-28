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

@WebServlet(name = "createCommandServlet", value = "/createCommand")
public class CreateCommandServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nameProduct = request.getParameter("product");
        String priceProduct = request.getParameter("price");
        String numberProduct = request.getParameter("quantity");
        String nameCustomer = request.getParameter("name");
        String phoneCustomer = request.getParameter("phone");
        String addressCustomer = request.getParameter("address");

        String idProduct = request.getParameter("id");
        String current_user = request.getRemoteUser();
        String idCustomer = "CL";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/webgate", "root", "");

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select count(*) from products where name = '"+ nameProduct +"' and quantity >= '"+ numberProduct +"'");
            rs.next();
            String Count = rs.getString(1);

            if(Count.equals("0")) {

                if (current_user == null) {

                    response.sendRedirect(request.getContextPath() + "/redirect.jsp");

                } else {
                    rs = st.executeQuery("select count(*) from customer");
                    rs.next();
                    int tmp = rs.getInt(1) + 1;
                    idCustomer += Integer.toString(tmp);

                    rs = st.executeQuery("select id_user from users where name ='" + current_user + "'");
                    rs.next();
                    String current_user_id = rs.getString(1);

                    rs = st.executeQuery("select count(*) from customer where name = '"+ nameCustomer +"' and phone = '"+ phoneCustomer +"' and adress = '"+ addressCustomer +"' ");
                    rs.next();
                    int a = rs.getInt(1);

                    if (a == 0) {
                        a = st.executeUpdate("insert into customer (id_customer, name, phone, adress, id_partner) values ('" + idCustomer + "', '" + nameCustomer + "', '" + phoneCustomer + "', '" + addressCustomer + "', '" + current_user_id + "')");
                    }

                    String activity = "Create Customer";
                    Activity log = new Activity(current_user_id, activity, idCustomer);
                    String description = log.getDescription();
                    Date date = log.getDate();
                    int status = 0;
                    int i = st.executeUpdate("insert into commands (status, quantity, date_command, id_product, id_customer, id_partner) values ('" + status + "', '"+ numberProduct +"' ,'" + date + "','" + idProduct + "', '"+ idCustomer +"' ,'" + current_user_id + "')");

                    if (i > 0) {
                        i = st.executeUpdate("insert into activity (author, type, description, date_log, concern) values ('" + current_user_id + "', '" + activity + "', '" + description + "', '" + date + "', '" + idProduct + "')");
                    }
                    response.sendRedirect(request.getContextPath() + "/partners/view-products.jsp");
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
