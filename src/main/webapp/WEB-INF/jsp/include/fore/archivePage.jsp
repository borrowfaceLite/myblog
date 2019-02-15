<%--
  Created by IntelliJ IDEA.
  User: borrowface
  Date: 2018/8/10
  Time: 23:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"
pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="mdui-container" style="margin-top: 35px">
    <div class="mdui-typo-display-2">分类</div>
    <div class="mdui-row">
        <c:if test="${!empty cs}">
            <c:forEach items="${cs}" varStatus="count" var="c">
                <div class="mdui-col-md-3 mdui-col-sm-4" style="margin-top: 30px">
                    <div class="mdui-card">
                        <div class="mdui-card-media">
                            <a href="javascript:void(0);" onclick="changePage('/category?cid=${c.id}')"><img src="/img/img_title/archive${c.id}.jpg"></a>
                            <div class="mdui-card-media-covered">
                                <div class="mdui-card-primary">
                                    <div class="mdui-card-primary-title mdui-typo" ><a style="color: #bbdefb" href="javascript:void(0);" onclick="changePage('/category?cid=${c.id}')">${c.name}</a></div>
                                    <div class="mdui-card-primary-subtitle">${c.count}篇文章</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>
    <div style="height: 100px"></div>
</div>
