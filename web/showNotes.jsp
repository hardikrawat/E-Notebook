<%-- 
    Document   : showNotes
    Created on : 28 May, 2021, 8:48:40 AM
    Author     : Divyansh
--%>

<%@page import="com.Db.DBConnect,com.DAO.PostDAO,com.User.Post,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Show Notes Page</title>
         <%@include file="all_component/allcss.jsp" %>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        
        <%
        
        String msg=(String)see.getAttribute("updateMsg");
        if(msg!=null){
            %>
              <div class="alert alert-success" role="alert"><%= msg%></div>
            
        <% 
        see.removeAttribute("updateMsg");
        }
        %>
        
         <%
        
        String wrongmsg=(String)see.getAttribute("wrongMsg");
        if(wrongmsg!=null){
            %>
              <div class="alert alert-danger" role="alert"><%= msg%></div>
            
        <% 
        see.removeAttribute("wrongMsg");
        }
        %>
        
        <div class="container">
            <h2 class="text-center">All Notes:</h2>
            <div class="row">
                <div class="col-md-12">
                    
                     <% 
                            if(uss!=null){
                              PostDAO ob=new PostDAO(DBConnect.getConn());  
                              List<Post> post=ob.getData(uss.getId());
                              for( Post po:post){
                       %>           
                         <div class="card mt-3">
                        <img src="img/png.png" class="card-img-top mt-2 mx-auto" style="max-width: 100px;">
                        <div class="card-body p-4">
                            
                                                     
                            <h5 class="card-title"><%= po.getTitle() %></h5>
                            
                            <p><%= po.getContent() %></p>
                            
                            <p>
                                <b class="text-success">Published By :<%= uss.getName() %></b></br>
                                <b class="text-primary"></b>
                            </p>
                            
                             <p>
                                 <b class="text-success">Published By :<%= po.getPdate() %></b></br>
                                <b class="text-primary"></b>
                            </p>
                            
                            <div class="container text-center mt-2">
                                <a href="DeleteServlet?note_id=<%= po.getId() %>" class="btn btn-danger">Delete</a>
                                <a href="edit.jsp?note_id=<%= po.getId() %>" class="btn btn-primary">Edit</a>
                  
                            </div>
                        </div>
                    </div>          
                       
                          <%    }
                            }
                            %>
                    
                  
                </div>
            </div>
        </div>
    </body>
</html>
