<%--
  Created by IntelliJ IDEA.
  User: Mechrevo
  Date: 2020/2/16
  Time: 19:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>戏迷网</title>

    <!--bootstrap-->
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%--        <link href="${pageContext.request.contextPath}/css/bootstrap.min_1.css" rel="stylesheet">--%>
<%--        <script src="${pageContext.request.contextPath}/js/jquery.min_1.js"></script>--%>
<%--        <script src="${pageContext.request.contextPath}/js/bootstrap.min_1.js"></script>--%>

    <script>
        $(document).ready(function(){

            var message = '${message}';
            if(message == "failed") {
                alert("用户名或密码错误,请重新输入");
            }
            var registerState = '${registerState}';
            if(registerState == "success") {
                alert("注册成功");
            }else if(registerState == "failed"){
                alert("此邮箱已经被注册");
            }

            $("#registerForm").hide();
            $("#loginForm").show();

            $("#loginTab").click(function () {
                $("#registerTab").attr("class","");
                $("#registerForm").hide();
                $("#loginTab").attr("class","active");
                $("#loginForm").show();
            });

            $("#registerTab").click(function () {
                $("#loginTab").attr("class","");
                $("#loginForm").hide();
                $("#registerTab").attr("class","active");
                $("#registerForm").show();
            });
        });
    </script>
</head>
<body>
<div style="height: 500px;width: 400px;position:absolute;top:50%;left: 50%;margin-top: -250px;margin-left: -200px">
    <ul class="nav nav-tabs">
        <li role="presentation" class="active" id="loginTab"><a href="#">登录</a></li>
        <li role="presentation"><a href="#" id="registerTab">注册</a></li>
    </ul>
    <div id="loginForm">
        <form method="post" action="${pageContext.request.contextPath}/UserManage/userLogin">
            <div class="form-group">
                <label for="Lemail">邮箱</label>
                <input type="email" class="form-control" id="Lemail" name="email" placeholder="Email">
            </div>
            <div class="form-group">
                <label for="Lpassword">密码</label>
                <input type="password" class="form-control" id="Lpassword" name="userPassword" placeholder="Password">
            </div>
            <button type="submit" id="loginBtn" class="btn btn-default">登录</button>
        </form>
    </div>
    <div id="registerForm">
        <form method="post" action="${pageContext.request.contextPath}/UserManage/userRegister">
            <div class="form-group">
                <label for="Rusername">用户名</label>
                <input type="text" class="form-control" id="Rusername" name="userName" placeholder="UserName">
            </div>
            <div class="form-group">
                <label for="Remail">邮箱</label>
                <input type="email" class="form-control" id="Remail" name="email" placeholder="Email">
            </div>
            <div class="form-group">
                <label for="Rpassword">密码</label>
                <input type="password" class="form-control" id="Rpassword" name="userPassword" placeholder="Password">
            </div>
            <button type="submit" id="registerBtn" class="btn btn-default">注册</button>
        </form>
    </div>
</div>
</body>
</html>
