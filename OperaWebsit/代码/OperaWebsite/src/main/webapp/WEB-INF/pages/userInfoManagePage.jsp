<%--
  Created by IntelliJ IDEA.
  User: Mechrevo
  Date: 2020/2/16
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>个人信息管理</title>
    <!--bootstrap-->
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>


<%--    <!-- import Vue before Element -->--%>
<%--    <script src="https://unpkg.com/vue/dist/vue.js"></script>--%>
<%--    <!-- import JavaScript -->--%>
<%--    <script src="https://unpkg.com/element-ui/lib/index.js"></script>--%>
<%--    <!-- import CSS -->--%>
<%--    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">--%>

<%--    <link href="${pageContext.request.contextPath}/css/bootstrap.min_1.css" rel="stylesheet">--%>
<%--    <script src="${pageContext.request.contextPath}/js/jquery.min_1.js"></script>--%>
<%--    <script src="${pageContext.request.contextPath}/js/bootstrap.min_1.js"></script>--%>
<%--    <script src="${pageContext.request.contextPath}/js/vue.min_1.js"></script>--%>
<%--    <script src="${pageContext.request.contextPath}/js/index_1.js"></script>--%>
<%--    <link src="${pageContext.request.contextPath}/css/index_1.css">--%>

    <script>
        $(document).ready(function () {


            /**
             * 一进入此页面，首先显示的应该是用户个人信息标签页，先隐藏其它标签页，然后显示用户信息标签页
             */
            $("#collectOperaBox").hide();//隐藏修改用户信息的标签页
            $("#uploadOperaBox").hide();//隐藏修改用户信息的标签页
            $("#modifyUserInfoBox").hide();//隐藏修改用户信息的标签页
            $("#uploadBox").hide();//隐藏修改用户信息的标签页
            $("#watchOperaBox").hide();
            $("#userInfoBox").show();//显示显示用户个人信息标签页

            var userId = '${sessionScope.user.id}';
            function getUploadOperaNumber() {
                $.ajax({
                    type:"POST",
                    url:"${pageContext.request.contextPath}/OperaManage/getUploadOperaNumber",
                    dataType:'json',
                    data:{"userId":userId},
                    success:function (res) {
                        console.log(res);
                        console.log(res.number);
                        $("#uploadNum").attr("value",res.number);
                    }
                });
            }

            //调用这个方法
            getUploadOperaNumber();


            /**
             * 用户在此页面点击上传文件，又返回此页面
             */
            var uploadState = '${uploadState}';
            if(uploadState == "文件为空") {
                alert("文件为空");
                //留在当前标签页
                $("#watchOperaBox").hide();
                $("#collectOperaBox").hide();//隐藏修改用户信息的标签页
                $("#uploadOperaBox").hide();//隐藏修改用户信息的标签页
                $("#userInfoBox").hide();//显示显示用户个人信息标签页
                $("#modifyUserInfoBox").hide();//隐藏修改用户信息的标签页
                $("#uploadBox").show();//隐藏修改用户信息的标签页

            }else if(uploadState == "上传成功") {
                alert("上传成功");
                //留在当前标签页
                $("#watchOperaBox").hide();
                $("#collectOperaBox").hide();//隐藏修改用户信息的标签页
                $("#uploadOperaBox").hide();//隐藏修改用户信息的标签页
                $("#userInfoBox").hide();//显示显示用户个人信息标签页
                $("#modifyUserInfoBox").hide();//隐藏修改用户信息的标签页
                $("#uploadBox").show();//隐藏修改用户信息的标签页

            }else if(uploadState == "文件上传出错") {
                alert("文件上传出错");
                //留在当前标签页
                $("#watchOperaBox").hide();
                $("#collectOperaBox").hide();//隐藏修改用户信息的标签页
                $("#uploadOperaBox").hide();//隐藏修改用户信息的标签页
                $("#userInfoBox").hide();//显示显示用户个人信息标签页
                $("#modifyUserInfoBox").hide();//隐藏修改用户信息的标签页
                $("#uploadBox").show();//隐藏修改用户信息的标签页

            }

            /**
             * 用户在此页面点击已上传戏曲，又返回此页面
             */
            var uploadedOperaState = '${uploadedOperaState}';
            if(uploadedOperaState == "success") {
                $("#watchOperaBox").hide();
                $("#collectOperaBox").hide();//隐藏修改用户信息的标签页
                $("#userInfoBox").hide();//显示显示用户个人信息标签页
                $("#modifyUserInfoBox").hide();//隐藏修改用户信息的标签页
                $("#uploadBox").hide();//隐藏修改用户信息的标签页
                $("#uploadOperaBox").show();//隐藏修改用户信息的标签页
            }

            /**
             * 用户点击观看已上传视频，又返回此页
             */
            var watchOperaStatus = '${watchOperaStatus}';
            if(watchOperaStatus == "success") {
                //先把其它标签页隐藏起来,再显示播放戏曲标签页
                $("#collectOperaBox").hide();//隐藏修改用户信息的标签页
                $("#uploadOperaBox").hide();//隐藏修改用户信息的标签页
                $("#uploadBox").hide();//隐藏修改用户信息的标签页
                $("#userInfoBox").hide();//显示显示用户个人信息标签页
                $("#modifyUserInfoBox").hide();//隐藏修改用户信息的标签页
                $("#watchOperaBox").show();
            }

            /**
             *  用户点击已收藏戏曲，又返回此页
             */
            var collectionOpera = '${collectionOpera}';
            if(collectionOpera == "success") {
                $("#watchOperaBox").hide();
                $("#userInfoBox").hide();//显示显示用户个人信息标签页
                $("#modifyUserInfoBox").hide();//隐藏修改用户信息的标签页
                $("#uploadBox").hide();//隐藏修改用户信息的标签页
                $("#uploadOperaBox").hide();//隐藏修改用户信息的标签页
                $("#collectOperaBox").show();//隐藏修改用户信息的标签页
            }


            /**
             * 用户点击修改用户信息的超链接
             */
            $("#modifyUserInfoLink").click(function () {
               //先隐藏其它标签页，显示修改个人信息标签页
                $("#watchOperaBox").hide();
                $("#collectOperaBox").hide();//隐藏修改用户信息的标签页
                $("#uploadOperaBox").hide();//隐藏修改用户信息的标签页
                $("#uploadBox").hide();//隐藏修改用户信息的标签页
                $("#userInfoBox").hide();//显示显示用户个人信息标签页
                $("#modifyUserInfoBox").show();//隐藏修改用户信息的标签页
            });

            /**
             * 用户点击个人信息超链接
             */
            $("#userInfoLink").click(function () {
                getUploadOperaNumber();
                $("#watchOperaBox").hide();
                $("#collectOperaBox").hide();//隐藏修改用户信息的标签页
                $("#uploadOperaBox").hide();//隐藏修改用户信息的标签页
                $("#uploadBox").hide();//隐藏修改用户信息的标签页
                $("#modifyUserInfoBox").hide();//隐藏修改用户信息的标签页
                $("#userInfoBox").show();//显示显示用户个人信息标签页
            });

            /**
             * 用户点击已收藏戏曲超链接
             */
            $("#collectionLink").click(function () {
                $("#watchOperaBox").hide();
                $("#uploadOperaBox").hide();//隐藏修改用户信息的标签页
                $("#uploadBox").hide();//隐藏修改用户信息的标签页
                $("#modifyUserInfoBox").hide();//隐藏修改用户信息的标签页
                $("#userInfoBox").hide();//显示显示用户个人信息标签页
                $("#collectOperaBox").show();//隐藏修改用户信息的标签页
            });

            /**
             * 用户点击已上传戏曲超链接
             */
            $("#uploadedLink").click(function () {
                $("#watchOperaBox").hide();
                $("#uploadBox").hide();//隐藏修改用户信息的标签页
                $("#modifyUserInfoBox").hide();//隐藏修改用户信息的标签页
                $("#userInfoBox").hide();//显示显示用户个人信息标签页
                $("#collectOperaBox").hide();//隐藏修改用户信息的标签页
                $("#uploadOperaBox").show();//隐藏修改用户信息的标签页
            });

            /**
             * 用户点击上传戏曲超链接
             */
            $("#uploadLink").click(function () {
                $("#watchOperaBox").hide();
                $("#modifyUserInfoBox").hide();//隐藏修改用户信息的标签页
                $("#userInfoBox").hide();//显示显示用户个人信息标签页
                $("#collectOperaBox").hide();//隐藏修改用户信息的标签页
                $("#uploadOperaBox").hide();//隐藏修改用户信息的标签页
                $("#uploadBox").show();//隐藏修改用户信息的标签页
            });



            /**
             *
             * 用户上传戏曲操作
             */
            <%--$("#uploadBtn").click(function () {--%>
            <%--    var formdata = new FormData($("#uploadOperaForm")[0]);--%>
            <%--    $.ajax({--%>
            <%--        type:"POST",--%>
            <%--        url:"${pageContext.request.contextPath}/OperaManage/operaUpload",--%>
            <%--        data:formdata,--%>
            <%--        dataType:"JSON",--%>
            <%--        contentType:false,//告诉jquery不要设置请求头--%>
            <%--        processData:false,//告诉jquery不要去处理发送的数据--%>
            <%--        success:function (res) {--%>
            <%--            debugger;--%>
            <%--            console.log(res);--%>
            <%--            if(res.state == "success") {--%>

            <%--                //留在当前标签页--%>
            <%--                $("#collectOperaBox").hide();//隐藏修改用户信息的标签页--%>
            <%--                $("#uploadOperaBox").hide();//隐藏修改用户信息的标签页--%>
            <%--                $("#userInfoBox").hide();//显示显示用户个人信息标签页--%>
            <%--                $("#modifyUserInfoBox").hide();//隐藏修改用户信息的标签页--%>
            <%--                $("#uploadBox").show();//隐藏修改用户信息的标签页--%>
            <%--                alert(res.message);--%>
            <%--            }else if(res.state == "failed") {--%>

            <%--                //留在当前标签页--%>
            <%--                $("#collectOperaBox").hide();//隐藏修改用户信息的标签页--%>
            <%--                $("#uploadOperaBox").hide();//隐藏修改用户信息的标签页--%>
            <%--                $("#userInfoBox").hide();//显示显示用户个人信息标签页--%>
            <%--                $("#modifyUserInfoBox").hide();//隐藏修改用户信息的标签页--%>
            <%--                $("#uploadBox").show();//隐藏修改用户信息的标签页--%>
            <%--                alert(res.message);--%>
            <%--            }--%>
            <%--        },--%>
            <%--        error:function (res) {--%>

            <%--            //留在当前标签页--%>
            <%--            $("#collectOperaBox").hide();//隐藏修改用户信息的标签页--%>
            <%--            $("#uploadOperaBox").hide();//隐藏修改用户信息的标签页--%>
            <%--            $("#userInfoBox").hide();//显示显示用户个人信息标签页--%>
            <%--            $("#modifyUserInfoBox").hide();//隐藏修改用户信息的标签页--%>
            <%--            $("#uploadBox").show();//隐藏修改用户信息的标签页--%>
            <%--            alert("上传失败");--%>
            <%--        }--%>
            <%--    });--%>
            <%--});--%>



        });



    </script>
</head>
<body>

<!--导航条开始-------------------------------->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">个人信息管理</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/UserManage/backMainPage"><span class="glyphicon glyphicon-menu-left"aria-hidden="true"></span><strong>返回首页</strong></a></li>
            </ul>
        </div>
    </div>
</nav>
<!--导航条结束-------------------------------->
<div class="container-fluid" style="margin-top: 60px">
    <div class="row">
        <!--旁边菜单开始-------------------->
        <div class="col-xs-4 col-md-2">
            <ul class="nav nav-sidebar">
                <li><a href="#" id="userInfoLink">个人信息 <span class="sr-only">(current)</span></a></li>
                <li><a href="${pageContext.request.contextPath}/UserManage/collectionOpera?currentPage=1" id="collectionLink">已收藏戏曲</a></li>
                <li><a href="${pageContext.request.contextPath}/UserManage/uploadedOpera?currentPage=1" id="uploadedLink">已上传戏曲</a></li>
                <li><a href="#" id="modifyUserInfoLink">个人信息修改</a></li>
            </ul>
            <ul class="nav nav-sidebar" style="margin-top: 10px">
                <li><a href="#" id="uploadLink">上传戏曲</a></li>
                <li><a href="${pageContext.request.contextPath}/UserManage/exit">退出登录</a></li>
            </ul>
        </div>
        <!--旁边菜单结束-------------------->


        <!--主要内容开始-------------------->
        <div class="col-xs-12 col-sm-6 col-md-8" style="background-color: whitesmoke">
            <div style="height: 720px">


                <!--显示用户的基本信息标签页-->
                <div id="userInfoBox" style="width: 890px;height: 400px;margin-top: 50px;margin-left: 50px">
                    <h3>个人信息</h3>
                    <div style="height: 400px;width: 500px;margin-left: 30px">
                        <h4><strong>基本信息</strong></h4>
                        <p>用户名：  ${sessionScope.user.userName}</p>
                        <p>邮箱：  ${sessionScope.user.email}</p>
                        <br>

                        <h4><strong>其他信息</strong></h4>
                        <p>上传戏曲数量：<input id="uploadNum" value="" disabled></p>
                    </div>
                </div>

                <!--显示用户已收藏戏曲标签页-->
                <div id="collectOperaBox" style="width: 100%;">
                    <h3>已收藏戏曲</h3>
                    <div style="margin-left: 30px">
                        <c:if test="${empty collectionList}">
                            <h5>您还未收藏过戏曲</h5>
                        </c:if>
                        <c:if test="${!empty collectionList}">
                            <div class="row">
                                <c:forEach var="collection" items="${collectionList}">
                                    <a href="${pageContext.request.contextPath}/OperaManage/watchUploadedOpera?operaId=${collection.operaId}">
                                        <div class="col-sm-6 col-md-4" style="width: 300px;height: 310px;margin-top: 10px">
                                            <div class="thumbnail" style="width: 270px;margin-left: 5px">
                                                <video width="260px" height="200px" style="margin-left:2px;">
                                                    <source src="${pageContext.request.contextPath}/${collection.opera.fileName}" type="video/mp4">
                                                    您的浏览器不支持Video标签。
                                                </video>
                                                <div class="caption" style="width:260px">
                                                    <p style="margin: 0 0 1px;"><strong>名称：</strong>${collection.opera.operaName}</p>
                                                    <p style="margin: 0 0 1px;"><strong>类型：</strong>${collection.opera.typeNamem()}</p>
                                                    <p style="margin: 0 0 1px;"><strong>收藏时间时间：</strong>${collection.collectionTime}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </c:forEach>
                            </div>
                            <!--实现分页-->
                            <div class="wrapper">
                                <span class="btn"  style="float: right">
                                    <a id ="pre_page_1">上一页</a>
                                    <span>
                                        <span id="current_page_1" val="${currentPage}">${currentPage}</span>
                                        <span>/</span>
                                        <span id ="total_page_1" val="${totalPageNumber}">${totalPageNumber}</span>
                                    </span>
                                    <a id ="next_page_1">下一页</a>
                                </span>
                            </div>
                        </c:if>
                    </div>
                </div>

                <!--显示用户已上传戏曲标签页-->
                <div id="uploadOperaBox" style="width: 100%;">
                    <h3>已上传戏曲</h3>
                    <div style="margin-left: 30px">
                        <c:if test="${empty operaList}">
                            <h5>您还未上传过戏曲</h5>
                        </c:if>
                        <c:if test="${!empty operaList}">
                            <div class="row">
                                <c:forEach var="opera" items="${operaList}">
                                    <a href="${pageContext.request.contextPath}/OperaManage/watchUploadedOpera?operaId=${opera.id}">
                                        <div class="col-sm-6 col-md-4" style="width: 300px;height: 310px;margin-top: 10px">
                                            <div class="thumbnail" style="width: 270px;margin-left: 5px">
                                                <video width="260px" height="200px" style="margin-left:2px;">
                                                    <source src="${pageContext.request.contextPath}/${opera.fileName}" type="video/mp4">
                                                    您的浏览器不支持Video标签。
                                                </video>
                                                <div class="caption" style="width:260px">
                                                    <p style="margin: 0 0 1px;"><strong>名称：</strong>${opera.operaName}</p>
                                                    <p style="margin: 0 0 1px;"><strong>类型：</strong>${opera.typeNamem()}</p>
                                                    <p style="margin: 0 0 1px;"><strong>上传时间：</strong>${opera.publicationTime}</p>
                                                    <p style="margin: 0 0 1px;"><strong>状态：</strong>${opera.operaStatus}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </c:forEach>
                            </div>
                            <!--实现分页-->
                            <div class="wrapper">
                                <span class="btn"  style="float: right">
                                    <a id ="pre_page">上一页</a>
                                    <span>
                                        <span id="current_page" val="${currentPage}">${currentPage}</span>
                                        <span>/</span>
                                        <span id ="total_page" val="${totalPageNumber}">${totalPageNumber}</span>
                                    </span>
                                    <a id ="next_page">下一页</a>
                                </span>
                            </div>
                        </c:if>
                    </div>
                </div>


                <!--显示修改用户基本信息标签页-->
                <div id="modifyUserInfoBox" style="width: 890px;height: 400px;margin-top: 50px;margin-left: 50px">
                    <h3>个人信息修改</h3>
                    <div style="height: 400px;width: 500px;margin-left: 30px">
                        <form>
                            <div class="form-group">
                                <label for="newUserName">用户名</label>
                                <input type="text" class="form-control" id="newUserName" placeholder="UserName" value="${sessionScope.user.userName}">
                            </div>
                            <div class="form-group">
                                <label for="newEmail">邮箱</label>
                                <input type="email" class="form-control" id="newEmail" placeholder="Email"  value="${sessionScope.user.email}">
                            </div>
                            <div class="form-group">
                                <label for="newUserPassword">密码</label>
                                <input type="password" class="form-control" id="newUserPassword" placeholder="Password" value="${sessionScope.user.userPassword}">
                            </div>
                            <div class="input-group">
                                <input type="text" class="form-control" id="checkCode" placeholder="填写验证码">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button" id="sendCheckCodeBtn">发送验证码至当前邮箱</button>
                                </span>
                            </div>
                            <br>
                            <button type="submit" class="btn btn-default" id="modifyUserInfoBtn">确认修改</button>
                        </form>
                    </div>
                </div>


                <!--显示用户上传操作标签页-->
<%--                <div id="uploadBox" style="width: 890px;height: 400px;margin-top: 50px;margin-left: 50px">--%>
<%--                    <h3>上传戏曲</h3>--%>
<%--                    <div style="height: 400px;width: 500px;margin-left: 30px">--%>
<%--                        <form  id="uploadOperaForm" enctype="multipart/form-data">--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="operaName">戏曲名称</label>--%>
<%--                                <input type="text" class="form-control" id="operaName" name="operaName" placeholder="Opera Name">--%>
<%--                            </div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label>戏曲类型</label>--%>
<%--                                <select class="form-control" name="typeId">--%>
<%--                                    <option value="1">京剧</option>--%>
<%--                                    <option value="2">越剧</option>--%>
<%--                                    <option value="3">川剧</option>--%>
<%--                                    <option value="4">秦腔</option>--%>
<%--                                    <option value="5">昆曲</option>--%>
<%--                                    <option value="6">黄梅戏</option>--%>
<%--                                    <option value="7">二人转</option>--%>
<%--                                    <option value="8">皮影戏</option>--%>
<%--                                </select>--%>
<%--                            </div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label>戏曲简介</label>--%>
<%--                                <textarea class="form-control" rows="3" name="introduce"></textarea>--%>
<%--                            </div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="exampleInputFile">File input</label>--%>
<%--                                <input type="file" id="exampleInputFile" name="operaFile" multiple="multiple">--%>
<%--                                <p class="help-block">Example block-level help text here.</p>--%>
<%--                            </div>--%>
<%--                            <button type="submit" class="btn btn-default" id="uploadBtn">上传</button>--%>
<%--                        </form>--%>
<%--                    </div>--%>
<%--                </div>--%>

                <!--显示用户上传操作标签页-->
                <div id="uploadBox" style="width: 890px;height: 400px;margin-top: 50px;margin-left: 50px">
                    <h3>上传戏曲</h3>
                    <div style="height: 400px;width: 500px;margin-left: 30px">
                        <form  id="uploadOperaForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/OperaManage/operaUpload">
                            <div class="form-group">
                                <label for="operaName">戏曲名称</label>
                                <input type="text" class="form-control" id="operaName" name="operaName" placeholder="Opera Name">
                            </div>
                            <div class="form-group">
                                <label>戏曲类型</label>
                                <select class="form-control" name="typeId">
                                    <option value="1">京剧</option>
                                    <option value="2">越剧</option>
                                    <option value="3">川剧</option>
                                    <option value="4">秦腔</option>
                                    <option value="5">昆曲</option>
                                    <option value="6">黄梅戏</option>
                                    <option value="7">二人转</option>
                                    <option value="8">皮影戏</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>戏曲简介</label>
                                <textarea class="form-control" rows="3" name="introduce"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputFile">File input</label>
                                <input type="file" id="exampleInputFile" name="operaFile" multiple="multiple">
                                <p class="help-block">Example block-level help text here.</p>
                            </div>
                            <button type="submit" class="btn btn-default">上传</button>
                        </form>
                    </div>
                </div>


                <!--用户在个人中心里面播放视频-->
                <div id="watchOperaBox" style="width: 100%;height: 700px;">
                    <div style="height: 80px">
<%--                        <a href="${pageContext.request.contextPath}/UserManage/uploadedOpera?currentPage=1">--%>
<%--                            <span class="glyphicon glyphicon-menu-left" style="height: 50px;margin-top: 10px" aria-hidden="true"></span><strong>返回</strong>--%>
<%--                        </a>--%>
                            <a href="#" id="backBtn">
                                <span class="glyphicon glyphicon-menu-left" style="height: 50px;margin-top: 10px" aria-hidden="true"></span><strong>返回</strong>
                            </a>
                    </div>
                    <!--大屏放视频-->
                    <div>
                        <video width="100%" height="500px" controls>
                            <source src="${pageContext.request.contextPath}/${watchOpera.fileName}" type="video/mp4" id="videoBox">
                            您的浏览器不支持Video标签。
                        </video>
                    </div>
                    <!--显示视频信息-->
                    <div>
                        <h4><strong>${watchOpera.operaName}</strong><small>${watchOpera.introduce}</small></h4>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>状态</th>
                                    <th>类别</th>
                                    <th>发布时间</th>
                                    <th>观看次数</th>
                                    <th>收藏次数</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>${watchOpera.operaStatus}</td>
                                    <td>${watchOpera.typeNamem()}</td>
                                    <td>${watchOpera.publicationTime}</td>
                                    <td>${watchOpera.watchNumber}</td>
                                    <td>${watchOpera.collectionNumber}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>




            </div>
        </div>
        <!--主要内容结束-------------------->
    </div>
</div>

<script>


    /**
     *  分页点击上一页事件
     */
    $("#pre_page").click(function () {
        debugger;
        var currentPage = parseInt($("#current_page").attr("val"));//得到当前页
        var totalPage = parseInt($("#total_page").attr("val"));//得到总页数
        //点击前一页就是显示currentPage-1页
        if((currentPage - 1) >= 1) {//表示前一页有内容，可以显示
            var pageIndex = currentPage - 1;
            //请求后台
            window.location.href="${pageContext.request.contextPath}/UserManage/uploadedOpera?currentPage="+pageIndex;//此方法会刷新当前页
        }
    });


    /**
     *  分页点击下一页事件
     */
    $("#next_page").click(function () {
        debugger;
        var currentPage = parseInt($("#current_page").attr("val"));//得到当前页
        var totalPage = parseInt($("#total_page").attr("val"));//得到总页数
        //点击前一页就是显示currentPage-1页
        if((currentPage + 1) <= totalPage) {//表示前一页有内容，可以显示
            var pageIndex = currentPage + 1;
            //请求后台
            window.location.href="${pageContext.request.contextPath}/UserManage/uploadedOpera?currentPage="+pageIndex;//此方法会刷新当前页
        }
    });


    //=========================用户收藏的分页功能========================
    $("#pre_page_1").click(function () {
        debugger;
        var currentPage = parseInt($("#current_page_1").attr("val"));//得到当前页
        var totalPage = parseInt($("#total_page_1").attr("val"));//得到总页数
        //点击前一页就是显示currentPage-1页
        if((currentPage - 1) >= 1) {//表示前一页有内容，可以显示
            var pageIndex = currentPage - 1;
            //请求后台
            window.location.href="${pageContext.request.contextPath}/UserManage/collectionOpera?currentPage="+pageIndex;//此方法会刷新当前页
        }
    });


    /**
     *  分页点击下一页事件
     */
    $("#next_page_").click(function () {
        debugger;
        var currentPage = parseInt($("#current_page_").attr("val"));//得到当前页
        var totalPage = parseInt($("#total_page_1").attr("val"));//得到总页数
        //点击前一页就是显示currentPage-1页
        if((currentPage + 1) <= totalPage) {//表示前一页有内容，可以显示
            var pageIndex = currentPage + 1;
            //请求后台
            window.location.href="${pageContext.request.contextPath}/UserManage/collectionOpera?currentPage="+pageIndex;//此方法会刷新当前页
        }
    });


    /**
     * 用户点击发送验证码按钮
     */
    var email = '${sessionScope.user.email}';//得到当前用户邮箱
    $("#sendCheckCodeBtn").click(function () {
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/UserManage/sendCheckCode",
            dataType:'json',
            data:{"email":email},
            success:function (res) {
                //alert(res.message);
                if(res.message == "success") {
                    alert("验证码已发送")
                }else if(res.message == " failed") {
                    alert("验证码发送失败，请重试");
                }
            }
        });
    });


    /**
     * 用户点击确认修改按钮
     */
    var id = '${sessionScope.user.id}';//得到当前用户id
    $("#modifyUserInfoBtn").click(function () {
        debugger;
        //首先得到全部参数
        var newUserName = $("#newUserName").val();
        var newEmail = $("#newEmail").val();
        var newUserPassword = $("#newUserPassword").val();
        var checkCode = $("#checkCode").val();
        //判断输入是否合法
        if(newUserName == null || newUserName == "") {
            alert("用户名不能为空");
            //留在当前标签页
            $("#watchOperaBox").hide();
            $("#collectOperaBox").hide();//隐藏修改用户信息的标签页
            $("#uploadOperaBox").hide();//隐藏修改用户信息的标签页
            $("#uploadBox").hide();//隐藏修改用户信息的标签页
            $("#userInfoBox").hide();//显示显示用户个人信息标签页
            $("#modifyUserInfoBox").show();//隐藏修改用户信息的标签页
        }else if(newEmail == null || newEmail == "") {
            alert("邮箱不能为空");
            $("#watchOperaBox").hide();
            $("#collectOperaBox").hide();//隐藏修改用户信息的标签页
            $("#uploadOperaBox").hide();//隐藏修改用户信息的标签页
            $("#uploadBox").hide();//隐藏修改用户信息的标签页
            $("#userInfoBox").hide();//显示显示用户个人信息标签页
            $("#modifyUserInfoBox").show();//隐藏修改用户信息的标签页
        }else if(newUserPassword == null || newUserPassword == "") {
            alert("密码不能为空");
            $("#watchOperaBox").hide();
            $("#collectOperaBox").hide();//隐藏修改用户信息的标签页
            $("#uploadOperaBox").hide();//隐藏修改用户信息的标签页
            $("#uploadBox").hide();//隐藏修改用户信息的标签页
            $("#userInfoBox").hide();//显示显示用户个人信息标签页
            $("#modifyUserInfoBox").show();//隐藏修改用户信息的标签页
        }else if(checkCode == null || checkCode == "") {
            alert("验证码不能为空");
            $("#watchOperaBox").hide();
            $("#collectOperaBox").hide();//隐藏修改用户信息的标签页
            $("#uploadOperaBox").hide();//隐藏修改用户信息的标签页
            $("#uploadBox").hide();//隐藏修改用户信息的标签页
            $("#userInfoBox").hide();//显示显示用户个人信息标签页
            $("#modifyUserInfoBox").show();//隐藏修改用户信息的标签页
        }else {
            //发送数据给后台进行跟新操作
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/UserManage/modifyUserInfo",
                dataType:'json',
                data:{"id":id,"userName":newUserName,"userPassword":newUserPassword,"email":newEmail,"checkCode":checkCode},
                success:function (res) {
                    if(res.message == "success") {
                        alert("修改成功");
                        $("#watchOperaBox").hide();
                        $("#collectOperaBox").hide();//隐藏修改用户信息的标签页
                        $("#uploadOperaBox").hide();//隐藏修改用户信息的标签页
                        $("#uploadBox").hide();//隐藏修改用户信息的标签页
                        $("#userInfoBox").hide();//显示显示用户个人信息标签页
                        $("#modifyUserInfoBox").show();//隐藏修改用户信息的标签页
                    }else if(res.message == "failed") {
                        alert("验证码错误");
                        $("#watchOperaBox").hide();
                        $("#collectOperaBox").hide();//隐藏修改用户信息的标签页
                        $("#uploadOperaBox").hide();//隐藏修改用户信息的标签页
                        $("#uploadBox").hide();//隐藏修改用户信息的标签页
                        $("#userInfoBox").hide();//显示显示用户个人信息标签页
                        $("#modifyUserInfoBox").show();//隐藏修改用户信息的标签页
                    }
                }
            });
        }
    });

    /**
     * 用户点击返回按钮
     */
    $("#backBtn").click(function () {
        window.location.href =document.referrer;//返回上一页并刷新
    });


</script>


</body>
</html>
