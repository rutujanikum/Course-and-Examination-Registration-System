<%-- 
    Document   : selectCourses
    Created on : Sep 1, 2018, 12:48:54 AM
    Author     : sarvadnya
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="beans.Hod_data"%>
<%@page import="mainController.HodCon"%>
<%@page import="mainController.AdminCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">
        <title>Offer Courses</title>
        <script src="../../assets/js/jquery1.min.js"></script>
     <script src="../../assets/js/bootstrap1.min.js"></script>
     
          <style>
            p{
                text-height: 20;
                
            }
        </style>
    </head>
    <body>
        
        <% 
            String hod_uname=((String)session.getAttribute("hod_uname"));
             try{if(hod_uname.equals(null))
            {
               //response.sendRedirect("hodLoginForm.jsp");
            }
             }catch(Exception e)
             {
                response.sendRedirect("hodLoginForm.jsp");
             }
             %> <%@include file="hodHeader.jsp"%> <%
            
                 Hod_data hd=HodCon.getHODInfo(hod_uname);
                 if(hd.getIs_reg_started().equals("y"))
                 {
                %>
                
                <br><div class="container"><%
             String result=request.getParameter("result");
            try{
            if(!result.equals(null)){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-success"><%out.print(result);%></p></div></div>
            <%}
                }catch(Exception e){}
              try{
            if(!(request.getParameter("wrongResult").equals(null))){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-danger">   <a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("wrongResult"));%></p></div></div>
            <%}
                }catch(Exception e){}
                
        %></div>
               
            
           <center>
        <form action="../../Controller/selectCourses.jsp" method="post">
            <h2>Offer Courses For Registration</h2><hr>
            Year : <select name="year">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                </select>
            <br><br>
            Term : <select name="term">
                <option>ODD</option>
                <option>EVEN</option>
            </select><br><br>
            <button class="btn btn-primary">Submit</button>
        </form>
    </center>
         <%@include file="../../footer.jsp" %>
         <% }
            else
            response.sendRedirect("hodPanel.jsp?flag1=Start registration before offering courses"); 
         
       %>
    </body>
</html>
