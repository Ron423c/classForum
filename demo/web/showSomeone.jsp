<%-- 
    Document   : showSomeone
    Created on : Aug 5, 2018, 3:38:21 PM
    Author     : khan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%!
    Connection conn = null;
    Statement st = null;
    ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Details of someone</h1>
        <%
            String email = request.getParameter("name");
            //out.println(email);
            try{
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root", "nothing");
                st = conn.createStatement();
                String sql = "SELECT fname, lname, email, dept, sem, sec, TorS from users WHERE email='"+email+"' ";
                rs = st.executeQuery(sql);
                int i = 1;
                if(rs.next()){
                    while(i<8){
                    out.println(rs.getString(i));
                    i++;
                    }
                }
            }
            catch(Exception ex){
                out.println(ex);
                //response.sendRedirect("resister.jsp");
            }
        %>
    </body>
</html>
