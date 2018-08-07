<%-- 
    Document   : login
    Created on : Jul 23, 2018, 3:43:46 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log In</title>
        <link rel="stylesheet" href="styles/resister.css">
    </head>
    <body>
        <div style="width: 30%; margin: 25px auto;">
            <h1 style="text-align: left">Login</h1>

            <form action="auth.jsp" method="POST">
                <input type="text" name="email" placeholder="email" required="true">
                    <br>
                    <input type="password" name="password" placeholder="password" required="true">
                    <br>
                    <button>Login</button>
            </form>
            <a href="index.jsp">Go Back</a>
        </div>
    </body>
</html>
