<%-- 
    Document   : showClassPost
    Created on : Aug 26, 2018, 5:03:40 PM
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

    <!--<link rel="stylesheet" href="styles/classPosts.css"/>-->
     
    <div class="text-center" style="display:flex; flex-wrap: wrap;">
        <%
int pics = 0, files = 0;
String user, pass;

user = session.getAttribute("uEmail").toString();
pass = request.getParameter("password");

try{
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root", "nothing");
    st = conn.createStatement();
    String sql = "SELECT * from classPosts";
    rs = st.executeQuery(sql);
    if(rs.next()){ %>
        <div class="thumbnail shadow" id="thePost">
           <!--<img src="">-->
           <div>
               <h4><%=rs.getString(2)%></h4>
           </div>
           <div class="caption">
               <h2><%=rs.getString(3)%></h2>
           </div>
           <p>
               <%=rs.getString(4)%>
           </p>
            <div>
               <%
                   for(int i = 6; i<11; i++)
                       if(rs.getString(i) != null){%>
                       <div class="col-md-3 col-sm-6 flex thumbnail shadow">
                       <img src="<%=rs.getString(i)%>">
                       </div>
                 <% } 
                    for(int i = 11; i<13; i++)
                       if(rs.getString(i) != null)
                           files++;
               %>
           </div>
           <div class="btns">
           <%if(rs.getString(5).equals(user)){%>
                <a href="#" id="deleteBtn" class="btn btn-danger btn-sm shadow">Delete</a>
                <a href="#" id="updateBtn" class="btn btn-info btn-sm shadow">Update</a>
           <%}%>
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
