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

<link rel="stylesheet" href="${ctx}/public/vendor/bootstrap-datepicker/bootstrap-datepicker.css">

<script src="${ctx}/public/vendor/bootstrap-datepicker/bootstrap-datepicker.min.js" data-name="datepicker"></script>
<script src="${ctx}/public/vendor/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js" data-deps="datepicker"></script>

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
	                    	<select class="form-control" id="auditStatus">
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
					    {"data": "name"},
					    {"data": "title"},
					    {"data": "base"},
					    {"data": "age"},
					    {"data": "hireDate"},
					    {"data": "salary"}
					]
				}));
			});
		    </script>
		</div>
    </div>
</div>
