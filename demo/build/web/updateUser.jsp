<%-- 
    Document   : updateUser
    Created on : Oct 4, 2018, 3:26:02 PM
    Author     : khan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
String fname, lname, dept, sem, sec, profilePic, email, sql;
fname = request.getParameter("fname");
lname = request.getParameter("lname");
email = session.getAttribute("uEmail").toString();
dept = request.getParameter("dept");
sem = request.getParameter("sem");
sec = request.getParameter("sec");
profilePic = request.getParameter("profilePic");
//out.print(email);
//sql = "UPDATE classPosts (subject, topic, email, description) "+"VALUES('"+subject+"','"+topic+"','"+email+"','"+desc+"')";
sql = "UPDATE users SET fname='"+fname+"', lname='"+lname+"', dept='"+dept+"', sec='"+sec+"', sem='"+sem+"', profilePic='"+profilePic+"' WHERE email='"+email+"';";

try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root", "nothing");
    Statement st = conn.createStatement();
    st.executeUpdate(sql);
    conn.close();
    response.sendRedirect("profile.jsp");
}catch(Exception ex){
    out.println(ex);
//    response.sendRedirect("resister.jsp?error=1");
}

%>