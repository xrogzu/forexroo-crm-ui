<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="taglib.jsp"%>

<title>出错了</title>

<link rel="stylesheet" href="${ctx}/public/css/errors.css">
<div class="page page-full vertical-align text-center animation-fade page-error">
    <div class="page-content vertical-align-middle">
        <header>
            <h1 class="animation-slide-top">${pageContext.response.status}</h1>
            <c:if test="${pageContext.response.status == 400}">
			<p>由于语法格式有误，服务器无法理解此请求</p>
			</c:if>
			<c:if test="${pageContext.response.status == 403}">
			<p>服务器上文件或目录拒绝访问</p>
			</c:if>
			<c:if test="${pageContext.response.status == 404}">
			<p>找不到您访问的页面</p>
			</c:if>
			<c:if test="${pageContext.response.status == 500}">
			<p>服务器内部错误</p>
			</c:if>
			<c:if test="${pageContext.response.status == 503}">
			<p>当前服务不可用，可能正在维护中</p>
			</c:if>
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


