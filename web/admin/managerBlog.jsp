<%-- 
    Document   : managerBlog
    Created on : Dec 8, 2023, 10:54:57 AM
    Author     : duong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/admin_temp.css"/>
    </head>
    <body>
        <h1>Quản lý Blog</h1>
        <form action="/elearning/admin/blog/add" method="get">
            <input type="submit" value="Thêm blog">
        </form>
        <h1>Danh sách các Blog</h1>
        <c:if test = "${empty listBlog or listBlog.size() eq 0}">
            <p>Không tồn tại blog</p>
        </c:if>
        <c:if test = "${not empty listBlog or listBlog.size() gt 0}">
            <div>
                 <div>
                    
                    <p>Total Blogs: ${listBlog.size()}</p>
                </div>
                <table>
                    <tr>
                        <!--<td>ID</td>-->
                        <td>Số thứ tự</td>
                        <td>Tiêu đề</td><!-- comment -->
                        <td>Ngày khởi tạo</td> 
                        <td>Ngày cập nhật</td>
                        <td>Tổng lượt xem</td>
                        <td>Chức năng</td>
                    </tr>
                    
                    <c:set var="count" value="0" />
                    <c:forEach var="blog" items = "${listBlog}">
                        <tr>
                            <td>${count + 1}</td>
                            <td>${blog.title}</td>   
                            <td>${blog.createdDate}</td>
                            <td>${blog.updateAt}</td>
                            <td>${blog.totalView}</td>
                            <td>
                                <form action="/elearning/admin/blog/delete" method="post">
                                    <input type="hidden" name="blogID" value="${blog.getBlogID()}"/>
                                    <button type ="submit">Xoa Blog</button>
                                </form>
                                <br/>
                                <form action="/elearning/admin/blog/update" method="get">
                                    <input type="hidden" name="blogID" value="${blog.getBlogID()}"/>
                                    <button type ="submit">Cap nhat Blog</button>
                                </form>
                            </td>
                        </tr>
                       
                        <!-- Tăng biến đếm sau mỗi lần lặp -->
                        <c:set var="count" value="${count + 1}" />
                    </c:forEach>
                </table>
            </div>
           
        </c:if>
    </body>
</html>
