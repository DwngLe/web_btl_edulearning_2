<%-- 
    Document   : managerAcc
    Created on : Dec 7, 2023, 4:21:23 PM
    Author     : duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/admin_temp.css"/>
    </head>
    <body>
        <h1>Quản lý tài khoản</h1>
        <table>
            <tr>
                <th>Mã Nhà cung cấp</th>
                <th>Tên</th>
                <th>Địa chỉ</th>
                <th>Số điện thoại</th>
                <th>Thao Tác</th>
            </tr>
            <c:forEach var="p" items="${sList}">
                <tr>
                    <td>${p.maNhaCC}</td>
                    <td>${p.tenNhaCC}</td>
                    <td>${p.diaChi}</td>
                    <td>
                        ${p.dienThoai}
                    </td>
                    <td>
                        <div class="btnContainer">

                            <div class="btnD">
                                <a href="#" onclick="doDelete(`${p.maNhaCC}`)">Delete</a>&nbsp;&nbsp;
                            </div>
                            <div class="btnL">
                                <a href="/th3/update?id=${p.maNhaCC}">Update</a>
                            </div>
                        </div>

                    </td>
                </tr>
            </c:forEach>
        </table>
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
