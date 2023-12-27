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
        <link rel="stylesheet" href="../../css/admin_temp.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" href="../../css/main.css" />
        <style>
            /* default styling. Nothing to do with freexing first row and column */
            main {
                display: flex;
            }
            main > * {
                border: 1px solid;
            }
            table {
                border-collapse: collapse;
                font-family: helvetica
            }
            td, th {
                border:  1px solid;
                background: white;
                box-sizing: border-box;
            }
            .table-container {
                position: relative;
                /*                max-height:  300px;
                                width: 500px;*/
                overflow: scroll;
            }

            thead th {
                position: -webkit-sticky;
                position: sticky;
                top: 0;
                z-index: 2;
                background: #309255;
            }

            thead th:first-child {
                left: 0;
                z-index: 3;
            }

            tfoot {
                position: -webkit-sticky;
                bottom: 0;
                z-index: 2;
            }

            tfoot td {
                position: sticky;
                bottom: 0;
                z-index: 2;
                background: hsl(20, 50%, 70%);
            }

            tfoot td:first-child {
                z-index: 3;
            }

            tbody {
                overflow: scroll;
                height: 200px;
            }

            /* MAKE LEFT COLUMN FIXEZ */
            tr > :first-child {
                position: -webkit-sticky;
                position: sticky;
                background: #eefbf3;
                left: 0;
            }
            /* don't do this */
            tr > :first-child {
                /*box-shadow: inset 0px 1px black;*/
            }

            .btn{
                font-size: 14px;
            }

            table {
                border-collapse: collapse;
                /*width: 100%;*/
                border-radius: 10px; /* Điều chỉnh giá trị này để thay đổi độ bo tròn */
                overflow: hidden; /* Để đảm bảo bo tròn được áp dụng cho các góc */
            }

            /* Định dạng các ô trong bảng */
            td, th {
                border: 1px solid #dddddd;
                padding: 8px;
            }

            .main{
                width: 80vw;
                margin: auto;
            }

        </style>
    </head>
    <body>
        <header>
            <div class="grid wide header">
                <a href="/">
                    <img src="../../assets/imgs/logo.png" alt="Logo" />
                </a>
                <nav>
                    <a class="nav-active" href="/">Trang chủ</a>
                    <a href="/">Khóa học</a>
                    <a href="/">Blog</a>
                    <a href="/">Liên hệ</a>
                </nav>
                <div class="login-nav">
                    <a href="/">
                        <img class="avatar" src="https://placehold.co/100x100" alt="image" />
                    </a>
                </div>
                <!-- <div class="login-nav">
                  <a href="/"> Đăng nhập </a>
                  <a href="/">
                    <button class="btn btn-outline-primary">Đăng ký</button>
                  </a>
                </div> -->
                <i
                    class="menu-btn fa-solid fa-bars"
                    onclick="openOverlay('header-mobile')"
                    ></i>
            </div>
        </header>

        <div class="main">
            <h1>Quản lý khoá học</h1>
            <button style="height: 100%; padding: 14px 20px; display: flex; align-items: center; gap: 4px;" onclick="window.location.href = '/elearning/admin/course/add'" class="btn btn-primary">
                <i class="fa-solid fa-circle-plus"></i>
                <span>

                    Thêm khoá học
                </span>
            </button>
            <!--        <form action="/elearning/admin/course/add" method="get">
                        <input type="submit" value="Thêm khoá học">
                    </form>-->
            <h1>Danh sách các khoá học</h1>
            <c:if test = "${empty cList or cList.size() eq 0}">
                <p>Khong ton tai khoa hoc</p>
            </c:if>
            <c:if test = "${not empty cList or cList.size() gt 0}">
                <div class="table-container">
                    <div class="table-horizontal-container">
                        <table class="unfixed-table">
                            <thead>
                                <tr>
                                    <th>Số thứ tự</th>
                                    <th>Tiêu đề</th>
                                    <th>Tên giảng viên</th>
                                    <th>Giá tiền</th>
                                    <th>Tổng lượt xem</th>
                                    <th>Tổng lượt đăng ký</th>
                                    <th>Tổng giá tiền</th>                
                                    <th>Công cụ</th>

                                </tr>
                            </thead>
                            <tbody>
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
                                                <form action="/elearning/admin/course/delete" method="post">
                                                    <input type="hidden" name="courseID" value="${course.getCourseID()}"/>
                                                    <button class="btn btn-destructive" type ="submit">
                                                        <span style="display: flex; align-items: center; gap: 4px;">
                                                            <i class="fa-solid fa-trash"></i>
                                                            Xóa
                                                        </span>
                                                    </button>
                                                </form>
                                                <form action="/elearning/admin/course/update" method="get">
                                                    <input type="hidden" name="courseID" value="${course.getCourseID()}"/>
                                                    <button class="btn btn-primary" type ="submit">
                                                        <span style="display: flex; align-items: center; gap: 4px;">
                                                            <i class="fa-solid fa-sliders"></i>

                                                            Sửa
                                                        </span>
                                                    </button>
                                                </form>

                                                <form action="#" method="get">
                                                    <input type="hidden" name="courseID" value="${course.getCourseID()}"/>
                                                    <button class="btn btn-info" type ="submit">
                                                        <span style="display: flex; align-items: center; gap: 4px;">
                                                            <i class="fa-solid fa-circle-info"></i>
                                                            Xem
                                                        </span>
                                                    </button>
                                                </form>

                                            </div>
                                        </td>
                                    </tr>
                                    <c:set var="count" value="${count + 1}" />
                                    <c:set var="totalEnroll" value="${totalEnroll + course.totalEnrollment}" />
                                    <c:set var = "totalPrice" value="${totalPrice + course.totalRevenue}"/>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </object>
        </article>
        <div>
            <p>Tổng doanh thu: ${totalPrice}</p>
            <p>Tổng lượt đăng ký: ${totalEnroll}</p>
        </div>
    </c:if>
</div>
<footer>
    <div class="grid widget wide">
        <div class="row">
            <div class="col l-3 m-6 c-12">
                <a href="#"><img src="../../assets/imgs/logo.png" alt="Logo" /></a>

                <div class="widget-address">
                    <h4>Km 10, Trần Phú</h4>
                    <p>Hà Đông, Hà Nội</p>
                </div>

                <ul class="widget-info">
                    <li>
                        <p>
                            <i class="fa-solid fa-envelope"></i>
                            <a href="mailto:ptit@gmail.com">ptit@gmail.com</a>
                        </p>
                    </li>
                    <li>
                        <p>
                            <i class="fa-solid fa-phone"></i>
                            <a href="tel:9702621413">(970) 262-1413</a>
                        </p>
                    </li>
                </ul>

                <ul class="widget-social">
                    <li>
                        <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa-brands fa-twitter"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa-brands fa-skype"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa-brands fa-square-instagram"></i></a>
                    </li>
                </ul>
            </div>
            <div class="col l-3 m-6 c-12">
                <h4 class="footer-widget-title">Loại khóa học</h4>
                <ul class="widget-link">
                    <li><a href="#">Văn bản sáng tạo</a></li>
                    <li><a href="#">Phim & Video</a></li>
                    <li><a href="#">Thiết kế đồ họa</a></li>
                    <li><a href="#">Thiết kế UI/UX</a></li>
                    <li><a href="#">Phân tích kinh doanh</a></li>
                    <li><a href="#">Tiếp thị</a></li>
                </ul>
            </div>
            <div class="col l-3 m-6 c-12">
                <h4 class="footer-widget-title">Truy cập nhanh</h4>
                <ul class="widget-link">
                    <li><a href="#">Chính sách bảo mật</a></li>
                    <li><a href="#">Thảo luân</a></li>
                    <li><a href="#">Điều khoản - điều kiện</a></li>
                    <li><a href="#">Hỗ trợ khách hàng</a></li>
                    <li><a href="#">Câu hỏi thường gặp</a></li>
                </ul>
            </div>
            <div class="col l-3 m-6 c-12">
                <h4 class="footer-widget-title">Đăng ký</h4>

                <div>
                    <p>Đăng ký để được tư vấn miễn phí!</p>

                    <div class="widget-form">
                        <form action="#">
                            <input class="input" placeholder="Điền email vào đây" />
                            <button class="btn btn-primary">Đăng ký ngay</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-copyright">
        <div class="grid wide">
            <div class="row">
                <div class="copyright-link">
                    <a href="#">Điều khoản dịch vụ</a>
                    <a href="#">Chính sách</a>
                    <a href="#">Sơ đồ trang</a>
                    <a href="#">Bảo mật</a>
                </div>
                <div class="copyright-text">
                    © 2023 <span> Edule </span> Tạo bởi
                    <a href="#">Nhóm 4 - 9</a>
                </div>
            </div>
        </div>
    </div>
</footer>

</body>
</html>
