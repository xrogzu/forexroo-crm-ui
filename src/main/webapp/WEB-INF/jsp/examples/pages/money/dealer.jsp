<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../includes/taglib.jsp"%>

<title>交易商出入金</title>

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
		                <td>交易商姓名</td>
		                <td>交易账号</td>
		                <td>MT4账号</td>
		                <td>所属经纪人</td>
		                <td>所属代理商</td>
		                <td>类别</td>
		                <td>金额</td>
		                <td>日期时间</td>
		                <td>状态</td>
		                <td>订单编码</td>
		                <td>标记</td>
		                <td>审核方式</td>
		                <td>审核时间</td>
		                <td>审核人</td>
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
					    "url": "${ctx}/historyOrder/all",
					    "data": function (d) {
					        d.dateStart = $('#dateStart').val();
					        d.dateEnd = $('#dateEnd').val();
					        d.searchKeyword = $('#searchKeyword').val();
					    }
					},
					"columns": [
					    {"data": "nickname", "defaultContent": "暂无数据"},
					    {"data": "phone", "defaultContent": "暂无数据"},
					    {"data": "login", "defaultContent": "暂无数据"},
					    {"data": "myBrokerName", "defaultContent": "暂无数据"},
					    {"data": "myAgentName", "defaultContent": "暂无数据"},
					    {"data": "type", "defaultContent": "暂无数据"},
					    {"data": "amount", "defaultContent": "暂无数据"},
					    {"data": "time", "defaultContent": "暂无数据"},
					    {"data": "status", "defaultContent": "暂未审核"},
					    {"data": "orderId", "defaultContent": ""},
					    {"data": "comment", "defaultContent": "暂无数据"},
					    {"data": null, "defaultContent": "暂无数据"},
					    {"data": "auditTimestamp", "defaultContent": "暂无数据"},
					    {"data": "auditUserName", "defaultContent": "暂无数据"}
					],
					"columnDefs": [
			            {
			                "render": function (data, type, row, meta) {
			                	switch (data) {
			                	case 1: return '<span style="color:#ff6350;">入金</span>';
			                	case 2: return '<span style="color:#00c69a;">出金</span>';
			                	case 3: return '<span style="color:#666666;">增加信用</span>';
			                	case 4: return '<span style="color:#666666;">减少信用</span>';
			                	case 101: return '<span style="color:#ff6350;">佣金入金</span>';
			                	case 102: return '<span style="color:#ff6350;">分成入金</span>';
			                	case 103: return '<span style="color:#ff6350;">奖励入金</span>';
			                	}
			                },
			                "targets": 5
			            },
			            {
			                "render": function (data, type, row, meta) {
			                	if (data > 0) {
			                		return '<span style="color:#fe644a;">'+data+'</span>';
			                	} else {
			                		return '<span style="color:#00c69a;">'+data+'</span>';
			                	}
			                },
			                "targets": 6
			            },
			            {
			                "render": function (data, type, row, meta) {
			                	if (data) {
				                	return getTime('$Y-$m-$d $h:$i:$s', new Date(data));
			                	}
			                },
			                "targets": 7
			            },
			            {
			                "render": function (data, type, row, meta) {
			                	switch (data) {
			                	case 0: return '<span style="color:#ff7000;">审核中</span>';
			                	case 1: return '<span style="color:#00c69a;">审核成功</span>';
			                	case 2: return '<span style="color:#9b9b9b;">审核失败</span>';
			                	}
			                },
			                "targets": 8
			            }
			        ],
			        "initComplete": function () {
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
