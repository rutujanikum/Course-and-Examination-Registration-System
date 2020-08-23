<%-- 
    Document   : changeStudPwdByHod
    Created on : May 5, 2019, 4:59:15 PM
    Author     : Rutuja Nikum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>change student password</title>
        <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">
     <script src="../../assets/js/jquery1.min.js"></script>
     <script src="../../assets/js/bootstrap1.min.js"></script>
    </head>
    <body>
        <%
        if(session.getAttribute("hod_uname")==null && session.getAttribute("hod_user")==null)
            {
                 response.sendRedirect("../../index.jsp");
            }
            else
            {  
                %>
            <%@include file="hodHeader.jsp"%> 
       <h2>Change Student Password</h2>
        <br>
          <%  try{
            if(!request.getParameter("result").equals("null"))%> 
            <div class="row"><div class="col-lg-8"><p class=" alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("result"));%></p></div></div>
        <%}catch(Exception e){}%>
        
        <%  try{
            if(!request.getParameter("failResult").equals(null))%> 
            <div class="row"><div class="col-lg-8"><p class=" alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("failResult"));%></p></div></div>
        <%}catch(Exception e){}%>   
                         
        <form action="../../Controller/changeStudPwdByHod.jsp" method="POST">
        Student Roll Number : <input type="text" name="rollno" placeholder="Rollno" required oninvalid="this.setCustomValidity('Roll number is required.')"
                              oninput="this.setCustomValidity('')" />
                       <br><br>    
         New Password : <input type="password" name="newPwd1" placeholder="Password" required pattern=".{6,}" oninvalid="this.setCustomValidity('Password must be of 6 characters.')" oninput="this.setCustomValidity('')" />
                       <br><br>
                       Retype Password : <input type="password" name="newPwd2" placeholder="Password" required pattern=".{6,}" oninvalid="this.setCustomValidity('Password must be of 6 characters.')" oninput="this.setCustomValidity('')" />
                       <br><br>
                       <input type="reset" name="reset" value="Reset" class="btn btn-primary"  />
                       <input type="submit" name="submit" value="Change" class="btn btn-primary"  /><br><br>   
        </form>
            <% }
            
%>
    </body>
</html>
