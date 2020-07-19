<%--
  Created by IntelliJ IDEA.
  User: Mechrevo
  Date: 2020/2/19
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>戏迷网管理系统</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="offcanvas.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    <script src="offcanvas.js"></script>
    <![endif]-->
</head>

<body>
<nav class="navbar navbar-fixed-top navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/AdminManage/jumpToMainPage">系统管理</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav" style="float: right;margin-right: 20px">
                <li><a disabled>管理员：${sessionScope.admin.adminName}</a></li>
                <li><a href="${pageContext.request.contextPath}/AdminManage/adminExit">退出<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a></li>
            </ul>
        </div><!-- /.nav-collapse -->
    </div><!-- /.container -->
</nav><!-- /.navbar -->

<div class="container">

    <div class="row row-offcanvas row-offcanvas-right" style="margin-top: 70px">

        <!--管理员首页标签页开始-->
        <div class="col-xs-12 col-sm-9" id="adminMainPageBox">
            <p class="pull-right visible-xs">
                <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
            </p>
            <div class="jumbotron">
                <h1>Hello, ${sessionScope.admin.adminName}!</h1>
                <p>以下是网站新的动态</p>
            </div>
            <div class="row">
                <div class="col-xs-6 col-lg-4">
                    <h2>戏曲审核</h2>
                    <p>有<strong style="color: red">${userNumber}</strong>位用户共上传了<strong style="color: red">${needHandleOperaNumber}</strong>部戏曲正等待审核</p>
                    <br>
                    <br>
                    <p><a class="btn btn-default" href="${pageContext.request.contextPath}/AdminManage/jumpToHandleOperaPage?currentPage=1" role="button">查看详情 &raquo;</a></p>
                </div><!--/.col-xs-6.col-lg-4-->
                <div class="col-xs-6 col-lg-4">
                    <h2>评论编辑</h2>
                    <p>有<strong style="color: red">${userNumber_2}</strong>位用户共发表了<strong style="color: red">${newOperaNumber}</strong>条评论正等待编辑</p>
                    <br>
                    <br>
                    <p><a class="btn btn-default" href="${pageContext.request.contextPath}/AdminManage/jumpToOperaCommentEditPage" role="button">查看详情 &raquo;</a></p>
                </div><!--/.col-xs-6.col-lg-4-->
                <div class="col-xs-6 col-lg-4">
                    <h2>发布信息</h2>
                    <p>发布线下交流活动信息，网站公告，戏曲常识与介绍等</p>
                    <br>
                    <p><a class="btn btn-default" href="${pageContext.request.contextPath}/AdminManage/jumpToNoticePage" role="button">快速发布 &raquo;</a></p>
                </div><!--/.col-xs-6.col-lg-4-->
            </div>
        </div>
        <!--管理员首页标签页结束-->



        <!--右边菜单开始-->
        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
            <div class="list-group">
                <a href="${pageContext.request.contextPath}/AdminManage/jumpToMainPage" class="list-group-item active">首页</a>
                <a href="${pageContext.request.contextPath}/AdminManage/jumpToHandleOperaPage?currentPage=1" class="list-group-item">戏曲审核</a>
                <a href="${pageContext.request.contextPath}/AdminManage/jumpToOperaCommentEditPage" class="list-group-item">评论编辑</a>
                <a href="${pageContext.request.contextPath}/AdminManage/jumpToNoticePage" class="list-group-item">发布信息</a>
            </div>
        </div>
        <!--右边菜单结束-->
    </div>

    <hr>

    <footer>
        <p>&copy; Copyright by me</p>
    </footer>

</div><!--/.container-->
</body>
</html>
