<%-- 
    Document   : login
    Created on : 20 May, 2021, 3:33:32 PM
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
        <title>Login Page</title>
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
                             <h4>Login Page</h4>
                         </div>
                         <%
                                 HttpSession se=request.getSession();
                                 String msgs=(String)se.getAttribute("log-fail");
                                 if(msgs!=null){
                                     %>
                                   <div class="alert alert-danger" role="alert"><%=msgs%></div>
                                 <%         
                                 se.removeAttribute("log-fail");}
                                   String withoutLogin=(String)se.getAttribute("Login-error");
                                    if(withoutLogin!=null)
                                    {%>
                                    <div class="alert alert-danger" role="alert"><%= withoutLogin%></div>
                                   <% }
                                        se.removeAttribute("Login-error");
                                        %>
                                        <%
                                        String lgmsg=(String)se.getAttribute("logoutMsg");
                                        if(lgmsg!=null)
                                        { %>
                                        <div class="alert alert-success" role="alert"><%= lgmsg%></div>
                                        <%
                                         }   
                                         se.removeAttribute("logoutMsg");
                                         %>
                         <div class="card-body"><form action="loginServlet" method="post">

  <div class="form-group">
    <label for="email">Enter Email</label>
    <input type="email" class="form-control" id="email1" aria-describedby="emailHelp" name="email" required >
   
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" name="password" required >
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
