<%-- 
    Document   : home
    Created on : 26 May, 2021, 10:59:43 AM
    Author     : Divyansh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession see=request.getSession();
            UserDetails uss1=(UserDetails)see.getAttribute("userO");
            if(uss1==null)
            {
                response.sendRedirect("login.jsp");
                see.setAttribute("Login-error","Please Login..");
            }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <%@include file="all_component/allcss.jsp" %>
    </head>
    <body>
        
         <div class="container-fluid ">
              <%@include file="all_component/navbar.jsp" %>
             <div class="card py-5">
                 <div class="card-body text-center">
                     <img alt="" src="img/png.png" class="img-fluid mx-auto" style="max-width: 400px">
                     <h1>START TAKING YOUR NOTES</h1>
                     <a href="addnotes.jsp" class="btn btn-outline-primary">Start Here</a>
                 </div>
         </div>
             <%@include file="all_component/footer.jsp" %>
    </body>
</html>
