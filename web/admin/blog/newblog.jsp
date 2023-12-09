<%-- 
    Document   : addblog
    Created on : Nov 15, 2023, 12:56:39 PM
    Author     : duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Blog</title>
        <style>
            .btn{
                background-color: blue;
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
        <form action="/elearning/admin/blog/add" method="post">
            <!--ID bai viet: <input type="text" name="id">  <br/><br/>-->
            Tieu de bai viet: <input type="text" name="title"> <br/><br/>
            Noi dung bai viet: <input type="text" name="content"> <br/><br/>
            <input type="submit" value="Submit" class="btn">
        </form>
    </body>
</html>
