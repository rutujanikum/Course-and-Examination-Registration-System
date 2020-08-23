<%-- 
    Document   : changeHodPwd
    Created on : Sep 6, 2018, 10:53:48 PM
    Author     : sarvadnya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">
        <title>Change Hod Password</title>
         <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">
     <script src="../../assets/js/jquery1.min.js"></script>
     <script src="../../assets/js/bootstrap1.min.js"></script>
     
          <style>
            p{
                text-height: 20;
                
            }
        </style>
    </head>
    <body>
         <%  //session check 
        if(session.getAttribute("hod_uname")!=null)
        {
            %> <%@include file="hodHeader.jsp"%> <%
       // String msg=request.getParameter("result");
    %>  
        
        <div class="container">
        <br>
        <h1>Change Your Password</h1><hr>
        <p class="text-danger"><% try{
            if(!(request.getParameter("failResult")).equals(null)){
            %> <div class="row"><div class="col-lg-8"> <p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.println(request.getParameter("failResult"));}
    }catch(Exception e){} %></p>
        <form action="../../Controller/changeHodPwd.jsp" method="POST">
                        Old Password : <input type="password" name="oldPwd" placeholder="old Password" required pattern=".{6,}" oninvalid="this.setCustomValidity('Password must be of 6 characters.')" oninput="this.setCustomValidity('')"
                              oninput="this.setCustomValidity('')" />
                       <br><br>
                       New Password : <input type="password" name="newPwd1" placeholder="Password"    required pattern=".{6,}" oninvalid="this.setCustomValidity('Password must be of 6 characters.')" oninput="this.setCustomValidity('')"/>
                       <br><br>
                       Retype Password :<input type="password" name="newPwd2" placeholder="Password"   required pattern=".{6,}" oninvalid="this.setCustomValidity('Password must be of 6 characters.')" oninput="this.setCustomValidity('')
                          " />
                       <br><br>
                       <input type="reset" name="reset" value="Reset" class="btn btn-primary"  />
                       <input type="submit" name="submit" value="Change" class="btn btn-primary"  /><br><br>
	 
</form> 
         <%  
            }
            else
            {
               response.sendRedirect("../../index.jsp");
            }
         %>
        </div>
        </div>
        </div>
    </body>
</html>
