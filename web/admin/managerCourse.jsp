<%-- 
    Document   : managerCourse
    Created on : Dec 8, 2023, 4:33:00 PM
    Author     : duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/admin_temp.css"/>
    </head>
    <body>
        <h1>Quản lý khoá học</h1>
        <form action="/elearning/admin/course/add" method="get">
            <input type="submit" value="Thêm khoá học">
        </form>
        <h1>Danh sách các khoá học</h1>
        <c:if test = "${empty cList or cList.size() eq 0}">
            <p>Khong ton tai khoa hoc</p>
        </c:if>
        <c:if test = "${not empty cList or cList.size() gt 0}">
            <div>
                <table>
                    <tr>
                        <!--<td>ID</td>-->
                        <th>Số thứ tự</th>
                        <th>Tiêu đề</th><!-- comment -->
                        <th>Tên giảng viên</th> 
                        <th>Giá tiền</th>
                        <th>Tổng lượt xem</th>
                        <th>Tổng lượt đăng ký</th>
                        <th>Tổng giá tiền</th>
                        <th>Công cụ</th>
                    </tr>
                    <c:set var="totalPrice" value="0" />
                    <c:set var="totalEnroll" value="0"/>
                    <c:set var="count" value="0" />
                    <c:forEach var="course" items = "${cList}">
                        <tr>
                            <td>${count + 1}</td>
                            <td>${course.title}</td>   
                            <td>${course.teacherName}</td>
                            <td>${course.price}</td>
                            <td>${course.totalView}</td>
                            <td>${course.totalEnrollment}</td>
                            <td>${course.totalRevenue}</td>
                            <td>
                                <div class="btnContainer">
                                    <form class="btnD" action="/elearning/admin/course/delete" method="post">
                                        <input type="hidden" name="courseID" value="${course.getCourseID()}"/>
                                        <button type ="submit">Xoa khoa hoc</button>
                                    </form>
                                    <br/>
                                    <form class="btnL" action="/elearning/admin/course/update" method="get">
                                        <input type="hidden" name="courseID" value="${course.getCourseID()}"/>
                                        <button type ="submit">Cap nhat khoa hoc</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                        <c:set var="count" value="${count + 1}" />
                        <c:set var="totalEnroll" value="${totalEnroll + course.totalEnrollment}" />
                        <c:set var = "totalPrice" value="${totalPrice + course.totalRevenue}"/>
                    </c:forEach>
                </table>
            </div>
            <div>
                <p>Tổng doanh thu: ${totalPrice}</p>
                <p>Tổng lượt đăng ký: ${totalEnroll}</p>
            </div>
        </c:if>
    </body>
</html>
