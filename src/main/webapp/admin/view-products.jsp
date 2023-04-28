<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: NASH
  Date: 01/11/2022
  Time: 06:38
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
                    <h1 class="h3 mb-0 text-gray-800">Products List</h1>
                    <div class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm text-uppercase">
                        <i class="fas fa-user-circle fa-sm text-white px-1" aria-hidden="true"> </i>
                        Administrator
                    </div>
                </div>

                <!-- Content Row -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Customers Managers</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>ID Product</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Description</th>
                                    <th>Category</th>
                                    <th>Sub-Category</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>ID Product</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Description</th>
                                    <th>Category</th>
                                    <th>Sub-Category</th>
                                    <th>Action</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <%
                                    String status = request.getParameter("category");

                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/webgate", "root", "");
                                        Statement st = con.createStatement();
                                        Statement state = con.createStatement();

                                        ResultSet rs;
                                        ResultSet result;

                                        if (status != null && status.equals("empty")) {
                                            int zero = 0;
                                            rs = st.executeQuery("select * from products where quantity = '"+ zero +"'");
                                        } else {
                                            rs = st.executeQuery("select * from products");
                                        }

                                        while (rs.next()){
                                            int id = rs.getInt(2);

                                            try {

                                                result = state.executeQuery("select * from catalog where id_catalog = '"+ id +"'");
                                                result.next();

                                %>
                                <tr>
                                    <td><%= rs.getString(1) %></td>
                                    <td><%= rs.getString(3) %></td>
                                    <td><%= rs.getString(4) %></td>
                                    <td><%= rs.getString(5) %></td>
                                    <td><%= rs.getString(6) %></td>
                                    <td><%= result.getString(2) %></td>
                                    <td><%= result.getString(3) %></td>
                                    <td class="text-center">
                                        <a href="#" data-id=<%= rs.getString(1) %> data-toggle="modal" data-target="#editModal" id="edit" class="p-1 text-white rounded bg-gradient-primary"><i class="fas fa-fw fa-edit"></i></a>
                                        <a href="${pageContext.request.contextPath}/deleteProduct?id=<%= rs.getString(1) %>" class="p-1 text-white rounded bg-gradient-danger"><i class="fas fa-fw fa-trash-alt"></i></a>
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
                    <span>Copyright &copy; Your Website 2021</span>
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
