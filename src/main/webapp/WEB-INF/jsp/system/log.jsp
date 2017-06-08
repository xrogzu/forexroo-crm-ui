<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglib.jsp"%>

<title>日志信息</title>

<link rel="stylesheet" href="${ctx}/public/vendor/bootstrap-daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="${ctx}/public/vendor/select2/select2.css">

<script src="${ctx}/public/vendor/bootstrap-daterangepicker/moment.min.js" data-name="moment"></script>
<script src="${ctx}/public/vendor/bootstrap-daterangepicker/daterangepicker.min.js" data-deps="moment"></script>
<script src="${ctx}/public/vendor/select2/select2.min.js" data-name="select2"></script>
<script src="${ctx}/public/vendor/select2/i18n/zh-CN.min.js" data-deps="select2"></script>

<div class="page page-full animation-fade page-logs">
    <div class="page-header">
        <h1 class="page-title">系统日志</h1>
        <div class="page-header-actions">
            <button type="button" class="btn btn-icon btn-info collapsed" data-toggle="collapse" data-target="#collapseFilter" aria-expanded="false" aria-controls="collapseFilter">
                <i class="icon fa-filter"></i>
            </button>
        </div>
    </div>
    <div class="page-content">
        <div class="collapse" id="collapseFilter" aria-expanded="true">
            <div class="panel">
                <div class="panel-body">
                    <form class="form-inline" id="logForm">
                        <div class="form-group">
                            <div class="input-daterange input-group">
                                <span class="input-group-addon"><i class="icon wb-calendar" aria-hidden="true"></i></span>
                                <input type="text" class="form-control" id="filter-date" placeholder="起至日期">
                                <input type="hidden" name="startDate">
                                <input type="hidden" name="endDate">
                                <a class="input-group-addon padding-horizontal-10" role="button">
                                    <i class="icon wb-close date-close"></i></a>
                            </div>
                        </div>
                        <div class="form-group">
                            <select class="form-control" name="url" data-plugin="select2">
                                <option value="">日志名称</option>
                                <c:forEach items="${configList}" var="config" varStatus="status">
                                <option value="${config.url}">${config.type}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <select class="form-control" name="user.userId" data-plugin="select2">
                                <option value="">所有用户</option>
                                <c:forEach items="${userList}" var="user" varStatus="status">
                                <option value="${user.userId}">${user.loginName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-success"><i class="icon fa-search"></i> 查找</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
        <div class="panel">
            <header class="panel-heading">
                <h3 class="panel-title">日志信息</h3>
            </header>
            <div class="panel-body">
                <jsp:include page="log-table.jsp"></jsp:include>
            </div>
        </div>
    </div>
</div>
