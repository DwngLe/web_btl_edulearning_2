<%-- 
    Document   : listblog
    Created on : Nov 15, 2023, 11:08:34 AM
    Author     : duong
--%>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="enity.*" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List blog</title>
        <link rel="stylesheet" href="./css/main.css" />
        <link rel="stylesheet" href="./css/pages/listblog.css"/>
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
                    <a href="/">Trang chủ</a>
                    <a href="/">Khóa học</a>
                    <a class="nav-active" href="/">Blog</a>
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

        <div class="overlay"></div>

        <div class="page-banner">
            <img class="shape-1" src="./assets/imgs/blog/shape-1.png" alt="Shape">
            <img class="shape-2" src="./assets/imgs/blog/shape-2.png" alt="Shape">
            <div class="container">
                <div class="page-banner-content">
                    <ul class="breadcrumb">
                        <li><a href="#">Elearning</a></li>
                        <li class="nav-active">Blog</li>
                    </ul>
                    <h2 class="title">Our <span>Blog</span></h2>
                </div>
            </div>

            <div class="box-badge">
                <div class="badge-wrapper">
                    <img class="badge" src="./assets/imgs/blog/badge.png" alt="Badge">
                </div>
                <img class="shape-6" src="./assets/imgs/blog/shape-6.png" alt="Shape">

            </div>
            <img class="shape-3" src="./assets/imgs/blog/shape-3.png" alt="Shape">
            <img class="shape-4" src="./assets/imgs/blog/shape-4.png" alt="Shape">
            <img class="shape-5" src="./assets/imgs/blog/shape-5.png" alt="Shape">

        </div>

        <div class="grid wide">
            <div class="row">
                <c:forEach var="p" items="${listBlog}">
                    <div class="col l-4 c-6">
                        <div class ="single-blog">
                            <div class="blog-image">
                                <a href="/elearning/blog?id=${p.getBlogID()}">
                                    <img src="./assets/imgs/blog/blog-01.png" alt="Picture blog">
                                </a>
                            </div>
                            <div class="blog_conten">
                                <div class="card-display-component">
                                    <h3> ${p.getTitle()}</h3>
                                    <div class="blog-meta">
                                        <span>
                                            <img src="./assets/imgs/blog/date.png" alt="Icon date"/>
                                            <p>${p.getCreatedDate()}</p>
                                        </span>
                                    </div>
                                    <button class="btn btn-secondary" onclick="redirectToBlog(`${p.getBlogID()}`)">
                                        Read more
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <table>
            <tr>
                <th>Title</th>
                <th>Content</th>
                <th>Created at</th>
                <th>Action</th>

            </tr>
            <c:forEach var="p" items="${listBlog}">
                <tr>
                    <td>${p.getTitle()}</td>
                    <td>${p.getContent()}</td>
                    <td>${p.getCreatedDate()}</td>
                    <td>
                        <div class="btn">
                            <a href="/elearning/blog?id=${p.getBlogID()}">Read more</a>&nbsp;&nbsp;
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <script src="./js/toastAndModel.js"></script>
        <script src="./js/blog.js"></script>
    </body>
</html>