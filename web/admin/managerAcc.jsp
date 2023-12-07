<%-- 
    Document   : managerAcc
    Created on : Dec 7, 2023, 4:21:23 PM
    Author     : duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/admin_temp.css"/>
    </head>
    <body>
        <h1>Quản lý tài khoản</h1>
        <div>
            <table>
                <tr>
                    <th>Tên tài khoản</th>
                    <th>Họ và tên</th>
                    <th>Email</th>
                    <th>Số điện thoại</th>
                    <th>Ngay sinh</th>
                    <th>Ngày tạo tài khoản</th>
                    <th>Thao Tác</th>
                </tr>
                <c:forEach var="u" items="${listUser}">
                    <tr>
                        <td>${u.username}</td>
                        <td>${u.name}</td>
                        <td>${u.email}</td>
                        <td>${u.phoneNumber}</td>
                        <td>${u.dateOfBirth}</td>
                        <td>${u.createdDate}</td>
                        <td>
                            <div class="btnContainer">

                                <div class="btnD">
                                    <a href="#" onclick="doDelete(`${u.username}`)">Delete</a>&nbsp;&nbsp;
                                </div>
                                <div class="btnL">
                                    <form action="/elearning/admin/managerAcc/user">
                                        <input type="hidden" name="userID" value="${account.getUserID()}" />
                                        <button type="submit" >View</button>
                                    </form>
                                </div>
                            </div>

                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="btnContainer">
            <div class="btnL">
                <a href="add.jsp">Thêm Nhà cung cấp mới</a>
            </div>
            <div class="btnL">
                <a href="view">View</a>
            </div>
        </div>
    </body>

    <script type="text/javascript">
        const btnElements = document.querySelectorAll('.btnL');

        btnElements.forEach((divElement) => {
            const linkElement = divElement.querySelector('a');

            divElement.addEventListener('click', function () {
                linkElement.click();
            });
        });


        function doDelete(id) {
            console.log(id);
            if (confirm("Delete this provider with id= " + id + " ?")) {
                window.location = "delete?id=" + id;
            }
        }


    </script>

</html>
