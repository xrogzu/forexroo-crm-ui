<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js css-menubar height-full" lang="zh-cn">

<head>
    <title>请重新登录</title>
    <%@ include file="includes/head.jsp"%>
    <!-- 自定义 -->
    <link rel="stylesheet" href="${ctx}/public/css/locked.css">
    <!-- 插件 -->
    <link rel="stylesheet" href="${ctx}/public/vendor/animsition/animsition.css">
    <!-- 图标 -->
    <link rel="stylesheet" href="${ctx}/public/fonts/web-icons/web-icons.css">
</head>

<body class="page-locked layout-full page-dark">

<div class=" page animation-fade vertical-align text-center animsition-fade height-full">
    <div class="page-content vertical-align-middle">
        <div class="avatar avatar-lg">
            <img src="${ctx}/public/images/avatar.svg" alt="${loginUser.loginName}">
        </div>
        <h4 class="locked-user">${loginUser.loginName}</h4>
        <form action="${ctx}/" role="form">
            <div class="input-group">
                <input type="password" class="form-control last" placeholder="请输入您的密码继续登录">
                <span class="input-group-btn">
                        <button type="submit" class="btn btn-primary">
                            <i class="icon wb-unlock" aria-hidden="true"></i>
                            <span class="sr-only">登录</span>
                    </button>
                    </span>
            </div>
        </form>
        <p>
            <a href="${ctx}/login">或者使用其他账号登录</a>
        </p>
    </div>
</div>

</body>

</html>


</html>
