<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: NASH
  Date: 07/11/2022
  Time: 07:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/logout">Logout</a>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="infosModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <%
            try {
                String user = request.getRemoteUser();

                Class.forName("com.mysql.jdbc.Driver");
                java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/webgate", "root", "");
                Statement st = con.createStatement();

                ResultSet rs = st.executeQuery("select * from users where name = '"+ user +"' ");
                rs.next();

        %>
        <div class="card">
            <div class="card-header">
                <strong class="card-title mb-3">Profile user</strong>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="card-body">
                <div class="mx-auto d-block">
                    <img class="rounded-circle mx-auto d-block" src="../img/default.gif" alt="Card image cap">
                    <h5 class="text-sm-center mt-2 mb-1"><%= rs.getString(1) %></h5>
                    <h5 class="text-sm-center text-uppercase mt-2 mb-1"><%= rs.getString(2) %></h5>
                    <div class="location text-sm-center"><i class="fas fa-fw fa-users mx-1"></i> <%= rs.getString(4) %></div>
                    <div class="location text-sm-center"><i class="fas fa-fw fa-envelope mx-1"></i> <%= rs.getString(5) %></div>
                </div>
            </div>
        </div>
        <%
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </div>
</div>
