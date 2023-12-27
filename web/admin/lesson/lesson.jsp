<%-- 
    Document   : studentList
    Created on : Aug 14, 2020, 8:52:51 PM
    Author     : Diep
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý bài học</title>
        <link rel="stylesheet" href="../css/main.css" />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
            integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link rel="stylesheet" href="../css/pages/lesson-admin.css" />
    </head>
    <body>
        <div class="grid wide">
            <h1 class="title">Danh sách bài học</h1>
            <c:forEach var="lessonPart" items="${ListLessonPart}" varStatus="loop">
                <div class="lesson-part-container">
                    <form class="lesson-part" action="updatelessonpart" method="POST">
                        <input class="input" name="lessonTitle" value="${lessonPart.getTitle()}">
                        <input name="lessonPartID" type="hidden" value="${lessonPart.getLessonPartID()}">
                        <button class="btn btn-primary" type="submit">Sửa</button>
                        <a class="text-error" href="deletelessonpart?LessonPartID=${lessonPart.getLessonPartID()}">Xóa</a>
                    </form>

                    <ul class="lesson-list">
                        <c:forEach var="lesson" items="${lessonPart.getListLesson()}" varStatus="loop">
                            <li>
                                ${lesson.getName()}
                                <br>
                                <a href="updatelesson?LessonID=${lesson.getLessonID()}&CourseID=${CourseID}">Sửa</a>
                                <a class="text-error" href="deletelesson?LessonID=${lesson.getLessonID()}">Xóa</a>
                            </li>
                        </c:forEach>
                    </ul>
                    <button onclick="window.location.href = 'addlesson?LessonPartID=${lessonPart.getLessonPartID()}&CourseID=${CourseID}'" class="btn btn-secondary">Thêm bài học</button>
                </div>
            </c:forEach>
            <hr>    
            <h2 class="text-center">Thêm chương học</h2>
            <form action="/elearning/admin/lesson" method="POST">
                <div class="lesson-part">
                    <input class="input input-fullwidth" name="newLessonPart" />
                    <button class="btn btn-primary" type="submit">Thêm</button>
                </div>
                <input name="CourseID" type="hidden" value="${CourseID}">
            </form>
        </div>
    </body>
</html>
