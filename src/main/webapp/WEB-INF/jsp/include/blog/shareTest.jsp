<%--
  Created by IntelliJ IDEA.
  User: borrowface
  Date: 2018/10/30
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <button id="qr" onclick="qrCreate()">生产二维码</button>
    <div id="qrimg"></div>
</body>
</html>
<script>
    var xmlhttp;
    function qrCreate() {
        var url="/qrtest";
        xmlhttp=new XMLHttpRequest();
        xmlhttp.onreadystatechange=checkresult;
        xmlhttp.open("GET",url,true);
        xmlhttp.send(null);
    }
    function checkresult() {
        if (xmlhttp.readyState==4&&xmlhttp.status==200){
            document.getElementById('qrimg').innerHTML=xmlhttp.responseText;
        }
    }
    
</script>
