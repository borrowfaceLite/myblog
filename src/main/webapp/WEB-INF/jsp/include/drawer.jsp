<%--
  Created by IntelliJ IDEA.
  User: borrowface
  Date: 2018/8/6
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="mdui-drawer mdui-color-white " id="left-drawer" >
    <div class="mdui-container-fluid">
        <ul class="mdui-list"  mdui-collapse>
            <a href="/home"  class=" mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons">home</i>
                <div class="mdui-list-item-content">首页</div>
            </a>
            <li class="archive mdui-list-item mdui-ripple" onclick="changePage('/archive')">
                <i class="mdui-list-item-icon mdui-icon material-icons">archive</i>
                <div class="mdui-list-item-content">归档</div>
            </li>
            <li class="mdui-collapse-item mdui-collapse-item-open">
                <div class="mdui-collapse-item-header mdui-list-item mdui-ripple" >
                    <i class="mdui-list-item-icon mdui-icon material-icons ">star</i>
                    <div class="mdui-list-item-content">分类</div>
                    <i class="mdui-collapse-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
                </div>
                <ul class="mdui-collapse-item-body mdui-list mdui-list-dense">
                    <c:forEach items="${cs}" var="c" varStatus="count">
                        <li onclick="changePage('/category?cid=${c.id}')" class="mdui-list-item mdui-ripple drawer_li" style="display: flex">
                            ${c.name}
                            <div  style="flex-grow: 2;background-color: #00e5ff"></div>
                            <span class="mdui-valign category_count"  ><span class="mdui-center">${c.count}</span></span>
                        </li>
                    </c:forEach>
                </ul>
            </li>
            <c:if test="${!empty user}">
                <li id="logout" class="archive mdui-list-item mdui-ripple" >
                    <i class="mdui-list-item-icon mdui-icon material-icons">account_circle</i>
                    <div class="mdui-list-item-content">登出</div>
                </li>
            </c:if>
            <c:if test="${empty user}">
                <li id="login" class="archive mdui-list-item mdui-ripple" >
                    <i class="mdui-list-item-icon mdui-icon material-icons">account_circle</i>
                    <div class="mdui-list-item-content">登录</div>
                </li>
            </c:if>
        </ul>
    </div>
</div>
