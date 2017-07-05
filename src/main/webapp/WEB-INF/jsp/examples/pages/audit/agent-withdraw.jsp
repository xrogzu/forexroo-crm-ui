<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../includes/taglib.jsp"%>

<title>代理商出金审核</title>

<link rel="stylesheet" href="${ctx}/public/vendor/highlight/default.css">
<link rel="stylesheet" href="${ctx}/public/vendor/highlight/github-gist.css">
<link rel="stylesheet" href="${ctx}/public/vendor/highlight/highlight.css">
<link rel="stylesheet" href="${ctx}/public/vendor/bootstrap-datepicker/bootstrap-datepicker.css">
<link rel="stylesheet" href="${ctx}/public/vendor/bootstrap-select/bootstrap-select.css">

<script src="${ctx}/public/vendor/bootstrap-datepicker/bootstrap-datepicker.min.js" data-name="datepicker"></script>
<script src="${ctx}/public/vendor/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js" data-deps="datepicker"></script>
<script src="${ctx}/public/vendor/bootstrap-select/bootstrap-select.min.js"></script>
<script src="${ctx}/public/vendor/timeformatter/timeformatter.js"></script>

<div class="page animation-fade page-blank">
    <div class="page-content">
        <div class="panel">
		    <div class="panel-heading">
		        <h3 class="panel-title">
			    	<form class="form-inline">
	                    <div class="form-group">
	                        <div class="input-daterange" data-plugin="datepicker" data-language="zh-CN">
	                            <div class="input-group">
	                                <span class="input-group-addon"><i class="icon wb-calendar" aria-hidden="true"></i></span>
	                                <input type="text" class="form-control" id="dateStart">
	                            </div>
	                            <div class="input-group">
	                                <span class="input-group-addon"> 至 </span>
	                                <input type="text" class="form-control" id="dateEnd">
	                            </div>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <button id="resetButton" type="button" class="btn btn-primary btn-outline">重置</button>
	                    </div>
                        <div class="form-group">
                            <div class="input-group">
                                <input type="text" class="form-control" id="searchKeyword" placeholder="请输入关键词...">
                                <span class="input-group-btn">
                  					<button id="searchButton" type="button" class="btn btn-primary"><i class="icon wb-search" aria-hidden="true"></i></button>
                				</span>
                            </div>
                        </div>
	                </form>
		        </h3>
		    </div>
		    <div class="panel-body">
		        <table class="table table-bordered table-hover dataTable table-striped width-full text-nowrap text-center" id="table">
		            <thead>
		            <tr>
		                <td>代理商名称</td>
		                <td>代理商代码</td>
		                <td>类别</td>
		                <td>日期</td>
		                <td>金额</td>
		                <td>审核状态</td>
		                <td>审核时间</td>
		                <td>审核人</td>
		                <td>操作</td>
		            </tr>
		            </thead>
		        </table>
		    </div>
		    <script type="text/javascript">
		    $(function () {
				$('#table').DataTable($.po('dataTable', {
				    "dom": 'rtip',
				    "ordering": false,
				    "processing": true,
				    "serverSide": true,
					"ajax": {
					    "url": "${ctx}/agentWithdraw/auditList",
					    "data": function (d) {
					        d.dateStart = $('#dateStart').val();
					        d.dateEnd = $('#dateEnd').val();
					        d.searchKeyword = $('#searchKeyword').val();
					    }
					},
					"columns": [
					    {"data": "agentName", "defaultContent": "暂无数据"},
					    {"data": "id", "defaultContent": "暂无数据"},
					    {"data": "type", "defaultContent": "暂无数据"},
					    {"data": "time", "defaultContent": "暂无数据"},
					    {"data": "amount", "defaultContent": "暂无数据"},
					    {"data": "status", "defaultContent": "暂未审核"},
					    {"data": "auditTimestamp", "defaultContent": "暂无数据"},
					    {"data": "auditUserName", "defaultContent": "暂无数据"},
					    {"data": null, "defaultContent": ""}
					],
					"columnDefs": [
			            {
			                "render": function (data, type, row, meta) {
			                	switch (data) {
			                	case 1: return '入金';
			                	case 2: return '出金';
			                	case 101: return '佣金入金';
			                	}
			                },
			                "targets": 2
			            },
			            {
			                "render": function (data, type, row, meta) {
			                	if (data) {
				                	return getTime('$Y-$m-$d', new Date(data));
			                	}
			                },
			                "targets": 3
			            },
			            {
			                "render": function (data, type, row, meta) {
			                	switch (data) {
			                	case 0: return '<span style="color:#ff7000;">审核中</span>';
			                	case 1: return '<span style="color:#00c69a;">审核成功</span>';
			                	case 2: return '<span style="color:#9b9b9b;">审核失败</span>';
			                	}
			                },
			                "targets": 5
			            }
			        ],
			        "initComplete": function () {
			        	$('#table li.audit-success-menu').click(function() {
					        var tr = $(this).closest('tr');
					        var row = $('#table').DataTable().row(tr);
					        var rowData = row.data();
					        $.get('${ctx}/agentWithdraw/auditSuccess', { "id": rowData.id }, function(data) {
								if (data.code != 0) {
									alert('Error: ' + data.message);
									return;
								}
						        rowData.status = data.status;
						        rowData.auditTimestamp = data.auditTimestamp;
						        rowData.auditUserName = data.auditUserName;
						        row.data(rowData);
							});
					    });
			        	$('#table li.audit-fail-menu').click(function() {
					        var tr = $(this).closest('tr');
					        var row = $('#table').DataTable().row(tr);
					        var rowData = row.data();
					        $.get('${ctx}/agentWithdraw/auditFail', { "id": rowData.id }, function(data) {
								if (data.code != 0) {
									alert('Error: ' + data.message);
									return;
								}
						        rowData.status = data.status;
						        rowData.auditTimestamp = data.auditTimestamp;
						        rowData.auditUserName = data.auditUserName;
						        row.data(rowData);
							});
					    });
			        	$('#resetButton').click(function() {
			        		window.location.reload();
					    });
			        	$('#searchButton').click(function() {
					        var table = $('#table').DataTable();
					        table.ajax.reload(null, false);
					    });
			        }
				}));
			});
		    </script>
		</div>
    </div>
</div>
