<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../../includes/taglib.jsp"%>

<title>高级初始化</title>

<link rel="stylesheet" href="${ctx}/public/vendor/datatables-bootstrap/dataTables.bootstrap.css">
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
                <h5 class="page-aside-title">高级初始化</h5>
                <div class="list-group">
                    <a class="list-group-item" href="${ctx}/tables/data-tables/advanced-init/events-live" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> DOM/jQuery 事件
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/advanced-init/dt-events" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> Datatables 事件
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/advanced-init/column-render" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 列渲染
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/advanced-init/length-menu" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 自定义长度菜单
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/advanced-init/dom-multiple-elements" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 多个表格操作元素
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/advanced-init/complex-header" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 隐藏列的复杂的表头
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/advanced-init/object-dom-read" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 把HTML转化为DT内部数据对象
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/advanced-init/html5-data-options" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> HTML5 data-* 属性 - 表格选项
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/advanced-init/html5-data-attributes" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> Html5 data-* 属性 - 单元格数据
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/advanced-init/defaults" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 默认设置
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/advanced-init/row-callback" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 创建行回调
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/advanced-init/row-grouping" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 行分组
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/advanced-init/footer-callback" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 表格foot回调
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/advanced-init/dom-toolbar" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 自定义工具按钮元素
                    </a>
                    <a class="list-group-item" href="${ctx}/tables/data-tables/advanced-init/sort-direction-control" data-pjax="#DTConent">
                        <i class="icon fa-circle-o"></i> 高级排序控制
                    </a>
                </div>
            </section>
        </div>

    </div>
    <div class="page-main">
        <div class="page-header">
            <h1 class="page-title">DataTables 高级初始化</h1>
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
			<jsp:include page="events-live.jsp"></jsp:include>
			</c:if>
        </div>
    </div>
</div>

<script src="${ctx}/public/vendor/highlight/highlight.pack.min.js"></script>
<script src="${ctx}/public/themes/classic/base/js/app.js" data-name="app"></script>
<script src="${ctx}/public/js/examples/tables/data-tables/common.js" data-deps="app"></script>