<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: NASH
  Date: 05/11/2022
  Time: 22:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp"/>

<body id="page-top">
<%
    String username = request.getRemoteUser();
%>

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
                    <h1 class="h3 mb-0 text-gray-800">Activities Logs</h1>
                    <div class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm text-uppercase">
                        <i class="fas fa-user-circle fa-sm text-white px-1" aria-hidden="true"> </i>
                        Administrator
                    </div>
                </div>

                <!-- Content Row -->
                <div class="container-fluid">

                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Activity Report Logs</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" style="width: 100%" width="100%" cellspacing="0">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Author</th>
                                        <th>Action</th>
                                        <th>Description</th>
                                        <th>Date Activity</th>
                                        <th>Concern</th>
                                    </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th>ID</th>
                                        <th>Author</th>
                                        <th>Action</th>
                                        <th>Description</th>
                                        <th>Date Activity</th>
                                        <th>Concern</th>
                                    </tr>
                                    </tfoot>
                                    <tbody>
                                    <%
                                        try {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/webgate", "root", "");
                                            Statement st = con.createStatement();
                                            Statement state = con.createStatement();

                                            ResultSet rs = st.executeQuery("select * from activity order by date_log desc");
                                            while (rs.next()){
                                    %>
                                    <tr>
                                        <td><%= rs.getInt(1) %></td>
                                        <td><%= rs.getString(2) %></td>
                                        <td><%= rs.getString(3) %></td>
                                        <td><%= rs.getString(4) %></td>
                                        <td><%= rs.getDate(5) %></td>
                                        <td><%= rs.getString(6) %></td>

                                    </tr>
                                    <%
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
