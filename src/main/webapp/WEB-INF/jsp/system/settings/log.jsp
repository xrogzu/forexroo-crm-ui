<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../includes/taglib.jsp"%>

<title>日志设置</title>

<link rel="stylesheet" href="${ctx}/public/css/system/settings/log.css">
<link rel="stylesheet" href="${ctx}/public/vendor/alertify-js/alertify.css">
<link rel="stylesheet" href="${ctx}/public/vendor/datatables-bootstrap/dataTables.bootstrap.css">
<link rel="stylesheet" href="${ctx}/public/vendor/datatables-responsive/dataTables.responsive.css">
<link rel="stylesheet" href="${ctx}/public/vendor/formvalidation/formValidation.css">

<div class="page animation-fade bg-white page-logs">
    <div class="page-header">
        <h1 class="page-title">系统日志</h1>
        <div class="page-header-actions">
            <button type="button" class="btn btn-sm btn-outline btn-default add-row" data-target="#logsForm" data-toggle="modal" aria-hidden="true" role="button">
                <i class="icon wb-plus"></i> 新增
            </button>
        </div>
    </div>
    <hr class="margin-0">
    <div class="page-content">
        <table class="table table-bordered table-hover text-nowrap dataTable table-striped width-full" id="logList" data-column-defs='[{ "orderable": false, "targets": 2},{ "orderable": false, "targets": 3},{ "orderable": false, "targets": 4}]'>
            <thead>
            <tr>
                <th>路径</th>
                <th>类型</th>
                <th>用户</th>
                <th>时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${configList}" var="config" varStatus="status">
            <tr id="${config.configId}">
                <td>${config.url}</td>
                <td>${config.type}</td>
                <td>${config.createUser.loginName}</td>
                <td><fmt:formatDate type="both" value="${config.createTime}" /></td>
                <td>
                    <div class="btn-group btn-group-sm">
                        <button type="button" class="btn btn-icon btn-pure btn-default edit-row" data-target="#logsForm" data-toggle="modal">
                            <i class="icon wb-edit" aria-hidden="true"></i>
                        </button>
                        <button type="button" class="btn btn-icon btn-pure btn-default delete-row">
                            <i class="icon wb-close" aria-hidden="true"></i>
                        </button>
                    </div>
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="modal" id="logsForm" aria-hidden="true" aria-labelledby="logsForm" role="dialog" tabindex="-1">
        <div class="modal-dialog modal-center">
            <form class="modal-content " id="compileRoleForm">
                <div class="modal-header">
                    <button type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button>
                    <h4 class="modal-title">日志设置</h4>
                </div>
                <div class="modal-body">
                    <div class="form form-horizontal logs-settings">
                        <div class="form-group row">
                            <label class="col-xs-2 control-label">路径</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" name="url" placeholder="请填写需要记录日志的URL">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-xs-2 control-label">名称</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" name="type" placeholder="请填写URL对应的显示名称">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="submit">保存</button>
                    <a class="btn btn-default" data-dismiss="modal">取消</a>
                </div>
            </form>

        </div>
    </div>
</div>

<script src="${ctx}/public/vendor/alertify-js/alertify.min.js"></script>
<script src="${ctx}/public/vendor/datatables/jquery.dataTables.min.js" data-name="dataTables"></script>
<script src="${ctx}/public/vendor/datatables-bootstrap/dataTables.bootstrap.min.js" data-deps="dataTables"></script>
<script src="${ctx}/public/vendor/datatables-responsive/dataTables.responsive.min.js" data-deps="dataTables"></script>
<script src="${ctx}/public/vendor/formvalidation/formValidation.min.js" data-name="formValidation"></script>
<script src="${ctx}/public/vendor/formvalidation/framework/bootstrap.min.js" data-name="bootstrap" data-deps="formValidation"></script>
<script src="${ctx}/public/js/system/settings/log.js" data-deps="bootstrap"></script>
