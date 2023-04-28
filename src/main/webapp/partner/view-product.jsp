<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: Bonarchi
  Date: 03/11/2022
  Time: 10:54 am
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
                    <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                        Partner Manager
                    </a>
                </div>

                <!-- Content Row -->
                <div class="row">
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/webgate", "root", "");
                            Statement st = con.createStatement();
                            ResultSet rs;

                            String search = request.getParameter("sub-category");

                            if (search != null) {
                                rs = st.executeQuery("select * from products where id_catalog in ( select id_catalog from catalog where sub_category = '"+ search +"')");
                            } else {
                                rs = st.executeQuery("select * from products");
                            }

                            while (rs.next()){
                    %>
                    <div class="col-6 col-lg-3 my-2">
                        <div class="card">
                            <div class="card-body">
                                <div class="clearfix">
                                    <i class="fa fa-laptop bg-info p-3 font-2xl mr-3 float-left text-light"></i>
                                    <div class="h5 text-secondary mb-0 mt-1"><%= rs.getString(3) %></div>
                                    <div class="h6 text-muted text-uppercase font-weight-bold font-xs small"><%= rs.getString(4) %> Xaf</div>
                                </div>
<%--                                <div class="b-b-1 pt-3">Quantity: <%= rs.getString(5) %></div>--%>
                                <a href="command.jsp?id=<%= rs.getString(1) %>" class="text-decoration-none">
                                    <div class="b-b-1 pt-3 text-info">To Order</div>
                                </a>
                                <hr>
                                <div class="more-info pt-2" style="margin-bottom:-10px;">
                                    <div class="font-xs btn-block text-muted small">Description: <%= rs.getString(6) %></div>
                                </div>
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
<div class="modal fade" id="commandModal" tabindex="-1" role="dialog" aria-labelledby="commandLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="commandLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Command" to conform to buy this product</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/newCommand">Command</a>
            </div>
        </div>
    </div>
</div>

<!-- Logout Modal-->
<jsp:include page="logout.jsp"/>

<!-- Bootstrap core JavaScript-->
<jsp:include page="script.jsp"/>

</body>

</html>
