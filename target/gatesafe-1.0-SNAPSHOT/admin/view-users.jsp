<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: NASH
  Date: 31/10/2022
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp"/>

<body id="page-top">
<%
    String search = request.getParameter("account");
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
                    <h1 class="h3 mb-0 text-gray-800">
                        <%
                            if (search.equals("partners")) {
                        %>
                        Partners List
                        <%
                            } else if (search.equals("customManager")) {
                        %>
                        Customers Managers List
                        <%
                            }
                        %>
                    </h1>
                    <div class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm text-uppercase">
                        <i class="fas fa-user-circle fa-sm text-white px-1" aria-hidden="true"> </i>
                        Administrator
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
                                    <th>ID User</th>
                                    <th>Username</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>ID User</th>
                                    <th>Username</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                    <th>Action</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <%
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/webgate", "root", "");
                                        Statement st = con.createStatement();

                                        ResultSet rs = st.executeQuery("select * from users where role = '"+ search +"' ");

                                        while (rs.next()){
                                %>
                                <tr>
                                    <td><%= rs.getString(1) %></td>
                                    <td><%= rs.getString(2) %></td>
                                    <td><%= rs.getString(5) %></td>
                                    <td><%= rs.getString(4) %></td>
                                    <td class="text-center">
                                        <a href="#" data-id=<%= rs.getString(1) %> data-toggle="modal" data-target="#editModal" id="edit" class="p-1 text-white rounded bg-gradient-primary"><i class="fas fa-fw fa-edit"></i></a>
                                        <a href="${pageContext.request.contextPath}/deleteUser?id=<%= rs.getString(1) %>&account=<%= search %>" class="p-1 text-white rounded bg-gradient-danger"><i class="fas fa-fw fa-trash-alt"></i></a>
                                    </td>
                                </tr>

                                <!-- Edit Modal-->
                                <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editLabel"
                                     aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="editLabel">Edit user information</h5>
                                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">×</span>
                                                </button>
                                            </div>
                                            <form class="" action="${pageContext.request.contextPath}/updateUser?account=<%= search %>" method="post">
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <label for="modalID">ID User</label>
                                                        <input type="text" class="form-control rounded" id="modalID" name="user_id" value=<%= rs.getString(1) %> disabled>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="modalName">Username</label>
                                                        <input type="text" class="form-control rounded" id="modalName" name="user_name" value=<%= rs.getString(2) %> disabled>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="modalEmail">Email</label>
                                                        <input type="email" class="form-control rounded" id="modalEmail" name="user_email" value=<%= rs.getString(5) %>>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="modalRole">New Password</label>
                                                        <input type="password" class="form-control rounded" id="modalRole" name="user_password">
                                                    </div>
                                                </div>

                                                <div class="modal-footer">
                                                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                                    <button class="btn btn-primary" type="submit" >Update</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

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
