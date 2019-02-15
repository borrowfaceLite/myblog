<%--
  Created by IntelliJ IDEA.
  User: borrowface
  Date: 2018/8/7
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="mdui-container ">
    <div class="mdui-row ">
        <div class="mdui-col-sm-8 mdui-col-xs-12 mdui-col-lg-6 mdui-col-offset-sm-2 mdui-col-offset-lg-3">
            <c:if test="${!empty blogs}">
                <c:forEach items="${blogs}" var="blog" varStatus="b">
                    <div class="mdui-card " style="margin-top: 30px">
                        <div class="mdui-card-media" >
                            <a href="/blog?blogId=${blog.id}"><img class="mdui-img-fluid" src="/img/img_title/blogimg${blog.id}.jpg" ></a>
                            <div class="mdui-card-media-covered">
                                <div class="mdui-card-primary">
                                    <div class="mdui-card-primary-title mdui-typo"><a  href="/blog?blogId=${blog.id}" style="color: #bbdefb">${blog.title}</a></div>
                                    <div class="mdui-card-primary-subtitle">${blog.subtitle}</div>
                                </div>
                            </div>
                        </div>
                        <div class="mdui-card-actions">
                            <div class="mdui-chip">
                                <span class="mdui-chip-icon">C</span>
                                <span class="mdui-chip-title" onclick="changePage('/category?cid=${blog.category.id}')">${blog.category.name}</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
        </div>
    </div>
</div>
<%@include file="../bottomNav.jsp"%>
