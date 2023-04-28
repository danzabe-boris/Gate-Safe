<%--
  Created by IntelliJ IDEA.
  User: NASH
  Date: 03/11/2022
  Time: 05:45
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
                    <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                    <div class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm text-uppercase">
                        <i class="fas fa-user-circle fa-sm text-white px-1" aria-hidden="true"> </i>
                        Administrator
                    </div>
                </div>

                <!-- Content Row -->
                <div class="row justify-content-md-center">

                    <div class="col col-lg-8 p-5 shadow-lg">
                        <form method="post" id="registerForm" action="${pageContext.request.contextPath}/createProduct" class="user">
                            <div class="form-group text-center h3">
                                Create a new product
                            </div>

                            <div class="form-row">
                                <div class="form-group col-lg-4">
                                    <img id="uploadPreview" style="width: 150px; height: 150px; box-shadow: 1px 1px 10px 1px gray;" src="../img/placeholder.png"/><br><br>
                                    <input id="uploadImage" class="text-xs"  type="file" name="image" onchange="PreviewImage();" />

                                    <script type="text/javascript">
                                        function PreviewImage() {
                                            const oFReader = new FileReader();
                                            oFReader.readAsDataURL(document.getElementById("uploadImage").files[0]);

                                            oFReader.onload = function(oFREvent) {
                                                document.getElementById("uploadPreview").src = oFREvent.target.result;
                                            };
                                        };
                                    </script>
                                </div>

                                <div class="col-lg-8">
                                    <div class="form-group">
                                        <label class="col-form-label" for="product">Product Name</label>
                                        <input type="text" class="form-control form-control-user" id="product" name="product"
                                               placeholder="Ex. Blue Night" required>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label class="col-form-label" for="price">Price</label>
                                            <input type="number" class="form-control form-control-user" id="price" name="price"
                                                   placeholder="Ex: 250" required>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label class="col-form-label" for="quantity">Quantity</label>
                                            <input type="number" class="form-control form-control-user" id="quantity" name="quantity"
                                                   placeholder="Ex: 50" required>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="col-form-label" for="category">Category</label>
                                    <input type="text" class="form-control form-control-user" id="category" name="category"
                                           placeholder="Ex: Phone" required>
                                </div>

                                <div class="form-group col-md-6">
                                    <label class="col-form-label" for="sub-category">Sub Category</label>
                                    <input type="text" class="form-control form-control-user" id="sub-category" name="sub-category"
                                           placeholder="Ex: Forfait Data" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-form-label" for="description">Description</label>
                                <input type="text" class="form-control form-control-user" id="description" name="description"
                                          placeholder="Ex: 250U = 05 Go 24 Hrs, 22hH to 06H" required />
                            </div>

                            <div class="form-group mt-5">
                                <input type="submit" value="Validate" class="btn btn-primary btn-user btn-block">
                            </div>
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

<!-- Bootstrap core JavaScript-->
<jsp:include page="script.jsp"/>

</body>

</html>
