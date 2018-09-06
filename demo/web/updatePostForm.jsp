<%-- 
    Document   : updatePost
    Created on : Sep 3, 2018, 10:29:40 PM
    Author     : khan
--%>

<%-- 
    Document   : classPostForm
    Created on : Aug 21, 2018, 8:29:49 PM
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
int pics = 0, files = 0;
String user, id;

user = session.getAttribute("uEmail").toString();
id = request.getParameter("id");
//out.println(id);

try{
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root", "nothing");
    st = conn.createStatement();
    String sql = "SELECT * from classPosts where id='"+id+"'";
    rs = st.executeQuery(sql);
    if(rs.next()){ %>
        <div class="row">
        <h1 style="text-align: center;">Create a new post</h1>
        <div style="width: 30%; margin: 25px auto;">
            <form action="updateClassPost.jsp?id=<%=id%>" method="POST">
                <div class="form-group">
                    <input class="form-control" type="text" name="subject" placeholder="Subject" value="<%=rs.getString(2)%>">    
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" name="topic" placeholder="Title or Topic" value="<%=rs.getString(3)%>">    
                </div>
<!--                <div class="form-group">
                    <input class="form-control" type="text" name="image" placeholder="image url">    
                </div>-->
                <div class="form-group">
                    <textarea class="form-control" name="description" placeholder="description"><%=rs.getString(4)%></textarea>
                </div>
                <div class="form-group">
                    <p>Add pics</p>
                    <div class="form-group">
                        <input class="form-control" type="text" name="pic1" placeholder="url" value="<%=rs.getString(6)%>">    
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="text" name="pic2" placeholder="url" value="<%=rs.getString(7)%>">    
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="text" name="pic3" placeholder="url" value="<%=rs.getString(8)%>">    
                    </div>
<!--                    <div class="form-group">
                        <input class="form-control" type="text" name="subject" placeholder="Subject" value="<%=rs.getString(9)%>">    
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="text" name="subject" placeholder="Subject" value="<%=rs.getString(10)%>">    
                    </div>-->
                    <!--<i class="far fa-image fa-2x" name="pic"></i>-->
                </div>
                <div class="form-group">
                    <p>Add files</p>
                    <i class="fas fa-file-pdf fa-2x" name="file"></i>
                </div>
                <div class="form-group">
                    <button class="btn btn-lg btn-primary btn-block shadow">Submit!</button>
                </div>
            </form>
             <a href="classPosts.jsp">Go back</a>
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