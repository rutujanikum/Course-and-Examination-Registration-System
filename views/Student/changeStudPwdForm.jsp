<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title> 
       
        <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css">
     <script src="../assets/js/jquery1.min.js"></script>
     <script src="../assets/js/bootstrap1.min.js"></script>
     
          <style>
            p{
                text-height: 20;
                
            }
        </style>
    </head>
    <body>
        <%
            if(session.getAttribute("stud_uname")==null && session.getAttribute("stud_user")==null )
            {
                 response.sendRedirect("../../index.jsp");
            }
            else
            {   
          %>
          <%@include file="studHeader.jsp"%> 
          <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
        <div class="container">
            <h2>Change Student Password</h2>
        <br>
                    <%
                       try{if(!request.getParameter("result").equals(null)){%><p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.println(request.getParameter("result"));%></p><%}}catch(Exception e){}                        
                       try{if(!request.getParameter("failResult").equals(null)){ %> <p class=" alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%= request.getParameter("failResult") %></p> <% }}catch(Exception e){} %>
                         
                         <form action="../../Controller/changeStudPwdByStud.jsp" method="POST">
                        Old Password: <input type="password" name="oldPwd" placeholder="Password"  required pattern=".{6,}" oninvalid="this.setCustomValidity('Password must be of 6 characters.')" oninput="this.setCustomValidity('')"/>
                       <br><br>
                       
                       New Password : <input type="password" name="newPwd1" placeholder="Password" required pattern=".{6,}" oninvalid="this.setCustomValidity('Password must be of 6 characters.')" oninput="this.setCustomValidity('')" />
                       <br><br>
                       Retype Password : <input type="password" name="newPwd2" placeholder="Password" required pattern=".{6,}" oninvalid="this.setCustomValidity('Password must be of 6 characters.')" oninput="this.setCustomValidity('')" />
                       <br><br>
                       <input type="reset" name="reset" value="Reset" class="btn btn-primary"  />
                       <input type="submit" name="submit" value="Change" class="btn btn-primary"  /><br><br>
	 
                    </form> 
                    <%  
                  
            }//outer else closing
                    %>
        </div>
    </body>
</html>
