<%--
  Created by IntelliJ IDEA.
  User: borrowface
  Date: 2018/8/12
  Time: 21:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="mdui-bottom-nav  mdui-color-transparent" style="margin-top: 50px;height: 80px">
    <c:if test="${!empty hasPrevious}">
        <a href="/home?start=${previous}" class="mdui-ripple mdui-ripple-white ">
            <label style="font-weight: bold">Previous</label>
            <i class="mdui-icon material-icons">arrow_back</i>
        </a>
    </c:if>
    <c:if test="${!empty hasNext}">
        <a href="/home?start=${start}" class="mdui-ripple mdui-ripple-white mdui-bottom-nav-active">
            <label style="font-weight: bold">Next</label>
            <i class="mdui-icon material-icons">arrow_forward</i>
        </a>
    </c:if>
    <c:if test="${empty hasPrevious && empty hasNext}">
        <a href="javascript:;" class="mdui-ripple mdui-bottom-nav-active">
            <label style="font-weight: bold">啥都没咯</label>
        </a>
    </c:if>
</div>

