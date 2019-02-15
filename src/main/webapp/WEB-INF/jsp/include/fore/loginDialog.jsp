<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<div class="mdui-dialog" id="loginDialog" style="max-width: 448px;" >
    <div class="mdui-dialog-title mdui-color-cyan-100" style="height: 200px;">登录</div>
    <div class="mdui-dialog-content">
        <div class="mdui-textfield mdui-textfield-floating-label">
            <label class="mdui-textfield-label">用户名</label>
            <input id="name" class="mdui-textfield-input" required="required"/>
            <div class="mdui-textfield-error">账号不能为空</div>
        </div>
        <div class="mdui-textfield mdui-textfield-floating-label">
            <label class="mdui-textfield-label">密码</label>
            <input id="password" class="mdui-textfield-input" type="password" required="required"/>
            <div class="mdui-textfield-error">密码不能为空</div>
        </div>
        <button onclick="login()" type="submit" class="mdui-btn mdui-btn-raised mdui-color-theme-accent mdui-float-right" style="margin-top: 20px">登录</button>
        <div id="msg" style="color: red;"></div>
    </div>
    <div style="height: 100px"></div>
</div>