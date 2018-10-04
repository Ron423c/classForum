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
        <div class="thumbnail shadow" id="thePost">
           <!--<img src="">-->
           <div>
               <h4><u><%=rs.getString(2)%></u></h4>
           </div>
           <div class="caption">
               <h2><u><%=rs.getString(3)%></u></h2>
           </div>
           <p id="desc">
               <%=rs.getString(4)%>
           </p>
           <hr>
           
           <div class="row">
               <label>Files:</label>
                <%for(int i = 11; i<13; i++)
                  if(rs.getString(i) != null) {%>
                  <div>
                      <a href="#"><%=rs.getString(i)%></a>
                  </div>
                <% } else {out.print("no files"); break;} %>
            </div>
            <hr>
            <div class="row">
                <div>
                <label>Pics:</label>
                </div>
               <%
                for(int i = 6; i<11; i++)
                    if(rs.getString(i) != null && !rs.getString(i).equals("null")){ %>
                    <div class="col-sm-6 col-md-3">
                        <div class="thumbnail shadow">
                            <a href="<%=rs.getString(i)%>"><div class="">
                                <img class="image" src="<%=rs.getString(i)%>">
                                </div></a>
                        </div>
                    </div>
                 <% }// else {out.print("no pics"); break;} 
                 %> 
           </div>
           <hr>
           <p>
               <em>Submitted By <strong>
               <% String tempMail = rs.getString(5);
               if(tempMail.equals(user)){
                   out.print("You");
               }else{
               sql = "SELECT fname from users where email='"+tempMail+"'";
                      rs = st.executeQuery(sql);
                      rs.next();
                      out.print(rs.getString(1));
               }
               %>
               </strong> </em>
            </p>
           <div class="btns">
               <%if(tempMail.equals(user)){%>
                <a onclick="showQ()" id="deleteBtn" class="btn btn-danger btn-sm shadow">Delete</a>
                <a href="updatePostForm.jsp?id=<%=id%>" id="updateBtn" class="btn btn-info btn-sm shadow">Update</a>
                <div id="theQ" style="display: none;">
                       <hr>
                       <p>Do you really want to delete?</p>
                       <p>
                            <a href="deletePost.jsp" class="btn btn-sm btn-success shadow">Yes</a>
                            <a href="showClassPost.jsp?id=<%=id%>" class="btn btn-sm btn-warning shadow">No</a>
                       </p>
                </div>
           <%}%>
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
    </div>
        
<%@ include file="partials/footer.jsp" %>  
<script>
    function showQ(){
        document.getElementById("theQ").style.display = "block";
    }
</script>