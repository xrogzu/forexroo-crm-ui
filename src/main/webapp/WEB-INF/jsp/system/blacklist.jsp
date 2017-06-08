<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglib.jsp"%>

<title>黑名单</title>

<link rel="stylesheet" href="${ctx}/public/vendor/webui-popover/webui-popover.css">
<link rel="stylesheet" href="${ctx}/public/vendor/alertify-js/alertify.css">
<link rel="stylesheet" href="${ctx}/public/vendor/datatables-bootstrap/dataTables.bootstrap.css">
<link rel="stylesheet" href="${ctx}/public/vendor/datatables-responsive/dataTables.responsive.css">
<link rel="stylesheet" href="${ctx}/public/vendor/formvalidation/formValidation.css">

<div class="page animation-fade page-backlist">
    <div class="page-content">
        <div class="panel">
            <div class="panel-heading">
                <h3 class="panel-title">黑名单</h3>
                <div class="panel-actions">
                    <a class="panel-action icon wb-plus" data-target="#add" data-toggle="modal" aria-hidden="true" role="button">
                        新增
                    </a>
                </div>
            </div>
            <div class="panel-body">
                <table class="table table-bordered dataTable table-striped table-hover text-nowrap margin-vertical-10" data-column-defs='[{ "orderable": false, "targets": 3},{ "orderable": false, "targets": 4}]'>
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>IP</th>
                        <th>加入时间</th>
                        <th>备注</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${blList}" var="blacklist" varStatus="status">
                    <tr id="${blacklist.blId}">
                        <td>${status.count}</td>
                        <td>
							<a href="javascript:;" class="ip-msg" data-url="${ctx}/query/ip?${blacklist.ip}">${blacklist.ip}</a>
                        </td>
                        <td><fmt:formatDate type="both" value="${blacklist.createTime}" /></td>
                        <td>${blacklist.comment}</td>
                        <td>
                            <a class="btn btn-pure btn-xs btn-default icon wb-close delete-tr" href="#"></a>
                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="add" aria-hidden="true" aria-labelledby="add" role="dialog" tabindex="-1">
    <div class="modal-dialog modal-center">
        <form class="modal-content" id="blackList" method="post">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="关闭">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">添加到黑名单</h4>
            </div>
            <div class="modal-body">
                <div class="alert alert-warning alert-dismissible" role="alert">
                    <i class="icon wb-bell" aria-hidden="true"></i> 加入黑名单的IP用户将无法访问本系统
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="ip" placeholder="请填写要加入黑名单的IP">
                </div>
                <div class="form-group margin-bottom-0">
                    <textarea class="form-control" rows="3" name="comment" placeholder="备注信息"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </form>
    </div>
</div>

<script src="${ctx}/public/vendor/webui-popover/jquery.webui-popover.min.js"></script>
<script src="${ctx}/public/vendor/alertify-js/alertify.min.js"></script>
<script src="${ctx}/public/vendor/datatables/jquery.dataTables.min.js" data-name="dataTables"></script>
<script src="${ctx}/public/vendor/datatables-bootstrap/dataTables.bootstrap.min.js" data-deps="dataTables"></script>
<script src="${ctx}/public/vendor/datatables-responsive/dataTables.responsive.min.js" data-deps="dataTables"></script>
<script src="${ctx}/public/vendor/formvalidation/formValidation.min.js" data-name="formValidation"></script>
<script src="${ctx}/public/vendor/formvalidation/framework/bootstrap.min.js" data-deps="formValidation"></script>
<script src="${ctx}/public/js/system/blacklist.js"></script>

