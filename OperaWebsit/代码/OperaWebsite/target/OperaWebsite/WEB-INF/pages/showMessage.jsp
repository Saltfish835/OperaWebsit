<%--
  Created by IntelliJ IDEA.
  User: Mechrevo
  Date: 2020/2/21
  Time: 18:03
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

    <title>戏迷网</title>

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

    <style>
        body {
            background-color: whitesmoke;
        }

        hr {
            margin-top: 20px;
            margin-bottom: 20px;
            border: 0;
            border-top: 1px solid #333;
        }
    </style>

    <script>
        $(document).ready(function () {

            //一进来显示系统通知页面
            $("#tMessageBox").hide();
            $("#noticeBox").show();


            var sendTMessageStatus = '${sendTMessageStatus}';
            if(sendTMessageStatus == "success") {
                alert("发表成功");
                $("#noticeBox").hide();
                $("#tMessageBox").show();
                $("#tMessageBtn").attr("class","btn btn-primary");
                $("#noticeBtn").attr("class","btn btn-default");
            }


            /**
             * 用户想看系统通知
             */
            $("#triggerNoticeBox").click(function () {
                $("#tMessageBox").hide();
                $("#noticeBox").show();
                $("#tMessageBtn").attr("class","btn btn-default");
                $("#noticeBtn").attr("class","btn btn-primary");
            });

            /**
             * 用户想看用户交流
             */
            $("#triggerTMessageBox").click(function () {
                $("#noticeBox").hide();
                $("#tMessageBox").show();
                $("#tMessageBtn").attr("class","btn btn-primary");
                $("#noticeBtn").attr("class","btn btn-default");
            });


        });

    </script>

</head>
<body>
<!--页面顶部开始-------------------------------->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header" style="margin-left: 300px">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/UserManage/backMainPage"><h3 style="margin-top: 0px">戏迷网</h3></a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="float: left;margin-left: 80px">
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/UserManage/backMainPage">首页 <span class="sr-only">(current)</span></a></li>
                <!--显示所有戏曲种类-->
                <c:forEach items="${typeList}" var="type">
                    <li id="${type.id}"><a href="#" onclick="clickType('${type.id}')">${type.typeName}</a></li>
                </c:forEach>
                <li><a href="${pageContext.request.contextPath}/UserManage/showRank">排行</a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/UserManage/showMessage">交流区</a></li>
            </ul>
            <form class="navbar-form navbar-left"style="float: left;margin-left: 120px" method="post" action="${pageContext.request.contextPath}/OperaManage/operaResearch">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for..." name="keyword">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="submit">Go</button>
                    </span>
                </div>
            </form>

            <ul class="nav navbar-nav navbar-right" style="float: left;margin-left: 80px">
                <c:if test="${empty sessionScope.user}">
                    <li><a href="#" onclick="popAlert()"><span class="glyphicon glyphicon-star" aria-hidden="true"></span></a></li>
                </c:if>
                <c:if test="${!empty sessionScope.user}">
                    <li><a href="${pageContext.request.contextPath}/UserManage/collectionOpera?currentPage=1"><span class="glyphicon glyphicon-star" aria-hidden="true"></span></a></li>
                </c:if>
                <li><a href="${pageContext.request.contextPath}/UserManage/clickUserInfo" alt="个人中心">
                    <c:if test="${empty sessionScope.user}"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></c:if>
                    <c:if test="${!empty sessionScope.user}"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></c:if>
                </a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!--页面顶部结束--------------------------------->

<div class="container marketing" style="margin-top: 150px">

    <!-- Three columns of text below the carousel -->
    <div class="row">
        <div class="col-lg-4" id="triggerNoticeBox">
            <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="140" height="140">
            <h2>系统通知</h2>
            <p>网站公告、线下活动通知等</p>
            <p><a class="btn btn-primary" href="#" role="button" id="noticeBtn">查看系统通知 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4" id="triggerTMessageBox">
            <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="140" height="140">
            <h2>戏迷交流</h2>
            <p>戏迷可以自由交流的区域</p>
            <p><a class="btn btn-default" href="#" role="button" id="tMessageBtn">查看戏迷交流 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->

    <!-- START THE FEATURETTES -->
    <!--显示系统通知的盒子开始-->
    <div id="noticeBox">
        <c:if test="${empty noticeList}">
            <hr class="featurette-divider" style="border-top: 3px solid #eee;">
            <div class="row featurette">
                <div class="col-md-7">
                    <h2 class="featurette-heading">管理员还没有发布通知。 <span class="text-muted"></span></h2>
                    <p class="lead">请您稍后再来查看...</p>
                </div>
                <div class="col-md-5">
                    <!--这里可以进行一些操作-->


                </div>
            </div>
            <hr class="featurette-divider">
        </c:if>
        <c:if test="${!empty noticeList}">
            <c:forEach items="${noticeList}" var="notice">
                <hr class="featurette-divider">
                <div class="row featurette">
                    <div class="col-md-7">
                        <h2 class="featurette-heading">管理员。 <span class="text-muted">${notice.publicationTime}</span></h2>
                        <p class="lead">${notice.content}</p>
                    </div>
                    <div class="col-md-5">
                        <!--这里可以进行一些操作-->


                    </div>
                </div>
                <br>
            </c:forEach>
        </c:if>
    </div>
    <!--显示系统通知的盒子结束-->

    <!--显示用户交流开始-->
    <div id="tMessageBox">
        <c:if test="${empty tMessageList}">
            <hr class="featurette-divider">
            <div class="row featurette">
                <div class="col-md-7">
                    <h2 class="featurette-heading">暂无讯息<span class="text-muted"></span></h2>
                    <p class="lead"></p>
                </div>
                <div class="col-md-5">
                    <!--这里可以进行一些操作-->


                </div>
            </div>
            <hr class="featurette-divider">
        </c:if>
        <c:if test="${!empty tMessageList}">
            <c:forEach items="${tMessageList}" var="tMessage">
                <hr class="featurette-divider">
                <div class="row featurette">
                    <div class="col-md-7">
                        <h2 class="featurette-heading">${tMessage.user.userName}。 <span class="text-muted">${tMessage.messageTime}</span></h2>
                        <p class="lead">${tMessage.content}</p>
                    </div>
                    <div class="col-md-5">
                        <!--这里可以进行一些操作-->


                    </div>
                </div>
                <br>
            </c:forEach>
        </c:if>
        <br><br><br>
        <div>
            <form method="post" action="${pageContext.request.contextPath}/UserManage/sendTMessage">
                <h4>发帖：</h4>
                <c:if test="${empty sessionScope.user}">
                    <textarea class="form-control" rows="3" name="message" placeholder="未登录不能发帖"></textarea><br>
                    <button type="submit" class="btn btn-primary" disabled="disabled">Submit</button>
                </c:if>
                <c:if test="${!empty sessionScope.user}">
                    <textarea class="form-control" rows="3" name="message"></textarea><br>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </c:if>
            </form>
        </div>
    </div>
    <!--显示用户交流结束-->
    <!-- /END THE FEATURETTES -->


    <!-- FOOTER -->
    <br><br><br><br>
    <hr class="featurette-divider">
    <footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>&copy; 2016 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
    </footer>

</div><!-- /.container -->

</body>
<script>
    /**
     * 点击顶部导航条的戏剧类型所触发的方法
     * 参数是戏曲类型的id
     * @param typeId
     */
    function clickType(typeId) {
        //alert("typeId:"+typeId);
        window.location.href="${pageContext.request.contextPath}/OperaManage/jumpToOperaPage?currentPage="+1+"&typeId="+typeId;//此方法会刷新当前页
    }

    /**
     * 用户在未登录的情况下不允许评论
     */
    function popAlert() {
        alert("您还未登录！");
    }
</script>
</html>
