<%-- 
    Document   : addClassPost
    Created on : Aug 26, 2018, 4:23:00 PM
    Author     : khan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
String subject, topic, desc, pic1, pic2, pic3, file1, email, sql;
subject = request.getParameter("subject");
topic = request.getParameter("topic");
email = session.getAttribute("uEmail").toString();
desc = request.getParameter("description");
pic1 = request.getParameter("pic1");
pic3 = request.getParameter("pic3");
pic2 = request.getParameter("pic2");


sql = "INSERT INTO classPosts (subject, topic, email, description, pic1, pic2, pic3) "+"VALUES('"+subject+"','"+topic+"','"+email+"','"+desc+"','"+pic1+"','"+pic2+"','"+pic3+"')";
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root", "nothing");
    Statement st = conn.createStatement();
    st.executeUpdate(sql);
    conn.close();
    response.sendRedirect("classPosts.jsp");
}catch(Exception ex){
    out.println(ex);
//    response.sendRedirect("resister.jsp?error=1");
}

%>