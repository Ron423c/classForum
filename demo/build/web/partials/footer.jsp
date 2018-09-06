<%-- 
    Document   : footer
    Created on : Aug 17, 2018, 7:33:07 AM
    Author     : khan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    </div> <!--container -->
<!-- jQuery CDN -->
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>

<!-- Bootstrap JS CDN -->
<script src="bootstrap/bootstrap.min.js" crossorigin="anonymous"></script>
<script src="js/main.js"></script>
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
    </body>
</html>
<%
}else
    response.sendRedirect("login.jsp");
%>