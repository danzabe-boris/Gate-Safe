<%--
  Created by IntelliJ IDEA.
  User: NASH
  Date: 18/10/2022
  Time: 01:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Gate | Register</title>

    <!-- Custom fonts for this template-->
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <style>
        .bg-register {
            background: url("img/register.png") center;
            background-size: cover;
        }

        body{
            background-image: url(img/171.jpg);
        }

    </style>

    <script>
        // function validate() {
        //     const str = document.getElementById("exampleInputPassword").value;
        //     if (str != null) {
        //         if (str.match( /[0-9]/g) && str.match( /[A-Z]/g) &&
        //             str.match(/[a-z]/g) && str.match( /[^a-zA-Z\d]/g) &&
        //             str.length >= 8 && str.length <= 20) {
        //             const valid = document.getElementById("exampleInputPassword");
        //             valid.className += "is-valid";
        //
        //             const text = document.getElementById("passwordBlock");
        //             text.innerText = "Password secure!";
        //             text.className += "valid-feedback";
        //
        //             return true;
        //         }
        //         else {
        //             const valid = document.getElementById("exampleInputPassword");
        //             valid.className += "is-invalid";
        //
        //             const text = document.getElementById("passwordBlock");
        //             text.innerText = "Password not secure! Please change it";
        //             text.className += "invalid-feedback";
        //
        //             return false;
        //         }
        //     }
        // }

        // function check() {
        //     const pass1 = document.getElementById("exampleInputPassword").value;
        //     const pass2 = document.getElementById("exampleRepeatPassword").value;
        //     if (pass1 != pass2) {
        //         const validPass = document.getElementById("exampleInputPassword");
        //         validPass.className += "is-invalid";
        //
        //         const validCheck = document.getElementById("exampleRepeatPassword");
        //         validCheck.className += "is-invalid";
        //
        //         return false;
        //
        //     } else {
        //         return true;
        //     }
        // }

        function strong_pass(){
            const pass1 = document.getElementById("exampleInputPassword");
            const str1=pass1.value;

					if (str1.match( /[0-9]/g) && str1.match( /[A-Z]/g) &&
						str1.match(/[a-z]/g) && str1.match( /[^a-zA-Z\d]/g) &&
						str1.length >= 8 && str1.length <= 20){

											const text = document.getElementById("passwordBlock");
											text.innerText = "Password secure!";
											text.className += "valid-feedback";

											pass1.className += "is-valid";
                    }else{
											pass1.className += "is-invalid";
						alert('Password Not Secure. Please enter a strong password.');
                    }
        }

        function myFunction() {
            const pass1 = document.getElementById("exampleInputPassword");
            const pass2 = document.getElementById("exampleRepeatPassword");
            const str1 = pass1.value;
            const str2 = pass2.value;

            if (str1.match( /[0-9]/g) && str1.match( /[A-Z]/g) &&
                str1.match(/[a-z]/g) && str1.match( /[^a-zA-Z\d]/g) &&
                str1.length >= 8 && str1.length <= 20 &&
                str1 == str2) {
                pass1.className += "is-valid";

                const text = document.getElementById("passwordBlock");
                text.innerText = "Password secure!";
                text.className += "valid-feedback";

                pass2.className += "is-valid";

                document.getElementById("regForm").submit();
                return true;
            }

            pass1.className += "is-invalid";
            pass2.className += "is-invalid";
            return false;
        }
    </script>

</head>

<body>

<div class="container">

    <div class="mt-4">
        <h1 class="text-center text-white"><%= "GateSafe" %></h1>
    </div>

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div class="col-lg-5 d-none d-lg-block bg-register"></div>
                <div class="col-lg-7">
                    <div class="p-5">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">Create a Partner Account!</h1>
                        </div>
                        <form class="user" id="regForm" action="${pageContext.request.contextPath}/registerUser" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" id="exampleFirstName" name="user_name" placeholder="Username" required>
                            </div>

                            <div class="form-group">
                                <input type="email" class="form-control form-control-user" id="exampleEmail" name="user_email" placeholder="Email" required>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="password" class="form-control form-control-user " name="user_password"
                                           id="exampleInputPassword" placeholder="Password" required  onchange="return strong_pass()">
                                    <div id="passwordBlock" class="form-text "></div>
                                </div>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control form-control-user " name="user_repeat_pass"
                                           id="exampleRepeatPassword" placeholder="Repeat Password" required>
<%--                                    <div id="passwordHelp" class="form-text form-control-user"></div>--%>
                                </div>
                            </div>
<%--                            <input class="form-control form-control-user" type="text" placeholder="Partner" name="user_account" value="partners" aria-label="Disabled input example" disabled>--%>
                            <div class="form-group">
                                <div class="custom-control custom-checkbox small text-center">
                                    <input type="checkbox" class="custom-control-input" id="customCheck" name="user_account" value="partners" checked required>
                                    <label class="custom-control-label" for="customCheck">Partner</label>
                                </div>
                            </div>

                            <input onclick="return myFunction()" value="Register Account" class="btn btn-primary btn-user btn-block">
                        </form>
                        <hr>
                        <div class="text-center">
                            <a class="small" href="forgot-password.jsp">Forgot Password?</a>
                        </div>
                        <div class="text-center">
                            <a class="small" href="redirect.jsp">Already have an account? Login!</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- Bootstrap core JavaScript-->
<!-- <script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

<!-- Core plugin JavaScript-->
<!-- <script src="vendor/jquery-easing/jquery.easing.min.js"></script> -->

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

</body>

</html>
