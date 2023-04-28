<%--
  Created by IntelliJ IDEA.
  User: NASH
  Date: 07/11/2022
  Time: 07:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Sidebar -->
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
    Account
  </div>

  <!-- Nav Item - Utilities Collapse Menu -->
  <li class="nav-item">
    <a class="nav-link" href="#" data-toggle="modal" data-target="#userModal" >
      <i class="fas fa-fw fa-user"></i>
      <span>Partner Information</span>
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
        <a class="collapse-item" href="view-customer.jsp">Customer</a>
        <a class="collapse-item" href="command-status.jsp">Status</a>

      </div>
    </div>
  </li>

  <!-- Nav Item - Charts -->
  <li class="nav-item">
    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseCatalogue"
       aria-expanded="true" aria-controls="collapseCatalogue">
      <i class="fas fa-fw fa-folder-open"></i>
      <span>Catalogue</span>
    </a>
    <div id="collapseCatalogue" class="collapse" aria-labelledby="headingCatalogue" data-parent="#accordionSidebar">
      <div class="bg-white py-2 collapse-inner rounded">
        <h6 class="collapse-header">Order Product:</h6>
        <a class="collapse-item" href="view-product.jsp">View all product</a>
        <a class="collapse-item" href="catalog.jsp">Catalog</a>
      </div>
    </div>
  </li>

  <!-- Nav Item - Tables -->
  <li class="nav-item">
    <a class="nav-link" href="#">
      <i class="fas fa-fw fa-print"></i>
      <span>Print</span></a>
  </li>

  <!-- Divider -->
  <hr class="sidebar-divider d-none d-md-block">

  <!-- Sidebar Toggler (Sidebar) -->
  <div class="text-center d-none d-md-inline">
    <button class="rounded-circle border-0" id="sidebarToggle"></button>
  </div>
</ul>
<!-- End of Sidebar -->
