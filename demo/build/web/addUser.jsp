<%-- 
    Document   : addUser
    Created on : Jul 24, 2018, 9:44:48 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%--<%@page import="com.cloudinary.*" %>--%>
<%
String fname, lname, email, password, TorS, sec = "NiL", dept, sem = "NiL", pic, sql;
fname = request.getParameter("fname");
lname = request.getParameter("lname");
email = request.getParameter("email");
password = request.getParameter("password");
TorS = request.getParameter("TorS");
pic = request.getParameter("profilePic");
pic = request.getParameter("profilePic");
out.println(pic);
out.println(fname);
if(TorS.charAt(0) != 'T')
{
    sec = request.getParameter("sec");
    sem = request.getParameter("sem");
}
    dept = request.getParameter("dept");

sql = "INSERT INTO users (fname, lname, email, password, TorS, sec, dept, sem, profilePic) VALUES('"+fname+"','"+lname+"','"+email+"','"+password+"','"+TorS+"','"+sec+"','"+dept+"','"+sem+"','"+pic+"')";
//sql = "INSERT INTO users (fname, lname, email, password, TorS, sec, dept, sem,) VALUES('"+fname+"','"+lname+"','"+email+"','"+password+"','"+TorS+"','"+sec+"','"+dept+"','"+sem+"','"+pic+"')";

try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root", "nothing");
    Statement st = conn.createStatement();
    st.executeUpdate(sql);
    conn.close();
    session = request.getSession();
    session.setAttribute("uEmail", email);
    response.sendRedirect("classPosts.jsp");
}catch(Exception ex){
    //out.println(ex);
    response.sendRedirect("resister.jsp?error=1");
}

%>