<%-- 
    Document   : register
    Created on : Oct 17, 2023, 5:02:01 PM
    Author     : TGDD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit course</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" href="../../css/main.css" />

        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
            integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <style>
            input{
                width: 100%;
            }
        </style>

    </head>

    <body>
        <div class="grid container wide">
            <h2 id="title" >Edit course</h2>
            <form action="/elearning/admin/course/update" method="post">
                <input name="totalView" hidden="true" value="${p.totalView}"/>
                <input name="id" hidden="true" value="${p.courseID}"/>
                <div class='row'>
                    <div class="col l-12 c-12">
                        <div class="card-display-component">
                            <div class="card-display-component-img">
                                <input name="title" value="${p.title}" class="input" placeholder="Title" type="text" />
                            </div>
                        </div>
                    </div>
                    <div class="col l-12 c-12">
                        <div class="card-display-component">
                            <div class="card-display-component-img">
                                <input name="level" value="${p.levelCourse}" class="input" placeholder="Level" type="text" />
                            </div>
                        </div>
                    </div>
                    <div class="col l-12 c-12">
                        <div class="card-display-component">
                            <div class="card-display-component-img">
                                <input name="description" value="${p.descriptionCourse}" class="input" placeholder="Description" type="text" />
                            </div>
                        </div>
                    </div>
                    <div class="col l-12 c-12">
                        <div class="card-display-component">
                            <div class="card-display-component-img">
                                <input name="language" value="${p.languageCourse}" class="input" placeholder="Language" type="text" />
                            </div>
                        </div>
                    </div>
                    <div class="col l-12 c-12">
                        <div class="card-display-component">
                            <div class="card-display-component-img">
                                <input name="duration" value="${p.duration}" class="input" placeholder="Duration" type="text" />
                            </div>
                        </div>
                    </div>

                    <div class="col l-6 c-12">
                        <div class="card-display-component">
                            <div class="card-display-component-img">
                                <input name="price" value="${p.price}" class="input" placeholder="Price" type="text" />
                            </div>
                        </div>
                    </div>
                    <div class="col l-6 c-12">
                        <div class="card-display-component">
                            <div class="card-display-component-img">
                                <input name="imgurl" value="${p.imageUrl}" class="input" placeholder="Url image" type="text" />
                            </div>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary" id="btn">Submit</button>
            </form>

        </div>
    </body>
</html>
