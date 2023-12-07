<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Your password has reseted!</h1>
        <table>
            <tr>
                <td>
                    <!--<c:out value="${sessionScope.username}"/>-->
                </td>
                <td>
<!--                     <c:out value="${sessionScope.NewPass}"/>-->
                    ${sessionScope.NewPass}
                </td>
            </tr>
        </table>
        <form action = "login" method = "post">
            <input type="hidden" value ="${sessionScope.NewPass}" name="password"/>
            <input type="hidden" value ="${sessionScope.UserName}" name="username"/>
            <button type="submit">Login</button>
            
        </form>

    <c:remove var="NewPass" scope="session" />
</body>
</html>
