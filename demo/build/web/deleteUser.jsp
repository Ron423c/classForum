<%-- 
    Document   : deleteUser
    Created on : Sep 27, 2018, 3:21:45 PM
    Author     : khan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ include file="partials/header.jsp" %> 
<%
String email, sql;

email = session.getAttribute("uEmail").toString();

sql =  "DELETE from users where email='"+email+"'";
        
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root", "nothing");
    Statement st = conn.createStatement();
    st.executeUpdate(sql);
    conn.close();
    response.sendRedirect("logout.jsp");
}catch(Exception ex){
    //out.println(ex);
    response.sendRedirect("resister.jsp?error=1");
}

%>
<%@ include file="partials/footer.jsp" %>  
