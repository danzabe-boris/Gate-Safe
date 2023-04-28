<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: NASH
  Date: 08/11/2022
  Time: 00:16
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
                    <h1 class="h3 mb-0 text-gray-800">
                        Customers List
                    </h1>
                    <div class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm text-uppercase">
                        <i class="fas fa-user-circle fa-sm text-white px-1" aria-hidden="true"> </i>
                        Partner Manager
                    </div>
                </div>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Customers Managers</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>ID Customer</th>
                                    <th>Name</th>
                                    <th>Phone</th>
                                    <th>Address</th>
                                    <th>Current command</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>ID Customer</th>
                                    <th>Name</th>
                                    <th>Phone</th>
                                    <th>Address</th>
                                    <th>Current command</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <%
                                    try {
                                        String user = request.getRemoteUser();

                                        Class.forName("com.mysql.jdbc.Driver");
                                        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/webgate", "root", "");
                                        Statement st = con.createStatement();
                                        Statement state = con.createStatement();

                                        ResultSet rs = st.executeQuery("select * from customer where id_partner = (select id_user from users where name = '"+ user +"') ");
                                        ResultSet result;

                                        while (rs.next()){
                                            String id = rs.getString(1);
                                            int val = 0;
                                            try {
                                                result = state.executeQuery("select count(*) from commands where id_customer = '"+ id +"'  and status = '"+ val +"' ");
                                                result.next();

                                %>
                                <tr>
                                    <td><%= rs.getString(1) %></td>
                                    <td><%= rs.getString(2) %></td>
                                    <td><%= rs.getString(3) %></td>
                                    <td><%= rs.getString(4) %></td>
                                    <td><%= result.getInt(1) %></td>
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
<jsp:include page="logout.jsp"/>

<%--<script type="text/javascript">--%>
<%--    $(document).on("click", "#edit", function () {--%>
<%--        const user = $(this).data('id');--%>
<%--        $(".modal-body #modalID").val( user );--%>
<%--        // As pointed out in comments,--%>
<%--        // it is unnecessary to have to manually call the modal.--%>
<%--        // $('#addBookDialog').modal('show');--%>
<%--    });--%>
<%--</script>--%>

<!-- Bootstrap core JavaScript-->
<jsp:include page="script.jsp"/>

</body>

</html>
