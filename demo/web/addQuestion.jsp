<%-- 
    Document   : addQuestion
    Created on : Aug 27, 2018, 8:12:37 PM
    Author     : khan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
//String subject, topic, desc, pic1, file1, email, sql;
//subject = request.getParameter("subject");
//topic = request.getParameter("topic");
//email = session.getAttribute("uEmail").toString();
//desc = request.getParameter("description");
//
//sql = "INSERT INTO classPosts (subject, topic, email, description) "+"VALUES('"+subject+"','"+topic+"','"+email+"','"+desc+"')";

try{
//    Class.forName("com.mysql.jdbc.Driver");
//    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root", "nothing");
//    Statement st = conn.createStatement();
//    st.executeUpdate(sql);
//    conn.close();
    response.sendRedirect("forum.jsp");
}catch(Exception ex){
    out.println(ex);
//    response.sendRedirect("resister.jsp?error=1");
}

%>