package cn.ermei.admui.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.context.support.WebApplicationContextUtils;

import cn.ermei.admui.entity.Menu;
import cn.ermei.admui.entity.User;
import cn.ermei.admui.service.MenuService;

public class AuthFilter implements Filter {

	/**
	 * 静态资源根目录
	 */
	private static final String RESOURCES_ROOT = "/public/";
	
	private MenuService menuService;
	
	private List<String> noCheckList;
	
	public void destroy() {

	}

	public void doFilter(ServletRequest servletRequest,
			ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;

		String currentURL = request.getRequestURI();
		HttpSession session = request.getSession(false);
		
		// 非静态资源及无需授权url
		if (!currentURL.startsWith(request.getContextPath() + RESOURCES_ROOT)
				&& !noCheckList.contains(currentURL.replaceFirst(request.getContextPath(), ""))) {
			
			if (session == null || session.getAttribute("loginUser") == null) {
				Cookie ckLoginName = getCookieByName(request, "ckLoginName");
				Cookie ckPassword = getCookieByName(request, "ckPassword");
				
				/**
				 * 自动登录
				 */
				if (ckLoginName != null && ckPassword != null
						&& StringUtils.isNotBlank(ckLoginName.getValue())
						&& StringUtils.isNotBlank(ckPassword.getValue())) {
					
					response.sendRedirect(request.getContextPath() 
							+ "/system/loginValidate?loginName=" + ckLoginName.getValue()
							+ "&password=" + ckPassword.getValue() + "&loginType=cookie");
					return;
				} 
				
				/**
				 * 未登录时，跳转到登录界面
				 */
				else {
					response.sendRedirect(request.getContextPath() + "/login");
					return;
				}
			}
			
			/**
			 * 登录后检查授权，此处只检查sys_menu表内url是否授权
			 */
			else {
				
				List<Menu> menuList = ((User)session.getAttribute("loginUser")).getMenus();
				if (!hasAuthority(currentURL, menuList)) {
					response.sendRedirect(request.getContextPath() + "/noauth");
					return;
				}
			}
		}

		filterChain.doFilter(request, response);
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		menuService = WebApplicationContextUtils.
				getRequiredWebApplicationContext(filterConfig.getServletContext()).
				getBean(MenuService.class);
		
		// 不需要授权的url list
		noCheckList = new ArrayList<String>();
		noCheckList.add("/maintenance");
		noCheckList.add("/locked");
		noCheckList.add("/noauth");
		noCheckList.add("/login");
		noCheckList.add("/system/captcha");
		noCheckList.add("/system/loginValidate");

	}
	
	private boolean hasAuthority(String currentURL, List<Menu> menuList) {
		
		// 用户授权菜单为空时
		if (menuList == null || menuList.isEmpty()) {
			return false;
		}
		
		List<Menu> allMenuList = menuService.queryAll();
		List<String> allUrls = new ArrayList<String>(); // 所有菜单url集合
		List<String> urls = new ArrayList<String>(); // 用户授权菜单url集合
		
		buildUrlList(menuList, urls);
		buildUrlList(allMenuList, allUrls);
		
		if (allUrls.contains(currentURL)) {
			if (urls.contains(currentURL)) {
				return true;
			} else {
				return false;
			}
		} else {
			return true;
		}
		
	}
	
	private void buildUrlList(List<Menu> menuList, List<String> urls) {
		for (Menu menu : menuList) {
			if (StringUtils.isNotBlank(menu.getUrl())) {
				urls.add(menu.getUrl());
			}
			if (menu.getMenus() != null && !menu.getMenus().isEmpty()) {
				buildUrlList(menu.getMenus(), urls);
			}
		}
	}
	
	private Cookie getCookieByName(HttpServletRequest request, String name) {
		Map<String, Cookie> cookieMap = readCookieMap(request);
		if (cookieMap.containsKey(name)) {
			Cookie cookie = (Cookie) cookieMap.get(name);
			return cookie;
		} else {
			return null;
		}
	}
	
	private Map<String, Cookie> readCookieMap(HttpServletRequest request) {
		Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();
		Cookie[] cookies = request.getCookies();
		if (null != cookies) {
			for (Cookie cookie : cookies) {
				cookieMap.put(cookie.getName(), cookie);
			}
		}
		return cookieMap;
	}
	
}
