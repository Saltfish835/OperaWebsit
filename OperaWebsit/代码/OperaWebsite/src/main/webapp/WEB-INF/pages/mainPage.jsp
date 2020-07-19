<%--
  Created by IntelliJ IDEA.
  User: Mechrevo
  Date: 2020/2/16
  Time: 9:43
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
    </style>
    <script>
        $(document).ready(function () {
            var message = '${message}';
            if(message == "success") {
                alert("登录成功，跳转至主页");
            }
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
                <li class="active"><a href="${pageContext.request.contextPath}/UserManage/backMainPage">首页 <span class="sr-only">(current)</span></a></li>
                <!--显示所有戏曲种类-->
                <c:forEach items="${typeList}" var="type">
                    <li id="${type.id}"><a href="#" onclick="clickType('${type.id}')">${type.typeName}</a></li>
                </c:forEach>
                <li><a href="${pageContext.request.contextPath}/UserManage/showRank">排行</a></li>
                <li><a href="${pageContext.request.contextPath}/UserManage/showMessage">交流区</a></li>
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


<!--轮播图开始------------------------------->
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="width: 100%;height: 600px">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="${pageContext.request.contextPath}/images/lunbotu_1.jpg" style="height: 600px;width: 100%"/>
            <div class="carousel-caption">

            </div>
        </div>
        <div class="item">
            <img src="${pageContext.request.contextPath}/images/lunbotu_4.jpg" style="height: 600px;width: 100%"/>
            <div class="carousel-caption">

            </div>
        </div>
        <div class="item">
            <img src="${pageContext.request.contextPath}/images/lunbotu_3.jpg" style="height: 600px;width: 100%"/>
            <div class="carousel-caption">

            </div>
        </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<!--轮播图结束------------------------------>

<div class="container">
    <!-- Example row of columns -->
    <c:forEach items="${typeList}" var="type">
        <div style="height: 30px;border-bottom: 1px solid">
            <a href="#" onclick="clickMoreLink(${type.id})">
                <h4 style="margin-top: 20px"><strong>${type.typeName}</strong>  <span class="glyphicon glyphicon-forward" aria-hidden="true"></span></h4>
            </a>
        </div>
        <div class="row">
            <c:forEach items="${mainPageData}" var="map">
                <c:if test="${type.id == map.key}">
                    <c:forEach var="opera" items="${map.value}">
                        <a href="${pageContext.request.contextPath}/OperaManage/jumpToWatchOperaPage?operaId=${opera.id}">
                            <div class="col-md-4" style="background-color: snow">
                                <video width="260px" height="200px">
                                    <source src="${pageContext.request.contextPath}/${opera.fileName}" type="video/mp4">
                                    您的浏览器不支持Video标签。
                                </video>
                                <p><strong>${opera.operaName}</strong></p>
                                <h6><small>${opera.introduce}</small></h6>
                            </div>
                        </a>
                    </c:forEach>
                </c:if>
            </c:forEach>
        </div>
    </c:forEach>

    <hr>

    <footer>
        <p>&copy; 2016 Company, Inc.</p>
    </footer>
</div> <!-- /container -->


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
     * 用户点击每个类型的更多按钮
     */
    function clickMoreLink(typeId) {
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
