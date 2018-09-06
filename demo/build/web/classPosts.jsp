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
    int pics = 0, files = 0;
%>

<%@ include file="partials/header.jsp" %> 

    <link rel="stylesheet" href="styles/classPosts.css"/>
   
    <header class="jumbotron shadow">
         <div class="container">
             <h1><i class="fas fa-user-graduate"></i> Welcome To Classes Unofficially!</h1>
             <p>Learn & Help | Just for Fun</p>
             <p>
                <a class="btn btn-info btn-large shadow" href="classPostForm.jsp">Add New Class Post</a>
             </p>
         </div>
     </header>
     
    <div class="row text-center" style="display:flex; flex-wrap: wrap;">
        <%

String user, pass;

user = session.getAttribute("uEmail").toString();
//pass = request.getParameter("password");

try{
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root", "nothing");
    st = conn.createStatement();
    String sql = "SELECT * from classPosts";
    rs = st.executeQuery(sql);
    while(rs.next()){ %>
            <div class="col-md-4 col-sm-6">
                <div class="thumbnail shadow">
                   <!--<img src="">-->
                   <div>
                       <h4><%=rs.getString(2)%></h4>
                   </div>
                   <div>
                       <h3><%=rs.getString(3)%></h3>
                   </div>
                   <p>
                       <%=rs.getString(4).substring(0,100)%>.....
                   </p>
                   <div>
                       <% pics = 0; files = 0;
                           for(int i = 6; i<11; i++)
                               if(rs.getString(i) != null)
                                   pics++;
                           for(int i = 11; i<13; i++)
                               if(rs.getString(i) != null)
                                   files++;
                       %>
                       <p><%=pics%> pics | <%=files%> files</p>
                   </div>
                   <p>
                       <a href="showClassPost.jsp?id=<%=rs.getString(1)%>" class="btn btn-success btn-sm shadow">More info</a>
                   </p>
                   <p>
                   <%if(rs.getString(5).equals(user) || rs.getString(5).equals("admin")){%>
                        <a href="#" id="deleteBtn" class="btn btn-danger btn-sm shadow">Delete</a>
                        <a href="updatePostForm.jsp?id=<%=rs.getString(1)%>" id="updateBtn" class="btn btn-info btn-sm shadow">Update</a>
                   <%}%>
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
