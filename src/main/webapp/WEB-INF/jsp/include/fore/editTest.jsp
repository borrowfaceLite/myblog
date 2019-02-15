<%--
  Created by IntelliJ IDEA.
  User: borrowface
  Date: 2018/10/20
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../header.jsp"%>
<html>
<head>
    <title>EditTestPage</title>
    <style>
        .inputtext{
            float: left;
        }
    </style>
</head>
<body>
    <div>
        <form id="blog" action="/addBlog" method="post" enctype="multipart/form-data">
            <div>标题：<input type="text" name="title"></div>
            <div>简介：<input type="text" name="subtitle"></div>
            <div>
                分类：<select id="category">
                    <option value="1">读书</option>
                    <option value="2">电影</option>
                    <option value="3">游戏</option>
                    <option value="4">瞎扯</option>
                    <option value="5">音乐</option>
                </select>
            </div>
            <div class="mdui-textfield mdui-textfield-floating-label inputtext">
                <label class="mdui-textfield-label">Message</label>
                <textarea class="mdui-textfield-input" onkeyup="complie()" id="blogContent"></textarea>
            </div>
            选择图片:<input type="file" name="image" accept="image/*" /> <br>
            <button id="add">提交</button>
            <input type="hidden" id="blogContentvalue" value="" name="blogContent">
            <input type="hidden" id="categoryvalue" value="" name="cid">
        </form>
    </div>
    <div class="result">

    </div>
</body>
<script>
    $(function () {
         $("#add").click(function () {
             var content=$(".result").html();
             var cid=$("#category option:selected").val();
             $("#categoryvalue").attr("value",cid);
             $("#blogContentvalue").attr("value",content);
             $("#blog").submit();
         });
    });

    function complie() {
        var text=$(".mdui-textfield-input").val();
        console.log(text);
        var converter=new showdown.Converter();
        var html=converter.makeHtml(text);
        console.log(html);
        $(".result").html(html);
    }
</script>
</html>
