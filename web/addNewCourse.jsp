<%-- 
    Document   : addNewCourse
    Created on : Nov 15, 2023, 11:04:57 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            width: 80%;
            border-radius: 100%;
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
        </style>
    </head>
    <body>
        <div id="container">
            <div>
                <h2 id="title" >Add new course</h2>
                <form action="/elearning/addCourse" >
                    <input name="title" placeholder="Title"/>   
                    <!--<input name="teacherName" value="Tung"/>-->
                    <input name="level" placeholder="Level"/>
                    <input name="description" placeholder="Description"/>
                    <input name="language" placeholder="Language"/>
                    <input name="duration" placeholder="Duration"/>
                    <div class="price-img">
                        <input name="price" type="number" placeholder="Price"/>
                        <input name="imgurl" placeholder="Url image"/>
                    </div>
                    <button type="submit" id="btn">Submit</button>
                </form>
            </div>
        </div>
    </body>
</html>
