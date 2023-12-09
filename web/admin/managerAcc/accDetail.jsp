<%-- 
    Document   : accDetail
    Created on : Dec 8, 2023, 9:06:05 AM
    Author     : duong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../../css/admin_temp.css"/>
    </head>
    <body>
        <h1>Thong tin tai khoan</h1>
        <h1>Danh sach cac khoa hoc da tham gia</h1>
        <c:if test = "${empty listEnrolledCourse or listEnrolledCourse.size() eq 0}">
            <p>Khong ton tai khoa hoc</p>
        </c:if>
        <c:if test = "${not empty listEnrolledCourse or listEnrolledCourse.size() gt 0}">
            <div>
                <table>
                    <tr>
                        <td>No.</td>
                        <td>Pic</td>
                        <td>Title</td>
                        <td>Teacher Name</td> 
                        <td>Price</td>
                        <td>Sub Date</td>
                    </tr>
                    <c:set var="totalPrice" value="0" />
                    <c:set var="totalCourses" value="0" />
                    <c:set var="count" value="0" />
                    <c:forEach var="enrollCourse" items="${listEnrolledCourse}">
                        <tr>
                            <td>${count + 1}</td>
                            <td><img src="${enrollCourse.course.imageUrl}" alt="alt" width="50px" height="50px"/></td>
                            <td>${enrollCourse.course.title}</td>
                            <td>${enrollCourse.course.teacherName}</td>
                            <td>${enrollCourse.course.price}</td>
                            <td>${enrollCourse.subDate}</td>
                        </tr>
                        <!-- Tính tổng số tiền và số khoá học -->
                        <c:set var="totalPrice" value="${totalPrice + enrollCourse.course.price}" />
                        <c:set var="totalCourses" value="${totalCourses + 1}" />
                        <!-- Tăng biến đếm sau mỗi lần lặp -->
                        <c:set var="count" value="${count + 1}" />
                    </c:forEach>
                </table>
            </div>
            <div>
                <p>Total Price: ${totalPrice}</p>
                <p>Total Courses: ${totalCourses}</p>
            </div>

        </c:if>
        <h1>Danh sach cac danh gia trong khoa hoc</h1>
        <c:if test = "${empty listEnrolledCourse or listEnrolledCourse.size() eq 0}">
            <p>Khong ton tai danh gia</p>
        </c:if>
        <c:if test = "${not empty listEnrolledCourse or listEnrolledCourse.size() gt 0}">
            <div>
                <table>
                    <tr>
                        <td>ID</td>
                        <td>Pic</td>
                        <td>Title</td><!-- comment -->
                        <td>Teacher Name</td> 
                        <td>Price</td>
                        <td>Sub Date</td>
                    </tr>
                    <c:forEach var="enrollCourse" items = "${listEnrolledCourse}">
                        <tr>
                            <td>${enrollCourse.course.courseID}</td>
                            <td><img src="${enrollCourse.course.imageUrl}" alt="alt"width="50px" height="50px"/></td>
                            <td>${enrollCourse.course.title}</td>
                            <td>${enrollCourse.course.teacherName}</td>
                            <td>${enrollCourse.course.price}</td>
                            <td>${enrollCourse.subDate}
                        </tr>
                    </c:forEach>

                </table>
            </div>
        </c:if>
        <h1>Danh sach cac danh gia trong blog</h1>
        <c:if test = "${empty listEnrolledCourse or listEnrolledCourse.size() eq 0}">
            <p>Khong ton tai danh gia</p>
        </c:if>
        <c:if test = "${not empty listEnrolledCourse or listEnrolledCourse.size() gt 0}">
            <div>
                <table>
                    <tr>
                        <td>ID</td>
                        <td>Pic</td>
                        <td>Title</td><!-- comment -->
                        <td>Teacher Name</td> 
                        <td>Price</td>
                        <td>Sub Date</td>
                    </tr>
                    <c:forEach var="enrollCourse" items = "${listEnrolledCourse}">
                        <tr>
                            <td>${enrollCourse.course.courseID}</td>
                            <td><img src="${enrollCourse.course.imageUrl}" alt="alt"width="50px" height="50px"/></td>
                            <td>${enrollCourse.course.title}</td>
                            <td>${enrollCourse.course.teacherName}</td>
                            <td>${enrollCourse.course.price}</td>
                            <td>${enrollCourse.subDate}
                        </tr>
                    </c:forEach>

                </table>
            </div>
        </c:if>
    </body>
</html>
