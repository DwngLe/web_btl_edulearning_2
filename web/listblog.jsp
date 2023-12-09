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
        <style>
            table {
                border-collapse: collapse;
                width: 50%;
                margin-top: 20px;
                margin-bottom: 20px;
            }

            th, td {
                border: 1px solid #dddddd;
                text-align: center;
                padding: 8px;
            }

            th {
                background-color: #f2f2f2;
                font-size: 20px;
            }

            .btnContainer{
                display: flex;

            }

            .btn{
                background-color: red;
                width: 100px;
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

            td > a {
                text-decoration: none;
                color: black;
            }
        </style>
    </head>
    <body>
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
    </body>
</html>