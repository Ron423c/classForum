<%-- 
    Document   : profile
    Created on : Aug 19, 2018, 1:19:08 PM
    Author     : khan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%!
    Connection conn = null;
    Statement st = null;
    ResultSet rs = null;
%>
<%@ include file="partials/header.jsp" %> 
<!--<link rel="stylesheet" href="styles/showClassPosts.css"/>-->
<div class="row" style="display:flex; flex-wrap: wrap;">
    <!--<h1>Profile page</h1>-->
    <%

String user, pass;

user = session.getAttribute("uEmail").toString();
//pass = request.getParameter("password");
//out.print(user);

try{
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root", "nothing");
    st = conn.createStatement();
    String sql = "SELECT fname,lname,email,profilePic, dept, sem, sec from users where email='"+user+"'";
    rs = st.executeQuery(sql);
    rs.next();
    %>
            <div class="col-md-4 col-sm-6">
                <div class="thumbnail text-center shadow" id="userInfo">
                    <img src="<%=rs.getString(4)%>">
                   
                   <div class="caption">
                       <h3 style="text-transform: uppercase;"><%=rs.getString(1)%> <%=rs.getString(2)%></h3>
                       <h5>Dept <%=rs.getString(5)%> | Sem <%=rs.getString(6)%> | Sec <%=rs.getString(7)%></h5>
                   </div>
                   <p>
                       <%=rs.getString(3)%>
                   </p>
                   <p>
                       <a href="updateUserForm.jsp" class="btn btn-primary shadow">Edit Profile</a>
                       <a onclick="showQ()" class="btn btn-danger shadow">Delete Account</a>
                   </p>
                   <div id="theQ" style="display: none;">
                       <hr>
                       <p>Do you really want to delete?</p>
                       <p>
                            <a href="deleteUser.jsp" class="btn btn-sm btn-success shadow">Yes</a>
                            <a onclick="hideQ()" class="btn btn-sm btn-warning shadow">No</a>
                       </p>
                   </div>
                </div>
            </div> 
            <div class="col-md-4 col-sm-6">
                   <div id="posts">
                       <h2>Posts</h2>
                       <ul>
                       <%
                            sql = "SELECT topic, id from classPosts where email='"+user+"'";
                            rs = st.executeQuery(sql);
                            while(rs.next()){
                       %>
                       
                       <a href="showClassPost.jsp?id=<%=rs.getString(2)%>"><li><%=rs.getString(1)%></li></a>
                       
                       <%}%>
                       </ul>
                   </div>
            </div> 
            <div class="col-md-4 col-sm-6">
                   <div id="questions">
                       <h2>Questions</h2>
                       <ul>
                           <li></li>
                           <li></li>
                           <li></li>
                           <li></li>
                       </ul>
                   </div>
            </div>      
<%  
    //out.println("  ===  "+pass);
    conn.close();
}catch(Exception ex){
    out.println(ex);
    //response.sendRedirect("resister.jsp");
} %>
</div>
        
<%@ include file="partials/footer.jsp" %> 
<script>
    function showQ(){
        document.getElementById("theQ").style.display = "block";
    }
    function hideQ(){
        document.getElementById("theQ").style.display = "none";
    }
</script>