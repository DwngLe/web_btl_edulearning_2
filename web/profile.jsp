<%-- 
    Document   : profile
    Created on : Nov 4, 2023, 9:49:41 AM
    Author     : TGDD
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="enity.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page  language="java" contentType="text/html"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>User's Profile</title>
        <link rel="stylesheet" href="./css/style.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,600;1,200&display=swap"
            rel="stylesheet"
            />
    </head>
    <body>
        <%
            if(session.getAttribute("username")==null){
               response.sendRedirect("login.jsp");
            }
        %>

        <div class="container">
            <aside>
                <div class="top">
                    <h1>Học Viên</h1>
                </div>
                <div class="sidebar">
                    <div class="s-info s choose" id="a-info">
                        <a href="#"> Thông Tin Học Viên </a>
                    </div>
                    <div class="s-courses s" id="a-courses">
                        <a href="#"> Khóa Học Của Bạn </a>
                    </div>
                    <div class="s-security s" id="a-security">
                        <a href="#"> Bảo Mật </a>
                    </div>
                    <div class="s" id="openDeposit">
                        <a href="user-deposit"> Nạp tiền </a>
                    </div>
                    <div class="s-logout s">
                        <a href="#"> Đăng Xuất </a>
                    </div>
                </div>
            </aside>
            <main>
                <div class="info active">
                    <%--<c:set var="=user" value="${requestScope.user}"/>--%>
                    <form action="user-update" method="POST" class="main">
                        <div class="title">
                            <h3>Thông Tin</h3>
                        </div>
                        <label for="name">Họ tên:</label>
                        <input type="text" id="name" name="name" value="${user.name}"/>

                        <label for="dob">Ngày sinh:</label>
                        <input type="text" id="dob" name="dob" value="${user.dateOfBirth}"/>


                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" value="${user.email}"/>

                        <label for="pNum">SĐT:</label>
                        <input type="text" id="pNum" name="pNum" value="${user.phoneNumber}"/>

                        <label for="money">Số dư khả dụng:</label>
                        <input type="text" id="money" readonly="true" name="money" value="${user.money}"/>
                        <div class="btn-container">
                            <input
                                type="submit"
                                id="updateBtn"
                                class="btn"
                                value="Cập nhật"
                                />
                            <input type="reset" id="resetBtn" class="btn" value="Reset" />
                        </div>
                    </form>
                </div>
                <div class="courses main">
                    <div class="title">
                        <h3>Khóa Học</h3>
                    </div>
                    <c:forEach var="eCourse" items="${ecList}">
                        <div class="course-cards">
                            <div class="course-card">
                                <div class="course-img">
                                    <img src=${eCourse.imageUrl} alt="" />
                                </div>
                                <div class="course-detail">
                                    <span>${eCourse.title}</span>
                                    <a href="courses?id=${eCourse.courseID}" class="detail">Xem chi tiết</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="security">
                    <form action="changePass" class="main" onsubmit="return validateChangePasswordForm()">
                        <div class="title">
                            <h3>Đổi Mật Khẩu</h3>
                        </div>
                        <label for="password">Nhập mật khẩu của bạn</label>
                        <input type="password" id="password" name="password" />
                        <label for="password">Nhập mật khẩu mới</label>
                        <input type="password" id="nPassword" name="new-password" />
                        <label for="password">Xác nhận mật khẩu mới</label>
                        <input type="password" id="rnPassword" name="re-new-password" />
                        <div class="btn-container">
                            <input
                                type="submit"
                                id="changeBtn"
                                class="btn"
                                value="Đổi mật khẩu"
                                />
                            <input type="reset" id="rsBtn" class="btn" value="Reset" />
                        </div>
                    </form>
                </div>
            </main>
        </div>
        <script>
            const divElement = document.getElementById('openDeposit');
            const linkElement = divElement.querySelector('a');

            const aInfo = document.getElementById("a-info");
            const aCourses = document.getElementById("a-courses");
            const aSecurity = document.getElementById("a-security");

            const infoContainer = document.querySelector(".info");
            const coursesContainer = document.querySelector(".courses");
            const securityContainer = document.querySelector(".security");

            const containerArr = [];

            containerArr.push(infoContainer);
            containerArr.push(coursesContainer);
            containerArr.push(securityContainer);

            const btnArr = [];

            btnArr.push(aInfo);
            btnArr.push(aCourses);
            btnArr.push(aSecurity);

            btnArr.forEach((btn) => {
                btn.addEventListener("click", () => {
                    removeActive();
                    btn.classList.add("choose");
                    if (btn == aInfo) {
                        if (!infoContainer.classList.contains("active"))
                            infoContainer.classList.add("active");
                    } else if (btn === aCourses) {
                        if (!coursesContainer.classList.contains("active"))
                            coursesContainer.classList.add("active");
                    } else if (btn === aSecurity) {
                        if (!securityContainer.classList.contains("active"))
                            securityContainer.classList.add("active");
                    }
                });
            });

            divElement.addEventListener('click', function () {
                linkElement.click();
            });

            function removeActive() {
                btnArr.forEach((btn) => {
                    btn.classList.remove("choose");
                });
                containerArr.forEach((container) => {
                    container.classList.remove("active");
                });
            }

            function validateChangePasswordForm() {
                var password = document.getElementById("password").value;
                var newPassword = document.getElementById("nPassword").value;
                var confirmNewPassword = document.getElementById("rnPassword").value;

                
                if (password === "" || newPassword === "" || confirmNewPassword === "") {
                    alert("Please fill in all fields.");
                    return false;
                }

           
                if (newPassword !== confirmNewPassword) {
                    alert("New password and confirm new password do not match.");
                    return false;
                }

                return true;
            }
        </script>
    </body>
</html>
