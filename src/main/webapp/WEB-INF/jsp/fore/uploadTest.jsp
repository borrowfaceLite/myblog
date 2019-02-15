<%--
  Created by IntelliJ IDEA.
  User: borrowface
  Date: 2018/9/22
  Time: 21:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" import="java.util.*"
isELIgnored="false" %>
<html>
<head>
    <%@include file="../include/header.jsp"%>
    <script>
        $(function () {
           var dia=new mdui.Dialog("#uploadDialog");
            dia.open();
        });
    </script>
</head>
<body>
    <div class="mdui-dialog"m id="uploadDialog">
        <form action="/upload" method="post" enctype="multipart/form-data">
            选择图片:<input type="file" name="image" accept="image/*" /> <br>
            <input type="submit" value="上传">
        </form>
    </div>
</body>
</html>
