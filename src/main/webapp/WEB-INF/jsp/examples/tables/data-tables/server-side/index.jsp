<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../../includes/taglib.jsp"%>

<title>服务器模式</title>

<link rel="stylesheet" href="${ctx}/public/vendor/datatables-bootstrap/dataTables.bootstrap.css">
<link rel="stylesheet" href="${ctx}/public/vendor/datatables-fixedheader/dataTables.fixedHeader.css">
<link rel="stylesheet" href="${ctx}/public/vendor/datatables-responsive/dataTables.responsive.css">
<link rel="stylesheet" href="${ctx}/public/vendor/highlight/default.css">
<link rel="stylesheet" href="${ctx}/public/vendor/highlight/github-gist.css">
<link rel="stylesheet" href="${ctx}/public/vendor/highlight/highlight.css">
<link rel="stylesheet" href="${ctx}/public/css/examples/tables/data-tables/examples.css">

<script src="${ctx}/public/vendor/datatables/jquery.dataTables.min.js" data-name="dataTables"></script>
<script src="${ctx}/public/vendor/datatables-bootstrap/dataTables.bootstrap.min.js" data-deps="dataTables"></script>
<script src="${ctx}/public/vendor/datatables-responsive/dataTables.responsive.min.js" data-deps="dataTables"></script>

<div class="page page-full animation-fade page-data-tables">
    <div class="page-aside">
        <div class="page-aside-switch">
            <i class="icon wb-chevron-left" aria-hidden="true"></i>
            <i class="icon wb-chevron-right" aria-hidden="true"></i>
        </div>
        <div class="page-aside-inner height-full" data-plugin="slimScroll">
            <section class="page-aside-section">
                <h5 class="page-aside-title">服务器模式</h5>
                <div class="list-group">
                    <a class="list-group-item" href="${ctx}/tables/data-tables/server-side/simple" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 服务器处理
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/server-side/custom-vars" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 自定义http变量
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/server-side/post" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 以post方式传输数据
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/server-side/ids" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 自动给行添加id属性
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/server-side/object-data" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 对象数据源
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/server-side/row-details" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 行详情
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/server-side/select-rows" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 行选中
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/server-side/jsonp" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 跨域JSONP数据源
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/server-side/defer-loading" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 延迟加载数据
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/server-side/pipeline" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 分页加载数据，减少ajax请求
                    </a>
                </div>
            </section>
        </div>

    </div>
    <div class="page-main">
        <div class="page-header">
            <h1 class="page-title">DataTables 服务器模式</h1>
            <div class="page-header-actions">
                <a class="btn btn-inverse btn-round" href="https://datatables.net/" target="_blank">
                    <i class="icon wb-link" aria-hidden="true"></i> <span class="hidden-xs">官网</span></a>
                <a class="btn btn-inverse btn-round" href="http://datatables.club/" target="_blank">
                    <i class="icon fa-language" aria-hidden="true"></i> <span class="hidden-xs">中文网</span></a>
            </div>
        </div>
        <div class="page-content" id="DTConent">
            <c:if test="${not empty includeInner}">
			<jsp:include page="${includeInner }"></jsp:include>
			</c:if>
			<c:if test="${empty includeInner}">
			<jsp:include page="simple.jsp"></jsp:include>
			</c:if>
        </div>
    </div>
</div>

<script src="${ctx}/public/vendor/highlight/highlight.pack.min.js"></script>
<script src="${ctx}/public/themes/classic/base/js/app.js" data-name="app"></script>
<script src="${ctx}/public/js/examples/tables/data-tables/common.js" data-deps="app"></script>