<%-- 
    Document   : auth
    Created on : Jul 28, 2018, 8:06:25 PM
    Author     : khan
--%>

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

if(user.equals("admin") && pass.equals("admin"))
    response.sendRedirect("admin.jsp");

try{
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root", "nothing");
    st = conn.createStatement();
    String sql = "SELECT * from users WHERE email = '"+user+"' AND password='"+pass+"'";
    rs = st.executeQuery(sql);
    if(rs.next()){
        session = request.getSession();
        session.setAttribute("uEmail", user);
//        out.println(rs.getString(5));
//            int i = 1;
//            while(i<9){
//                out.println(rs.getString(i));
//                i++;
//            }
        response.sendRedirect("classPosts.jsp");
    }
    else{
        response.sendRedirect("login.jsp");
    }
    
    //out.println("  ===  "+pass);
    conn.close();
}catch(Exception ex){
    out.println(ex);
    //response.sendRedirect("resister.jsp");
}
%>