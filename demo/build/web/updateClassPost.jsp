<%-- 
    Document   : updateClassPost
    Created on : Sep 3, 2018, 10:47:39 PM
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

int id = Integer.parseInt(request.getParameter("id"));

//sql = "UPDATE classPosts (subject, topic, email, description) "+"VALUES('"+subject+"','"+topic+"','"+email+"','"+desc+"')";
sql = "UPDATE classPosts SET subject='"+subject+"', topic='"+topic+"', description='"+desc+"', pic1='"+pic1+"', pic2='"+pic2+"', pic3='"+pic3+"' WHERE id="+id+";";

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