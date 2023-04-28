<%--
  Created by IntelliJ IDEA.
  User: NASH
  Date: 06/11/2022
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="home.jsp">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">GateSafe</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
        <a class="nav-link" href="home.jsp">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Account Management
    </div>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="view-users.jsp?account=customManager" >
            <i class="fas fa-user-cog"></i>
            <span>Managers</span>
        </a>
    </li>

    <!-- Nav Item - Utilities Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="view-users.jsp?account=partners">
            <i class="fas fa-users"></i>
            <span>Partners</span>
        </a>
    </li>

    <!-- Nav Item - Utilities Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="create-user.jsp">
            <i class="fas fa-user-plus"></i>
            <span>New Account</span>
        </a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Addons
    </div>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
           aria-expanded="true" aria-controls="collapsePages">
            <i class="fas fa-fw fa-shopping-cart"></i>
            <span>Commands</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Infos Commands:</h6>
                <a class="collapse-item" href="current_command.jsp">Current</a>
                <a class="collapse-item" href="finalize_command.jsp">Finalize</a>

            </div>
        </div>
    </li>

    <!-- Nav Item - Charts -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseCatalogue"
           aria-expanded="true" aria-controls="collapseCatalogue">
            <i class="fa fa-fw fa-folder-open"></i>
            <span>Catalogue</span>
        </a>
        <div id="collapseCatalogue" class="collapse" aria-labelledby="headingCatalogue" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Product:</h6>
                <a class="collapse-item" href="create-product.jsp">New Product</a>
                <a class="collapse-item" href="create-catalog.jsp">New Catalog</a>
                <a class="collapse-item" href="view-products.jsp">View Product</a>
                <div class="collapse-divider"></div>
                <h6 class="collapse-header">Empty Product:</h6>
                <a class="collapse-item" href="view-products.jsp?status=empty">View empty product</a>
            </div>
        </div>
    </li>

    <!-- Nav Item - Tables -->
    <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseActivity"
           aria-expanded="true" aria-controls="collapseActivity">
            <i class="fas fa-fw fa-table"></i>
            <span>Activity Logs</span>
        </a>
        <div id="collapseActivity" class="collapse" aria-labelledby="headingCatalogue" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Type logs:</h6>
                <a class="collapse-item" href="view-connexion.jsp">Connexion</a>
                <a class="collapse-item" href="view-activities.jsp">Others</a>
            </div>
        </div>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>



</ul>
<!-- End of Sidebar -->
