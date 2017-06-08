<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../includes/taglib.jsp"%>

<title>您没有访问权限</title>

<link rel="stylesheet" href="${ctx}/public/css/errors.css"><!-- 图标 -->
<link rel="stylesheet" href="${ctx}/public/fonts/7-stroke/7-stroke.css">

<div class="page page-full vertical-align text-center animation-scale-up page-error">
    <div class="page-content vertical-align-middle">
        <header>
            <i class="icon pe-id" aria-hidden="true"></i>
            <h3>没有权限</h3>
            <p>您没有权限访问此页面，请联系管理员</p>
        </header>
        <footer class="page-copyright">
            <p>&copy; 2016
                <a href="http://www.admui.com/?form=sources" target="_blank">Admui</a>
            </p>
        </footer>
    </div>
</div>

</html>
