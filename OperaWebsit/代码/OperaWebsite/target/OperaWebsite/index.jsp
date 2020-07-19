<%--
  Created by IntelliJ IDEA.
  User: Mechrevo
  Date: 2020/2/16
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<script>
    //转发到后台进行数据获取，最后转发到首页
    window.location.href="${pageContext.request.contextPath}/OperaManage/jumpToMainPage";
</script>
<body>
</body>
</html>
