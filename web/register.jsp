<%-- 
    Document   : register
    Created on : Nov 14, 2023, 4:54:18 PM
    Author     : duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/form.css"/>
    </head>
    <body>
        <form action="register" method="post">
            <label>Username</label><input type="text" name="username"/>
            <label>Password</label><input type="password" name="password"/>
            <label>Confirm Password</label><input type="password" name="confirmPassword"/>
            <label>Name</label><input type="text" name="name"/>
            <label>Email</label><input type="text" name="email"/>
            <label>Phone Number</label><input type="text" name="phoneNumber"/>
            <button type="submit">Sign Up</button>
        </form>
    </body>
</html>
