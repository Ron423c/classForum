<%-- 
    Document   : classPosts
    Created on : Jul 24, 2018, 6:32:57 AM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%!
    Connection conn = null;
    Statement st = null;
    ResultSet rs = null;
%>

<%@ include file="partials/header.jsp" %> 

    <link rel="stylesheet" href="styles/classPosts.css"/>
   
    <header class="jumbotron">
         <div class="container">
             <h1>Welcome To Classes Unofficially!</h1>
             <p>Learn & Help | Just for Fun</p>
             <p>
                <a class="btn btn-success btn-large" href="classPostForm.jsp">Add New Class Post</a>
             </p>
         </div>
     </header>
     
    <div class="row text-center" style="display:flex; flex-wrap: wrap;">
        <%

String user, pass;

user = request.getParameter("email");
pass = request.getParameter("password");

try{
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root", "nothing");
    st = conn.createStatement();
    String sql = "SELECT subject, topic, description, email from classPosts";
    rs = st.executeQuery(sql);
    while(rs.next()){ %>
            <div class="col-md-4 col-sm-6">
                <div class="thumbnail">
                   <!--<img src="">-->
                   <div class="caption">
                       <h3><%=rs.getString(1)%></h3>
                   </div>
                   <div class="caption">
                       <h4><%=rs.getString(2)%></h4>
                   </div>
                   <p>
                       <%=rs.getString(3)%>
                   </p>
                   <p>
                       <a href="showClassPost.jsp" class="btn btn-primary">More info</a>
                   </p>
                </div>
            </div> 
       <% }
    
    //out.println("  ===  "+pass);
    conn.close();
}catch(Exception ex){
    out.println(ex);
    //response.sendRedirect("resister.jsp");
} %>
    </div>
        
<%@ include file="partials/footer.jsp" %>  
