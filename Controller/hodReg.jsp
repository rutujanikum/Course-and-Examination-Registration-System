<%-- 
    Document   : hod_register
    Created on : Jul 27, 2018, 1:45:15 AM
    Author     : sarvadnya
--%>

<%@page import="mainController.HodCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <jsp:useBean id="hd" class="beans.Hod_data"></jsp:useBean>
        <jsp:setProperty property="*" name="hd"/>
        <% 
            int i=HodCon.registerHOD(hd);
            if(i>0)
            {
                response.sendRedirect("../views/Admin/hodRegForm.jsp?result=HOD is successfully registered");
               // Hod Successfully registered.
            }
            else
             {
                response.sendRedirect("../views/Admin/hodRegForm.jsp?failResult=HOD is not registered successfully");
               // Hod not Successfully registered.
            }
        %>
    </body>
</html>
