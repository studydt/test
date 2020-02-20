<%--
  Created by IntelliJ IDEA.
  User: 25760
  Date: 2019/10/7
  Time: 12:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${ctx}/layui/css/layui.css">
    <title>登陆页面</title>
    <style type="text/css">
        .container {
            width: 420px;
            height: 200px;
            min-height: 200px;
            max-height: 200px;
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            margin: auto;
            padding: 40px;
            z-index: 130;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 3px 18px rgba(100, 0, 0, .5);
            font-size: 16px;
        }
        .layui-input {
            border-radius: 5px;
            width: 300px;
            height: 40px;
            font-size: 15px;
        }

        .layui-form-item {
            margin-left: -20px;
        }

        .layui-btn {
            margin-left: -50px;
            border-radius: 5px;
            width: 350px;
            height: 40px;
            font-size: 15px;
        }
        a:hover {
            text-decoration: underline;
        }

        body{
            background: url("${ctx}/images/1.jpg") no-repeat;
            background-size: cover;
        }
    </style>
</head>
<body>
<form class="layui-form" action="${ctx}/login/login.do" method="post">
    <div class="container">
        <p style="color:#009688;font-size:25px;text-align:center;">欢迎登陆</p>
        <br/>
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="username" required lay-verify="required" placeholder="请输入用户名" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密 &nbsp;&nbsp;码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" required lay-verify="required" placeholder="请输入密码"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">登陆</button>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript" src="${ctx}/layui/layui.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate','jquery'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate
            , $=layui.jquery;
        form.on('submit(formDemo)', function(data){
            // layer.msg("hello");
            // console.log("hello");
            return true; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });
        $(function(){
            if(${not empty msg}){
                layer.msg("密码错误！");
                ${msg}=null;
            }
        })


    });
</script>
</body>
</html>

