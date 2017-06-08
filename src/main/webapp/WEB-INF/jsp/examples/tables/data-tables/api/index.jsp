<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../../includes/taglib.jsp"%>
<%@ include file="../../../../includes/taglib.jsp"%>

<title>API</title>

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
                <h5 class="page-aside-title">API</h5>
                <div class="list-group">
                    <a class="list-group-item" href="${ctx}/tables/data-tables/api/add-row" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 添加行
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/api/multi-filter" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 给每一列添加搜索框
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/api/multi-filter-select" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 给每一列添加下拉框搜索
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/api/highlight" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 高亮鼠标停留的行和列
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/api/row-details" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 显示行的附加信息
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/api/select-row" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 选择行(多行)
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/api/select-single-row" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 选择行并删除(单行)
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/api/form" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 表单输入框
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/api/counter-columns" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 索引列
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/api/show-hide" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 动态显示/隐藏列
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/api/api-in-init" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 在回调方法中使用API
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/api/tabs-and-scrolling" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 带垂直滚动条和Bootstrap Tabs控件
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/api/regex" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 搜索API(正则表达式)
                    </a>
                </div>
            </section>
        </div>

    </div>
    <div class="page-main">
        <div class="page-header">
            <h1 class="page-title">DataTables API</h1>
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
			<jsp:include page="add-row.jsp"></jsp:include>
			</c:if>
        </div>
    </div>
</div>

<script src="${ctx}/public/vendor/highlight/highlight.pack.min.js"></script>
<script src="${ctx}/public/themes/classic/base/js/app.js" data-name="app"></script>
<script src="${ctx}/public/js/examples/tables/data-tables/common.js" data-deps="app"></script>