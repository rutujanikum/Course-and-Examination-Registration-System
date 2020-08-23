<%-- 
    Document   : regExam
    Created on : Dec 28, 2018, 11:19:05 PM
    Author     : sarvadnya
--%>

<%@page import="beans.Admin_data"%>
<%@page import="mainController.AdminCon"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="beans.Course_reg"%>
<%@page import="beans.Student_data"%>
<%@page import="mainController.StudCon"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>registration of Examination</title>
    </head>
    <body>
        <%
            //session checking
            if(session.getAttribute("stud_uname")==null || session.getAttribute("stud_user")==null)
            {
               response.sendRedirect("../../index.jsp");
            }
            else if(session.getAttribute("stud_user").equals("student")) 
           {  
            String ans=request.getParameter("yn");
            SimpleDateFormat f=new SimpleDateFormat("dd/MM/yyyy");
            String date=f.format(new Date());
            if(ans.equals("yes"))
            {
                Student_data stud=(Student_data)StudCon.getStudentInfo((String)session.getAttribute("stud_uname"));
                 //list2 gives courses which are registered by student.
                List list1=StudCon.getRegCourse((String)session.getAttribute("stud_uname"),stud.getTerm(),stud.getYear());
          
                String courses[]=new String[list1.size()];
                //out.print(list1.size()+list2.size());
                //---------Combining regular and backlog courses into one array
                int i=0;
                for(Object obj1:list1)
                {
                Course_reg c1=(Course_reg)obj1;
                courses[i++]=c1.getCou_code();
                }
                Admin_data ad=(Admin_data)AdminCon.getAdminInfo();
                int res[]=StudCon.regExam(courses,(String)session.getAttribute("stud_uname"),ad.getReg_term_year(),stud.getTerm(),stud.getYear(),(String)session.getAttribute("stud_user"));
                try{
                //List3 gives backlog courses
                List list2=StudCon.getBackCourse((String)session.getAttribute("stud_uname"));
                String courses1[]=new String[list2.size()];
                i=0;
                for(Object obj2:list2)
                {
                Course_reg c2=(Course_reg)obj2;
                courses1[i++]=c2.getCou_code();
                }
                int res1[]=StudCon.regExam(courses1,(String)session.getAttribute("stud_uname"),ad.getReg_term_year(),stud.getTerm(),stud.getYear(),(String)session.getAttribute("stud_user"));
                }
                catch(Exception e)
                {
                    out.print(" =------------"+e);
                }
                response.sendRedirect("../views/Student/printRegForStud.jsp");
            }
            else if(ans.equals("no"))
            {
                response.sendRedirect("../views/Student/printRegForStud.jsp");
            }
         }
            %>
    </body>
</html>
