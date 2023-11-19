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
        <title>Lesson</title>
    </head>
    <body>
        <h1 class="title">Danh sách bài học</h1>
        <c:forEach var="lessonPart" items="${ListLessonPart}" varStatus="loop">
            ${lessonPart.getTitle()}
            <a href="deletelessonpart?id=${lessonPart.getLessonPartID()}">Xóa</a>
            <form action="updatelessonpart" method="POST">
                <label for="fname">Sửa chương học:</label>
                <input name="lessonTitle" value="${lessonPart.getTitle()}">
                <input name="lessonPartID" type="hidden" value="${lessonPart.getLessonPartID()}">
                <button type="submit">Sửa</button>
            </form>
            <ul>
                <c:forEach var="lesson" items="${lessonPart.getListLesson()}" varStatus="loop">
                    <li>${lesson.getName()}</li>
                    <a href="updatelesson?lessonID=${lesson.getLessonID()}&lessonPartID=${lessonPart.getLessonPartID()}">Sửa bài học</a>
                    <a href="deletelesson?lessonID=${lesson.getLessonID()}">Xóa bài học</a>
                </c:forEach>
            </ul>
            <a href="addlesson?lessonPartID=${lessonPart.getLessonPartID()}">Thêm bài học</a>
            <br>
            <hr>
        </c:forEach>
        <form action="lesson" method="POST">
            <label for="fname">Thêm chương học:</label>
            <input name="newLessonPart">
            <button type="submit">Thêm</button>
        </form>
      
    </body>
</html>
