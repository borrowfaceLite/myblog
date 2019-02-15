<%--
  Created by IntelliJ IDEA.
  User: borrowface
  Date: 2018/8/4
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"
isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>test</title>
    <link rel="stylesheet" href="css/mdui/css/mdui.min.css">
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <script src="js/mdui/js/mdui.min.js"></script>
<style>
        .mdui-container>div{
            padding: 10px 15px;
            border-radius: 3px;
            margin-bottom:8px;
            font-weight: 700;
        }
    </style>
</head>
<body class="mdui-theme-primary-cyan mdui-color-theme-a400">
    <div class="mdui-container">
        <i class="mdui-icon material-icons">account_circle</i>
        <c:if test="${!empty us}">
            <c:forEach items="${us}" var="u">
                <div class="mdui-color-theme-300 mdui-typo"><i class="mdui-icon material-icons">account_circle</i><strong>${u.id}</strong>用户名为：${u.name} <a href="#">sdajfsdfasdÄ</a></div>
            </c:forEach>
        </c:if>
    </div>
    <div class="mdui-fab-wrapper" id="exampleFab"  mdui-fab="{trigger: 'hover'}">
        <button class="mdui-fab mdui-ripple mdui-color-theme-accent">
            <!-- 默认显示的图标 -->
            <i class="mdui-icon material-icons">add</i>

            <!-- 在拨号菜单开始打开时，平滑切换到该图标，若不需要切换图标，则可以省略该元素 -->
            <i class="mdui-icon mdui-fab-opened material-icons">add</i>
        </button>
        <div class="mdui-fab-dial">
            <button class="mdui-fab mdui-fab-mini mdui-ripple mdui-color-pink"><i class="mdui-icon material-icons">backup</i></button>
            <button class="mdui-fab mdui-fab-mini mdui-ripple mdui-color-red"><i class="mdui-icon material-icons">bookmark</i></button>
            <button class="mdui-fab mdui-fab-mini mdui-ripple mdui-color-orange"><i class="mdui-icon material-icons">access_alarms</i></button>
            <button class="mdui-fab mdui-fab-mini mdui-ripple mdui-color-blue"><i class="mdui-icon material-icons">touch_app</i></button>
        </div>
    </div>
</body>
</html>
