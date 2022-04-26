<%-- 
    Document   : edit
    Created on : 28 May, 2021, 10:45:42 AM
    Author     : Divyansh
--%>

<%@page import="com.Db.DBConnect,com.DAO.PostDAO,com.User.Post"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession see=request.getSession();
            UserDetails uss=(UserDetails)see.getAttribute("userO");
            if(uss==null)
            {
                response.sendRedirect("login.jsp");
                see.setAttribute("Login-error","Please Login..");
            }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Page</title>
        <%@include file="all_component/allcss.jsp" %>
    </head>
    <body>
        <%
        Integer noteid=Integer.parseInt(request.getParameter("note_id"));
        PostDAO post=new PostDAO(DBConnect.getConn());
        Post p=post.getDataById(noteid);
        
        %>
        
         <div class="container-fluid ">
            <%@include file="all_component/navbar.jsp" %>
            <h1 class="text-center">Add Your Notes</h1>
            <div class="container">
                         <div class="row">
                <div class="col-md-12">
                    <form class="mt-5" action="NotesEditServlet" method="post">
                        
                        <input type="hidden"  name="noteid" value="<%= noteid %>">
  <div class="form-group">
         
    <label for="exampleInputEmail1">Enter Title</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="title" required value="<%= p.getTitle() %>">
   
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Enter Content</label>
    <textarea rows="9" cols="" class="form-control" required name="content" ><%= p.getContent() %></textarea>
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
