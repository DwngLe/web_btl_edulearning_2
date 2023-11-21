<%-- 
    Document   : resetPassword
    Created on : Nov 19, 2023, 11:22:41 PM
    Author     : duong
--%>

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
                    ${account.username}
                </td>
                <td>
                    ${account.password}
                </td>
            </tr>
        </table>
    </body>
</html>
