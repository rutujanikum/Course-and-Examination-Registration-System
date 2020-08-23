<%-- 
    Document   : save_course
    Created on : Jul 28, 2018, 10:55:50 PM
    Author     : sarvadnya
--%>

<%@page import="beans.Courses"%>
<%@page import="java.util.List"%>
<%@page import="mainController.AdminCon"%>
<%@page import="mainController.CourseCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm course</title>
    </head>
    <body>
        <jsp:useBean id="course" class="beans.Courses"></jsp:useBean> 
        <jsp:setProperty property="*" name="course"/>  
        
        <%  course.setIs_offered("n");
            //System.out.print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&User = " +session.getAttribute("user"));
            try
            {
                if(session.getAttribute("hod_user").equals("hod"))
                {
                    //course.setIs_validated("n"); 
                    int i=CourseCon.register(course);
                    if(i>0)
                    {
                        //out.println("Successfully given for confirmation to admin..");
                        response.sendRedirect("../views/HOD/hodPanel.jsp?result=Successfully given for confirmation to admin..");

                    }
                }
            }catch(Exception e)
            {
                out.println(e);
            }
            
            try
            {
                if(session.getAttribute("admin_user").equals("admin"))
                {
                    Boolean flag=null;
                    System.out.println("###################################");

                    flag=AdminCon.addNewCourse(course); 
                    //out.println(""+flag);
                    if(flag==true)
                    {
                        //out.println("Course confirmation successful");
                        //response.sendRedirect("../views/HOD/hodPanel.jsp?result=Successfully given for confirmation to admin..");
                        response.sendRedirect("../views/Admin/confirmCourse.jsp?page=1&result=Successfully course confirmed..");
                    }
                    else
                    {
                        out.println("Course confirmation unsuccessful");

                    }
                }
            }catch(Exception e)
            {
                out.println(e);
            }
        %>
    </body>
</html>
