<%-- 
    Document   : addnotes
    Created on : 26 May, 2021, 2:03:23 PM
    Author     : Divyansh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.User.UserDetails"%>
<%
    HttpSession see=request.getSession();
            UserDetails uss=(UserDetails)see.getAttribute("userO");
            if(uss==null)
            {
                response.sendRedirect("login.jsp");
                see.setAttribute("Login-error","Please Login..");
            }
%>





<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Notes</title>
         <%@include file="all_component/allcss.jsp" %>
    </head>
    <body>
        <div class="container-fluid ">
            <%@include file="all_component/navbar.jsp" %>
            <h1 class="text-center">Add Your Notes</h1>
            <div class="container">
                         <div class="row">
                <div class="col-md-12">
                    <form class="mt-5" action="AddNotesServlet" method="post">
  <div class="form-group">
      <%  
       HttpSession se=request.getSession();
            UserDetails us=(UserDetails)se.getAttribute("userO");
            if(us!=null){
                %>
                 <input type="hidden" value="<%= us.getId()%>" name="uid">
        <%    }
      %>
     
    <label for="exampleInputEmail1">Enter Title</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="title" required>
   
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Enter Content</label>
    <textarea rows="9" cols="" class="form-control" required name="content"></textarea>
     </div>
                        <div class="container text-center"> <button type="submit" class="btn btn-primary">Add Notes</button></div>
 
</form>
                </div>
            </div>
            </div>
        </div>
            <div class="mt-5">
         <%@include file="all_component/footer.jsp" %>
            </div>
    </body>
</html>
