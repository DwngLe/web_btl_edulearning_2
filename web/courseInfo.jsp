<%-- 
    Document   : courseInfo
    Created on : Nov 15, 2023, 4:18:47 PM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="enity.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" href="./css/main.css" />

        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
            integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
    </head>

    <style>
        #container{

            padding-top: 100px;
            width: 1200px;
            margin: auto;
        }
        #header{
            display: flex;
            align-items: center;
            flex-direction: row;
            gap: 10px;
            justify-content: flex-end;
        }
        #btn{
            background-color: blue;
            text-decoration: none;
            color: white;
            border:none;
            padding: 8px 6px;
            border-radius: 4px;
        }

        #btn:hover{
            background-color: #3366ff;
            cursor: pointer;
        }

        #title{
            margin-bottom: 10px
        }
        #list-courses{
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            grid-gap: 10px;
        }
        #course{
            cursor: pointer;
            box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
            border-radius: 10px;
            text-decoration: none;

        }

        #course-info p,h3{
            margin: 0;

        }

        #course-info{
            height: 250px;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
        }

        #course-info h3{
            color: black;
        }


        #course-info p{
            color: gray;
        }

        #course-info img{
            width: 200px;
            height: 100px;
            border-radius: 10px;
        }

        #img{
            margin-bottom: 10px;
            display: flex;
            justify-content : center;
        }



        #course-info{
            padding:10px;
            text-decoration: none;
        }

        #desc-price{
            margin: 4px 0;
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
        }

        #price{
            font-size: 12px;
        }

        input{
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border-radius: 10px;
            border: 1px solid gray;
        }
        .price-img{
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-gap: 30px;
        }

        .btn-price{
            background-color: greenyellow;
            text-align: center;
            padding: 6px 0;
            border-radius: 8px;
        }
        .nav{
            padding: 8px 0;
            width: 1400px;
            margin: auto;
        }

        .card-display-component {
            background-color: #e7f8ee;
            border-radius: var(--border-radius-default);
            padding: 20px 32px;
            height: 100%;
        }

        .card-display-component-img {
            /*            display: flex;
                        justify-content: center;
                        align-items: center;*/
            /*height: 150px;*/
        }

        .card-display-component-title {
            margin-top: 28px;
            text-align: center;
        }

        .input-container{
            position: relative;
            width: 100%;
        }

        .btn{
            width: 100%;
            font-size: 13px;
        }
        .btn-course{
            height: 100%;
        }

        .course-images{
            padding-top: 24px;
            position: relative;
        }

        .course-images a img{
            width: 100%;
            border-radius: 15px;
        }

        img{
            max-width: 100%;
        }


        .course-content{
            padding-top: 25px;
        }
        .courses-author{
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .auth{
            display: flex;
            align-items: center;
        }
        .auth-name{
            flex: 1;
            padding-left: 12px;
        }

        .auth-name span{
            font-size: 13px;
            color: #52565b;
            font-family: "Montserrat",sans-serif;
            font-weight: 400;
        }

        .auth-name .name::before{
            content: "|| Admin";
            position: relative;
            color: #309255;
            font-family: "Montserrat",sans-serif;
            font-size: 14px;
            font-weight: 400;
        }

        /*        h4{
                    font-size: calc(1.275rem + 0.3vw);
                }*/

        h4{
            margin: 4px 0;
        }
        h4 a{
            font-size: 14px;
            font-weight: 500;
            color: #212832;
            display: inline-block;
            line-height: 1.4;
        }

        .title{
            display: flex;
            margin-bottom: 10px;
        }

        .container{
            padding:  20px 0;
        }

        .section-title h2{
            font-size: 35px;
            font-weight: 500;
            margin: 0;
            line-height: 1.4;
        }

        .section-title h2 span{
            color: #309255;
        }


        .swiper-container-pointer-events {
            touch-action: pan-y;
        }
        .swiper-container {
            margin-left: auto;
            margin-right: auto;
            position: relative;
            overflow: hidden;
            list-style: none;
            padding: 0;
            z-index: 1;
        }

        ul{
            transition-duration: 0ms;
            transform: translate3d(0px, 0px, 0px);
            padding: 0;
            list-style: none;
            margin: 0;
        }

        .nav{
            display: flex;
            flex-wrap: nowrap;
            padding-left: 0;
            margin-bottom: 0;
            list-style: none;
        }

        .swiper-wrapper {
            position: relative;
            width: 100%;
            height: 100%;
            z-index: 1;
            display: flex;
            transition-property: transform;
            box-sizing: content-box;
        }
        li{
            width: 160px;
            margin-right: 30px ;
        }
        .swiper-slide {
            flex-shrink: 0;
            width: 100%;
            height: 100%;
            position: relative;
            transition-property: transform;
        }

        .tag a{
            width: 80px;
            font-size: 13px;
            height: 35px;
            line-height: 35px;
            background-color: #e7f8ee;
            color: #309255;
            display: inline-block;
            text-align: center;
            border-radius: 5px;
            padding: 0 10px;
        }

        .course-meta{
            display: flex;

            justify-content: space-between;
            padding-top: 10px;
        }

        .course-meta span{
            font-size: 14px;
            font-weight: 400;
            color: #52565b;
            margin-right: 20px;
            display: inline-block;
            line-height: 1;
        }

        .course-meta span i{
            color: #309255;
            margin-right: 5px;
            font-size: 20px;
            display: inline-block;
            line-height: 1;
        }

        .courses-price-review{
            padding: 10px 10px;
            background-color: #eefbf3;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px 0  ;
        }
        .banner{
            background: #eefbf3;
        }

        .main-title{
            color:
                #1d2733;
            font-family:
                Montserrat;
            font-size:
                40px;
            font-weight:
                500;
            grid-area:
                auto;
            line-height:
                52px;
            margin:
                25px 0px 0px;
        }

        .sub-title{
            font-weight: 500;
            margin-bottom: 0;
            color: #309255;
            font-size: 16px;
        }
        li{
            width: fit-content;
            margin: 0;
        }
        .main-title span{
            color: #309255;

        }



        .shape-author img{
            border-radius: 100%;
            width: 150px;
            float: right;
        }

        .box-content{
            width: 140px;
            height: 140px;
            text-align: center;
            border: 1px solid rgba(48,146,85,0.2);
            border-radius: 50%;
            margin: 0 auto;
            padding: 10px;
        }
        .box-wrapper{
            background-color: #309255;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 50%;
            width: 100%;
            height: 100%;
        }

        .box-wrapper i{
            font-size: 70px;
            color: #fff;
            display: block;
            line-height: 1;
        }

        .right{
            display: flex;
        }

        .courses-details-images{
            overflow: hidden;
            border-radius: 10px;
            position: relative;
        }

        .courses-details-images img{
            border-radius: 10px;
            width: 100%;
        }

        .title{
            font-size: 25px;
            font-weight: 500;
            color: #212832;
            line-height: 1.5;
            margin-top: 30px;
            margin-bottom: 0;
        }
        .courses-details-admin .admin-author{
            display: flex;
            align-items: center;
            gap: 20px;
            padding-top: 10px;
        }
        .details-tab-menu{
            margin: 20px 0;
            padding: 20px;
            background: #e7f8ee;
            border-radius: 10px;
        }
        .description-wrapper{
            margin-top: 25px;
        }
        .tab-title{
            font-size: 25px;
            font-weight: 500;
            color: #212832;
            margin-bottom: 0;
        }
        .tab-title p{
            margin-bottom: 0;
            margin-top: 15px;
            color: #52565b;
            font-size: 15px;
            font-weight: 400;
        }

        .menu-tab{
            display: block;
        }

        .details-tab-content{
            display: none;
        }

        .show{
            display: block;
        }
        .widget-information{
            background-color: #e7f8ee;
            padding: 30px 30px 40px;
            border: 1px solid rgba(48,146,85,0.2);
            border-radius: 10px;
        }
        .sidebar-widget {
            /*margin-top: 50px;*/
        }
        .info-price{
            text-align: center;
        }
        .widget-information .info-price .price {
            font-size: 30px;
            font-weight: 700;
            color: #309255;
            display: block;
        }

        .widget-information .info-list ul {
            border-top: 1px solid #d1e6d9;
            margin-top: 35px;
        }
        .widget-information .info-list ul li {
            border-top: 1px solid #d1e6d9;
            padding: 15px 0;
            display: flex;
            justify-content: space-between;
            width: 100%;
        }
        .widget-information .info-list ul li div i {
            color: #309255;
            margin-right: 3px;
            font-size: 16px;
        }
        .widget-information .info-list ul li span {
            color: #52565b;
            font-size: 16px;
            font-weight: 400;
        }
        .sidebar-widget .social {
            display: flex;
            justify-content: space-between;
            margin-top: 25px;
            flex-wrap: wrap;
        }
        .widget-title {
            font-size: 25px;
            font-weight: 500;
            margin-bottom: 0;
            margin-top: -7px;
        }
        .sidebar-widget .social li {
            padding-top: 10px;
            margin-right: 10px;
        }

        .sidebar-widget .social li i:hover{
            background: #309255;
            color: #fff;
        }

        .sidebar-widget .social li i {
            display: block;
            width: 50px;
            height: 50px;
            line-height: 52px;
            border: 1px solid rgba(48,146,85,0.25);
            border-radius: 10px;
            text-align: center;
            font-size: 18px;
            color: #212832;
            transition: all 0.3s ease 0s;
        }
        .info-btn{
            margin-top: 20px;
        }

        .single-review {
            margin: 20px 0;
            border: 1px solid rgba(48,146,85,0.2);
            border-radius: 10px;
            padding: 30px;
            position: relative;
        }

        .review-author {
            display: flex;
            align-items: center;
            gap:20px;
        }
        .name {
            font-size: 22px;
            font-weight: 500;
            margin-bottom: 0;
        }
        .single-review p {
            margin-top: 30px;
            margin-bottom: 0;
            font-size: 15px;
            font-weight: 400;
            color: #52565b;
        }
    </style>
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
                <!-- <div class="login-nav">
                  <a href="/"> Đăng nhập </a>
                  <a href="/">
                    <button class="btn btn-outline-primary">Đăng ký</button>
                  </a>
                </div> -->
                <i
                    class="menu-btn fa-solid fa-bars"
                    onclick="openOverlay('header-mobile')"
                    ></i>
            </div>
        </header>

        <div class="banner">
            <div class="grid container wide">
                <div class="row">
                    <div style="margin: auto" class="col l-6 c-12">
                        <!--<div class="card-display-component">-->
                        <div class="card-display-component-img">
                            <ul class="breadcrumb">
                                <li><a href="/">Home</a></li>
                                <li>
                                    <a class="breadcrumb-active" href="/">Courses Details</a>
                                </li>
                            </ul>
                            <h4 class="main-title">
                                Courses
                                <span>Details</span>
                            </h4>
                        </div>

                        <!--</div>-->
                    </div>
                    <div class=" right col l-6 c-12 ">

                        <div class="box-content">
                            <div class="box-wrapper">
                                <i class="fa-solid fa-ribbon"></i>
                            </div>
                        </div>

                        <div class="shape-author">
                            <img src="https://htmldemo.net/edule/eduLe/assets/images/author/author-11.jpg"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="grid container wide">
            <div class="row">
                <div class="col col-lg-8 c-12">
                    <div class="courses-details">
                        <div class="courses-details-images">
                            <img src="${p.imageUrl}" alt="image" />
                        </div>

                        <h2 class="title">
                            ${p.title}
                        </h2>
                        <div class="courses-details-admin">
                            <div class="admin-author">
                                <div class="author-thumb">
                                    <img class="avatar" src="https://placehold.co/100x100" alt="image" />
                                </div>
                                <div class="author-content">
                                    <span> ${p.teacherName}</span>
                                </div>
                            </div>
                        </div>

                        <div class="courses-details-tab">
                            <div class="details-tab-menu">

                                <div class="row">
                                    <div class="col l-4 m-6 c-12">
                                        <button class="btn menu-tab btn-primary">Description</button>
                                    </div>
                                    <div class="col l-4 m-6 c-12">
                                        <button class="btn menu-tab btn-outline-primary">Instructors</button>
                                    </div>
                                    <div class="col l-4 m-6 c-12">
                                        <button class="btn menu-tab btn-outline-primary">Reviews</button>

                                    </div>
                                </div>
                            </div>

                            <div class="details-tab-content show">
                                <div class="tab-content">
                                    <div class="tab-pane fade">
                                        <div class="tab-description">
                                            <div class="description-wrapper">
                                                <h3 class="tab-title">
                                                    Description:
                                                </h3>
                                                <p> ${p.descriptionCourse}</p>
                                            </div>
                                            <div class="description-wrapper">
                                                <h3 class="tab-title">
                                                    Certification:
                                                </h3>
                                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                            </div>
                                            <div class="description-wrapper">
                                                <h3 class="tab-title">
                                                    Curriculum:
                                                </h3>
                                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="details-tab-content">
                                <div class="tab-content">
                                    <div class="tab-pane fade active show">
                                        <div class="tab-description">
                                            <div class="description-wrapper">
                                                <h3 class="tab-title">
                                                    Intructor
                                                </h3>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="details-tab-content">
                                <div class="tab-content">
                                    <div class="tab-pane fade active show">
                                        <div class="tab-description">
                                            <div class="description-wrapper">
                                                <h3 class="tab-title">
                                                    Add Reviews
                                                </h3>

                                                <form action="/elearning/addcmt">

                                                    <!--<input name="description" placeholder="Description" type="text"/>-->
                                                    <input style="margin: 20px 0 10px 0;" name="description" class="input" placeholder="Description"  type="text" />
                                                    <input name="elseID" hidden="true" value="${p.courseID}"/>
                                                    <button style="margin-bottom: 20px;" class="btn btn-primary" type="submit">Comment</button>
                                                </form>



                                                <h3 class="tab-title">
                                                    Student Reviews
                                                </h3>

                                                <c:forEach var="m" items="${cmtList}">
                                                    <div class='single-review swiper-slide'>
                                                        <div class='review-author'>
                                                            <div class='auth-thumb'>
                                                                <img
                                                                    class="avatar"
                                                                    src="https://placehold.co/100x100"
                                                                    alt="image"
                                                                    />
                                                            </div>
                                                            <div class='auth-content'>
                                                                <h4 class='name'>${m.user.name}</h4>
                                                            </div>
                                                        </div>
                                                        <p>  ${m.description}</p>
                                                    </div>

                                                </c:forEach>



                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
                <div class="col col-lg-4 c-12">
                    <div class="sidebar-widget widget-information">
                        <div class="info-price">
                            <span class="price">$${p.price}</span>
                        </div>
                        <div class="info-list">
                            <ul>
                                <li>
                                    <div>

                                        <i class="fa-solid fa-chalkboard-user"></i>
                                        Instructor
                                    </div>
                                    <span> ${p.teacherName}</span>
                                </li>
                                <li>
                                    <div>

                                        <i class="fa-regular fa-clock"></i>
                                        Duration
                                    </div>
                                    <span>${p.duration}</span>
                                </li>
                                <li>
                                    <div>

                                        <i class="fa-solid fa-book-open"></i>
                                        Lectures
                                    </div>
                                    <span>20</span>
                                </li>
                                <li>
                                    <div>

                                        <i class="fa-solid fa-laptop-code"></i>
                                        Level
                                    </div>
                                    <span>${p.levelCourse}</span>
                                </li>
                                <li>
                                    <div>

                                        <i class="fa-solid fa-language"></i>
                                        Language
                                    </div>
                                    <span> ${p.languageCourse}</span>

                                </li>

                            </ul>
                        </div>
                        <div class='info-btn'>
                            <%-- Kiểm tra enrolled có phải là "Enrollment not found" hay không --%>
                            <c:if test="${enrolled eq 'Enrollment not found'}">
                                <button class="btn btn-primary">
                                    <a style="color: #fff;" href="/elearning/addenrolled?id=${p.courseID}">

                                        Enroll Now
                                    </a>
                                </button>

                            </c:if>
                            <c:if test="${enrolled ne 'Enrollment not found'}">
                                <button class="btn btn-primary">
                                    
                                    <a style="color: #fff;" href="#">

                                        Lesson
                                    </a>
                                </button>
                            </c:if>
                        </div>


                    </div>

                    <div style="margin-top:50px" class="sidebar-widget">
                        <h4 class="widget-title">Share course: </h4>


                        <ul class="social">

                            <li>
                                <i class="fa-brands fa-facebook"></i>
                            </li>                  
                            <li>
                                <i class="fa-brands fa-instagram"></i>
                            </li>
                            <li>
                                <i class="fa-brands fa-twitter"></i>
                            </li>
                            <li>
                                <i class="fa-brands fa-linkedin"></i>
                            </li>
                            <li>
                                <i class="fa-brands fa-skype"></i>
                            </li>

                        </ul>
                    </div>
                </div>

            </div>
        </div>

        <!--        <div class="container">
        
                    <div class="left">
                        <div class="img">
                            <img src="${p.imageUrl}" alt="alt"/>
                        </div>
                        <div>
        ${p.title}
    </div>
    <div> 
        ${p.teacherName}
    </div>
    <h3>Description</h3>
    <span>${p.descriptionCourse}</span>
    <h3>Review</h3>

    <h4>Add review</h4>
    <form action="/elearning/addcmt">
        Nhập bình luận: <input name="description" placeholder="Description" type="text"/>
        <input name="elseID" hidden="true" value="${p.courseID}"/>
        <button type="submit">Comment</button>
    </form>

        <c:forEach var="m" items="${cmtList}">
            <div class="itemReview">
                <div class="title">
                    <div class="imgUser">
                        <img src="https://cdn-icons-png.flaticon.com/512/3177/3177440.png"/>
                    </div>
                    <div class="name">${m.user.name}</div>
                </div>
                <div class="descUser">
            ${m.description}
        </div>
    </div>
        </c:forEach>

    </div>
    <div class="right">
        <div class="courseinfo">
            <h1 class="price cg">$${p.price}</h1>
            <hr />
            <div class="info">
                <div class="infoLeft">
                    <i class="fa-solid fa-person-rifle cg"></i>
                    <span class="cg">Instructor</span>
                </div>
                <div class="infoRight cg">
        ${p.teacherName}
    </div>
</div>
<hr/>
<div class="info cg">
    <div class="infoLeft">
        <i class="fa-regular fa-clock"></i>
        <span>Duration</span>
    </div>
    <div class="infoRight">
        ${p.duration}
    </div>
</div>
<hr/>
<div class="info cg">
    <div class="infoLeft">
        <i class="fa-solid fa-photo-film"></i>
        <span>Lectures</span>
    </div>
    <div class="infoRight">
        10
    </div>
</div>
<hr/>
<div class="info cg">
    <div class="infoLeft">
        <i class="fa-solid fa-book"></i>
        <span>Level</span>
    </div>
    <div class="infoRight">
        ${p.levelCourse}
    </div>
</div>
<hr/>
<div class="info cg">
    <div class="infoLeft">
        <i class="fa-solid fa-language"></i>
        <span>Language</span>
    </div>
    <div class="infoRight">
        ${p.languageCourse}
    </div>
</div>
<hr/>

<button class="btn " >

    <a href="/elearning/addenrolled?id=${p.courseID}">

        Checkout
    </a>
</button>
</div>
</div>
</div>-->


        <footer>
            <div class="grid widget wide">
                <div class="row">
                    <div class="col l-3 m-6 c-12">
                        <a href="#"><img src="./assets/imgs/logo.png" alt="Logo" /></a>

                        <div class="widget-address">
                            <h4>Km 10, Trần Phú</h4>
                            <p>Hà Đông, Hà Nội</p>
                        </div>

                        <ul class="widget-info">
                            <li>
                                <p>
                                    <i class="fa-solid fa-envelope"></i>
                                    <a href="mailto:ptit@gmail.com">ptit@gmail.com</a>
                                </p>
                            </li>
                            <li>
                                <p>
                                    <i class="fa-solid fa-phone"></i>
                                    <a href="tel:9702621413">(970) 262-1413</a>
                                </p>
                            </li>
                        </ul>

                        <ul class="widget-social">
                            <li>
                                <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa-brands fa-twitter"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa-brands fa-skype"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa-brands fa-square-instagram"></i></a>
                            </li>
                        </ul>
                    </div>
                    <div class="col l-3 m-6 c-12">
                        <h4 class="footer-widget-title">Loại khóa học</h4>
                        <ul class="widget-link">
                            <li><a href="#">Văn bản sáng tạo</a></li>
                            <li><a href="#">Phim & Video</a></li>
                            <li><a href="#">Thiết kế đồ họa</a></li>
                            <li><a href="#">Thiết kế UI/UX</a></li>
                            <li><a href="#">Phân tích kinh doanh</a></li>
                            <li><a href="#">Tiếp thị</a></li>
                        </ul>
                    </div>
                    <div class="col l-3 m-6 c-12">
                        <h4 class="footer-widget-title">Truy cập nhanh</h4>
                        <ul class="widget-link">
                            <li><a href="#">Chính sách bảo mật</a></li>
                            <li><a href="#">Thảo luân</a></li>
                            <li><a href="#">Điều khoản - điều kiện</a></li>
                            <li><a href="#">Hỗ trợ khách hàng</a></li>
                            <li><a href="#">Câu hỏi thường gặp</a></li>
                        </ul>
                    </div>
                    <div class="col l-3 m-6 c-12">
                        <h4 class="footer-widget-title">Đăng ký</h4>

                        <div>
                            <p>Đăng ký để được tư vấn miễn phí!</p>

                            <div class="widget-form">
                                <form action="#">
                                    <input class="input" placeholder="Điền email vào đây" />
                                    <button class="btn btn-primary">Đăng ký ngay</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-copyright">
                <div class="grid wide">
                    <div class="row">
                        <div class="copyright-link">
                            <a href="#">Điều khoản dịch vụ</a>
                            <a href="#">Chính sách</a>
                            <a href="#">Sơ đồ trang</a>
                            <a href="#">Bảo mật</a>
                        </div>
                        <div class="copyright-text">
                            © 2023 <span> Edule </span> Tạo bởi
                            <a href="#">Nhóm 4 - 9</a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </body>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var tabButtons = document.querySelectorAll(".menu-tab");

            var tabContents = document.querySelectorAll(".details-tab-content");

            tabButtons.forEach(function (button, index) {
                button.addEventListener("click", function () {

                    tabContents.forEach(function (content) {
                        content.style.display = "none";
                    });

                    tabContents[index].style.display = "block";

                    tabButtons.forEach(function (btn) {
                        btn.classList.remove("btn-primary");
                        btn.classList.add("btn-outline-primary");

                    });

                    button.classList.add("btn-primary");
                    button.classList.remove("btn-outline-primary");
                });
            });
        });
    </script>
    <script src="./js/toastAndModel.js"></script>
</html>
