<%-- 
    Document   : admin_panel
    Created on : Jul 28, 2018, 6:42:21 PM
    Author     : sarvadnya
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="mainController.AdminCon"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>  
        <script src="../../assets/js/jquery1.min.js"></script>
        <script src="../../assets/js/bootstrap1.min.js"></script>
    </head>
    <body>
        <%
            if(session.getAttribute("admin_uname")==null || session.getAttribute("admin_user")==null)
            {
               response.sendRedirect("../../index.jsp");
            }
            else if(session.getAttribute("admin_user").equals("admin"))
           {    
               List newCourses=AdminCon.checkNewCourse();
               int size=newCourses.size();
          %>   
        <%@include file="adminHeader.jsp"%> 
        <div class="container">
        <!--Used for displaying flash data.-->
        <%  try{
            if(!request.getParameter("result").equals("null"))%> 
            <div class="row"><div class="col-lg-8"><p class=" alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("result"));%></p></div></div>
        <%}catch(Exception e){}%>
        
        <%  try{
            if(!request.getParameter("failResult").equals(null))%> 
            <div class="row"><div class="col-lg-8"><p class=" alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("failResult"));%></p></div></div>
        <%}catch(Exception e){}%>         
        
        <script type="text/javascript"> //if any course found for confirmation then 
        <%if(!newCourses.isEmpty()){%> //notification is displayed           
           function notify()
             { 
                confirm("Confirmation of "+<%=size%>+" courses is required.\nConfirm now ?");
             }
           <%}%> 
        </script> 
        
        <h1>Welcome to Admin Panel</h1> <hr><br>
        <div class="row">
                <div class="col-lg-4">
                <div class="panel panel-primary">
                   <div class="panel-heading">
                           <h3>Registration Settings</h3>
                   </div>
                   <div class="panel-body">
                       <form>
                       <button class="btn btn-primary" formaction="controlReg.jsp">Control registration</button><br><br>
                       <button class="btn btn-primary" formaction="maxRegCourses.jsp">Maximum allowed registration courses</button><br><br>
                       <!--button class="btn btn-primary" formaction="hallTicketGeneration.jsp">Hall ticket generation</button-->
                       </form>
                   </div>
                </div>
                </div>
                <div class="col-lg-4">
                <div class="panel panel-primary">
                   <div class="panel-heading">
                           <h3>Registration Reports</h3>
                   </div>
                   <div class="panel-body">
                       <form>
                       <button class="btn btn-primary" formaction="courseRegReport.jsp">Course registration report</button><br><br>
                       <button class="btn btn-primary" formaction="examRegReport.jsp">Exam registration report</button><br><br>
                       <button class="btn btn-primary" formaction="collageRegReport.jsp">College registration report</button><br><br>
                       </form>
                   </div>
                </div>
                </div>
                <div class="col-lg-4">
                <div class="panel panel-primary">
                   <div class="panel-heading">
                           <h3>Reset Registration</h3>
                   </div>
                   <div class="panel-body">
                       <form>
                       <button class="btn btn-primary" formaction="courseRegReset.jsp">Reset Course Registration</button><br><br>
                       <button class="btn btn-primary" formaction="examRegReset.jsp">Reset Exam registration</button><br><br>
                       </form>
                   </div>
                </div>
                </div>
        </div>
        <hr>
        <div class="row">
                <div class="col-lg-4">
                    <div class="panel panel-primary">
                       <div class="panel-heading">
                               <h3>Student Settings</h3>
                       </div>
                       <div class="panel-body">
                           <form>
                                <button class="btn btn-primary" formaction="studentDetails.jsp">View student details</button><br><br>
                           </form>
                       </div>
                    </div><br>
                    
                    <div class="panel panel-primary">
                       <div class="panel-heading">
                               <h3>Curriculum</h3>
                       </div>
                       <div class="panel-body">
                           <form action="confirmCourse.jsp?page=1" method="post">
                                <button name="courses" onclick="notify()" class="btn btn-primary pull-right">Confirm Course</button>
                                <button formaction="deleteCourseForm.jsp" class="btn btn-primary ">Delete Course</button>
                           </form>
                       </div>
                    </div>
             </div>
       
            
            
                <div class="col-lg-4">
                    <div class="panel panel-primary">
                       <div class="panel-heading">
                               <h3>General Settings</h3> 
                       </div>
                       <div class="panel-body"> 
                           <form>
                               <button class="btn btn-primary" formaction="changeAdminPwdForm.jsp">Change Admin Password</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
                           <button class="btn btn-primary" formaction="hodRegForm.jsp">Add HOD</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <button class="btn btn-primary" formaction="http://localhost/phpmyadmin/">View DataBase</button><br><br>
                           <button class="btn btn-primary" formaction="exemption.jsp">Exemption</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <button class="btn btn-primary" formaction="notice.jsp">Update notice</button><br><br>
                           <button class="btn btn-primary" formaction="accessAllAccountsForm.jsp">Access All Accounts</button>
                           <button class="btn btn-primary" formaction="changeHodPwdFormByAdmin.jsp">change HOD password</button><br><br>
                         </form>
                       </div>
                    </div>
                    </div>
             
            
            <div class="col-lg-4">
            <div class="panel panel-primary">
               <div class="panel-heading">
                       <h3>Auto updation</h3>
               </div> 
               <div class="panel-body">
                   <form method="POST">
                       <div class="panel panel-primary">
                           <div class="panel-body">
                       Enter Current Semester Term :<select name="term" required oninvalid="this.setCustomValidity('Term is required.')"
                              oninput="this.setCustomValidity('')" >
                            <option>ODD</option> 
                            <option>EVEN</option> 
                        </select> <br><br>
                        <button class="btn btn-primary" formaction="../../Controller/autoUpdation.jsp?termOrYear=term">Update Term</button><br><br>
                           </div>
                       </div>
                        <button class="btn btn-primary" formaction="../../Controller/autoUpdation.jsp?termOrYear=year">Update Year</button>        
                  </form> 
               </div>
            </div>
       </div>            
        </div>
        <form>
            <a href="hallTicketGeneration.jsp">Hall ticket</a>
        </form>
        <%}%>
        </div>
    </body>
</html>
