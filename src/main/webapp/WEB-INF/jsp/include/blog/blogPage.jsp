<%--
  Created by IntelliJ IDEA.
  User: borrowface
  Date: 2018/8/7
  Time: 22:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../header.jsp"%>
<style>
    div.qr-menu1{
        position: relative;
        left: 0;
        top: 0;
    }

    div.qr-menu2{
        position: absolute;
        left: 150px;
        top: 0px;
    }
</style>
<body class="mdui-drawer-body-left  mdui-theme-accent-cyan mdui-theme-primary-cyan mdui-color-grey-50 ">
<div class="content_div">
    <div class="theme-post__background "  ></div>
    <div class="mdui-container ">
        <div class="mdui-row">
            <div class=" mdui-col-xs-12 mdui-col-lg-9 ">
                <div class="mdui-card blog_title" style="margin-top: 40px">
                    <div class="mdui-card-primary">
                        <div class="mdui-card-primary-title">${blog.title}
                            <button style="margin-right: 20px;float: right;" class="mdui-btn mdui-ripple mdui-btn-icon mdui-hidden-xs-down" mdui-dialog="{target: '#qr-menu'}">
                                <i class="mdui-icon material-icons">share</i>
                            </button>
                        </div>
                        <div class="mdui-card-primary-subtitle">${blog.uploadTime}</div>
                    </div>
                </div>
                <div class="mdui-card blog_content" style="margin-top: 20px">
                    <div class="mdui-card-content mdui-typo blogContent">
                        ${content}
                    </div>
                </div>
                <div style="height: 80px"></div>
            </div>
        </div>
    </div>
</div>
<button class="mdui-fab mdui-fab-fixed mdui-fab-hide mdui-color-cyan-100"><i class="mdui-icon material-icons">arrow_upward</i></button>
<div class="mdui-dialog" id="qr-menu">
    <div class="mdui-dialog-title">
        扫描二维码分享
    </div>
    <div class="mdui-dialog-content" id="qr" >
    </div>
</div>
<%@include file="../appbar.jsp"%>
<%@include file="../drawer.jsp"%>
<%@include file="../fore/loginAlert.jsp"%>
<%@include file="../fore/loginDialog.jsp"%>
</body>
<script>
    $(function () {
        $("#qr").qrcode({render:'canvas',text:window.location.href,width:130,height:130})
    });
</script>