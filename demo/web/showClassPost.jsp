<%-- 
    Document   : showClassPost
    Created on : Aug 26, 2018, 5:03:40 PM
    Author     : khan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String hi = request.getParameter("hi");
out.print(hi);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
