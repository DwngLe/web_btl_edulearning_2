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
<!--                     <c:out value="${sessionScope.newpass}"/>-->
                    <p>Your new password is:  ${sessionScope.newpass}</p>
                </td>
            </tr>
        </table>
        <form action = "login" method = "post">
            <input type="hidden" value ="${sessionScope.newpass}" name="password"/>
            <input type="hidden" value ="${sessionScope.username}" name="username"/>
            <button type="submit">Login</button>
        </form>
            
       <form action = "login" method = "get">
           
            <button type="submit">Back to Login Page</button>
        </form>
            

    <c:remove var="NewPass" scope="session" />
</body>
</html>
