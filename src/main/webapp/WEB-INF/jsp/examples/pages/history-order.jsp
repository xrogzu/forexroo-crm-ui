<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../includes/taglib.jsp"%>

<title>历史订单</title>

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
		                <td>交易商品</td>
		                <td>建仓方向</td>
		                <td>建仓价格</td>
		                <td>建仓时间</td>
		                <td>平仓价格</td>
		                <td>平仓时间</td>
		                <td>平仓类型</td>
		                <td>交易数量</td>
		                <td>交易编码</td>
		                <td>保证金</td>
		                <td>手续费</td>
		                <td>隔夜费</td>
		                <td>盈亏</td>
		                <td>所属经纪人</td>
		                <td>所属代理商</td>
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
					    {"data": "symbol", "defaultContent": "暂无数据"},
					    {"data": "cmd", "defaultContent": "暂无数据"},
					    {"data": "openPrice", "defaultContent": "暂无数据"},
					    {"data": "openTime", "defaultContent": "暂无数据"},
					    {"data": "closePrice", "defaultContent": "暂无数据"},
					    {"data": "closeTime", "defaultContent": "暂无数据"},
					    {"data": null, "defaultContent": "暂无数据"},
					    {"data": "volume", "defaultContent": "暂无数据"},
					    {"data": "order", "defaultContent": "暂无数据"},
					    {"data": null, "defaultContent": "暂无数据"},
					    {"data": "commission", "defaultContent": "暂无数据"},
					    {"data": "taxes", "defaultContent": "暂无数据"},
					    {"data": "profit", "defaultContent": "暂无数据"},
					    {"data": "myBrokerName", "defaultContent": "暂无数据"},
					    {"data": "myAgentName", "defaultContent": "暂无数据"}
					],
					"columnDefs": [
			            {
			                "render": function (data, type, row, meta) {
			                	switch (data) {
			                	case 0: return '<span style="color:#fe644a;">买入</span>';
			                	case 1: return '<span style="color:#00c69a;">卖出</span>';
			                	}
			                },
			                "targets": 4
			            },
			            {
			                "render": function (data, type, row, meta) {
			                	if (data) {
				                	return getTime('$Y-$m-$d $h:$i:$s', new Date(data));
			                	}
			                },
			                "targets": [6, 8]
			            },
			            {
			                "render": function (data, type, row, meta) {
			                	if (data > 0) {
			                		return '<span style="color:#fe644a;">'+data+'</span>';
			                	} else {
			                		return '<span style="color:#00c69a;">'+data+'</span>';
			                	}
			                },
			                "targets": 15
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
