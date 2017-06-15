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
<link rel="stylesheet" href="${ctx}/public/vendor/bootstrap-datepicker/bootstrap-datepicker.css">
<link rel="stylesheet" href="${ctx}/public/vendor/bootstrap-select/bootstrap-select.css">

<script src="${ctx}/public/vendor/datatables/jquery.dataTables.min.js" data-name="dataTables"></script>
<script src="${ctx}/public/vendor/datatables-bootstrap/dataTables.bootstrap.min.js" data-deps="dataTables"></script>
<script src="${ctx}/public/vendor/datatables-responsive/dataTables.responsive.min.js" data-deps="dataTables"></script>
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
	                    	<select class="form-control" data-plugin="selectpicker" id="auditStatus">
                                <option value="0">审核状态</option>
                                <option value="1">未审核</option>
                                <option value="2">已审核</option>
                                <option value="3">已拒绝</option>
                            </select>
	                    </div>
	                    <div class="form-group">
	                        <button type="button" class="btn btn-primary btn-outline" onclick="window.location.reload();">重置</button>
	                    </div>
                        <div class="form-group">
                            <div class="input-group">
                                <input type="text" class="form-control" id="searchKeyword" placeholder="请输入关键词...">
                                <span class="input-group-btn">
                  					<button type="button" class="btn btn-primary"><i class="icon wb-search" aria-hidden="true"></i></button>
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
		                <td>姓名</td>
		                <td>手机号</td>
		                <td>MT4账号</td>
		                <td>审核状态</td>
		                <td>审核时间</td>
		                <td>审核人</td>
		                <td>所属经纪人</td>
		                <td>所属代理商</td>
		                <td>开户资料</td>
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
					    "url": "${ctx}/dealer/all",
					    "data": function (d) {
					        d.dateStart = $('#dateStart').val();
					        d.dateEnd = $('#dateEnd').val();
					        d.auditStatus = $('#auditStatus').val();
					        d.searchKeyword = $('#searchKeyword').val();
					    }
					},
					"columns": [
					    {"data": "nickname", "defaultContent": "暂无数据"},
					    {"data": "phone", "defaultContent": "暂无数据"},
					    {"data": "mt4RealAccount", "defaultContent": "暂无数据"},
					    {"data": "openAccountStatus", "defaultContent": "暂无数据"},
					    {"data": "openAccountAuditTimestamp", "defaultContent": "暂未审核"},
					    {"data": "openAccountAuditUserId", "defaultContent": "暂无数据"},
					    {"data": "myBroker", "defaultContent": "暂无数据"},
					    {"data": "myAgent", "defaultContent": "暂无数据"},
					    {"data": null, "defaultContent": "", "class": 'details-control'}
					],
					"columnDefs": [
			            {
			                "render": function (data, type, row, meta) {
			                	switch (data) {
			                	case 0: return '未开户';
			                	case 1: return '开户中';
			                	case 2: return '<span style="color:#ff7000;">审核中</span>';
			                	case 3: return '<span style="color:#00c69a;">审核成功</span>';
			                	case 4: return '<span style="color:#9b9b9b;">审核失败</span>';
			                	}
			                },
			                "targets": 3
			            },
			            {
			                "render": function (data, type, row, meta) {
			                	if (data) {
				                	return getTime('$Y-$m-$d', new Date(data));
			                	}
			                },
			                "targets": 4
			            },
			            {
			                "render": function (data, type, row, meta) {
			                	return '<button type="button" class="btn btn-sm btn-block btn-default">查看</button>';
			                },
			                "targets": 8
			            },
			            {
			                "render": function (data, type, row, meta) {
			                	if (row.openAccountStatus == '2') {
				                	return '<div class="dropdown">\n\
				                                <button type="button" class="btn btn-sm btn-default dropdown-toggle" id="exampleLeftDropdownSubMenu" aria-expanded="true" data-toggle="dropdown">\n\
				                                审核 <span class="caret"></span>\n\
				                            	</button>\n\
				                            	<ul class="dropdown-menu dropdown-menu-right" aria-labelledby="exampleLeftDropdownSubMenu" role="menu">\n\
		                                            <li role="presentation" class="audit-success-menu">\n\
		                                                <a href="javascript:;" role="menuitem" tabindex="-1">通过</a>\n\
		                                            </li>\n\
		                                            <li class="divider" role="presentation"></li>\n\
		                                            <li class="dropdown-submenu dropdown-menu-left">\n\
		                                                <a href="javascript:;" tabindex="-1">拒绝</a>\n\
		                                                <ul class="dropdown-menu" role="menu">\n\
		                                                    <li role="presentation" class="audit-fail-menu" data-reason="1">\n\
		                                                        <a href="javascript:;" role="menuitem" tabindex="-1">\n\
		                                                            手持身份证照不清晰\n\
		                                                        </a>\n\
		                                                    </li>\n\
		                                                    <li role="presentation" class="audit-fail-menu" data-reason="2">\n\
		                                                        <a href="javascript:;" role="menuitem" tabindex="-1">\n\
		                                                            签名不清晰\n\
		                                                        </a>\n\
		                                                    </li>\n\
		                                                </ul>\n\
		                                            </li>\n\
	                                            </ul>\n\
				                            </div>';
			                	} else {
			                		return '';
			                	}
			                },
			                "targets": 9
			            }
			        ],
			        "initComplete": function () {
			        	$('#table tbody').on('click', 'td.details-control', function() {
					        var tr = $(this).closest('tr');
					        var row = $('#table').DataTable().row(tr);
					        if (row.child.isShown()) {
					            row.child.hide();
					            tr.removeClass('shown');
					        } else {
					            row.child(format(row.data())).show();
					            tr.addClass('shown');
					        }
					    });
			        	$('#table li.audit-success-menu').click(function() {
					        var tr = $(this).closest('tr');
					        var rowData = $('#table').DataTable().row(tr).data();
					        $.get('${ctx}/dealer/auditSuccess', { "id": rowData.id }, function(data) {
								if (data.code != 0) {
									alert('Error: ' + data.message);
									return;
								}
						        rowData.mt4RealAccount = data.mt4RealAccount;
						        rowData.openAccountStatus = data.openAccountStatus;
						        rowData.openAccountAuditTimestamp = data.openAccountAuditTimestamp;
						        row.data(rowData);
							});
					    });
			        	$('#table li.audit-fail-menu').click(function() {
			        		var li = $(this);
			        		var reason = li.data('reason');
					        var tr = li.closest('tr');
					        var rowData = $('#table').DataTable().row(tr).data();
					        $.get('${ctx}/dealer/auditFail', { "id": rowData.id, "reason": reason }, function(data) {
								if (data.code != 0) {
									alert('Error: ' + data.message);
									return;
								}
						        rowData.openAccountStatus = data.openAccountStatus;
						        rowData.openAccountAuditTimestamp = data.openAccountAuditTimestamp;
						        row.data(rowData);
							});
					    });
			        }
				}));
			});
		    function format(d) {
		    	// 照片
		    	var openAccountPictureHtml = '';
		    	if (d.openAccountPictureUrl) {
		    		openAccountPictureHtml += '<div class="col-xlg-4 col-md-6"><div class="panel panel-bordered"><div class="panel-body"><div class="col-sm-12"><img height="150" src="'+d.openAccountPictureUrl+'"/></div><div class="col-sm-12">手持身份证正面照</div></div></div></div>';
		    	}
		    	if (d.openAccountSignUrl) {
		    		openAccountPictureHtml += '<div class="col-xlg-4 col-md-6"><div class="panel panel-bordered"><div class="panel-body"><div class="col-sm-12"><img height="150" src="'+d.openAccountSignUrl+'"/></div><div class="col-sm-12">签名图片</div></div></div></div>';
		    	}
		    	// 协议
		    	var openAccountAgreementsHtml = '';
		    	var openAccountAgreements = eval(d.openAccountAgreements);
		    	if (openAccountAgreements) {
			    	for (var i = 0; i < openAccountAgreements.length; i++) {
			    		switch (openAccountAgreements[i]) {
						case "1": openAccountAgreementsHtml += '<a class="list-group-item blue-grey-500" href="javascript:;">已签订《交易商告知书》</a>'; break;
						case "2": openAccountAgreementsHtml += '<a class="list-group-item blue-grey-500" href="javascript:;">已签订《交易商协议书》</a>'; break;
						case "3": openAccountAgreementsHtml += '<a class="list-group-item blue-grey-500" href="javascript:;">已签订《入市交易协议书》</a>'; break;
						case "4": openAccountAgreementsHtml += '<a class="list-group-item blue-grey-500" href="javascript:;">已签订《本人是该账户的最终且唯一受益拥有人》</a>'; break;
						}
					}
		    	}
		    	// 拼接
		    	return '<div class="page-content container-fluid" style="background-color:rgb(243,247,249);">\n\
					    	<div class="row">\n\
				                <div class="col-sm-6">姓名：'+d.openAccountRealname+'</div>\n\
				                <div class="col-sm-6">身份证号：'+d.openAccountIdentityCardNumber+'</div>\n\
				            </div>\n\
					        <div class="row">'+openAccountPictureHtml+'</div>\n\
			                <div class="row"><div class="list-group bg-blue-grey-100 bg-inherit">'+openAccountAgreementsHtml+'</div></div>\n\
			            </div>';
		    }
		    </script>
		</div>
    </div>
</div>
