<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: NASH
  Date: 07/11/2022
  Time: 08:03
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
                    <h1 class="h3 mb-0 text-gray-800">Catalog</h1>
                    <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                        Partner Manager
                    </a>
                </div>

                <!-- Content Row -->
                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/webgate", "root", "");
                        Statement st = con.createStatement();

                        ResultSet rs;

                        rs = st.executeQuery("select distinct category from catalog");

                        while (rs.next()){

                %>
                <div>
                    <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary"><%= rs.getString(1) %></h6>

                        </div>
                        <!-- Card Body -->
                        <div class="card-body">

                            <div class="row">
                                <%
                                    try {
                                        String search =  rs.getString(1);
                                        Statement state = con.createStatement();
                                        ResultSet result = state.executeQuery("select * from catalog where category = '"+ search +"' ");

                                        while (result.next()) {

                                %>
                                <div class="col-6 col-lg-3">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="clearfix">
                                                <i class="fa fa-laptop bg-info p-3 font-2xl mr-3 float-left text-light"></i>
                                                <div class="h5 text-secondary mb-0 mt-1"><%= result.getString(3) %></div>
                                                <div class="text-muted font-xs small"></div>
                                            </div>
                                            <div class="b-b-1 pt-3 text-muted font-xs small"><%= result.getString(4) %></div>
                                            <hr>
                                            <div class="more-info pt-2" style="margin-bottom:-10px;">
                                                <a class="font-weight-bold font-xs btn-block text-muted small" href="view-product.jsp?sub-category=<%= result.getString(3) %>">View More <i class="fa fa-angle-right float-right font-lg"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%
                                        }
                                    }  catch (SQLException throwables) {
                                        throwables.printStackTrace();
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>

                <%
                        }
                        con.close();

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>

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
<jsp:include page="logout.jsp"/>

<!-- Bootstrap core JavaScript-->
<jsp:include page="script.jsp"/>

</body>

</html>
