<%-- 
    Document   : courseReg
    Created on : Sep 7, 2018, 9:22:51 AM
    Author     : User
--%>


<%@page import="beans.Admin_data"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="beans.Course_reg"%>
<%@page import="java.util.ListIterator"%>
<%@page import="mainController.AdminCon"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course Reg Report</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css">
    </head>
    <body>
        <% String uname=((String)session.getAttribute("admin_uname"));
            if(uname.equals(null))
            {
               response.sendRedirect("../index.jsp");
            }
            else
           { 
          %>
           <%@include file="commonHeader.jsp"%>
        <%
            Session s;
            Query qr;
            SessionFactory sf;
            List list1=new ArrayList();
            Admin_data ad=AdminCon.getAdminInfo();
            sf=SessionFact.SessionFact.getSessionFact();
            s=sf.openSession();
            String programme=request.getParameter("branch");
            int year=Integer.parseInt(request.getParameter("year"));
            int shift=Integer.parseInt(request.getParameter("shift"));
            
            List list=AdminCon.courseRegReport(programme, shift, year, ad.getReg_term_year());
            if(list.size()!=0)
            { 
            %>
             <center> <h1><u>Course Registration Report</u></h1>
        <br><h3>
            <%
             out.print("Program is "+programme);
             %>
             <br>
             <%
             out.println("Year is "+year);
         %>
        </h3>
             <table border="2" class="table">
            <thead>
            
            <th>Sr.no</th> 
            <th>Roll_No</th>
            <th colspan="7">Course Code</th>
          
            
            </thead>
            <%
                    int j=1;
                     for(int i=0;i<list.size();i++)
                    {
                    Query query = s.createQuery("SELECT cou_code FROM Course_reg WHERE regno =:rollno");
                    query.setString("rollno",(String)list.get(i));
                    //query.list() will give all course code that are registered of that roll number.
                    list1=query.list();
                    
            %>
                
                <tr> 
                
                <td><%= j++%></td>
               
                <td><%=list.get(i)%></td>
                <%for( int j1=0;j1<list1.size();j1++)
                {
                %>
                  <td><%=list1.get(j1)%></td> 
                
                <%}%>
   
                </tr> 
             
                <%}%>

        </table> 
    <%}
    else
    {
        response.sendRedirect("../views/Admin/courseRegReport.jsp?failResult=Records not found.");
    }}
    %>
    </center>
            
           
       
   
    
        
        
        
    
         
        
        
        
    </body>
</html>
