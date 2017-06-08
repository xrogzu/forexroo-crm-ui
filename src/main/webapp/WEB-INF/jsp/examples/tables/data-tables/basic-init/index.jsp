<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../../includes/taglib.jsp"%>

<title>基本初始化</title>

<link rel="stylesheet" href="${ctx}/public/vendor/datatables-bootstrap/dataTables.bootstrap.css">
<link rel="stylesheet" href="${ctx}/public/vendor/datatables-responsive/dataTables.responsive.css">
<link rel="stylesheet" href="${ctx}/public/vendor/highlight/default.css">
<link rel="stylesheet" href="${ctx}/public/vendor/highlight/github-gist.css">
<link rel="stylesheet" href="${ctx}/public/vendor/highlight/highlight.css">
<link rel="stylesheet" href="${ctx}/public/css/examples/tables/data-tables/examples.css">

<div class="page page-full animation-fade page-data-tables">
    <div class="page-aside">
        <div class="page-aside-switch">
            <i class="icon wb-chevron-left" aria-hidden="true"></i>
            <i class="icon wb-chevron-right" aria-hidden="true"></i>
        </div>
        <div class="page-aside-inner height-full" data-plugin="slimScroll">
            <section class="page-aside-section">
                <h5 class="page-aside-title">基本初始化</h5>
                <div class="list-group">
                    <a class="list-group-item" href="${ctx}/tables/data-tables/basic-init/zero-configuration" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 零配置
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/basic-init/filter-only" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 功能启用/禁用
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/basic-init/table-sorting" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 默认排序
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/basic-init/multi-col-sort" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 多列排序
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/basic-init/multiple-tables" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 多个表格
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/basic-init/hidden-columns" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 隐藏列
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/basic-init/complex-header" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 复杂表头
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/basic-init/dom" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> DOM定位
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/basic-init/flexible-width" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 表格自适应
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/basic-init/state-save" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 保存状态
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/basic-init/alt-pagination" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 不同的分页样式
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/basic-init/scroll-y" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 垂直滚动条
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/basic-init/scroll-y-dynamic" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 垂直滚动条,动态高度
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/basic-init/scroll-x" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 水平滚动条
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/basic-init/scroll-xy" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 水平和垂直滚动条
                    </a>
                </div>
            </section>
        </div>

    </div>
    <div class="page-main">
        <div class="page-header">
            <h1 class="page-title">DataTables 基本初始化</h1>
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
			<jsp:include page="zero-configuration.jsp"></jsp:include>
			</c:if>
        </div>
    </div>
</div>

<script src="${ctx}/public/vendor/datatables/jquery.dataTables.min.js" data-name="dataTables"></script>
<script src="${ctx}/public/vendor/datatables-bootstrap/dataTables.bootstrap.min.js" data-deps="dataTables"></script>
<script src="${ctx}/public/vendor/datatables-responsive/dataTables.responsive.min.js" data-deps="dataTables"></script>
<script src="${ctx}/public/vendor/highlight/highlight.pack.min.js"></script>
<script src="${ctx}/public/themes/classic/base/js/app.js" data-name="app"></script>
<script src="${ctx}/public/js/examples/tables/data-tables/common.js" data-deps="app"></script>