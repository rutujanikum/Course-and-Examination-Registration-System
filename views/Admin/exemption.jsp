<%-- 
    Document   : exemption
    Created on : Feb 27, 2019, 1:31:18 AM
    Author     : Shubham Nehe
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css"> 
        <script src="../../assets/js/jquery1.min.js"></script>
        <script src="../../assets/js/bootstrap1.min.js"></script>
    </head>
    <body>
        <%
        if(session.getAttribute("admin_uname")==null || session.getAttribute("admin_user")==null )
            {
                 response.sendRedirect("../../index.jsp");
            }
        else  if(session.getAttribute("admin_user").equals("admin"))
            {  %>
            <%@include file="adminHeader.jsp"%>
        <div class="container">            
            <form action="../../Controller/exemptionOfCourses.jsp?actionTodo=exemption" method="post">
            <% String result=request.getParameter("result");
            try{if(!result.equals(null)){ %> <p class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a><%= result %></p> <% }}catch(Exception e){} %>
            
            <% String failResult=request.getParameter("failResult");
            try{if(!failResult.equals(null)){ %> <p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%= failResult %></p> <% }}catch(Exception e){} %>
            
            <b>Exemption of Courses</b><br><br>            
                
            Enter roll number :<input type="number" name="rollNo" required><br><br> 
            <input type="submit" class="btn btn-primary" value="Show Courses"> 
        </form> 
        <hr> 
        <form action="../../Controller/exemptionOfCourses.jsp?actionTodo=Dsy1stYearExamReg" method="post">
            <b>Exam registration of first year courses of DSY student</b><br><br>
            Enter roll number :<input type="number" name="rollNo" required><br><br>
            <input type="submit" class="btn btn-primary" value="Register Courses">
        </form>
        </div>
            <%}%>
    </body>
</html>
