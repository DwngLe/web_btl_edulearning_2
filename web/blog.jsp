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
            .itemReview .title .imgUser img{
                width: 50px;
            }

            .itemReview .title{
                display: flex;
                gap: 10px;
                align-items: center;
            }
            .nav{
                padding: 8px 0;
                width: 1400px;
                margin: auto;
            }

            .btn a{
                text-decoration: none;
                color: white;
            }

            .name {
                font-weight: 700;
            }
        </style>
        <script type="text/javascript">
            function deleteblog(id) {
                if (confirm("Confirm deletion of this post?")) {
                    window.location = "deleteblog?id=" + id;
                }
            }
        </script>
    </head>
    <body>
        <div class="btnContainer">
            <div class="btn">
                <a href="#" onclick="deleteblog(`${b.getBlogID()}`)">Delete</a>&nbsp;&nbsp;
            </div>
            <div class="btn">
                <a href="/elearning/updateblog?id=${b.getBlogID()}">Update</a>
            </div>
        </div>
        <h1>${b.getTitle()}</h1>
        <p>${b.getContent()}</p>


        <form action="/elearning/blogaddcomment" method="post">
            Nhập bình luận: <input name="description" placeholder="Description" type="text"/>
            <input name="elseID" hidden="true" value="${b.getBlogID()}"/>
            <button type="submit">Comment</button>
        </form>

        <c:forEach var="m" items="${cmtList}">
            <div class="itemReview">
                <div class="name"> ${m.user.getName()} </div>
                <div class="descUser">
                    ${m.getDescription()}
                </div>
            </div>
        </c:forEach>
    </body>
</html>
