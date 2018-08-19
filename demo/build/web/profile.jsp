<%-- 
    Document   : profile
    Created on : Aug 19, 2018, 1:19:08 PM
    Author     : khan
--%>

<% 
    if(session.getAttribute("uEmail") != null){
        String userEmail = session.getAttribute("uEmail").toString();
%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
    </head>
    <body>
        <h1>Profile page</h1>
    </body>
</html>
<%
}else
    response.sendRedirect("login.jsp");
%>