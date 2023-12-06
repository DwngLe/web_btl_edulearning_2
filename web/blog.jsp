<%-- 
    Document   : blog
    Created on : Nov 16, 2023, 5:34:02 AM
    Author     : duong
--%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="enity.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>

            .btnContainer{
                display: flex;
            }

            .btn{
                background-color: red;
                width: 50px;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 10px;
                margin: 0 10px;
                border-radius: 5px;
            }

            .btn:hover{
                cursor: pointer;
                background-color: green;
            }

            .btn>a{
                text-decoration: none;
                color: white;
            }
        </style>
        <script type="text/javascript">
            function deleteblog(id) {
                window.location = "deleteblog?id=" + id;
            }
        </script>
    </head>
    <body>
        <div class="btnContainer">
            <div class="btn">
                <a href="#" onclick="deleteblog(`${b.blogID}`)">Delete</a>&nbsp;&nbsp;
            </div>
            <div class="btn">
                <a href="/elearning/updateblog?id=${b.blogID}">Update</a>
            </div>
        </div>
        <h1>${b.title}</h1>
        <p>${b.content}</p>

    </body>
</html>