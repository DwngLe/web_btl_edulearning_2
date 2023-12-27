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
        <title>Blog</title>
        <link rel="stylesheet" href="./css/main.css" />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
            integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
    </head>
    <body>
        <header>
      <div class="grid wide header">
        <a href="/">
          <img src="assets/imgs/logo.png" alt="Logo" />
        </a>
        <nav>
          <a class="nav-active" href="/">Trang chủ</a>
          <a href="/">Khóa học</a>
          <a href="/">Blog</a>
          <a href="/">Liên hệ</a>
        </nav>
        <div class="login-nav">
          <a href="/">
            <img class="avatar" src="https://placehold.co/100x100" alt="image" />
          </a>
        </div>
        <i
          class="menu-btn fa-solid fa-bars"
          onclick="openOverlay('header-mobile')"
        ></i>
      </div>
    </header>

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
