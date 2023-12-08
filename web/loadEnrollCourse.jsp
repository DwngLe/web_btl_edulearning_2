<%-- 
    Document   : listCourse
    Created on : Nov 15, 2023, 10:36:38 AM
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
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    </head>

    <style>
        #container{
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

    </style>

    <body>
        <div class="nav">
            <a href="loadallcourse">Home</a>     
            <a href="loadCourse">Course</a>            
            <a href="loadenrollcourse">Enroll Course</a>


        </div>
        <div id="container">
            
   
            
            <div>
                <div id="list-courses">

                    <c:forEach var="p" items="${cList}">
                        <a href="/elearning/courseinfoctl?id=${p.course.courseID}" id="course">
                            <div id="course-info">
                                <div id="img">
                                    <img src=${p.course.imageUrl} alt="alt"/>
                                </div>
                                <div>
                                        <p id="price">${p.course.teacherName}</p>
                                    <div id="desc-price">
                                        <h3 >${p.course.title}</h3>
                                    </div>
                                    <div id="desc-price">
                                        <p id="desc">${p.course.descriptionCourse}</p>
                                        
                                    </div>
                                    <div id="desc-price">
                                        <p id="desc">
                                            <i class="fa-regular fa-clock"></i>
                                            ${p.course.duration}</p>
                                        <p id="price">10 Lectures</p>    
                                    </div>
                                        
                                        <div class="btn-price">
                                            <p class="price">$${p.course.price}</p>
                                        </div>
                                </div>
                            </div>
                        </a>
                    </c:forEach>


                </div>
            </div>
        </div>
    </body>
</html>
