<%-- 
    Document   : managerAcc
    Created on : Dec 7, 2023, 4:21:23 PM
    Author     : duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Trang Admin</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
      integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

    <!-- Material Icons -->
    <link
      href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined"
      rel="stylesheet"
    />

    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css/main.css" />
  </head>
  <body>
    <div class="grid-container">
      <!-- Header -->
      <header class="admin-header" style="padding: 30px">
        <div class="menu-icon" onclick="openSidebar()">
          <span class="material-icons-outlined">menu</span>
        </div>
        <div class="header-left">
          <span class="material-icons-outlined">search</span>
        </div>
        <div class="header-right">
          <span class="material-icons-outlined">notifications</span>
          <span class="material-icons-outlined">email</span>
          <span class="material-icons-outlined">account_circle</span>
        </div>
      </header>
      <!-- End Header -->

      <!-- Sidebar -->
      <aside id="sidebar">
        <div class="sidebar-title">
          <div class="sidebar-brand">
              <img src="../assets/logo-icon.png" alt="" />
          </div>
          <span class="material-icons-outlined" onclick="closeSidebar()"
            >close</span
          >
        </div>

        <ul class="sidebar-list">
          <li class="sidebar-list-item">
            <a href="#" target="_blank">
              <span class="material-icons-outlined">groups</span> Học viên
            </a>
          </li>
          <li class="sidebar-list-item">
            <a href="#" target="_blank">
              <span class="material-icons-outlined">library_books</span> Khoá
              học
            </a>
          </li>

          <li class="sidebar-list-item">
            <a href="#" target="_blank">
              <span class="material-icons-outlined">newspaper</span> Blog
            </a>
          </li>

          <li class="sidebar-list-item">
            <a href="#" target="_blank">
              <span class="material-icons-outlined">visibility</span>
              Lượt truy cập
            </a>
          </li>
          <li class="sidebar-list-item">
            <a href="#" target="_blank">
              <span class="material-icons-outlined">payments</span> Doanh thu
            </a>
          </li>
          <li class="sidebar-list-item">
            <a href="#" target="_blank">
              <span class="material-icons-outlined">mail</span> Tin nhắn
            </a>
          </li>
          <li class="sidebar-list-item">
            <a href="#" target="_blank">
              <span class="material-icons-outlined">logout</span> Đăng xuất
            </a>
          </li>
        </ul>
      </aside>
      <!-- End Sidebar -->

      <!-- Main -->
      <main class="main-container" style="width: 100%">
        <div class="main-title col">
          <h1>Danh sách các học viên</h1>
        </div>
          <table style="width: 100%" >
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
                        <td class="td-bold">${u.username}</td>
                        <td>${u.name}</td>
                        <td>${u.email}</td>
                        <td>${u.phoneNumber}</td>
                        <td>${u.dateOfBirth}</td>
                        <td>${u.createdDate}</td>
                        <td>
                            <div class="btnContainer">
                                <div class="btnL">
                                    <form action="/elearning/admin/managerAcc/user">
                                        <input type="hidden" name="userID" value="${u.userID}" />
                                        <button class="btn-backgound" type="submit" >View</button>
                                    </form>
                                </div>
                            </div>

                        </td>
                    </tr>
                </c:forEach>
            </table>
      </main>
      <!-- End Main -->
    </div>

    <!-- Scripts -->

    <!-- Custom JS -->
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
            if (confirm("Bạn có chắc muốn xoá học viên có id = " + id + " ?")) {
                window.location = "delete?id=" + id;
            }
        }


    </script>
    <script src="../js/admin.js"></script>
  </body>
</html>

