package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.cloudinary.utils.ObjectUtils;
import java.util.Map;
import java.io.File;
import java.sql.*;
import com.cloudinary.Cloudinary;

public final class addUser_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

Cloudinary cloudinary = new Cloudinary();
//cloudinary.upload(fileRef, ObjectUtils.emptyMap());
File file = new File("styles/assets/background.jpg");
Map uploadResult = cloudinary.uploader().upload(file, ObjectUtils.emptyMap());
out.print(uploadResult);
//String fname, lname, email, password, TorS, sec = "NiL", dept, sem = "NiL", sql;
//fname = request.getParameter("fname");
//lname = request.getParameter("lname");
//email = request.getParameter("email");
//password = request.getParameter("password");
//TorS = request.getParameter("TorS");
//if(TorS.charAt(0) != 'T')
//{
//    sec = request.getParameter("sec");
//    sem = request.getParameter("sem");
//}
//    dept = request.getParameter("dept");
//
//sql = "INSERT INTO users (fname, lname, email, password, TorS, sec, dept, sem) "+"VALUES('"+fname+"','"+lname+"','"+email+"','"+password+"','"+TorS+"','"+sec+"','"+dept+"','"+sem+"')";
//
//try{
//    Class.forName("com.mysql.jdbc.Driver");
//    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root", "nothing");
//    Statement st = conn.createStatement();
//    st.executeUpdate(sql);
//    conn.close();
//    session = request.getSession();
//    session.setAttribute("uEmail", email);
//    response.sendRedirect("classPosts.jsp");
//}catch(Exception ex){
//    //out.println(ex);
//    response.sendRedirect("resister.jsp?error=1");
//}


    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
