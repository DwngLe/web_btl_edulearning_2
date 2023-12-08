<%-- 
    Document   : updateblog
    Created on : Nov 15, 2023, 3:13:49 PM
    Author     : duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Blog</title>
        
        <style>
            .btn{
                background-color: red;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 10px;
                border-radius: 5px;
                color: white;
            }
            
            .btn:hover{
                cursor: pointer;
                background-color: green;
            }
        </style>
    </head>
    <body>
        <h1>Thong tin bai viet</h1>
            <form action="updateblog" method="post">
                <input type="hidden" name="id" value="${b.getBlogID()}">
                <input type="hidden" name="createdDate" value="${b.getCreatedDate()}">
                <input type="hidden" name="totalView" value="${b.getTotalView()}">
                Tieu De: <input type="text" name="title" value="${b.getTitle()}"> <br/><br/>
                Noi Dung: <input type="text" name="content" value="${b.getContent()}"> <br/><br/>
                <input type="submit" value="Submit" class="btn">
            </form>
    </body>
</html>
