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
    </head>

    <style>
        .container {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 40px;
            width: 1400px;
            margin: auto;
        }

        .left {
            background-color: #f4fff9;
            padding: 10px;
            border-radius: 20px;
            border: 1px solid green;
        }



        .img img{
            border-radius: 20px;
            width: 100%;
        }

        .courseinfo{
            background-color: #f4fff9;

            padding: 30px;
            border-radius: 20px;
            border: 1px solid green;
        }

        .courseinfo .price{
            text-align: center;
            color: green;
        }

        .cg{
            color: green;
        }

        .info{
            display: flex;
            margin: 25px 0;
            justify-content: space-between;
            align-items: center;
        }

        .right{

        }

        .btn{
            background-color: green;
            color: white;
            border: none;
            padding: 8px 10px;
            border-radius: 10px;
            width: 100%;
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
       
    </style>

    <body>
        <div class="nav">
            <a href="loadallcourse">Home</a>     
            <a href="loadCourse">Course</a>            
            <a href="loadenrollcourse">Enroll Course</a>


        </div>
        <div class="container">

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
        </div>
    </body>
</html>
