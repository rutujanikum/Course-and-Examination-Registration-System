<%-- 
    Document   : studReg
    Created on : Dec 2, 2018, 12:14:42 PM
    
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="mainController.HodCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course Registration</title>
    <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">
    </head>
    <body>
        <%if(session.getAttribute("registrar_uname")==null || session.getAttribute("registrar_user")==null){
                response.sendRedirect("../../index.jsp");
          }else if(session.getAttribute("registrar_user").equals("registrar"))
            {
                %> <%@include file="registrarHeader.jsp"%> <%
                if(HodCon.getRegStatusForRegistrar((String)session.getAttribute("registrar_uname"),(String)session.getAttribute("registrar_user")))
               {
        %>
    <center>
        <h1>Course Registration</h1><br><br> 
        <!--Drop-down for term and year -->
        <form action="studRegList.jsp" method="POST"> 
            Year : <select name="year">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
            </select>
            <br><br>
            Term : <select name="term">
                <option value="ODD">Odd</option>
                <option value="EVEN">Even</option>
            </select>
            <br><br>
            <button name="submit" class=" btn btn-primary">Submit</button> 
        </form>
    </center>
        <%
            }
            else
            {
                %><h1>Sorry, but registration not started yet</h1><%
            }
           }//if close used for session check%>
    </body>
</html>
