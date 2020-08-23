<%-- 
    Document   : courseRegReport
    Created on : Sep 7, 2018, 9:01:11 AM
    Author     : User
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>course Registration Report</title>
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
          <%
            String name=((String)session.getAttribute("admin_uname"));
            if(name.equals(null))
            {
               response.sendRedirect("adminLoginForm.jsp");
            }
            else if(session.getAttribute("admin_user").equals("admin"))
           { %>
           <%@include file="adminHeader.jsp"%>
           <br><div class="container"><%
             String result=request.getParameter("result");
            try{
            if(!result.equals(null)){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(result);%></p></div></div>
            <%}
                }catch(Exception e){}
              try{
            if(!(request.getParameter("failResult").equals(null))){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("failResult"));%></p></div></div>
            <%}
                }catch(Exception e){}
                
        %></div>
    <center> <h1><u>Course Registration Report</u></h1><br>
  

    <form action="../../Controller/courseRegReport.jsp" method="post">
        
        Branch :<select name="branch">
            <option value="CE">CE</option>
            <option value="CM">CM</option>
            <option value="Ddgm">DDGM</option>
            <option value="EE">EE</option>
            <option value="E&TC">E&TC</option>
            <option value="IF">IF</option>
            <option value="IDD">IDD</option>
            <option value="ME">ME</option>
            <option value="PE">PE</option>
            <option value="AE">AE</option>
        </select>
       
        Year :<select name="year">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
        </select> 
        
        Shift :<select name="shift">
            <option value="1">1</option>
            <option value="2">2</option> 
        </select>    
    
        <br><br>
         <button class="btn btn-primary">Generate</button>
    </form>
        </center>
    <%}%>
    </body>
    
</html>
