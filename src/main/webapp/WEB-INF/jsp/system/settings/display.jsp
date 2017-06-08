<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../includes/taglib.jsp"%>

<title>显示设置</title>

<link rel="stylesheet" href="${ctx}/public/css/system/settings/display.css">
<link rel="stylesheet" href="${ctx}/public/fonts/material-design/material-design.css">
<link rel="stylesheet" href="${ctx}/public/vendor/bootstrap-select/bootstrap-select.css">
<link rel="stylesheet" href="${ctx}/public/vendor/switchery/switchery.css">

<div class="page animation-fade page-display">
    <div class="page-content">
        <form id="displayForm" class="form-horizontal padding-vertical-30">
        <c:set var="display" value="${globalDisplay == null ? userDisplay : globalDisplay}"></c:set>
            <div class="form-group">
                <label class="col-sm-2 control-label">导航条颜色：</label>
                <div class="col-sm-10" id="skintoolsNavbar">
                    <ul class="list-unstyled list-inline color-radio">
                        <li>
                            <div class="radio-custom radio-primary">
                                <input type="radio" <c:if test="${display.navigationColor == ''}">checked</c:if> name="navigationColor" value=""> <label></label>
                            </div>
                        </li>
                        <li>
                            <div class="radio-custom radio-brown">
                                <input type="radio" <c:if test="${display.navigationColor == 'bg-brown-600'}">checked</c:if> name="navigationColor" value="bg-brown-600"> <label></label>
                            </div>
                        </li>
                        <li>
                            <div class="radio-custom radio-cyan">
                                <input type="radio" <c:if test="${display.navigationColor == 'bg-cyan-600'}">checked</c:if> name="navigationColor" value="bg-cyan-600"> <label></label>
                            </div>
                        </li>
                        <li>
                            <div class="radio-custom radio-green">
                                <input type="radio" <c:if test="${display.navigationColor == 'bg-green-600'}">checked</c:if> name="navigationColor" value="bg-green-600"> <label></label>
                            </div>
                        </li>
                        <li>
                            <div class="radio-custom radio-grey">
                                <input type="radio" <c:if test="${display.navigationColor == 'bg-grey-600'}">checked</c:if> name="navigationColor" value="bg-grey-600"> <label></label>
                            </div>
                        </li>
                        <li>
                            <div class="radio-custom radio-indigo">
                                <input type="radio" <c:if test="${display.navigationColor == 'bg-indigo-600'}">checked</c:if> name="navigationColor" value="bg-indigo-600"> <label></label>
                            </div>
                        </li>
                        <li>
                            <div class="radio-custom radio-orange">
                                <input type="radio" <c:if test="${display.navigationColor == 'bg-orange-600'}">checked</c:if> name="navigationColor" value="bg-orange-600"> <label></label>
                            </div>
                        </li>
                        <li>
                            <div class="radio-custom radio-pink">
                                <input type="radio" <c:if test="${display.navigationColor == 'bg-pink-600'}">checked</c:if> name="navigationColor" value="bg-pink-600"> <label></label>
                            </div>
                        </li>
                        <li>
                            <div class="radio-custom radio-purple">
                                <input type="radio" <c:if test="${display.navigationColor == 'bg-purple-600'}">checked</c:if> name="navigationColor" value="bg-purple-600"> <label></label>
                            </div>
                        </li>
                        <li>
                            <div class="radio-custom radio-red">
                                <input type="radio" <c:if test="${display.navigationColor == 'bg-red-600'}">checked</c:if> name="navigationColor" value="bg-red-600"> <label></label>
                            </div>
                        </li>
                        <li>
                            <div class="radio-custom radio-teal">
                                <input type="radio" <c:if test="${display.navigationColor == 'bg-teal-600'}">checked</c:if> name="navigationColor" value="bg-teal-600"> <label></label>
                            </div>
                        </li>
                        <li>
                            <div class="radio-custom radio-yellow">
                                <input type="radio" <c:if test="${display.navigationColor == 'bg-yellow-700'}">checked</c:if> name="navigationColor" value="bg-yellow-700"> <label></label>
                            </div>
                        </li>
                    </ul>
                    <div class="checkbox-custom checkbox-primary margin-top-10">
                        <input type="checkbox" <c:if test="${display.acrossFlag == 'navbar-inverse'}">checked</c:if> id="navbarDisplay" name="acrossFlag" value="navbar-inverse">
                        <label for="navbarDisplay">通栏显示</label>
                    </div>
                </div>
            </div>
            <hr>
            <div class="form-group">
                <label class="col-sm-2 control-label">菜单主题：</label>
                <div class="col-sm-10">
                    <select data-plugin="selectpicker" id="skintoolsSidebar" name="menuTheme">
                        <option value="site-menubar-dark" <c:if test="${display.menuTheme == 'site-menubar-dark'}">selected</c:if>>深色主题</option>
                        <option value="site-menubar-light" <c:if test="${display.menuTheme == 'site-menubar-light'}">selected</c:if>>浅色主题</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">菜单显示：</label>
                <div class="col-sm-10">
                    <div class="radio-inline radio-custom radio-primary">
                        <input type="radio" id="menuUnfold" <c:if test="${display.menuDisplay == 'site-menubar-unfold'}">checked="checked"</c:if> name="menuDisplay" value="site-menubar-unfold">
                        <label for="menuUnfold">默认展开</label>
                    </div>
                    <div class="radio-inline radio-custom radio-primary">
                        <input type="radio" id="menuFold" <c:if test="${display.menuDisplay == 'site-menubar-fold'}">checked="checked"</c:if> name="menuDisplay" value="site-menubar-fold">
                        <label for="menuFold">默认收起</label>
                    </div>
                    <div class="margin-top-10 <c:if test="${display.menuDisplay == 'site-menubar-unfold'}">hidden</c:if>" id="menuFoldSetting">
                        <span>鼠标经过菜单时显示：</span>
                        <div class="btn-group btn-group-xs" data-toggle="buttons">
                            <label class="btn  btn-outline btn-dark active" for="textIconKeep">
                                <input type="radio" id="textIconKeep" autocomplete="off" hidden="hidden" <c:if test="${display.menuTxtIcon == 'site-menubar-keep'}">checked</c:if> name="menuTxtIcon" value="site-menubar-keep"> 文字
                            </label> <label class="btn btn-outline btn-dark" for="textIconAlt">
                            <input type="radio" id="textIconAlt" autocomplete="off" hidden="hidden" <c:if test="${display.menuTxtIcon == 'site-menubar-fold-alt'}">checked</c:if> name="menuTxtIcon" value="site-menubar-fold-alt"> 图标
                        </label>
                        </div>
                    </div>
                    <span class="help-block">仅在可视区域宽度大于768px生效</span>
                </div>
            </div>
            <hr>
            <div class="form-group">
                <label class="col-sm-2 control-label">主题颜色：</label>
                <div class="col-sm-10" id="skintoolsPrimary">
                    <ul class="list-unstyled list-inline color-radio">
                        <li>
                            <div class="radio-custom radio-primary">
                                <input type="radio" <c:if test="${display.themeColor == 'primary'}">checked</c:if> name="themeColor" value="primary"> <label></label>
                            </div>
                        </li>
                        <li>
                            <div class="radio-custom radio-brown">
                                <input type="radio" <c:if test="${display.themeColor == 'brown'}">checked</c:if> name="themeColor" value="brown"> <label></label>
                            </div>
                        </li>
                        <li>
                            <div class="radio-custom radio-cyan">
                                <input type="radio" <c:if test="${display.themeColor == 'cyan'}">checked</c:if> name="themeColor" value="cyan"> <label></label>
                            </div>
                        </li>
                        <li>
                            <div class="radio-custom radio-green">
                                <input type="radio" <c:if test="${display.themeColor == 'green'}">checked</c:if> name="themeColor" value="green"> <label></label>
                            </div>
                        </li>
                        <li>
                            <div class="radio-custom radio-grey">
                                <input type="radio" <c:if test="${display.themeColor == 'grey'}">checked</c:if> name="themeColor" value="grey"> <label></label>
                            </div>
                        </li>
                        <li>
                            <div class="radio-custom radio-indigo">
                                <input type="radio" <c:if test="${display.themeColor == 'indigo'}">checked</c:if> name="themeColor" value="indigo"> <label></label>
                            </div>
                        </li>
                        <li>
                            <div class="radio-custom radio-orange">
                                <input type="radio" <c:if test="${display.themeColor == 'orange'}">checked</c:if> name="themeColor" value="orange"> <label></label>
                            </div>
                        </li>
                        <li>
                            <div class="radio-custom radio-pink">
                                <input type="radio" <c:if test="${display.themeColor == 'pink'}">checked</c:if> name="themeColor" value="pink"> <label></label>
                            </div>
                        </li>
                        <li>
                            <div class="radio-custom radio-purple">
                                <input type="radio" <c:if test="${display.themeColor == 'purple'}">checked</c:if> name="themeColor" value="purple"> <label></label>
                            </div>
                        </li>
                        <li>
                            <div class="radio-custom radio-red">
                                <input type="radio" <c:if test="${display.themeColor == 'red'}">checked</c:if> name="themeColor" value="red"> <label></label>
                            </div>
                        </li>
                        <li>
                            <div class="radio-custom radio-teal">
                                <input type="radio" <c:if test="${display.themeColor == 'teal'}">checked</c:if> name="themeColor" value="teal"> <label></label>
                            </div>
                        </li>
                        <li>
                            <div class="radio-custom radio-yellow">
                                <input type="radio" <c:if test="${display.themeColor == 'yellow'}">checked</c:if> name="themeColor" value="yellow"> <label></label>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <hr>
            <div class="form-group">
                <label class="col-sm-2 control-label">Tab 页签：</label>
                <div class="col-sm-10">
                    <div class="radio-inline radio-custom radio-primary">
                        <input type="radio" id="tabDisplayShow" <c:if test="${display.tabFlag == 'site-contabs-open'}">checked</c:if> name="tabFlag" value="site-contabs-open">
                        <label for="tabDisplayShow">开启</label>
                    </div>
                    <div class="radio-inline radio-custom radio-primary">
                        <input type="radio" id="tabDisplayHide" <c:if test="${display.tabFlag == ''}">checked</c:if> name="tabFlag">
                        <label for="tabDisplayHide">关闭</label>
                    </div>
                    <span class="help-block">Tab 页签必须保存以后才能看到效果</span>
                </div>
            </div>
            <hr>
            <div class="form-group">
                <div class="col-sm-10 col-sm-offset-2 margin-top-20">
                    <button type="submit" class="btn btn-primary" name="save" value="true">保存</button>
                    <button type="button" class="btn btn-outline btn-default" name="reset" value="reset" id="skintoolsReset">恢复默认
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="${ctx}/public/vendor/switchery/switchery.min.js"></script>
<script src="${ctx}/public/vendor/bootstrap-select/bootstrap-select.min.js" data-name="select"></script>
<script src="${ctx}/public/js/system/settings/display.js" data-deps="select"></script>

