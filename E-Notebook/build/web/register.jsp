<%-- 
    Document   : register
    Created on : 20 May, 2021, 3:33:16 PM
    Author     : Divyansh
--%>

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
        <title>Register Page</title>
         <%@include file="all_component/allcss.jsp" %>
    </head>
    <body>
         <%@include file="all_component/navbar.jsp" %>
         <div class="container-fluid back-img">
             <div class="row">
                 <div class="col-md-4 offset-md-4">
                     <div class="card mt-4">
                         <div class="card-header text-center text-white bg-custom">
                             <i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
                             <h4>Registration</h4>
                         </div>
                         
                        
                             <%
                                 HttpSession se=request.getSession();
                                 String msg=(String)se.getAttribute("reg-sucess");
                                 if(msg!=null){
                                     %>
                                     <div class="alert alert-success" role="alert"> <%=msg%> Login<a href="login.jsp">Cilck Here</a></div>
                                 <%         
                                 s.removeAttribute("reg-sucess");}
                                 %>
                                 
                                 <%
                                 
                                 String msgs=(String)se.getAttribute("reg-fail");
                                 if(msgs!=null){
                                     %>
                                   <div class="alert alert-danger" role="alert"><%=msgs%></div>
                                 <%         
                                 s.removeAttribute("reg-fail");}
                                 %>
                        
                         <div class="card-body"><form action="UserServlet" method="post">
                                  <div class="form-group">
    <label for="name">Enter Full Name</label>
    <input type="text" class="form-control" id="name" aria-describedby="emailHelp" name="fname" required>
    
  </div>
  <div class="form-group">
    <label for="email">Enter Email</label>
    <input type="email" class="form-control" id="email1" aria-describedby="emailHelp" name="uemail" required >
   
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" name="upassword" required>
  </div>
 
  <button type="submit" class="btn btn-primary badge-pill btn-block">Register</button>
</form>
                         </div>
                 </div>
             </div>
                  
         </div>
         </div>
<%@include file="all_component/footer.jsp" %>
    </body>
</html>
