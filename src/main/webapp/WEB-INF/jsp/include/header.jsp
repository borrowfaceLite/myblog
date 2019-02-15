<%@ page import="com.borrowface.blog.pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: borrowface
  Date: 2018/8/6
  Time: 18:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
isELIgnored="false" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0,user-scalable=0">
    <style>
        .theme_appbar {
            width:auto;
            transition: padding 0.3s;
            -moz-transition: padding 0.3s; /* Firefox 4 */
            -webkit-transition: padding 0.3s; /* Safari 和 Chrome */
            -o-transition: padding 0.3s; /* Opera */
        }
        .theme-post__background {
            height: 64%;
            z-index: -1;
            position: absolute;
            width: 100%;
            background-image: url("img/timg.jpg");
        }
        .category_count{
            text-align: center;flex-grow: 1;height: 25px;border-radius: 3px;background-color:#e3f2fd;
        }
        #qr-menu{
            text-align: center;
            max-width: 200px;
        }
    </style>
    <link rel="stylesheet" href="css/mdui/css/mdui.min.css">
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <script src="js/mdui/js/mdui.min.js"></script>
    <script src="js/showdown-1.8.6/dist/showdown.min.js"></script>
    <script src="js/jquery/qrcode/jquery.qrcode.min.js"></script>
    <script>
        $(function () {
            var height= $(".mdui-appbar").height();
//            var class_="content_div"
            $("body").css("padding-top",height+"px");

            var drawer=$("#left-drawer");
            drawer.on("open.mdui.drawer",function () {
               $(".theme_appbar").css("padding-left","240px");
            });
            drawer.on("close.mdui.drawer",function () {
                $(".theme_appbar").css("padding-left","0px");
            });

            $(".drawer_li").click(function () {
                $(".drawer_li").removeClass("mdui-list-item-active");
                $(this).addClass("mdui-list-item-active");
            });

            $(window).scroll(function(){
                if($(this).scrollTop()>100){
                    $(".mdui-fab").removeClass("mdui-fab-hide");
                }
                else {
                    $(".mdui-fab").addClass("mdui-fab-hide");
                }
            });

            $(".mdui-fab").click(function () {
                $("body").animate({scrollTop:0},400);
//                $(window).animate({scrollTop:'0px'},400);
                return false;
            });

            $("#login").click(function () {
                var dia= new mdui.Dialog("#loginDialog");
                dia.open();
            });

            $("#logout").click(function () {
                logout();
               var dia=new mdui.Dialog("#loginAlert");
               dia.open();
               setTimeout(reload,1000);
            });

//            checkScrollHeight();

        });

        function changePage(page) {
            $(".mdui-progress").css("display","block");
            $.get(
                page,
                function (result) {
                    change("content_div",result);
                    $(".mdui-progress").css("display","none");
//                    checkScrollHeight();
                }
            );
        }

        function change(class_,result) {
            $("."+class_.toString()).html(result);
        }
//
//        function checkScrollHeight() {
//            var scrollHeight=$(".content_div").scrollHeight;
//            var innerHeight=window.innerHeight;
//            console.log(innerHeight+" and "+scrollHeight);
//            if (scrollHeight>innerHeight){
//                $(".mdui-bottom-nav").css("display","flex");
//            }
//            if (scrollHeight<=innerHeight){
//                $(".mdui-bottom-nav").css("display","none");
//            }
//
//
//        }
        function login() {
            $(".mdui-progress").css("display","block");
            var name=$("#name").val();
            var password=$("#password").val();
            var page="/login"
            $.post(
                page,
                {"username":name,"password":password},
                function(result){
                    $("#msg").html(result);
                    if(result=="login success"){
                        $(".mdui-progress").css("display","none");
                        setTimeout(reload,1000);
                    }
                }
            );
        }

        function logout() {
            $(".mdui-progress").css("display","block");
            $.get(
                "/logout",
                function (result) {
                    $(".mdui-progress").css("display","none");
                }
            );
        }

        function reload() {
            location.reload();
        }


    </script>
</head>
