<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Forgotten Password</title>
    <script>
        function showTable() {
            document.getElementById('accountTable').style.display = 'block';
            return true;
        }
    </script>
</head>
<body>
    <form action="/elearning/forgetpassword" method="post" onsubmit="return showTable();">
        <input type="hidden" name="formSubmitted" value="true" />
        <label for="phoneNumber">Phone Number:</label>
        <input type="text" id="phoneNumber" name="phoneNumber" required>
        <input type="submit" value="Submit">
    </form>

        <table id="accountTable">
            <tr>
                <td>Account</td>
            </tr>
            <c:forEach items="${listAccount}" var="account">
                <tr>
                    <td>${account.username}</td>
                    <td>${account.userID}</td>
                    <td>
                        <form action="/elearning/forgetpassword/resetpass" method="post">
                            <input type="hidden" name="username" value="${account.username}" />
                            <button type="submit" >Reset pass</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>

</body>
</html>
