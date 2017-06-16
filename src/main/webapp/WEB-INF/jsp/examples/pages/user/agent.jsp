<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../includes/taglib.jsp"%>

<title>代理商</title>

<link rel="stylesheet" href="${ctx}/public/vendor/highlight/default.css">
<link rel="stylesheet" href="${ctx}/public/vendor/highlight/github-gist.css">
<link rel="stylesheet" href="${ctx}/public/vendor/highlight/highlight.css">
<link rel="stylesheet" href="${ctx}/public/vendor/bootstrap-datepicker/bootstrap-datepicker.css">
<link rel="stylesheet" href="${ctx}/public/vendor/bootstrap-select/bootstrap-select.css">

<script src="${ctx}/public/vendor/bootstrap-datepicker/bootstrap-datepicker.min.js" data-name="datepicker"></script>
<script src="${ctx}/public/vendor/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js" data-deps="datepicker"></script>
<script src="${ctx}/public/vendor/bootstrap-select/bootstrap-select.min.js"></script>
<script src="${ctx}/public/vendor/timeformatter/timeformatter.js"></script>
<script src="${ctx}/public/vendor/bootbox/bootbox.min.js"></script>

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
	                    <div class="form-group">
	                        <button id="createAgentButton" type="button" class="btn btn-primary btn-outline">创建代理商</button>
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
		                <td>状态</td>
		                <td>银行资料</td>
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
					    "url": "${ctx}/agent/all",
					    "data": function (d) {
					        d.dateStart = $('#dateStart').val();
					        d.dateEnd = $('#dateEnd').val();
					        d.auditStatus = $('#auditStatus').val();
					        d.searchKeyword = $('#searchKeyword').val();
					    }
					},
					"columns": [
					    {"data": "name", "defaultContent": "暂无数据"},
					    {"data": "id", "defaultContent": "暂无数据"},
					    {"data": "status", "defaultContent": "暂无数据"},
					    {"data": null, "defaultContent": "", "class": 'details-control'},
					    {"data": null, "defaultContent": "", "class": 'marketing-control'},
					    {"data": null, "defaultContent": "", "class": 'settings-control'}
					],
					"columnDefs": [
			            {
			                "render": function (data, type, row, meta) {
			                	switch (data) {
			                	case 0: return '<span style="color:#ff7000;">未知</span>';
			                	case 1: return '<span style="color:#00c69a;">正常</span>';
			                	case 2: return '<span style="color:#9b9b9b;">销户</span>';
			                	case 3: return '<span style="color:#ff6350;">禁用</span>';
			                	}
			                },
			                "targets": 2
			            },
			            {
			                "render": function (data, type, row, meta) {
			                	return '<button type="button" class="btn btn-sm btn-block btn-default">查看</button>';
			                },
			                "targets": 3
			            },
			            {
			                "render": function (data, type, row, meta) {
			                	return '<button type="button" class="btn btn-sm btn-block btn-default">查看</button>';
			                },
			                "targets": 4
			            },
			            {
			                "render": function (data, type, row, meta) {
			                	return '<button type="button" class="btn btn-sm btn-block btn-default">设置</button>';
			                },
			                "targets": 5
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
					            row.child('详情').show();
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
			        	$('#createAgentButton').click(function() {
			        		bootbox.dialog({
		                        title: "创建代理商",
		                        message: '<form class="form-horizontal">\n\
				                        <div class="form-group">\n\
				                        	<label class="col-md-4 control-label" for="name">代理商名称</label>\n\
					                        <div class="col-md-6">\n\
					                        	<input type="text" class="form-control input-md" id="name" name="name" placeholder="请输入代理商名称"/>\n\
					                        </div>\n\
				                        </div>\n\
				                        <div class="form-group">\n\
				                        	<label class="col-md-4 control-label" for="bankDetailOpeningBank">开户银行</label>\n\
					                        <div class="col-md-6">\n\
					                        	<input type="text" class="form-control input-md" id="bankDetailOpeningBank" name="bankDetailOpeningBank" placeholder="请输入开户银行"/>\n\
					                        </div>\n\
				                        </div>\n\
				                        <div class="form-group">\n\
				                        	<label class="col-md-4 control-label" for="bankDetailOpeningBankAddress">开户地</label>\n\
					                        <div class="col-md-6">\n\
					                        	<input type="text" class="form-control input-md" id="bankDetailOpeningBankAddress" name="bankDetailOpeningBankAddress" placeholder="请输入开户地"/>\n\
					                        </div>\n\
				                        </div>\n\
				                        <div class="form-group">\n\
				                        	<label class="col-md-4 control-label" for="bankDetailAccountNumber"银行账号</label>\n\
					                        <div class="col-md-6">\n\
					                        	<input type="text" class="form-control input-md" id="bankDetailAccountNumber" name="bankDetailAccountNumber" placeholder="请输入银行账号"/>\n\
					                        </div>\n\
				                        </div>\n\
				                        <div class="form-group">\n\
				                        	<label class="col-md-4 control-label" for="account">登录账号</label>\n\
					                        <div class="col-md-6">\n\
					                        	<input type="text" class="form-control input-md" id="account" name="account" placeholder="请输入登录账号"/>\n\
					                        </div>\n\
				                        </div>\n\
				                        <div class="form-group">\n\
				                        	<label class="col-md-4 control-label" for="password">登录密码</label>\n\
					                        <div class="col-md-6">\n\
					                        	<input type="text" class="form-control input-md" id="password" name="password" placeholder="请输入登录密码"/>\n\
					                        </div>\n\
				                        </div>\n\
			                        </form>',
		                        buttons: {
		                            success: {
		                                label: "保存",
		                                className: "btn-success",
		                                callback: function () {
		                                	var args = {
		                                		"name": $('#name').val(),
		                                		"bankDetailOpeningBank": $('#bankDetailOpeningBank').val(),
		                                		"bankDetailOpeningBankAddress": $('#bankDetailOpeningBankAddress').val(),
		                                		"bankDetailAccountNumber": $('#bankDetailAccountNumber').val(),
		                                		"account": $('#account').val(),
		                                		"password": $('#password').val()
		                                	};
		                                	$.get('${ctx}/agent/create', args, function(data) {
		        								if (data.code != 0) {
		        									alert('Error: ' + data.message);
		        									return;
		        								}
			                                    toastr.info('创建成功');
		        							});
		                                }
		                            }
		                        }
		                    });
					    });
			        }
				}));
			});
		    </script>
		</div>
    </div>
</div>
