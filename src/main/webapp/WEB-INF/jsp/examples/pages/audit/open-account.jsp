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
					    {"data": "myAgent", "defaultContent": "暂无数据"}
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
			                	return '<button type="button" class="btn btn-sm btn-block btn-default">查看</button>';
			                },
			                "targets": 8
			            },
			            {
			                "render": function (data, type, row, meta) {
			                	return '<div class="dropdown">\n\
			                                <button type="button" class="btn btn-sm btn-default dropdown-toggle" id="exampleLeftDropdownSubMenu" aria-expanded="true" data-toggle="dropdown">\n\
			                                审核 <span class="caret"></span>\n\
			                            	</button>\n\
			                            	<ul class="dropdown-menu dropdown-menu-right" aria-labelledby="exampleLeftDropdownSubMenu" role="menu">\n\
	                                            <li role="presentation">\n\
	                                                <a href="javascript:;" role="menuitem" tabindex="-1">通过</a>\n\
	                                            </li>\n\
	                                            <li class="divider" role="presentation"></li>\n\
	                                            <li class="dropdown-submenu dropdown-menu-left">\n\
	                                                <a href="javascript:;" tabindex="-1">拒绝</a>\n\
	                                                <ul class="dropdown-menu" role="menu">\n\
	                                                    <li role="presentation">\n\
	                                                        <a href="javascript:;" role="menuitem" tabindex="-1">\n\
	                                                            身份证正面照不清晰\n\
	                                                        </a>\n\
	                                                    </li>\n\
	                                                    <li role="presentation">\n\
	                                                        <a href="javascript:;" role="menuitem" tabindex="-1">\n\
	                                                            身份证反面照不清晰\n\
	                                                        </a>\n\
	                                                    </li>\n\
	                                                    <li role="presentation">\n\
	                                                        <a href="javascript:;" role="menuitem" tabindex="-1">\n\
	                                                            手持身份证照不清晰\n\
	                                                        </a>\n\
	                                                    </li>\n\
	                                                    <li role="presentation">\n\
	                                                        <a href="javascript:;" role="menuitem" tabindex="-1">\n\
	                                                            签名不清晰\n\
	                                                        </a>\n\
	                                                    </li>\n\
	                                                </ul>\n\
	                                            </li>\n\
                                            </ul>\n\
			                            </div>';
			                },
			                "targets": 9
			            }
			        ]
				}));
			});
		    </script>
		</div>
    </div>
</div>
