<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../includes/taglib.jsp"%>

<title>交易商开户申请审核</title>

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

<div class="page animation-fade page-blank">
    <div class="page-content">
        <div class="panel">
		    <div class="panel-heading">
		        <h3 class="panel-title">服务器处理</h3>
		    </div>
		    <div class="panel-body">
		        <table class="table table-bordered table-hover dataTable table-striped width-full text-nowrap" id="table">
		            <thead>
		            <tr>
		                <th>姓名</th>
		                <th>职位</th>
		                <th>工作地点</th>
		                <th>年龄</th>
		                <th>入职时间</th>
		                <th>年薪</th>
		            </tr>
		            </thead>
		        </table>
		    </div>
		    <script type="text/javascript">
		    $(function () {
				$('#table').DataTable($.po('dataTable', {
				    "processing": true,
				    "serverSide": true,
				    "ajax": "${ctx}/employee/all"
				}));
			});
		    </script>
		</div>
    </div>
</div>
