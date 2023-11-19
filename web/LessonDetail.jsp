<%-- 
    Document   : LessonDetail
    Created on : Nov 18, 2023, 9:30:16 AM
    Author     : My Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 class="title">${functionTitle}</h1>
        <form class="form" action=${link} method="post">
            <input name="LessonPartID" type="hidden" value="${lesson.getLessonPartID()}">
            <input name="LessonID" type="hidden" value="${lesson.getLessonID()}">
            <div>
                <label>Tên</label>
                <input name="Name" value="${lesson.getName()}">
            </div>
            <div>
                <label>Video URL</label>
                <input name="VideoURL" value="${lesson.getVideoURL()}">
            </div>
            <div>
                <label>Mô tả</label>
                <input name="Description" value="${lesson.getDesctiption()}" >
            </div>
            <button type="submit">Lưu</button>
        </form>
    </body>
</html>
