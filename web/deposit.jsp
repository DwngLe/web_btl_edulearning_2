<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page contentType="text/html" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Deposit</title>
        <link rel="stylesheet" href="./css/css2.css" />
        
    </head>
    <body>
        <div class="d-container">
            <h1>Nạp tiền</h1>
            <form action="user-deposit" method="post">
                <label for="amount">Nhập số tiền muốn nạp:</label>
                <input type="text" name="amount" required placeholder="VD:100000">
                <h2>Thực hiện chuyển khoản theo thông tin dưới đây:</h2>
                <p> <b>Tên ngân hàng:</b>  MB Bank</p>
                <p> <b>Số tài khoản:</b>  0388622098</p>
                <p> <b>Chủ tài khoản:</b>  Nguyễn Nhất Vương</p>
                <p id="depositMessage"> <b>Mã giao dịch:${generateUniqueCode}</b> </p>
                <span style="font-style: italic">
                    Lưu ý: <br><br>
                    - Chuyển đúng số tiền đã nhập. <br><br>
                    - Khi chuyển khoản phần nội dung phải là mã giao dịch. <br><br>
                    - Chỉ thực hiện xác nhận khi đã tiến hành chuyển khoản. <br><br>
                </span>
                
                <input type="submit" value="Xác nhận thanh toán" id="dBtn">
            </form>
        </div>
    </body>
</html>
