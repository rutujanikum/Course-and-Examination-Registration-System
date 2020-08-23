<%-- 
    Document   : generateAllHallTicket
    Created on : Feb 23, 2019, 11:39:47 AM
    Author     : sarvadnya
--%>

<%@page import="beans.Admin_data"%>
<%@page import="beans.Student_data"%>
<%@page import="mainController.StudCon"%>
<%@page import="beans.Courses"%>
<%@page import="mainController.AdminCon"%>
<%@page import="java.util.List"%>
<%@page import="mainController.CourseCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css">  
    </head>
    <body onload="load()">
       <% String uname=((String)session.getAttribute("admin_uname"));
            if(uname.equals(null))
            {
               response.sendRedirect("../index.jsp");
            }
            else
           { 
          %>
           <%@include file="commonHeader.jsp"%>
        <div class="container">
        <%
            String hallTicketType=request.getParameter("hallTicketType");
            if(hallTicketType.equals("pt"))
            {
            String firstPTDate=request.getParameter("firstPTDate");
            String secondPTDate=request.getParameter("secondPTDate");
            String or_pr_tw=request.getParameter("or_pr_tw");
            String finalExDate=request.getParameter("finalExDate");
            String endOfTerm=request.getParameter("endOfTerm");
            String exRegDate=request.getParameter("exRegDate");
            AdminCon.saveExaminationDates((String)session.getAttribute("admin_uname"),firstPTDate,secondPTDate,or_pr_tw,finalExDate,endOfTerm,exRegDate);
            String programmes[]={"CM","IF","ME","ME","CE","CE","EL","EL","EE","DDGM","IDD","PL","AE"};//Array of programmes
            int shift[]={1,1,1,2,1,2,1,2,1,1,1,1,1,1};//Array of shift for esch programme.
            String regno,cou_code;
            Courses course;
            Student_data stud;
            String reg_term_year=AdminCon.getReg_term_year();
            //Admin_data object is used to get current term_year value such as(ODD-18 or EVN-18) 
           Admin_data ad=AdminCon.getAdminInfo();
            for(int i=0;i<13;i++)
            {
                for(int j=1;j<=3;j++)
                {
                    //li contains regno of students of a particular programme,shift,year.
                    List li=AdminCon.getRegNoByProgrammePT(programmes[i], shift[i], j,reg_term_year);%><br><br>
                   
                    <%
                   
                    if(li.size()>0) 
                    {
                    for(Object obj:li) 
                    { 
                        regno=(String)obj;
                        stud=(Student_data)StudCon.getStudentInfo(regno);
                        //returns cou_codes of courses registered by each student.%><br><br>
                       <% 
                       try{ 
                       List couCode=AdminCon.generateIndividualPTHallTicket(regno, programmes[i], j,stud.getTerm(),ad.getReg_term_year(),stud.getS_regular());
                        
                        if(couCode.size()>0)
                        {
                        //Returns course object for each cou_code in couCode list.
                        %> 
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
                      <div id="HallTicket">  
                      <table border="1" class="table-bordered">
                        
                            <tr>
                  <th colspan="5"><center>GOVERMENT POLYTECHNIC,NASHIK</center><br>&nbsp;&nbsp;Course Registration(PROVISIONAL)SLIP FOR EVEN TERM -2018-2019<br>&nbsp;&nbsp;&nbsp;<b><text-height:500px><text-width:500px> Hall Ticket for periodic Test Examination</text-width:500px></text-height:200px></b></th></tr>
             
                  
        <th colspan="5">Roll number:<%=stud.getRollno() %>&nbsp;&nbsp;&nbsp;&nbsp; Name:<%=stud.getS_name() %><br>Programme :<%=stud.getProgramme() %></th>
     <tr>
                        <th>Course Code</th> 
                        <th>Course Name</th>
                        <th>Credits</th>
                        <th>Theory</th>
                        <th>Periodic Test</th>
                        <th>Practical</th>
                        <th>Term Work</th>
                        <th>Oral</th>
                       
                        <% for(Object obj1:couCode)
                        {
                            cou_code=(String)obj1;
                            course=CourseCon.getCourseObject(cou_code);
                         %>   
                        <tr>
                            <td><%=cou_code%></td> 
                            <td><%=(course.getCourse_name()).toUpperCase()%></td> 
                            <td><%=course.getCou_credit() %></td> 
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
                        
         let doc = new jsPDF('p', 'pt', 'a4');
         var handler={'#editor':function(element,renderer){return true;}};
         
    function load(){
    doc.fromHTML($('#HallTicket').html(),15,15,{
             'width':170,'elementHandlers':handler
         }); 
         
         //doc.addHTML(document.body, function () {  
           doc.save('file.pdf');
           //this.saveAs("C:\Users\sarvadnya\Documents\NetBeansProjects\Registration_system_final\web\Images\file.pdf");           
         }

    </script>
                       <% }
        }catch(Exception e){}
                        }//if close
                    }
                    }//second if close
                }//outer for close
            }//outer if close
        else if(hallTicketType.equals("final"))
        {
            
            //out.println("final hallticket generation");
            String programmes[]={"CM","IF","ME","ME","CE","CE","EL","EL","EE","DDGM","IDD","PL","AE"};//Array of programmes
            int shift[]={1,1,1,2,1,2,1,2,1,1,1,1,1,1};//Array of shift for esch programme.
            String regno,cou_code;
            Courses course;
            Student_data stud;
            String reg_term_year=AdminCon.getReg_term_year();
            //Admin_data object is used to get current term_year value such as(ODD-18 or EVN-18) 
           Admin_data ad=AdminCon.getAdminInfo();
            for(int i=0;i<13;i++)
            {
                for(int j=1;j<=3;j++)
                {
                    //li contains regno of students of a particular programme,shift,year.
                    List li=AdminCon.getRegNoByProgrammeFinal(programmes[i], shift[i], j,reg_term_year);%><br><br>
                   
                    <% 
                    if(li.size()>0) 
                    {
                    for(Object obj:li) 
                    { 
                        regno=(String)obj;
                        stud=(Student_data)StudCon.getStudentInfo(regno);
                        //returns cou_codes of courses registered by each student.%><br><br>
                       <% 
                       try{ 
                           
                       List couCode=AdminCon.generateIndividualFinalHallTicket(regno, programmes[i], j,stud.getTerm());
                        
                        if(couCode.size()>0)
                        {
                        //Returns course object for each cou_code in couCode list.
                        %> 
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
                      <div id="HallTicket">  
                      <table border="1">
                        <thead>
                        <th>Course Code</th> 
                        <th>Course Name</th>
                        <th>Credits</th>
                        <th>Theory</th>
                        <th>Periodic Test</th>
                        <th>Practical</th>
                        <th>Term Work</th>
                        <th>Oral</th>
                        </thead> 
                        <% 
                            for(Object obj1:couCode)
                            { 
                            cou_code=(String)obj1;
                            course=CourseCon.getCourseObject(cou_code);
                            
                         %>   
                        <tr>
                            <td><%=cou_code%></td> 
                            <td><%=(course.getCourse_name()).toUpperCase()%></td> 
                            <td><%=course.getCou_credit() %></td> 
                            <td><%if(course.getCou_th_min()>0)out.print("Y"); else out.print("--"); %></td>  
                            <td><%if(course.getCou_pt_min()>0)out.print("Y"); else out.print("--"); %></td>  
                            <td><%if(course.getCou_pr_min()>0)out.print("Y"); else out.print("--"); %></td>  
                            <td><%if(course.getCou_tw_min()>0)out.print("Y"); else out.print("--"); %></td>  
                            <td><%if(course.getCou_or_min()>0)out.print("Y"); else out.print("--"); %></td>
                                    </tr>
                        <%
                            } 
                        %>
            </table>
            </div>
            <div id="editor"></div>
            <br><br><br>
            <script>
                        
         let doc = new jsPDF('p', 'pt', 'a4');
         var handler={'#editor':function(element,renderer){return true;}};
         
        function load(){
        doc.fromHTML($('#HallTicket').html(),15,15,{
                 'width':170,'elementHandlers':handler
             }); 
         
         //doc.addHTML(document.body, function () {  
           doc.save('file.pdf');
           //this.saveAs("C:\Users\sarvadnya\Documents\NetBeansProjects\Registration_system_final\web\Images\file.pdf");           
         }

            </script>
                       <% }
                    }//try close
            catch(Exception e){}
                        }//for close
                    }//
                    }//second if close
                }//outer for close
        }

        %>
        </div>
        <% } %>
    </body> 
</html>
