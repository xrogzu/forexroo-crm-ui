<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js css-menubar" lang="zh-cn">

<head>
    <title>系统正在维护中…</title>
    <%@ include file="../../includes/head.jsp"%>
    <!-- 自定义CSS -->
    <link rel="stylesheet" href="${ctx}/public/css/errors.css">
    <!-- 图标 -->
    <link rel="stylesheet" href="${ctx}/public/fonts/7-stroke/7-stroke.css">
</head>

<body class="page-errors page-maintenance layout-full">

<div class="site-page">
    <div class="page vertical-align text-center animation-scale-up page-error">
        <div class="page-content vertical-align-middle">
            <header>
                <i class="icon pe-paint" aria-hidden="true"></i>
                <h3>正在维护中…</h3>
                <p>系统正在维护中，请稍后访问</p>
            </header>
            <footer class="page-copyright">
                <p>&copy; 2016
                    <a href="http://www.admui.com/?form=sources" target="_blank">Admui</a>
                </p>
            </footer>
        </div>
    </div>
</div>

</body>

</html>
