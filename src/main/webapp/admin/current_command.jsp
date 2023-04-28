<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%--
  Created by IntelliJ IDEA.
  User: NASH
  Date: 08/11/2022
  Time: 03:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp"/>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="sidebar.jsp"/>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <jsp:include page="topbar.jsp"/>

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">Current Commands</h1>
                    <div class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm text-uppercase">
                        <i class="fas fa-user-circle fa-sm text-white px-1" aria-hidden="true"> </i>
                        Administrator
                    </div>
                </div>

                <!-- Content Row -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Current Commands</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>ID Command</th>
                                    <th>Product</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Date</th>
                                    <th>Customer</th>
                                    <th>Address</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>ID Command</th>
                                    <th>Product</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Date</th>
                                    <th>Customer</th>
                                    <th>Address</th>
                                    <th>Action</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <%
                                    String user = request.getRemoteUser();

                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/webgate", "root", "");
                                        Statement st = con.createStatement();
                                        Statement state = con.createStatement();
                                        Statement state1 = con.createStatement();

                                        ResultSet rs;
                                        ResultSet result;
                                        ResultSet result1;

                                        int zero = 0;
                                        rs = st.executeQuery("select * from commands where status = '"+ zero +"' order by date_command desc ");

                                        while (rs.next()){
                                            String id_customer = rs.getString(7);
                                            String id_product = rs.getString(6);
                                            int val = rs.getInt(2);
                                            String status;

                                            if (val == 0) {

                                            } else {
                                                status = "deliver";
                                            }

                                            try {

                                                result = state.executeQuery("select * from customer where id_customer = '"+ id_customer +"'");
                                                result.next();

                                                result1 = state1.executeQuery("select * from products where id_product = '"+ id_product +"'");
                                                result1.next();

                                %>
                                <tr>
                                    <td><%= rs.getString(1) %></td>
                                    <td><%= result1.getString(3) %></td>
                                    <td><%= result1.getString(4) %></td>
                                    <td><%= rs.getString(3) %></td>
                                    <td><%= rs.getString(4) %></td>
                                    <td><%= result.getString(2) %></td>
                                    <td><%= result.getString(4) %></td>
                                    <td>
<%--                                        <a href="${pageContext.request.contextPath}/validateCommand?id=<%= rs.getString(1) %>" class="p-1 text-white rounded bg-gradient-success"><i class="fas fa-fw fa-check-square"></i></a>--%>
<%--                                        <a href="${pageContext.request.contextPath}/deleteCommand?id=<%= rs.getString(1) %>" class="p-1 text-white rounded bg-gradient-danger"><i class="fas fa-fw fa-trash-alt"></i></a>--%>
                                    </td>

                                </tr>
                                <%
                                            } catch (SQLException throwables) {
                                                throwables.printStackTrace();
                                            }
                                        }
                                        con.close();
                                    }
                                    catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Your Website 2022</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<jsp:include page="logoutScript.jsp"/>

<!-- Bootstrap core JavaScript-->
<jsp:include page="script.jsp"/>

</body>

</html>
