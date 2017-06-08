<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglib.jsp"%>

<link rel="stylesheet" href="${ctx}/public/vendor/datatables-bootstrap/dataTables.bootstrap.css">
<link rel="stylesheet" href="${ctx}/public/vendor/datatables-responsive/dataTables.responsive.css">
<table class="table table-bordered table-hover text-nowrap dataTable table-striped width-full margin-vertical-10" id="logList" data-column-defs='[{ "orderable": false, "targets": 2}]'>
    <thead>
    <tr>
        <th>路径</th>
        <th>名称</th>
        <th>参数</th>
        <th>用户</th>
        <th>用户IP</th>
        <th>时间</th>
    </tr>
    </thead>
    <tfoot>
    <tr>
        <th>路径</th>
        <th>名称</th>
        <th>参数</th>
        <th>用户</th>
        <th>用户IP</th>
        <th>时间</th>
    </tr>
    </tfoot>
</table>

<script src="${ctx}/public/vendor/datatables/jquery.dataTables.min.js" data-name="dataTables"></script>
<script src="${ctx}/public/vendor/datatables-bootstrap/dataTables.bootstrap.min.js" data-deps="dataTables"></script>
<script src="${ctx}/public/vendor/datatables-responsive/dataTables.responsive.min.js" data-deps="dataTables"></script>
<script src="${ctx}/public/js/system/log.js"></script>
