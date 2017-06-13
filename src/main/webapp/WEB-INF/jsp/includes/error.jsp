<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="taglib.jsp"%>

<title>出错了</title>

<link rel="stylesheet" href="${ctx}/public/css/errors.css">
<div class="page page-full vertical-align text-center animation-fade page-error">
    <div class="page-content vertical-align-middle">
        <header>
            <h1 class="animation-slide-top">出错了</h1>
            <p>当前服务不可用，可能正在维护中</p>
        </header>
        <button class="btn btn-outline btn-primary btn-round" id="closeTab" href="javascript:;">关闭当前页</button>
        <footer class="page-copyright">
            <p>&copy; 2016
                <a href="http://www.admui.com/?form=sources" target="_blank">Admui</a>
            </p>
        </footer>
    </div>
</div>

<script src="${ctx}/public/js/error.js"></script>


