<%--
  Created by IntelliJ IDEA.
  User: Mechrevo
  Date: 2020/2/20
  Time: 20:41
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

            var operaCommentStatus = '${operaCommentStatus}';
            if(operaCommentStatus == "success") {
                alert("发表成功！");
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
                <li><a href="${pageContext.request.contextPath}/UserManage/backMainPage">首页 <span class="sr-only">(current)</span></a></li>
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


<div class="container">

    <div class="row row-offcanvas row-offcanvas-right" style="margin-top: 70px">
        <!--审核戏曲标签页开始-->
        <div class="col-xs-12 col-sm-9" id="handleOperaBox" style="background-color: whitesmoke;margin-top: 10px">
            <p class="pull-right visible-xs">
                <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
            </p>
            <div style="height: 80px">
                <a href="#" onclick="backPage()">
                    <span class="glyphicon glyphicon-menu-left" style="height: 50px;margin-top: 10px" aria-hidden="true"></span><strong>返回</strong>
                </a>
            </div>
            <!--大屏放视频-->
            <div>
                <video width="100%" height="500px" controls>
                    <source src="${pageContext.request.contextPath}/${opera.fileName}" type="video/mp4" id="videoBox">
                    您的浏览器不支持Video标签。
                </video>
            </div>
            <!--显示视频信息-->
            <div>
                <br>
                <hr>
                <h3>${opera.operaName} <small>${opera.introduce}</small></h3>
                <p>
                    <strong>上传者：</strong>${uploader.userName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <strong>上传时间：</strong>${opera.publicationTime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <strong>类别：</strong>${opera.typeNamem()}
                </p>
                <p>
                    <a><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>&nbsp;&nbsp;${opera.watchNumber}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <c:if test="${empty sessionScope.user}">
                        <a  href="#" onclick="popAlert()"><span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span></a>&nbsp;&nbsp;${opera.collectionNumber}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </c:if>
                    <c:if test="${!empty sessionScope.user}">
                        <c:if test="${collectionFlag == 'yes'}">
                            <a id="collectionLink" href="#" onclick="collectionOpera('${opera.id}')"><span id="collectionBtn" class="glyphicon glyphicon-star-empty" aria-hidden="true"></span></a>&nbsp;&nbsp;<span id="collNum">${opera.collectionNumber}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </c:if>
                        <c:if test="${collectionFlag == 'no'}">
                            <a href="#" onclick="popAlert1()"><span class="glyphicon glyphicon-star" aria-hidden="true"></span></a>&nbsp;&nbsp;${opera.collectionNumber}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </c:if>
                    </c:if>
                    <a href="#" onclick="operaDownload('${opera.id}')"><span class="glyphicon glyphicon-cloud-download" aria-hidden="true"></span></a>
                </p>
            </div>
            <!--显示评论开始-->
            <div>
                <br>
                <br>
                <hr>
                <h3><strong>最新评论</strong></h3>
                <c:if test="${empty operaCommentList }">
                    <div class="media">
                        <div class="media-left media-middle">
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">此戏曲还没有评论</h4>
                        </div>
                    </div>
                </c:if>
                <c:if test="${!empty operaCommentList }">
                    <c:forEach items="${operaCommentList}" var="operaComment">
                        <div class="media" style="margin-top: 25px">
                            <div class="media-left media-middle">
                                <a href="#">
                                    <img class="media-object" src="${pageContext.request.contextPath}/images/logo.jpg" height="64px" width="64px">
                                </a>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">${operaComment.usre.userName}&nbsp;&nbsp;&nbsp;<samll style="font-size: 3px">${operaComment.commentTime}</samll></h4>
                                <p>${operaComment.content}</p>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
            <!--显示评论结束-->
            <!--发表评论-->
            <div>
                <br>
                <br>
                <br>
                <hr>
                <h3><strong>发表您的评论</strong></h3>
                <form method="post" action="${pageContext.request.contextPath}/OperaManage/operaComment">
                    <input type="hidden" name="userId" value="${sessionScope.user.id}">
                    <input type="hidden" name="operaId" value="${opera.id}">
                    <c:if test="${!empty sessionScope.user}">
                        <textarea class="form-control" rows="3" name="content" placeholder="发表您的评论..."></textarea><br>
                    </c:if>
                    <c:if test="${empty sessionScope.user}">
                        <textarea class="form-control" rows="3" name="content" placeholder="您还未登录，不能发表评论"></textarea><br>
                    </c:if>
                    <c:if test="${!empty sessionScope.user}">
                        <button type="submit" class="btn btn-primary">发表</button>
                    </c:if>
                    <c:if test="${empty sessionScope.user}">
                        <button type="submit" class="btn btn-primary" disabled onclick="popAlert()">发表</button>
                    </c:if>
                </form>
            </div>
        </div>
    </div>

    <hr>

    <footer>
        <p>&copy; Copyright by me</p>
    </footer>

</div><!--/.container-->

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
     * 返回上一个页面
     */
    function backPage() {
        window.location.href =document.referrer;//返回上一页并刷新
    }

    /**
     * 用户在未登录的情况下不允许评论
     */
    function popAlert() {
        alert("您还未登录！");
    }

    /**
     * 提示用户已经收藏过该戏曲
     */
    function popAlert1() {
        alert("您已经收藏过此戏曲");
    }

    /**
     * 戏曲下载方法
     */
    function operaDownload(operaId) {
        window.location.href = "${pageContext.request.contextPath}/OperaManage/operaDownload?operaId="+operaId;
    }


    /**
     * 用户收藏戏曲
     */
    function collectionOpera(operaId) {
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/UserManage/operaCollection",
            dataType:'json',
            data:{"operaId":operaId},
            success:function (res) {
                console.log(res);
                if(res.state == "success") {
                    alert(res.message);
                    $("#collectionBtn").attr("class","glyphicon glyphicon-star");
                    $("#collectionLink").attr("disabled","disabled");
                    debugger;
                    var collNum = $("#collNum").val();
                    var newcollNum = Number(collNum)+1;
                    $("#collNum").val(newcollNum);
                }
            }
        });
    }

</script>

</body>
</html>
