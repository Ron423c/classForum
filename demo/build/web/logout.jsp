<%-- 
    Document   : logout
    Created on : Aug 19, 2018, 2:40:22 PM
    Author     : khan
--%>

<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>