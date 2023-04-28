<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: NASH
  Date: 07/11/2022
  Time: 20:23
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
                    <h1 class="h3 mb-0 text-gray-800">New Command</h1>
                    <div class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm text-uppercase">
                        <i class="fas fa-user-circle fa-sm text-white px-1" aria-hidden="true"> </i>
                        Administrator
                    </div>
                </div>

                <!-- Content Row -->
                <div class="row justify-content-md-center">

                    <div class="col col-lg-8 p-5 shadow-lg">
                        <%
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/webgate", "root", "");
                                Statement st = con.createStatement();
                                ResultSet rs;

                                String search = request.getParameter("id");

                                rs = st.executeQuery("select * from products where id_product = '"+ search +"'");

                                if (rs.next()){
                        %>
                        <form method="post" id="registerForm" action="${pageContext.request.contextPath}/createCommand?id=<%= rs.getString(1) %>" class="user">

                            <div class="form-group text-center h3">
                                Product Information
                            </div>

                            <div class="form-row">
                                <div class="d-flex align-items-center col-lg-4">
                                    <img id="" style="width: 150px; height: 150px; box-shadow: 1px 1px 10px 1px gray;" src="<%= rs.getString(7) %>"/><br><br>
<%--                                    <input id="uploadImage" class="text-xs"  type="file" name="image" onchange="PreviewImage();" />--%>
                                </div>

                                <div class="col-lg-8">
                                    <div class="form-group">
                                        <label class="col-form-label" for="product">Product Name</label>
                                        <input type="text" class="form-control form-control-user" id="product" name="product" value="<%= rs.getString(3) %>"
                                               placeholder="Ex. Blue Night" disabled>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label class="col-form-label" for="price">Price</label>
                                            <input type="number" class="form-control form-control-user" id="price" name="price" value="<%= rs.getString(4) %>"
                                                   placeholder="Ex: 250" disabled>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label class="col-form-label" for="quantity">Quantity</label>
                                            <input type="number" class="form-control form-control-user" id="quantity" name="quantity"
                                                   placeholder="Ex: 50" required>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group text-center mt-4 h3">
                                Customer Information
                            </div>

                            <div class="form-group">
                                <label class="col-form-label" for="name">Name</label>
                                <input type="text" class="form-control form-control-user" id="name" name="name"
                                       placeholder="Ex: John Doe" required />
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="col-form-label" for="phone">Phone</label>
                                    <input type="tel" class="form-control form-control-user" id="phone" name="phone"
                                           placeholder="Ex: xxx xxx xxx" required>
                                </div>

                                <div class="form-group col-md-6">
                                    <label class="col-form-label" for="address">Adress</label>
                                    <input type="text" class="form-control form-control-user" id="address" name="address"
                                           placeholder="Ex: Maroua, Pitoire" required>
                                </div>
                            </div>

                            <div class="form-group mt-5">
                                <input type="submit" value="Validate" class="btn btn-primary btn-user btn-block">
                            </div>
                        </form>

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
