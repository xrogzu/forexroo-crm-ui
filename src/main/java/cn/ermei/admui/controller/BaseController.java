package cn.ermei.admui.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.HandlerMapping;

import cn.ermei.admui.entity.Menu;
import cn.ermei.admui.entity.User;

public class BaseController {
	
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected HttpSession session;
	protected User loginUser;

	@ModelAttribute
	protected void setReqAndRes(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.session = request.getSession();
		if (this.session != null && this.session.getAttribute("loginUser") != null) {
			loginUser = (User)session.getAttribute("loginUser");
		}
		
		// 根据当前url自动定位顶部及左侧菜单
		String curl = request.getRequestURI().replaceFirst(request.getContextPath(), "");
		if (loginUser != null) {
			Map<String, Menu> menuMap = loginUser.getMenuMap();
			curl = generateCurl(curl, menuMap);
		}
		request.setAttribute("curl", curl);
		request.setAttribute("fullCurl", request.getRequestURI().replaceFirst(request.getContextPath(), ""));
	}
	
	private String generateCurl(String curl, Map<String, Menu> menuMap) {
		if (StringUtils.isBlank(curl)) {
			return "/";
		}
		
		if (!curl.equals("/") && curl.indexOf("/") != -1 && !menuMap.containsKey(curl)) {
			curl = curl.substring(0, curl.lastIndexOf("/"));
			return generateCurl(curl, menuMap);
		}
		return curl;
	}
	
	protected String getIp() {
		String ip = request.getHeader("X-Forwarded-For");
		if (StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)) {
			int index = ip.indexOf(",");
			if (index != -1) {
				return ip.substring(0, index);
			} else {
				return ip;
			}
		}
		ip = request.getHeader("X-Real-IP");
		if (StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)) {
			return ip;
		}
		return request.getRemoteAddr();
	}
	
	protected String extractPathFromPattern(){
        String path = (String)request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
        String bestMatchPattern = (String)request.getAttribute(HandlerMapping.BEST_MATCHING_PATTERN_ATTRIBUTE);
        return new AntPathMatcher().extractPathWithinPattern(bestMatchPattern, path);
    }
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	protected void addCookie(String name, String value, int maxAge){
	    Cookie cookie = new Cookie(name, value);
	    cookie.setPath("/");
	    if(maxAge > 0)  cookie.setMaxAge(maxAge);
	    response.addCookie(cookie);
	}
	
}
