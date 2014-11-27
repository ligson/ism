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
    <link rel="stylesheet" type="text/css" href="${resource(dir:'css/admin',file:'admin_login.css')}">
    <script type="text/javascript">
        $(function(){

        });
    </script>
</head>

<body>
<div class="login_container">
    <g:form controller="admin" action="login">
        <table>
            <tr>
                <td colspan="2" style="color:red;font-size:10px;">${result?.msg}</td>
            </tr>
            <tr>
                <td>账号:</td><td><input type="text" name="name" value="${params.name}"></td>
            </tr>
            <tr>
                <td>密码:</td><td><input type="password" name="password" value="${params.password}"></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center"><input type="submit" value="登陆" class="login_btn"/></td><td></td>
            </tr>
        </table>
    </g:form>
</div>

</body>
</html>