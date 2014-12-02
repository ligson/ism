<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/11/27 0027
  Time: 11:50
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!Doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>后台登陆</title>
    <link type="text/css" rel="stylesheet" href="${resource(dir: 'css/admin', file: 'adminBase.css')}"/>
</head>

<body>
<g:form controller="admin" action="login">
    <table>
        <tr>
            <td colspan="2">${result?.msg}</td>
        </tr>
        <tr>
            <td>账号</td><td><input type="text" name="name" value="${params.name}"></td>
        </tr>
        <tr>
            <td>密码</td><td><input type="password" name="password" value="${params.password}"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="登陆"/></td><td></td>
        </tr>
    </table>
</g:form>
</body>
</html>