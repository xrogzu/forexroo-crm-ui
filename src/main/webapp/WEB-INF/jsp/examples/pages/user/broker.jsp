<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../includes/taglib.jsp"%>

<title>经纪人</title>

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
		                <td>经纪人名称</td>
		                <td>经纪人代码</td>
		                <td>经纪人账号</td>
		                <td>申请日期</td>
		                <td>状态</td>
		                <td>所属代理商</td>
		                <td>经纪人资料</td>
		                <td>推广网址</td>
		                <td>设置</td>
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
					    "url": "${ctx}/broker/all",
					    "data": function (d) {
					        d.dateStart = $('#dateStart').val();
					        d.dateEnd = $('#dateEnd').val();
					        d.auditStatus = $('#auditStatus').val();
					        d.searchKeyword = $('#searchKeyword').val();
					    }
					},
					"columns": [
					    {"data": "nickname", "defaultContent": "暂无数据"},
					    {"data": "id", "defaultContent": "暂无数据"},
					    {"data": "phone", "defaultContent": "暂无数据"},
					    {"data": "brokerRequestTime", "defaultContent": "暂无数据"},
					    {"data": "status", "defaultContent": "暂无数据"},
					    {"data": "myAgentName", "defaultContent": "暂无数据"},
					    {"data": null, "defaultContent": "", "class": 'details-control'},
					    {"data": null, "defaultContent": "", "class": 'marketing-control'},
					    {"data": null, "defaultContent": "", "class": 'settings-control'}
					],
					"columnDefs": [
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
			                	case 0: return '<span style="color:#ff7000;">注册</span>';
			                	case 1: return '<span style="color:#00c69a;">正常</span>';
			                	case 2: return '<span style="color:#9b9b9b;">销户</span>';
			                	case 3: return '<span style="color:#ff6350;">禁用</span>';
			                	}
			                },
			                "targets": 4
			            },
			            {
			                "render": function (data, type, row, meta) {
			                	return '<button type="button" class="btn btn-sm btn-block btn-default">查看</button>';
			                },
			                "targets": 6
			            },
			            {
			                "render": function (data, type, row, meta) {
			                	return '<button type="button" class="btn btn-sm btn-block btn-default">查看</button>';
			                },
			                "targets": 7
			            },
			            {
			                "render": function (data, type, row, meta) {
			                	return '<button type="button" class="btn btn-sm btn-block btn-default">设置</button>';
			                },
			                "targets": 8
			            }
			        ],
			        "initComplete": function () {
			        	$('#table tbody').on('click', 'td.details-control', function() {
					        var tr = $(this).closest('tr');
					        var row = $('#table').DataTable().row(tr);
					        if (row.child.isShown() && tr.data('shownChildName') == 'details-control') {
					        	tr.data('shownChildName', '');
					            row.child.hide();
					            tr.removeClass('shown');
					        } else {
					        	tr.data('shownChildName', 'details-control');
					            row.child(formatDetailsControl(row.data())).show();
					            tr.addClass('shown');
					        }
					    });
			        	$('#table tbody').on('click', 'td.marketing-control', function() {
					        var tr = $(this).closest('tr');
					        var row = $('#table').DataTable().row(tr);
					        if (row.child.isShown() && tr.data('shownChildName') == 'marketing-control') {
					        	tr.data('shownChildName', '');
					            row.child.hide();
					            tr.removeClass('shown');
					        } else {
					        	tr.data('shownChildName', 'marketing-control');
					            row.child('推广网址').show();
					            tr.addClass('shown');
					        }
					    });
			        	$('#table tbody').on('click', 'td.settings-control', function() {
					        var tr = $(this).closest('tr');
					        var row = $('#table').DataTable().row(tr);
					        if (row.child.isShown() && tr.data('shownChildName') == 'settings-control') {
					        	tr.data('shownChildName', '');
					            row.child.hide();
					            tr.removeClass('shown');
					        } else {
					        	tr.data('shownChildName', 'settings-control');
					            row.child('设置').show();
					            tr.addClass('shown');
					        }
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
		    function formatDetailsControl(d) {
		    	// 照片
		    	var brokerRequestPictureHtml = '';
		    	if (d.openAccountPictureUrl) {
		    		brokerRequestPictureHtml += '<div class="col-xlg-4 col-md-6"><div class="panel panel-bordered"><div class="panel-body"><div class="col-sm-12"><img height="150" src="'+d.openAccountPictureUrl+'"/></div><div class="col-sm-12">手持身份证正面照</div></div></div></div>';
		    	}
		    	if (d.brokerRequestSignUrl) {
		    		brokerRequestPictureHtml += '<div class="col-xlg-4 col-md-6"><div class="panel panel-bordered"><div class="panel-body"><div class="col-sm-12"><img height="150" src="'+d.brokerRequestSignUrl+'"/></div><div class="col-sm-12">签名图片</div></div></div></div>';
		    	}
		    	// 协议
		    	var brokerRequestAgreementsHtml = '';
		    	var brokerRequestAgreements = eval(d.brokerRequestAgreements);
		    	if (brokerRequestAgreements) {
			    	for (var i = 0; i < brokerRequestAgreements.length; i++) {
			    		switch (brokerRequestAgreements[i]) {
						case "1": brokerRequestAgreementsHtml += '<a class="list-group-item blue-grey-500" href="javascript:;">已签订《经纪人协议》</a>'; break;
						case "2": brokerRequestAgreementsHtml += '<a class="list-group-item blue-grey-500" href="javascript:;">已签订《经纪人承诺书》</a>'; break;
						case "3": brokerRequestAgreementsHtml += '<a class="list-group-item blue-grey-500" href="javascript:;">已签订《经纪人劳务服务协议》</a>'; break;
						}
					}
		    	}
		    	// 拼接
		    	return '<div class="page-content container-fluid" style="background-color:rgb(243,247,249);">\n\
					    	<div class="row">\n\
				                <div class="col-sm-6">姓名：'+d.openAccountRealname+'</div>\n\
				                <div class="col-sm-6">身份证号：'+d.openAccountIdentityCardNumber+'</div>\n\
				            </div>\n\
					        <div class="row">'+brokerRequestPictureHtml+'</div>\n\
			                <div class="row"><div class="list-group bg-blue-grey-100 bg-inherit">'+brokerRequestAgreementsHtml+'</div></div>\n\
			            </div>';
		    }
		    </script>
		</div>
    </div>
</div>
