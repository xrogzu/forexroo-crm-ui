<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js css-menubar" lang="zh-cn">

<head>
    <title>主页</title>
    <%@ include file="./includes/head.jsp"%>
    <!-- 图标 CSS-->
    <link rel="stylesheet" href="${ctx}/public/fonts/font-awesome/font-awesome.css">
    <link rel="stylesheet" href="${ctx}/public/fonts/web-icons/web-icons.css">
    <!-- 插件 CSS -->
    <link rel="stylesheet" href="${ctx}/public/vendor/animsition/animsition.css">
    <link rel="stylesheet" href="${ctx}/public/vendor/toastr/toastr.css">
    
    <script src="${ctx}/public/vendor/jquery/jquery.min.js"></script>
    <script src="${ctx}/public/vendor/bootstrap/bootstrap.min.js"></script>
    
    <!-- 插件 -->
    <script src="${ctx}/public/vendor/modernizr/modernizr.min.js"></script>
    <script src="${ctx}/public/vendor/breakpoints/breakpoints.min.js"></script>
    <script src="${ctx}/public/vendor/artTemplate/template.min.js"></script>
    <script src="${ctx}/public/vendor/toastr/toastr.min.js"></script>
    <!-- 核心  -->
    <script src="${ctx}/public/themes/classic/global/js/core.js"></script>
    <script src="${ctx}/public/themes/classic/base/js/site.js"></script>
    <script src="${ctx}/public/themes/classic/global/js/configs/site-configs.js"></script>
    <script src="${ctx}/public/themes/classic/global/js/components.js"></script>

    <script>
        Breakpoints();
    </script>
</head>

<body class="${display.tabFlag} ${display.menuDisplay} site-menubar-keep <c:if test="${display.menuDisplay=='site-menubar-fold'}">${display.menuTxtIcon}</c:if>">

<nav class="site-navbar navbar navbar-default navbar-fixed-top ${display.acrossFlag} ${display.navigationColor}" role="navigation">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle hamburger hamburger-close navbar-toggle-left hided" data-toggle="menubar">
            <span class="sr-only">切换菜单</span> <span class="hamburger-bar"></span>
        </button>
        <button type="button" class="navbar-toggle collapsed" data-target="#admui-navbarCollapse" data-toggle="collapse">
            <i class="icon wb-more-horizontal" aria-hidden="true"></i>
        </button>
        <div class="navbar-brand navbar-brand-center site-gridmenu-toggle" data-toggle="gridmenu">
            <img class="navbar-brand-logo visible-lg visible-xs navbar-logo" src="${ctx}/public/images/forexroo-crm-ui-logo.svg" title="Forexroo CRM">
            <img class="navbar-brand-logo hidden-xs hidden-lg navbar-logo-mini" src="${ctx}/public/images/forexroo-crm-ui-logo-min.svg" title="Forexroo CRM">
        </div>
    </div>
    <div class="navbar-container container-fluid">
        <div class="collapse navbar-collapse navbar-collapse-toolbar" id="admui-navbarCollapse">
            <ul class="nav navbar-toolbar navbar-left">
                <li class="hidden-float">
                    <a data-toggle="menubar" class="hidden-float" href="javascript:;" role="button" id="admui-toggleMenubar">
                        <i class="icon hamburger hamburger-arrow-left"> 
                      		<span class="sr-only">切换目录</span>
                            <span class="hamburger-bar"></span> 
                        </i>
                    </a>
                </li>
                <li class="navbar-menu nav-tabs-horizontal nav-tabs-animate is-load" id="admui-navMenu">
                    <ul class="nav navbar-toolbar nav-tabs" role="tablist">
                        <!-- 顶部菜单 -->
                    	<c:forEach items="${loginUser.menus}" var="menu1" varStatus="status1">
                        <li role="presentation" class="<c:if test="${curl == '/' && status1.count == 1}">active</c:if><c:if test="${curl != '/' && menu1.layer == fn:substring(loginUser.menuMap[curl].layer,0,2)}">active</c:if>">
                            <a data-toggle="tab" href="#admui-navTabsItem-${status1.count}" aria-controls="admui-navTabsItem-${status1.count}" role="tab" aria-expanded="false">
                                <i class="icon ${menu1.icon}"></i> <span>${menu1.name}</span>
                            </a>
                        </li>
                        </c:forEach>
                        <li class="dropdown" id="admui-navbarSubMenu">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#" data-animation="slide-bottom" aria-expanded="true" role="button">
                                <i class="icon wb-more-vertical"></i>
                            </a>
                            <ul class="dropdown-menu" role="menu">
                                <li class="no-menu" role="presentation">
                                    <a href="${ctx}/sitemap" target="_blank" role="menuitem" data-pjax>
                                        <i class="icon wb-list-numbered"></i><span>网站地图</span>
                                    </a>
                                </li>
                                <li class="no-menu" role="presentation">
                                    <a href="${ctx}/system/menu" target="_blank" role="menuitem" data-pjax>
                                        <i class="icon wb-wrench"></i><span>菜单管理</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-toolbar navbar-right navbar-toolbar-right">
                <li class="dropdown" id="admui-navbarMessage">
                    <a data-toggle="dropdown" href="javascript:;" class="msg-btn" aria-expanded="false" data-animation="scale-up" role="button">
                        <i class="icon wb-bell" aria-hidden="true"></i> <span class="badge badge-danger up msg-num"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right dropdown-menu-media" role="menu">
                        <li class="dropdown-menu-header" role="presentation">
                            <h5>最新消息</h5>
                            <span class="label label-round label-danger"></span>
                        </li>
                        <li class="list-group" role="presentation">
	                        <div id="admui-messageContent" data-height="220px" data-plugin="slimScroll">
	                            <p class="text-center height-200 vertical-align">
	                                <small class="vertical-align-middle opacity-four">没有新消息</small>
	                            </p>
	                            <script type="text/html" id="admui-messageTpl">
                                        {{each msgList}}
                                        <a class="list-group-item" href="${ctx}/system/account/message" target="_blank" data-pjax role="menuitem">
                                            <div class="media">
                                                <div class="media-left padding-right-10">
                                                    <i class="icon {{$value.type | iconType}} bg-red-600 white icon-circle" aria-hidden="true"></i>
                                                </div>
                                                <div class="media-body">
                                                    <h6 class="media-heading">{{$value.content}}</h6>
                                                    <time class="media-meta" datetime="{{$value.sendTime}}">
                                                        {{$value.sendTime | timeMsg}}
                                                    </time>
                                                </div>
                                            </div>
                                        </a>{{/each}}
                                 </script>
	                      	</div>
                        </li>
                        <li class="dropdown-menu-footer" role="presentation">
                            <a href="${ctx}/system/account/message" target="_blank" data-pjax>
                            	<i class="icon fa-navicon"></i> 所有消息
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="hidden-xs" id="admui-navbarDisplay" data-toggle="tooltip" data-placement="bottom" title="设置主题与布局等">
                    <a class="icon wb-layout" href="${ctx}/system/settings/display" target="_blank" data-pjax>
                        <span class="sr-only">主题与布局</span>
                    </a>
                </li>
                <li class="hidden-xs" id="admui-navbarFullscreen" data-toggle="tooltip" data-placement="bottom" title="全屏">
                    <a class="icon icon-fullscreen" data-toggle="fullscreen" href="#" role="button">
                        <span class="sr-only">全屏</span></a>
                </li>
                <li>
                    <a class="icon fa-sign-out" id="admui-signOut" data-ctx="${ctx}" data-user="${loginUser.userId}" href="${ctx}/system/logout" role="button">
                    	<span class="sr-only">退出</span></a>
                </li>

            </ul>
        </div>
    </div>
</nav>
<nav class="site-menubar ${display.menuTheme}">
    <div class="site-menubar-body">
        <div class="tab-content height-full" id="admui-navTabs">
        	<!-- 一级菜单 -->
            <c:forEach items="${loginUser.menus}" var="menu1" varStatus="status1">
            <div class="tab-pane animation-fade height-full <c:if test="${curl == '/' && status1.count == 1}">active</c:if><c:if test="${curl !='/' && menu1.layer == fn:substring(loginUser.menuMap[curl].layer,0,2)}">active</c:if>" id="admui-navTabsItem-${status1.count}" role="tabpanel">
                <div>
                    <ul class="site-menu">
                    	<c:if test="${not empty menu1.menus}">
                    	<!-- 二级菜单 -->
                    	<c:forEach items="${menu1.menus}" var="menu2" varStatus="status2">
                    	<li class="site-menu-category">${menu2.name}</li>
                    	<!-- 三级菜单 -->
                    	<c:if test="${not empty menu2.menus}">
                    	<c:forEach items="${menu2.menus}" var="menu3" varStatus="status3">
                    	<c:if test="${empty menu3.menus}">
                    	<li class="site-menu-item <c:if test="${menu3.layer == fn:substring(loginUser.menuMap[curl].layer,0,6)}">active</c:if>">
                            <a data-pjax href="${ctx}${menu3.url}" target="_blank">
                            	<i class="site-menu-icon ${menu3.icon}" aria-hidden="true"></i><span class="site-menu-title">${menu3.name}</span>
                            </a>
                        </li>
                        </c:if>
                        <c:if test="${not empty menu3.menus}">
                        <li class="site-menu-item has-sub <c:if test="${menu3.layer == fn:substring(loginUser.menuMap[curl].layer,0,6)}">active open</c:if>">
                            <a href="javascript:;"><i class="site-menu-icon ${menu3.icon}" aria-hidden="true"></i><span class="site-menu-title">${menu3.name}</span><span class="site-menu-arrow"></span></a>
                            <ul class="site-menu-sub">
                            	<!-- 四级菜单 -->
                            	<c:forEach items="${menu3.menus}" var="menu4" varStatus="status4">
                            	<c:if test="${empty menu4.menus}">
                                <li class="site-menu-item <c:if test="${menu4.layer == fn:substring(loginUser.menuMap[curl].layer,0,8)}">active</c:if>">
                                    <a data-pjax href="${ctx}${menu4.url}" target="_blank">
                                    	<span class="site-menu-title">${menu4.name}</span>
                                    </a>
                                </li>
                                </c:if>
                                <c:if test="${not empty menu4.menus}">
                                	<li class="site-menu-item has-sub <c:if test="${menu4.layer == fn:substring(loginUser.menuMap[curl].layer,0,8)}">active open</c:if>">
	                                    <a href="javascript:;">
	                                    	<span class="site-menu-title">${menu4.name}</span><span class="site-menu-arrow"></span></a>
	                                    <ul class="site-menu-sub">
	                                	<!-- 五级菜单 -->
	                                	<c:forEach items="${menu4.menus}" var="menu5" varStatus="status5">
	                                		<li class="site-menu-item <c:if test="${menu5.layer == fn:substring(loginUser.menuMap[curl].layer,0,10)}">active</c:if>">
	                                            <a data-pjax href="${ctx}${menu5.url}" target="_blank">
	                                                <span class="site-menu-title">${menu5.name}</span>
												</a>
	                                        </li>
	                                	</c:forEach>
	                                	<!-- 五级菜单 -->
	                                	</ul>
                                	</li>
                                </c:if>
                                </c:forEach>
                                <!-- 四级菜单 -->
                            </ul>
                        </li>
                        </c:if>
                    	</c:forEach>
                    	</c:if>
                    	<!-- 三级菜单 -->
                    	</c:forEach>
                    	<!-- 二级菜单 -->
                    	</c:if>
                    </ul>
                </div>
            </div>
            </c:forEach>
            <!-- 一级菜单 -->
        </div>
    </div>
</nav>
<nav class="site-contabs" id="admui-siteConTabs">
    <button type="button" class="btn btn-icon btn-default pull-left hide">
        <i class="icon fa-angle-double-left"></i>
    </button>
    <div class="contabs-scroll pull-left">
        <ul class="nav con-tabs">
            <li class="active">
                <a data-pjax href="${ctx}/home" rel="contents"><span>首页</span></a>
            </li>
        </ul>
    </div>
    <div class="btn-group pull-right">
        <button type="button" class="btn btn-icon btn-default hide">
            <i class="icon fa-angle-double-right"></i>
        </button>
        <button type="button" class="btn btn-default dropdown-toggle btn-outline" data-toggle="dropdown" aria-expanded="false">
            <span class="caret"></span> <span class="sr-only">切换菜单</span>
        </button>
        <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="conTabsDropdown" role="menu">
            <li class="reload-page" role="presentation">
                <a href="javascript:;" role="menuitem"><i class="icon wb-reload"></i> 刷新当前</a>
            </li>
            <li class="close-other" role="presentation">
                <a href="javascript:;" role="menuitem"><i class="icon wb-close"></i> 关闭其他</a>
            </li>
            <li class="close-all" role="presentation">
                <a href="javascript:;" role="menuitem"><i class="icon wb-power"></i> 关闭所有</a>
            </li>
        </ul>
    </div>
</nav>

<main class="site-page">
    <div class="page-container" id="admui-pageContent">
    <c:if test="${not empty include}">
    <c:catch var="e">
	<jsp:include page="${include}"></jsp:include>
	</c:catch>
	<c:if test="${not empty e}">
	<jsp:include page="includes/error.jsp"></jsp:include>
	</c:if>
	</c:if>
    </div>
    <div class="page-loading vertical-align text-center">
        <div class="page-loader loader-default loader vertical-align-middle" data-type="default"></div>
    </div>
</main>

<footer class="site-footer">
    <div class="site-footer-legal">&copy; 2017</div>
    <div class="site-footer-right">
        当前版本：v1.0.0
        <a class="margin-left-5" data-toggle="tooltip" title="升级" href="#" target="_blank">
            <i class="icon fa-cloud-upload"></i>
        </a>
    </div>
</footer>

<!-- 布局 -->
<script src="${ctx}/public/themes/classic/base/js/sections/menu.js"></script>
<script src="${ctx}/public/themes/classic/base/js/sections/media-menu.js"></script>
<script src="${ctx}/public/themes/classic/base/js/sections/content-tabs.js"></script>

<!-- 插件 -->
<script src="${ctx}/public/vendor/jquery-pjax/jquery.pjax.min.js"></script>
<script src="${ctx}/public/themes/classic/global/js/plugins/responsive-tabs.js"></script>
<script src="${ctx}/public/vendor/ashoverscroll/jquery-asHoverScroll.min.js"></script>
<script src="${ctx}/public/vendor/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${ctx}/public/vendor/screenfull/screenfull.min.js"></script>

<script src="${ctx}/public/js/notify-msg.js"></script>
</body>
</html>

