

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>course registration</title>
        <link rel="stylesheet" href="styles.css">
        <style>
            #customers 
            {
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }
            #customers td, #customers th {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: center;
            }
            #customers tr:nth-child(even){background-color: #f2f2f2;}
            #customers tr:hover {background-color: #ddd;}
            #customers th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #4CAF50;
                color: white;
            }
    </style>
        <script>
            function update_details()
            {
                alert("Contact the administrator for any updations!!");
            }
        </script>
    </head>
    <body>
       <div class="divide" style="background-color: #43425D; left: 0">
            <div style="color:white;font-size: 20px; font-family: sans-serif;display: block;text-align: center;
                 margin-top: 20px; margin-bottom: 25px;">FRCRCE</div>
            <hr> 
            <ul>
                 <li><a href="student_home.jsp">Home</a></li>
  <li><a href="student_attendance.jsp">Check Attendance</a></li>
  <li><a href="see_student_notice.jsp">Check Notices</a></li>
  <li><a href="student_marks.jsp">Check Marks</a></li>
  <li><a href="course_register.jsp" class="active">Course Registration</a></li>
<!--    <li><a href="chat_faculty.jsp">Chat Room</a></li>-->


  <li><a href="index.jsp">Sign Out</a>
</ul> 
        </div>
        <div class="divide" style="left: 27%; width: 50%; height: 80%; top: 10%; right: 20%; overflow-x: hidden; overflow-y: auto">
            
           <div style="overflow-x: auto;overflow-y: auto; height: 50%; width: 70%">
                        <table id="customers" style="width: 73%; margin-left: 90px">
                            <tr>
                                <th>Course ID</th>
                                <th>Course Name</th>
                            </tr>
                            <%
                            
//                session.setAttribute("A", "SA");
                            Class.forName("com.mysql.jdbc.Driver");  
                           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagement","root","rootroot");
                String qr="select course_id,course_name from courses;";
                PreparedStatement ps=con.prepareStatement(qr);
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
         %>
         <tr>
             <td>
                 <%=rs.getString("course_id")%>
             </td>
             <td>
                 <%=rs.getString("course_name")%>
             </td>
         </tr>
         <%}%>
                        </table>
                        
                        </div>
                        <div class="divide" style="right: 50%; width: 50%; left: 16%; top: 65%; height: 35%">
                            <form action="register_course"> 
                        
                         <% //
//                             if(status.equals("F"))
//        
//                            {
//                         %>
        <!--<font style="color: red;margin-left: 80px;margin-bottom: 5px">Student does not exist!!</font>-->
        <%  
//                }else{
//                        }
        %>
                            <input type="text" name="course_id" placeholder="Course ID">
                        <br>
                        <br>
                        <input type="submit" value="Register the Course">
                    </form>
                            </div>
                        
            
            
        </div>    
        <div class="divide facutly_info_right">
          
           
            <p align="center" class="facutly_info">
                 <%
        String username = (String)session.getAttribute("uname");
        
         Class.forName("com.mysql.jdbc.Driver");  
          con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagement","root","rootroot");
          qr="select fname,lname,branch,roll from student where username=?";
            ps=con.prepareStatement(qr);
            ps.setString(1,username);
             rs=ps.executeQuery();
//           out.println(username);
            while(rs.next())
            {
                String roll = rs.getString("roll");
                String fname = rs.getString("fname");
                String lname = rs.getString("lname");
//                out.println("Pass");
                String department = rs.getString("branch");
                
            %>
            Roll Number :
            <%=roll%>
            <br><br>
            Name :
            <%=fname+" "+lname%>
            <br>
            <br>
            Department :
                <%=department%>
            <br><br>
                <%  }
             
                %>
           
        </p>
        </div>
    </body>
</html>
