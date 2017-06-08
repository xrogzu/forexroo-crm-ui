package cn.ermei.admui.controller;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cn.ermei.admui.entity.Menu;
import cn.ermei.admui.exception.InitMenuException;
import cn.ermei.admui.service.MenuService;

@Controller
public class IndexController extends BaseController {

	Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private MenuService menuService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
	    return mv;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		mv.addObject("include", "examples/home.jsp");
		
	    return mv;
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView home() {
		
		ModelAndView mv = new ModelAndView();
		String pjax = request.getHeader("X-PJAX");
		
		if (StringUtils.isNotBlank(pjax) && "true".equals(pjax)) {
			mv.setViewName("examples/home");
		} else {
			mv.addObject("include", "examples/home.jsp");
			mv.setViewName("index");
		}
		
	    return mv;
	}
	
	/**
	 * 首页-日志，根据是否为pjax请求，返回不同页面
	 */
	@RequestMapping(value = "/account/log", method = RequestMethod.GET)
	public ModelAndView accountLog() {
		
		ModelAndView mv = new ModelAndView();
		String pjax = request.getHeader("X-PJAX");
		
		if (StringUtils.isNotBlank(pjax) && "true".equals(pjax)) {
			mv.addObject("includeInner", "../log-table.jsp");
			mv.setViewName("system/account/index");
		} else {
			mv.addObject("include", "system/account/index.jsp");
			mv.addObject("includeInner", "../log-table.jsp");
			mv.setViewName("index");
		}
		
	    return mv;
	}
	
	/**
	 * 首页-修改密码，根据是否为pjax请求，返回不同页面
	 */
	@RequestMapping(value = "/account/password", method = RequestMethod.GET)
	public ModelAndView accountPassword() {
		
		ModelAndView mv = new ModelAndView();
		String pjax = request.getHeader("X-PJAX");
		
		if (StringUtils.isNotBlank(pjax) && "true".equals(pjax)) {
			mv.addObject("includeInner", "password.jsp");
			mv.setViewName("system/account/index");
		} else {
			mv.addObject("include", "system/account/index.jsp");
			mv.addObject("includeInner", "password.jsp");
			mv.setViewName("index");
		}
		
	    return mv;
	}
	
	@RequestMapping(value = "/menu", method = RequestMethod.GET)
	public ModelAndView menu() {
		
		ModelAndView mv = new ModelAndView();
		String pjax = request.getHeader("X-PJAX");
		
		if (StringUtils.isNotBlank(pjax) && "true".equals(pjax)) {
			mv.setViewName("examples/menu");
		} else {
			mv.addObject("include", "examples/menu.jsp");
			mv.setViewName("index");
		}
		
	    return mv;
	}
	
	@RequestMapping(value = "/sitemap", method = RequestMethod.GET)
	public ModelAndView sitemap() {
		
		ModelAndView mv = new ModelAndView();
		String pjax = request.getHeader("X-PJAX");
		
		try {
			List<Menu> menuList = menuService.queryHierarchical(loginUser);
			mv.addObject("menuList", menuList);
		} catch (InitMenuException e) {
		}
		
		if (StringUtils.isNotBlank(pjax) && "true".equals(pjax)) {
			mv.setViewName("site-map");
		} else {
			mv.addObject("include", "site-map.jsp");
			mv.setViewName("index");
		}
		
	    return mv;
	}
	
	@RequestMapping(value = "/noauth", method = RequestMethod.GET)
	public ModelAndView noauth() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("examples/errors/no-auth");
		
	    return mv;
	}
	
	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public ModelAndView error() {
		
		ModelAndView mv = new ModelAndView();
		String pjax = request.getHeader("X-PJAX");
		
		if (StringUtils.isNotBlank(pjax) && "true".equals(pjax)) {
			mv.setViewName("includes/error");
		} else {
			mv.addObject("include", "includes/error.jsp");
			mv.setViewName("index");
		}
		
	    return mv;
	}
	
	@RequestMapping(value = "/maintenance", method = RequestMethod.GET)
	public ModelAndView maintenance() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("examples/errors/maintenance");
		
	    return mv;
	}
	
	@RequestMapping(value = "/locked", method = RequestMethod.GET)
	public ModelAndView locked() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("locked");
		
	    return mv;
	}
	
}
