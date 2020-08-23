<%-- 
    Document   : examRegReset
    Created on : Feb 21, 2019, 8:01:39 PM
    Author     : User
--%>

<%@page import="beans.Student_data"%>
<%@page import="java.util.ListIterator"%>
<%@page import="mainController.AdminCon"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Registration reset</title>
         <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css">
    </head>
    <body>
        <% String user=((String)session.getAttribute("admin_user"));
            if(!user.equals("admin"))
            {
               response.sendRedirect("../index.jsp");
            }
            else
           { 
          %>
           <%@include file="commonHeader.jsp"%>
        <%
        
          String roll_no=request.getParameter("rollno");
          List list=AdminCon.studentDetails(roll_no);
         
          if(list!=null) 
           {
                ListIterator lit=list.listIterator();
               Student_data c;
                while(lit.hasNext()) {
                c=(Student_data)lit.next();
          %>
          <center> <h1><u>Student information</u></h1>
       
    <h3>Roll number:<%= c.getRollno()%></h3>
        
    <h3>Name:<%= c.getS_name()%></h3>
    <h3>Branch:<%= c.getProgramme() %></h3>
    <h3>Phone_number:<%= c.getPhone_no()%></h3>
      
    
    </center>

             <% }
             String path="./examReset.jsp?roll_no="+request.getParameter("rollno");
        %>
            
             
             <br><br> <center>
          <form action="./examReset.jsp" method="POST">
               <button type="submit" class="btn btn-danger" formaction="<%=path%>">Reset</button>
           </form>
             </center>
           <%} else
                {
                     response.sendRedirect("../views/Admin/examRegReset.jsp?failResult=Record is not present");
                }
}
           %>
    </body>
</html>
