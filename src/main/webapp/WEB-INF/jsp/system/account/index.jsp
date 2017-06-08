<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../includes/taglib.jsp"%>

<title>账户信息</title>

<link rel="stylesheet" href="${ctx}/public/css/system/account.css">
<link rel="stylesheet" href="${ctx}/public/vendor/jquery-strength/jquery-strength.css">
<link rel="stylesheet" href="${ctx}/public/vendor/alertify-js/alertify.css">
<div class="page animation-fade page-account">
    <div class="page-content">
        <div class="row">
            <div class="col-md-3">
                <div class="widget widget-shadow text-center">
                    <div class="widget-header">
                        <div class="widget-header-content">
                            <a class="avatar avatar-lg" href="javascript:;">
                                <img src="${ctx}/public/images/avatar.svg" alt="${loginUser.loginName}">
                            </a>
                            <h4 class="account-user">${loginUser.loginName}</h4>
                            <p>上次登录：<fmt:formatDate type="both" value="${loginUser.lastLoginTime}" /></p>
                        </div>
                    </div>
                    <div class="widget-footer">
                        <div class="row no-space">
                            <div class="col-xs-4">
                                <strong class="account-stat-count">${loginUser.loginCount}</strong> <span>登录</span>
                            </div>
                            <div class="col-xs-4">
                                <strong class="account-stat-count msg-number"></strong> <span>消息</span>
                            </div>
                            <div class="col-xs-4">
                                <strong class="account-stat-count log-number"></strong> <span>日志</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <div class="panel">
                    <div class="panel-body nav-tabs-animate">
                        <ul class="nav nav-tabs nav-tabs-line tabList" role="tablist">
                            <li class="news <c:if test="${fullCurl == '/system/account' || fullCurl == '/system/account/message'}">active</c:if>" role="presentation">
                                <a href="${ctx}/system/account/message?from=account" data-pjax="#accountContent" aria-expanded="true">
                                    <i class="icon fa-comment-o" aria-hidden="true"></i> 消息
                                    <span class="badge badge-danger"></span></a>
                            </li>
                            <li class="news <c:if test="${fullCurl == '/system/account/log' || fullCurl == '/account/log'}">active</c:if>" role="presentation" id="accountLog">
                                <a href="${ctx}/system/account/log?from=account" data-pjax="#accountContent" aria-expanded="false">
                                    <i class="icon fa-file-text-o" aria-hidden="true"></i> 日志
                                </a>
                            </li>
                            <li class="news <c:if test="${fullCurl == '/system/account/password' || fullCurl == '/account/password'}">active</c:if>" role="presentation">
                                <a href="${ctx}/system/account/password?from=account" data-pjax="#accountContent" aria-expanded="false">
                                    <i class="icon fa-key" aria-hidden="true"></i> 密码
                                </a>
                            </li>
                            <li class="news <c:if test="${fullCurl == '/system/account/display'}">active</c:if>" role="presentation">
                                <a href="${ctx}/system/account/display?from=account" data-pjax="#accountContent" aria-expanded="false">
                                    <i class="icon fa-magic" aria-hidden="true"></i> 显示
                                </a>
                            </li>
                        </ul>
                        <div class="tab-content margin-top-15">
                            <div class="animation-slide-left tab-message active" id="accountContent">
                                <c:if test="${not empty includeInner}">
								<jsp:include page="${includeInner }"></jsp:include>
								</c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${ctx}/public/vendor/jquery-strength/jquery-strength.min.js"></script>
<script src="${ctx}/public/vendor/alertify-js/alertify.min.js"></script>
<script src="${ctx}/public/js/system/account/account.js"></script>
