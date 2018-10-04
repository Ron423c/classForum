<%-- 
    Document   : updateUser
    Created on : Oct 4, 2018, 2:07:25 PM
    Author     : khan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ include file="partials/header.jsp" %> 
<%!
    Connection conn = null;
    Statement st = null;
    ResultSet rs = null;
    int pics = 0, files = 0;

String user, pass;
%><%
String user;

user = session.getAttribute("uEmail").toString();

try{
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root", "nothing");
    st = conn.createStatement();
    String sql = "SELECT * from users where email='"+user+"'";
    rs = st.executeQuery(sql);
    if(rs.next()){ %>
<div class="row">
        <h1 style="text-align: center;">Edit Your Profile</h1>
    <div style="width: 30%; margin: 25px auto;">
        <form action="updateUser.jsp" method="POST">
            <div class="form-group">
                <label for="fname">First Name:</label>
                <input class="form-control" type="text" name="fname" placeholder="First Name" value="<%=rs.getString(2)%>" required>    
            </div>
            <div class="form-group">
                <label for="lname">Last Name:</label>
                <input class="form-control" type="text" name="lname" placeholder="Last Name" value="<%=rs.getString(3)%>" required>    
            </div>
<!--            <div class="form-group">
                <label for="email">Email</label>
                <input class="form-control" type="email" name="email" placeholder="First Name" value="<%=rs.getString(4)%>" required>    
            </div>-->
            <div class="form-group">
                <label for="dept">Dept:</label>
                <input class="form-control" type="text" name="dept" placeholder="Dept" value="<%=rs.getString(6)%>" required>    
            </div>
            <div class="form-group">
                <label for="sem">Semester</label>
                <input class="form-control" type="number" min="1" max="8" name="sem" placeholder="Semester" value=<%=rs.getString(7)%> required>    
            </div>
            <div class="form-group">
                <label for="sec">Section</label>
                <input class="form-control" type="text" name="sec" placeholder="Section" value="<%=rs.getString(8)%>" required>    
            </div>
            <div class="form-group">
                <label for="profilePic">Profile Pic:</label>
                <input class="form-control" type="text" name="profilePic" placeholder="pic url" value="<%=rs.getString(10)%>" required>
            </div>
            <div class="form-group">
                    <button class="btn btn-lg btn-primary btn-block shadow">Submit!</button>
            </div>
        </form>
            <button class="btn btn-xs btn-link" onclick="goBack()">Go back</button>
    </div>
</div>
<% } else{
            response.sendRedirect("classPosts.jsp");
         }
    //out.println("  ===  "+pass);
    conn.close();
}catch(Exception ex){
    out.println(ex);
    //response.sendRedirect("resister.jsp");
} %>
<%@ include file="partials/footer.jsp" %> 
<script>
function goBack() {
    window.history.back();
}
</script>