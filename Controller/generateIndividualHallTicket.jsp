<%-- 
    Document   : generateIndivitualHallTicket
    Created on : Feb 20, 2019, 8:08:08 PM
    Author     : User
--%>

<%@page import="beans.Admin_data"%>
<%@page import="beans.Exam_reg"%>
<%@page import="beans.Courses"%>
<%@page import="mainController.CourseCon"%>
<%@page import="mainController.StudCon"%>
<%@page import="beans.Student_data"%>
<%@page import="java.util.ListIterator"%>
<%@page import="mainController.AdminCon"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
           String rollno=request.getParameter("rollnumber");
           String cou_code,cou_name;
           Student_data stud=(Student_data)StudCon.getStudentInfo(rollno);
           Courses course;
           Exam_reg examReg;
           Admin_data ad=AdminCon.getAdminInfo();
           int cnt=0;
        %>         
     
        <%              String hallTicketType=request.getParameter("hallTicketType");//Value can be pt or final
                        if(hallTicketType.equals("pt")){
                        List couCode=AdminCon.generateIndividualPTHallTicket(rollno,stud.getProgramme(), stud.getYear(),stud.getTerm(),ad.getReg_term_year(),stud.getS_regular());
                        if(couCode.size()>0)
                        { 
                        //Returns course object for each cou_code in couCode list.
                        %>
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
                      <div id="HallTicket">  
                      <TABLE border="1" cellpadding="5" cellspacing="2" align="center">
              <br>
              <br>
             
              <tr>
                  <th colspan="5"><center>GOVERMENT POLYTECHNIC,NASHIK</center><br>&nbsp;&nbsp;Course Registration(PROVISIONAL)SLIP FOR EVEN TERM -2018-2019<br>&nbsp;&nbsp;&nbsp;<b><text-height:500px><text-width:500px> Hall Ticket for periodic Test Examination</text-width:500px></text-height:200px></b></th></tr>
             
                  
        <th colspan="5">Roll number:<%=stud.getRollno() %>&nbsp;&nbsp;&nbsp;&nbsp; Name:<%=stud.getS_name() %><br>Programme :<%=stud.getProgramme() %></th>
     <tr>
         <th>Sr.No</th>
         <th>Course Code</th>
         <th>Course Name</th>
         <th>TH</th>
         <th>PT</th>
         <th>TW</th>
         <th>PR</th>
         <th>OR</th>
     </tr> 
                        <% for(Object obj1:couCode)
                        {
                            cou_code=(String)obj1;
                            course=CourseCon.getCourseObject(cou_code);
                            
                         %>   
                        <tr>
                            <td><%= ++cnt %></td>
                            <td><%=cou_code%></td> 
                            <td><%=(course.getCourse_name()).toUpperCase()%></td> 
                            <td><%if(course.getCou_th_min()>0)out.print("Y"); else out.print("--"); %></td>  
                            <td><%if(course.getCou_pt_min()>0)out.print("Y"); else out.print("--"); %></td>  
                            <td><%if(course.getCou_pr_min()>0)out.print("Y"); else out.print("--"); %></td>  
                            <td><%if(course.getCou_tw_min()>0)out.print("Y"); else out.print("--"); %></td>  
                            <td><%if(course.getCou_or_min()>0)out.print("Y"); else out.print("--"); %></td>
                                    </tr>
                        <%
                            } 
                        %>
                        <tr><td  colspan="8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;________________
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sign
                            <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(Prof.G.G.Wankhede)
                            <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Candidate's Signature
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Controller of Examination
                            <br>Note :1)This is Provisional course Registration.Min 75% attendence
                            & satisfactory Termwork/Practical submission is<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; necessary for final grant of term.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>2)Preserve this document carefully.It is required at the time of Examination Registartion 
                                & Periodic Test.</b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>3)Contact Controller of Examinations for type of discripancy/error observed in the above details.</b>
                                <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4)Dates to remember - 
                                <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Examination Registration -</b> <%=ad.getExamination_reg_date()%>&nbsp;&nbsp;&nbsp;&nbsp;
                                <b>First Periodic Test - </b><%=ad.getFirst_PT_date()%>&nbsp;&nbsp;&nbsp;&nbsp;
                                <b>Second Periodic Test - </b><%=ad.getSecond_PT_date()%><br>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>End of Term - </b><%=ad.getEnd_of_term()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <b>OR/PR/TW Exam - </b><%=ad.getOr_pr_tw_exam_date()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <b>Final Summer Examination - </b><%=ad.getFinal_exam_date()%><br>
                            </td></tr>
                       
    </table>
    </div>
    <div id="editor"></div>
    <br><br><br>
                    <script>
                        
         /*let doc = new jsPDF('p', 'pt', 'a4');
         var handler={'#editor':function(element,renderer){return true;}};
         
    
    doc.fromHTML($('#HallTicket').html(),15,15,{
             'width':170,'elementHandlers':handler
         }); 
         
         //doc.addHTML(document.body, function () {  
           doc.save('file.pdf');
           //this.saveAs("C:\Users\sarvadnya\Documents\NetBeansProjects\Registration_system_final\web\Images\file.pdf");  */         
          let doc = new jsPDF('p', 'pt', 'a4'); 
         doc.addHTML(document.body, function () {
             doc.save('file.pdf');
         });


    </script>
                       <% }
                    }//if close for hallTicketType=pt
        else if(hallTicketType.equals("final")) 
        {
            String rollno1=request.getParameter("rollnumber");
             Student_data stud1=(Student_data)StudCon.getStudentInfo(rollno1);
            List couCode=AdminCon.generateIndividualFinalHallTicket(rollno, stud1.getProgramme(), stud1.getYear(),stud1.getTerm());
                        if(couCode.size()>0)
                        { 
                        //Returns course object for each cou_code in couCode list.
                        %>
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
                      <div id="HallTicket">  
                      <TABLE border="1" cellpadding="5" cellspacing="2" align="center">
              <br> 
              <br>
             
              <tr>
                  <th colspan="5"><center>GOVERMENT POLYTECHNIC,NASHIK</center><br>&nbsp;&nbsp;Course Registration(PROVISIONAL)SLIP FOR EVEN TERM -2018-2019<br>&nbsp;&nbsp;&nbsp;<b><text-height:500px><text-width:500px> Hall Ticket for Final Examination</text-width:500px></text-height:200px></b></th></tr>
             
                  
        <th colspan="5">Roll number:<%=stud.getRollno() %>&nbsp;&nbsp;&nbsp;&nbsp; Name:<%=stud.getS_name() %><br>Programme :<%=stud.getProgramme() %></th>
     <tr>
         <th>Sr.No</th>
         <th>Course Code</th>
         <th>Course Name</th>
         <th>TH</th>
         <th>PT</th>
         <th>TW</th>
         <th>PR</th>
         <th>OR</th>
     </tr> 
                        <% for(Object obj1:couCode)
                        {
                            examReg=(Exam_reg)obj1;
                            
                            cou_name=CourseCon.getCourseName(examReg.getCou_code());
                            
                         %>   
                        <tr>
                            <td><%= ++cnt %></td> 
                            <td><%=examReg.getCou_code()%></td> 
                            <td><%=(cou_name).toUpperCase()%></td> 
                            <td><%if(examReg.getEx_th()==1)out.print("Y"); else out.print("--"); %></td>  
                            <td><%if(examReg.getEx_pt()==1)out.print("Y"); else out.print("--"); %></td>  
                            <td><%if(examReg.getEx_tw()==1)out.print("Y"); else out.print("--"); %></td>  
                            <td><%if(examReg.getEx_pr()==1)out.print("Y"); else out.print("--"); %></td>  
                            <td><%if(examReg.getEx_or()==1)out.print("Y"); else out.print("--"); %></td>
                        </tr>
                        <%
                            } 
                        %>
    </table>
    </div>
    <div id="editor"></div>
    <br><br><br>
                    <script>
                        
         /*let doc = new jsPDF('p', 'pt', 'a4');
         var handler={'#editor':function(element,renderer){return true;}};
         
    
    doc.fromHTML($('#HallTicket').html(),15,15,{
             'width':170,'elementHandlers':handler
         }); 
         
         //doc.addHTML(document.body, function () {  
           doc.save('file.pdf');
           //this.saveAs("C:\Users\sarvadnya\Documents\NetBeansProjects\Registration_system_final\web\Images\file.pdf");  */         
          let doc = new jsPDF('p', 'pt', 'a4'); 
         doc.addHTML(document.body, function () {
             doc.save('file.pdf');
         });


    </script>
                       <% }//for close
        }//else if close for hallTicketType=final
}
%>
                

    </body>
</html>
