<%-- 
    Document   : RegistrarRegForm
    Created on : 27 Aug, 2018, 11:50:59 AM
    Author     : ADMIN
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="mainController.HodCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css"> 
        <title>Set registrar Password</title>
    </head>
    <body>
         <%  
            String uname=((String)session.getAttribute("hod_uname"));
            if(uname.equals(null))
            {
               response.sendRedirect("hodLoginForm.jsp");
            }
            else
           {  
               %> <%@include file="hodHeader.jsp"%> <%
                   %><br><div class="container"><%try{
            if(!(request.getParameter("wrongResult").equals(null))){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("wrongResult"));%></p></div></div>
            <%}
                }catch(Exception e){}
                 boolean flag=HodCon.isRegistrarAvailable(uname);
                //System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+flag);
                if(flag==true)
                { 
                   response.sendRedirect("hodPanel.jsp?flag1=Sorry registrar already registered you can only change password for registrar..");   
                }
               else
                {
          %>
     

        <div class="container"><br>
            <h1>Register Registrar</h1>
            <br><hr>
         <form action="../../Controller/registrarReg.jsp" method="post">
             Username : <input type="text" name="username" placeholder="Username" required oninvalid="this.setCustomValidity('username is required.')"
                              oninput="this.setCustomValidity('')">
            <br><br>
            Password : <input type="password" name="password" placeholder="Password" required pattern=".{6,}" oninvalid="this.setCustomValidity('Password must be of 6 characters.')" oninput="this.setCustomValidity('')">
            <br><br>
            <button class="btn btn-primary">Submit</button>
            
        </form>
        </div>
        <%@include file="../../footer.jsp" %>
        <% }} %>
    </body>
</html>
