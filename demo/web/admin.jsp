<%-- 
    Document   : admin
    Created on : Aug 5, 2018, 3:01:51 PM
    Author     : khan
--%>

<%-- 
    Document   : auth
    Created on : Jul 28, 2018, 8:06:25 PM
    Author     : khan
--%>

<% 
    if(session.getAttribute("uEmail") != null){
        String userEmail = session.getAttribute("uEmail").toString();
%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%!
    Connection conn = null;
    Statement st = null;
    ResultSet rs = null;
%>
<%

String user, pass;

user = request.getParameter("email");
pass = request.getParameter("password");

try{
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root", "nothing");
    st = conn.createStatement();
    String sql = "SELECT fname,lname,email from users";
    rs = st.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Admin page</h1>
<table align="center" border="5">
    <th>first name</th>
    <th>last name</th>
    <th>email</th>
    
<%
    while(rs.next()){
        //out.println(rs.getString(5));
            int i = 1;
            %><tr><%
            while(i<4){
                if(i==3){
%>                
            <td><a href="profile.jsp?name=<%=rs.getString(i)%>"><%out.println(rs.getString(i));%></a></td>
                
<%               }else { %>
                        <td><%out.println(rs.getString(i));%></td>
                       <%}
                i++;
            }
            %></tr><%
        //response.sendRedirect("classPosts.jsp");
    }
%>
</table>                
<%
    
    //out.println("  ===  "+pass);
    conn.close();
}catch(Exception ex){
    out.println(ex);
    //response.sendRedirect("resister.jsp");
}
%>
    </body>
</html>
<%
}else
    response.sendRedirect("login.jsp");
%>