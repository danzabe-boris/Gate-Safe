<%--
  Created by IntelliJ IDEA.
  User: NASH
  Date: 31/10/2022
  Time: 13:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp"/>

<body id="page-top">
<%
    String username = request.getRemoteUser();
    boolean admin = request.isUserInRole("admin");

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
                    <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                    <div class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm text-uppercase">
                        <i class="fas fa-user-circle fa-sm text-white px-1" aria-hidden="true"> </i>
                        Administrator
                    </div>
                </div>

                <!-- Content Row -->
                <div class="row justify-content-md-center">

                    <div class="col col-lg-8 p-5 shadow-lg">
                        <form method="post" id="registerForm" action="${pageContext.request.contextPath}/registerUser" class="user">
                            <div class="form-group text-center h3">
                                Create a new user
                            </div>

                            <div class="form-group">
                                <label class="col-form-label" for="exampleInputUser">Username</label>
                                <input type="text" class="form-control form-control-user" id="exampleInputUser" name="user_name"
                                       placeholder="Ex. John Doe" required>
                            </div>

                            <div class="form-group">
                                <label class="col-form-label" for="exampleInputEmail">Email address</label>
                                <input type="email" class="form-control form-control-user" id="exampleInputEmail" name="user_email"
                                       placeholder="Ex. john@gate.cm" required>
                            </div>

                            <div class="form-group">
                                <label class="col-form-label" for="exampleInputPassword">Password</label>
                                <input type="password" class="form-control form-control-user " id="exampleInputPassword" name="user_password"
                                       aria-describedby="passHelp" placeholder="Strong Password with Number, Lowercase, Uppercase, special character" required>
                                <small id="passHelp" class="form-text text-muted ">Please enter a strong password...</small>
                            </div>

                            <div class="form-group my-4">
                                <div class="d-flex justify-content-between">
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input class="custom-control-input" type="radio" name="user_account" value="admin" id="inlineRadio1">
                                        <label class="custom-control-label" for="inlineRadio1">Administrator</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input class="custom-control-input" type="radio" name="user_account" value="customManager" id="inlineRadio2" >
                                        <label class="custom-control-label" for="inlineRadio2">Custom Manager</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input class="custom-control-input" type="radio" name="user_account" value="partners" id="inlineRadio3">
                                        <label class="custom-control-label" for="inlineRadio3">Partner</label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group my-4">
                                <div class="custom-control custom-checkbox" onclick="return checkFunction()">
                                    <input type="checkbox" class="custom-control-input" id="customCheck" required>
                                    <label class="custom-control-label" for="customCheck">I validate all this information</label>
                                </div>
                            </div>

                            <input type="submit" value="Validate" class="btn btn-primary btn-user btn-block">

                        </form>
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

<script>
    function checkFunction() {
        const pass = document.getElementById("exampleInputPassword");
        const str = pass.value;
        if (str != null) {
            if (str.match( /[0-9]/g) && str.match( /[A-Z]/g) &&
                str.match(/[a-z]/g) && str.match( /[^a-zA-Z\d]/g) &&
                str.length >= 8 && str.length <= 20) {

                pass.className += "is-valid";

                // document.getElementById("registerForm").submit();
                return true;
            }
            else {
                pass.className += "is-invalid";

                const text = document.getElementById("passHelp");
                text.innerText = "Password not secure! Please change it";
                text.className += "invalid-feedback";

                return false;
            }
        }
    }
</script>

<!-- Bootstrap core JavaScript-->
<jsp:include page="script.jsp"/>

</body>

</html>
