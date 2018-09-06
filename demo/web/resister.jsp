<%-- 
    Document   : resister
    Created on : Jul 23, 2018, 3:42:29 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <% 
    if(session.getAttribute("uEmail") == null){
        //String userEmail = session.getAttribute("uEmail").toString();
%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sing Up</title>
        <link rel="stylesheet" href="styles/resister.css">
    </head>
    <body>
        <%
            String error = request.getParameter("error");
            if(error!=null && error.equals("1")){%>
            <div align="center">
                You already have an account
                <a href="login.jsp">LogIn</a>
            </div>
        <%}%>
        
        <div style="width: 50%; margin: 25px auto;">
            
                <form  id="signup" action="addUser.jsp" method="POST">
                    
                    <table>
                        <tr>
                            <td>
                                <div class="container">
                                    <div class="header">
                                        <h3>Sign Up</h3>

                                        <p>You want to fill out this form</p>

                                    </div>

                                    <div class="sep"></div>

                                    <div class="inputs">
                                      <input type="text" name="fname" placeholder="First name" autofocus required />
                                      <input type="text" name="lname" placeholder="Last name" autofocus required />

                                      <input type="email" name="email" placeholder="e-mail" autofocus required />

                                      <input type="password" name="password" placeholder="Password" required />
<!--                                      <input type="button" id="profilePic" value="Profile Pic">
                                      <input type="file" id="my_file" accept=".png, .jpg, .jpeg" required>-->
                                      <input type="text" name="profilePic" placeholder="pic url" required/>
                                        <div class="checkboxy">
                                            <input name="cecky" id="checky" value="1" type="checkbox" required /><label class="terms">I accept the terms of use</label>
                                        </div>

                                    </div>
                                </div>
​
                            </td>
                            <td style="margin-top: 30%;">
               
                                <select name="TorS" id="TorSid" required>
                                    <option value="">T or S</option>
                                    <option value="teacher">Teacher</option>
                                    <option value="student">Student</option>
                                </select> <br>
                                <select name="dept" id="deptid" required>
                                    <option value="">Dept</option>
                                    <option value="IT">IT</option>
                                    <option value="CSE">CSE</option>
                                    <option value="CE">CE</option>
                                    <option value="ECE">ECE</option>
        <!--                            <option value="5">5th</option>
                                    <option value="6">6th</option>
                                    <option value="7">7th</option>
                                    <option value="8">8th</option>-->
                                </select>
                                <br>
                                <select name="sem" id="semid" required>
                                    <option value="">Semester</option>
                                    <option value="1">1st</option>
                                    <option value="2">2nd</option>
                                    <option value="3">3rd</option>
                                    <option value="4">4th</option>
                                    <option value="5">5th</option>
                                    <option value="6">6th</option>
                                    <option value="7">7th</option>
                                    <option value="8">8th</option>
                                </select>
                                <br>
                                <select name="sec" id="secid" required>
                                    <option value="">Section</option>
                                    <option value="A">A</option>
                                    <option value="B">B</option>
                                    <option value="nil">No sec</option>
                                </select>
                                <!--<input type="file">-->
                            </td>
                        </tr>
                        
                    </table>
                    <button>Sign Up</button>
                </form>
            <a href="index.jsp">Go Back</a>
        </div>
        
        <script type="text/javascript" src="js/resister.js"></script>
    </body>
</html>
<%
}else
    response.sendRedirect("classPosts.jsp");
%>