<%-- 
    Document   : register_course
    Created on : Jul 29, 2018, 12:42:18 AM
    Author     : sarvadnya
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="mainController.CourseCon"%>
<%@page import="mainController.StudCon"%>
<%@page import="mainController.CourseRegCon"%>
<%@page import="beans.Course_reg"%>
<%@page import="beans.Student_data"%>
<%@page import="beans.Courses"%>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Courses Registered</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css">
        
    </head>
    <body"> 
        
        <%
            if(session.getAttribute("stud_uname")==null || session.getAttribute("stud_user")==null)
            {
               response.sendRedirect("studLoginForm.jsp");
            }
            else if(session.getAttribute("stud_user").equals("student"))
           { 
                
          %><%@include file="studHeader.jsp"%> 
          <table border="1" class="table">
            <thead>
            <th>Sr.no</th>
            <th>Course Code</th>
            <th>Course Name</th>
            <th>Credits</th>
            <th>TH</th>
            <th>PT</th>
            <th>PR</th>
            <th>TW</th>
            <th>OR</th>
            </thead>
            <tbody>
        <br><h1>You have registered following subject</h1><br>
        <% 
        Courses course;
        int j=1;
        List<String> list=null,list1=null,list2=null;
        Student_data stud=(Student_data)StudCon.getStudentInfo((String)session.getAttribute("stud_uname"));
        try
        {   
            String saveOrReg="register";
            list=StudCon.getRegCourse((String)session.getAttribute("stud_uname"),stud.getTerm(),stud.getYear());
            list1=StudCon.getPendingCourse((String)session.getAttribute("stud_uname"));
            list2=StudCon.getBackCourse((String)session.getAttribute("stud_uname"));
            String courses[]=new String[list.size()];int i=0;
            for(Object o:list)
            {
                Course_reg cr=(Course_reg)o;
                StudCon.confirmCourse((cr));
            }
        }
        catch(Exception e)
        {
            out.println("________________________________________(views/saveOrRegCourse.jsp)Retrieval of the course give exception "+e+"occured.");
        }
         if(list!=null){
        for(Object li:list){  
            Course_reg course1=(Course_reg)li;
            course=CourseCon.getCourseObject(course1.getCou_code().trim());
      %>
      
        <tr>
            <td><%= j++ %></td>
            <td><%= course1.getCou_code()%></td>
            <td><%= course.getCourse_name() %></td>
            <td><%=course.getCou_credit() %></td> 
            <td><%if(course.getCou_th_min()>0)out.print("Y"); else out.print("--"); %></td>  
            <td><%if(course.getCou_pt_min()>0)out.print("Y"); else out.print("--"); %></td>  
            <td><%if(course.getCou_pr_min()>0)out.print("Y"); else out.print("--"); %></td>  
            <td><%if(course.getCou_tw_min()>0)out.print("Y"); else out.print("--"); %></td>  
            <td><%if(course.getCou_or_min()>0)out.print("Y"); else out.print("--"); %></td>
        </tr>               
      <%} 
        } 
        
        %>
        </tbody> 
        </table> 
        
        <form action="../../Controller/regExam.jsp" method="POST">
            Would you like to register for Examination?
            YES <input type="radio" name="yn" value="yes" required>&nbsp;&nbsp;&nbsp;&nbsp;
            NO <input type="radio" name="yn" value="no" required><br><br>
            <button class="btn btn-primary">Submit</button>
        </form>
                <%@include file="../../footer.jsp" %>
      
     <%   }//closing of outer else
       %>
    </body>
</html>