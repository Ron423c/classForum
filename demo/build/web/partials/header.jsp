<%-- 
    Document   : header
    Created on : Aug 17, 2018, 7:24:56 AM
    Author     : khan
--%>
<% 
    if(session.getAttribute("uEmail") != null){
        String userEmail = session.getAttribute("uEmail").toString();
%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Make site responsive on mobile/tablet -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Classes Unofficially</title>
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
        <link rel="stylesheet" href="styles/main.css">
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                      <span class="sr-only">Toggle navigation</span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                    </button>
        
                    <a class="navbar-brand" href="#">$$$</a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                  <ul class="nav navbar-nav">
                      <li id="routine"><a href="#">Routine</a></li>
                  </ul>
                  <ul class="nav navbar-nav navbar-right">
      
                          <li id="forum"><a href="forum.jsp">Forum</a></li>
                          <li id="classPosts" class="active"><a href="classPosts.jsp">Class Posts</a></li>
                      
                          <li id="profile"><a href="profile.jsp">Profile(<%=userEmail%>)</a></li>
                          <li><a href="logout.jsp">Logout</a></li>
                     
                  </ul>
                </div>
            </div>
        </nav>
  
    <div class="container">