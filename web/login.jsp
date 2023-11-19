<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="login" method = "post">
            <label>Username</label><input type="text" name="username"/>
            <label>Password</label><input type="password" name="password"/>
            <button>Sign In</button>
        </form>
         
        <form action="register" method="get">
            <button style="submit">Sign Up</button>
        </form>
        
        <form action="forgetpassword" method="get">
            <button style="submit">Forget Password</button>
        </form>
        
    </body>
</html>
