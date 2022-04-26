<%-- 
    Document   : index
    Created on : 20 May, 2021, 3:32:41 PM
    Author     : Divyansh
--%>

<%@page import="com.Db.DBConnect,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <style type="text/css">
            .back-img{
                background: url("img/notes.jpg");
                width : 100%;
                height: 100vh;
               background-repeat: no-repeat;
               background-size: cover;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <%@include file="all_component/allcss.jsp" %>
    </head>
    <body>
             <%@include file="all_component/navbar.jsp" %>
             <%
                 
                 
                 %>
        <div class="container-fluid back-img">
            <div class="text-center text-white">
                   <h1><i class="fa fa-book" aria-hidden="true"></i> E Notes-Save Your Notes</h1>
        <a href="login.jsp" class="btn btn-light"><i class="fa fa-user-circle-o" aria-hidden="true"></i> Login</a>
        <a href="register.jsp" class="btn btn-light"><i class="fa fa-user-plus" aria-hidden="true"></i> Register</a>
        </div>
            </div>
       
     <%@include file="all_component/footer.jsp" %>
    </body>
</html>
