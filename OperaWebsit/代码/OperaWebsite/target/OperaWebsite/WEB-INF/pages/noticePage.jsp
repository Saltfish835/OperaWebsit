<%--
  Created by IntelliJ IDEA.
  User: Mechrevo
  Date: 2020/2/21
  Time: 15:56
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
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <%--    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>--%>
    <%--    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    <script src="offcanvas.js"></script>

    <script>
        <!--显示消息用-->
        $(document).ready(function () {
            var sendStatus = '${sendStatus}';
            if(sendStatus == "success") {
                alert("发布成功");
            }
        })

    </script>


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
        <!--评论编辑标签页开始-->
        <div class="col-xs-12 col-sm-9" id="handleOperaBox" style="background-color: whitesmoke;margin-top: 10px">
            <p class="pull-right visible-xs">
                <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
            </p>
            <div class="row" style="margin-top: 80px">
                <!--发布表单开始-->
                <div>
                    <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/AdminManage/sendNotice">
                        <h3><strong>发布信息</strong><small>发布线下交流活动信息，网站公告，戏曲常识与介绍等</small></h3>
                        <br>
                        <br>
                        <label class="col-sm-2 control-label">输入信息：</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="3" name="content"></textarea>
                        </div>
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary">发布</button>
                        </div>
                    </form>
                </div>
                <!--发布表单开始-->
            </div>
        </div>
        <!--评论编辑标签页结束-->
        <!--右边菜单开始-->
        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
            <div class="list-group">
                <a href="${pageContext.request.contextPath}/AdminManage/jumpToMainPage" class="list-group-item">首页</a>
                <a href="${pageContext.request.contextPath}/AdminManage/jumpToHandleOperaPage?currentPage=1" class="list-group-item">戏曲审核</a>
                <a href="${pageContext.request.contextPath}/AdminManage/jumpToOperaCommentEditPage" class="list-group-item">评论编辑</a>
                <a href="${pageContext.request.contextPath}/AdminManage/jumpToNoticePage" class="list-group-item active">发布信息</a>
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
