<%--
  Created by IntelliJ IDEA.
  User: borrowface
  Date: 2018/8/6
  Time: 18:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<title>主页</title>
<%@include file="../include/header.jsp"%>
<body class="mdui-drawer-body-left  mdui-theme-accent-cyan mdui-theme-primary-cyan mdui-color-grey-50 ">
    <%@include file="../include/drawer.jsp"%>
    <%@include file="../include/appbar.jsp"%>
    <div class="mdui-container-fluid mdui-color-white">
        <img src="/img/home.jpg" class="mdui-img-rounded mdui-img-fluid mdui-center">
    </div>
    <div class="content_div ">
        <%@include file="../include/fore/homePage.jsp"%>
    </div>
    <button class="mdui-fab mdui-fab-fixed mdui-fab-hide mdui-color-cyan-100"><i class="mdui-icon material-icons">arrow_upward</i></button>
    <%@include file="../include/fore/loginDialog.jsp"%>
    <%@include file="../include/fore/loginAlert.jsp"%>
</body>
</html>
