<%-- 
    Document   : addUser
    Created on : Jul 24, 2018, 9:44:48 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
String fname, lname, email, password, TorS, sec = "NiL", dept, sem = "NiL", sql;
fname = request.getParameter("fname");
lname = request.getParameter("lname");
email = request.getParameter("email");
password = request.getParameter("password");
TorS = request.getParameter("TorS");
if(TorS.charAt(0) != 'T')
{
    sec = request.getParameter("sec");
    sem = request.getParameter("sem");
}
    dept = request.getParameter("dept");

sql = "INSERT INTO users (fname, lname, email, password, TorS, sec, dept, sem) "+"VALUES('"+fname+"','"+lname+"','"+email+"','"+password+"','"+TorS+"','"+sec+"','"+dept+"','"+sem+"')";

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