<%--
  Created by IntelliJ IDEA.
  User: Mechrevo
  Date: 2020/2/19
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>系统管理</title>
    <!--bootstrap-->
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            var loginStatus = '${loginStatus}';
            if(loginStatus == "failed") {
                alert("用户名或密码错误");
            }
        });
    </script>


</head>
<body>
<div style="height: 500px;width: 400px;position:absolute;top:50%;left: 50%;margin-top: -250px;margin-left: -200px">
    <ul class="nav nav-tabs">
        <li role="presentation" class="active" id="loginTab"><a href="#">管理员登录</a></li>
    </ul>
    <div id="loginForm">
        <form method="post" action="${pageContext.request.contextPath}/AdminManage/adminLogin">
            <div class="form-group">
                <label for="adminName">用户名</label>
                <input type="text" class="form-control" id="adminName" name="adminName" placeholder="admin name">
            </div>
            <div class="form-group">
                <label for="adminPassword">密码</label>
                <input type="password" class="form-control" id="adminPassword" name="adminPassword" placeholder="Password">
            </div>
            <button type="submit" id="loginBtn" class="btn btn-default">登录</button>
        </form>
    </div>
</div>
</body>
</html>
