<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/taglib.jsp"%>

<title>网站地图</title>

<link rel="stylesheet" href="${ctx}/public/css/site-map.css">
<link rel="stylesheet" href="${ctx}/public/css/examples/components/advanced/masonry.css">

<div class="page animation-fade page-site-map">

    <div class="page-header">
        <h1 class="page-title">网站地图</h1>
    </div>

    <div class="page-content container-fluid">
        <div class="panel">
            <div class="panel-body">
                <div class="row" data-plugin="masonry" data-item-selector=".grid-item">
                
                	<!-- 一级菜单 -->
                	<c:if test="${not empty menuList}">
                	<c:forEach items="${menuList}" var="menu1" varStatus="status1">
                    <div class="col-xlg-3 col-lg-4 col-md-6 col-sm-6 grid-item">
                        <h4><i class="icon ${menu1.icon}"></i> ${menu1.name}</h4>
                        
                        <!-- 二级菜单 -->
                        <c:if test="${not empty menu1.menus}">
                        <ul class="sitemap-list">
                        	<c:forEach items="${menu1.menus}" var="menu2" varStatus="status2">
                            <li>
                                <a href="javascript:;">${menu2.name}</a>
								
								<!-- 三级菜单 -->
                        		<c:if test="${not empty menu2.menus}">
                                <ul>
                                	<c:forEach items="${menu2.menus}" var="menu3" varStatus="status3">
                                    <li>
                                        <a href="${empty menu3.menus ? ctx.concat(menu3.url) : 'javascript:;'}" data-pjax target="_blank">
                                        	<c:if test="${empty menu3.menus}">
                                            <i class="icon wb-link pull-right"></i>
                                            </c:if>
                                            <i class="icon ${menu3.icon}"></i>
                                            <span>${menu3.name}</span>
                                        </a>
                                        
                                        <!-- 四级菜单 -->
                        				<c:if test="${not empty menu3.menus}">
                                        <ul>
                                        	<c:forEach items="${menu3.menus}" var="menu4" varStatus="status4">
                                            <li>
                                                <a href="${empty menu4.menus ? ctx.concat(menu4.url) : 'javascript:;'}" data-pjax target="_blank">
                                                	<c:if test="${empty menu4.menus}">
                                                	<i class="icon wb-link pull-right"></i>
                                                	</c:if>
                                                    <span>${menu4.name}</span>
                                                </a>
                                                    
                                                <!-- 五级菜单 -->
		                        				<c:if test="${not empty menu4.menus}">
                                                <ul class="sitemap-list-sub">
                                                	<c:forEach items="${menu4.menus}" var="menu5" varStatus="status5">
                                                    <li>
                                                        <a href="${ctx.concat(menu5.url)}" data-pjax target="_blank"> ${menu5.name}</a>
                                                    </li>
                                                    </c:forEach>
                                                </ul>
                                                </c:if>
			                                    <!-- 五级菜单 -->
                                                
                                            </li>
                                            </c:forEach>
                                        </ul>
                                        </c:if>
	                                    <!-- 四级菜单 -->
                                        
                                    </li>
                                    </c:forEach>
                                </ul>
                                </c:if>
                                <!-- 三级菜单 -->

                            </li>
                            </c:forEach>
                        </ul>
                        </c:if>
                        <!-- 二级菜单 -->

                    </div>
                    </c:forEach>
                    </c:if>
                    <!-- 一级菜单 -->
                    
                </div>
            </div>
        </div>
    </div>

</div>

<script src="${ctx}/public/vendor/masonry/masonry.pkgd.min.js"></script>
