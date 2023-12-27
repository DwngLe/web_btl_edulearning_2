<%-- 
    Document   : LessonDetail
    Created on : Nov 18, 2023, 9:30:16 AM
    Author     : My Asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm/Sửa bài học</title>
        <link rel="stylesheet" href="../css/main.css" />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
            integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <style>
            .form {
                margin: 40px 0px;
            }
            .form-input + .form-input {
                margin-top: 16px;
            }
        </style>
    </head>
    <body> 
        <div class="grid wide">
            <form class="form" action=${link} method="post" enctype="multipart/form-data">
                <input name="LessonPartID" type="hidden" value="${lesson.getLessonPartID()}">
                <input name="CourseID" type="hidden" value="${CourseID}">
                <input name="LessonID" type="hidden" value="${lesson.getLessonID()}">
                <div class="form-input">
                    <label>Tải video lên:</label>
                    <input type="file" name="VideoURL" accept="video/*" onchange="checkFileUpload(this)">
                    <c:if test="${not empty lesson.getVideoURL()}">
                        <video controls width="100%">
                            <source src="../assets/videos/${lesson.getVideoURL()}">
                            Your browser does not support the video tag.
                        </video>
                    </c:if>
                </div>
                <div class="form-input">
                    <label for="lessonName">Tên bài học</label>
                    <input id="lessonName" class="input" name="Name" value="${lesson.getName()}">
                </div>
                <div class="form-input">
                    <label for="lessonDes">Mô tả</label>
                    <textarea id="lessonDes" class="textarea input-fullwidth" rows="10" name="Description">${lesson.getDesctiption()}</textarea>
                </div>
                <button class="form-input btn btn-primary" type="submit">Lưu</button>
            </form>
        </div>

        <div class="overlay" id="dialog">
            <div class="modal">
                <i class="close-icon fa-solid fa-xmark"></i>
                <h3 class="modal-title">
                    Cảnh báo!
                </h3>
                <div class="modal-content">
                    Không được tải lên file có kích thước lớn hơn 500MB. Vui lòng thử lại
                </div>
            </div>
        </div>
    </body>
    <script src="../js/toastAndModel.js"></script>
    <script>
                        function checkFileUpload(input) {
                            const maxSizeInBytes = 500 * 1024 * 1024; // 500MB
                            const files = input.files;

                            if (files.length > 0) {
                                const fileSize = files[0].size;

                                if (fileSize > maxSizeInBytes) {
                                    document.getElementById("dialog").style.display = "block";
                                    input.value = ''; // Clear the input to prevent submitting the oversized file
                                } else {
                                    // File is within the size limit, you can proceed with further actions
                                    console.log('File size is within the limit.');
                                }
                            }
                        }
    </script>
</html>
