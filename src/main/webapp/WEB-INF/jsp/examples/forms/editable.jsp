<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../includes/taglib.jsp"%>

<title>表单编辑</title>

<link rel="stylesheet" href="${ctx}/public/vendor/x-editable/x-editable.css">
<link rel="stylesheet" href="${ctx}/public/vendor/typeahead-js/typeahead.css">
<link rel="stylesheet" href="${ctx}/public/vendor/select2/select2.css">

<div class="page animation-fade page-forms">
    <div class="page-header">
        <h1 class="page-title">表单编辑</h1>
        <ol class="breadcrumb">
            <li>
                <a>首页</a>
            </li>
            <li>
                <a href="javascript:;">表单</a>
            </li>
            <li class="active">表单编辑</li>
        </ol>
        <div class="page-header-actions">
            <a class="btn btn-default btn-outline btn-round" href="http://github.com/vitalets/x-editable" target="_blank">
                <i class="icon wb-link" aria-hidden="true"></i> <span class="hidden-xs">官网</span>
            </a>
        </div>
    </div>
    <div class="page-content">
        <div class="panel">
            <header class="panel-heading">
                <h3 class="panel-title">
                    X-Editable（各种问题） <span class="panel-desc">单击编辑</span>
                </h3>
            </header>
            <div class="panel-body">
                <button class="btn btn-primary btn-outline margin-bottom-10" id="editableEnable" type="button">启用 / 停用
                </button>
                <div class="table-responsive">
                    <table class="table table-bordered table-striped" id="editableUser">
                        <tbody>
                        <tr>
                            <td style="width:35%">input</td>
                            <td style="width:65%">
                                <a id="editableSuperuser" href="javascript:void(0)" data-type="text" data-pk="1" data-title="请输入用户名">
                                    admui
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>input（必填）</td>
                            <td>
                                <a id="editableFirstname" href="javascript:void(0)" data-type="text" data-pk="1" data-placement="right" data-placeholder="必填项" data-title="请输入用户名"></a>
                            </td>
                        </tr>
                        <tr>
                            <td>select</td>
                            <td>
                                <a id="editableSex" href="javascript:void(0)" data-type="select" data-pk="1" data-value="" data-title="选择性别"></a>
                            </td>
                        </tr>
                        <tr>
                            <td>Combodate（日期）</td>
                            <td>
                                <a id="editableDob" href="javascript:void(0)" data-type="combodate" data-value="1984-05-15" data-format="YYYY-MM-DD" data-viewformat="YYYY/MM/DD" data-template="YYYY - MM - DD" data-pk="1" data-title="选择出生日期"></a>
                            </td>
                        </tr>
                        <tr>
                            <td>Combodate（时间）</td>
                            <td>
                                <a id="editableEvent" href="javascript:void(0)" data-type="combodate" data-template="YYYY - MM - DD  HH:mm" data-format="YYYY/MM/DD HH:mm" data-viewformat="YYYY-MM-DD, HH:mm" data-pk="1" data-title="请选择时间"></a>
                            </td>
                        </tr>
                        <tr>
                            <td>文本框、按钮，按<i>ctrl+enter</i>提交</td>
                            <td>
                                <a id="editableComments" href="javascript:void(0)" data-type="textarea" data-pk="1" data-placeholder="说点什么吧" data-title="请输入评论">啦啦啦</a>
                            </td>
                        </tr>
                        <tr>
                            <td>typeahead.js</td>
                            <td>
                                <a id="editableState2" href="javascript:void(0)" data-type="typeaheadjs" data-pk="1" data-placement="right" data-title="请输入"></a>
                            </td>
                        </tr>
                        <tr>
                            <td>复选框</td>
                            <td>
                                <a id="editableFruits" href="javascript:void(0)" data-type="checklist" data-value="2,3" data-title="选择您喜爱的水果"></a>
                            </td>
                        </tr>
                        <tr>
                            <td>自定义，多个字段</td>
                            <td>
                                <a id="editableAddress" href="javascript:void(0)" data-type="address" data-pk="1" data-title="请填写地址"></a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${ctx}/public/vendor/select2/select2.min.js" data-name="select2"></script>
<script src="${ctx}/public/vendor/moment/moment.min.js" data-deps="select2"></script>
<script src="${ctx}/public/vendor/x-editable/bootstrap-editable.min.js" data-name="editable"></script>
<script src="${ctx}/public/vendor/typeahead-js/bloodhound.min.js" data-deps="editable"></script>
<script src="${ctx}/public/vendor/typeahead-js/typeahead.jquery.min.js" data-deps="editable"></script>
<script src="${ctx}/public/vendor/typeahead-js/typeaheadjs.min.js" data-deps="editable"></script>
<script src="${ctx}/public/vendor/x-editable/address.min.js" data-deps="editable"></script>
<script src="${ctx}/public/js/examples/forms/editable.js"></script>
