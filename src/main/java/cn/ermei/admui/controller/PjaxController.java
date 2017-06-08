package cn.ermei.admui.controller;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PjaxController extends BaseController {

	Logger logger = Logger.getLogger(this.getClass());
	
	/**
	 * UI示例，根据是否为pjax请求，返回不同页面
	 */
	@RequestMapping(value = "/components/**", method = RequestMethod.GET)
	public ModelAndView components() {
		
		ModelAndView mv = new ModelAndView();
		String pjax = request.getHeader("X-PJAX");
		String url = extractPathFromPattern();
		
		if (StringUtils.isNotBlank(pjax) && "true".equals(pjax)) {
			mv.setViewName("examples/components/" + url);
		} else {
			mv.addObject("include", "examples/components/" + url + ".jsp");
			mv.setViewName("index");
		}
		
	    return mv;
	}
	
	/**
	 * 页面示例，根据是否为pjax请求，返回不同页面
	 */
	@RequestMapping(value = "/pages/**", method = RequestMethod.GET)
	public ModelAndView pages() {
		
		ModelAndView mv = new ModelAndView();
		String pjax = request.getHeader("X-PJAX");
		String url = extractPathFromPattern();
		
		if (StringUtils.isNotBlank(pjax) && "true".equals(pjax)) {
			mv.setViewName("examples/pages/" + url);
		} else {
			mv.addObject("include", "examples/pages/" + url + ".jsp");
			mv.setViewName("index");
		}
		
	    return mv;
	}
	
	/**
	 * 表格示例，根据是否为pjax请求，返回不同页面
	 */
	@RequestMapping(value = "/tables/**", method = RequestMethod.GET)
	public ModelAndView tables() {
		
		ModelAndView mv = new ModelAndView();
		String pjax = request.getHeader("X-PJAX");
		String url = extractPathFromPattern();
		
		if (StringUtils.isNotBlank(pjax) && "true".equals(pjax)) {
			mv.setViewName("examples/tables/" + url);
		} else {
			if (url.indexOf("data-tables/") != -1 && !url.endsWith("/index")) {
				String jspInner = url.substring(url.lastIndexOf("/") + 1, url.length());
				mv.addObject("include", "examples/tables/" + url.substring(0, url.lastIndexOf("/") + 1) + "index.jsp");
				mv.addObject("includeInner", jspInner + ".jsp");
				mv.setViewName("index");
			} else {
				mv.addObject("include", "examples/tables/" + url + ".jsp");
				mv.setViewName("index");
			}
		}
		
	    return mv;
	}
	
	/**
	 * 表单示例，根据是否为pjax请求，返回不同页面
	 */
	@RequestMapping(value = "/forms/**", method = RequestMethod.GET)
	public ModelAndView forms() {
		
		ModelAndView mv = new ModelAndView();
		String pjax = request.getHeader("X-PJAX");
		String url = extractPathFromPattern();
		
		if (StringUtils.isNotBlank(pjax) && "true".equals(pjax)) {
			mv.setViewName("examples/forms/" + url);
		} else {
			mv.addObject("include", "examples/forms/" + url + ".jsp");
			mv.setViewName("index");
		}
		
	    return mv;
	}
	
	/**
	 * 数据统计，根据是否为pjax请求，返回不同页面
	 */
	@RequestMapping(value = "/charts/**", method = RequestMethod.GET)
	public ModelAndView charts() {
		
		ModelAndView mv = new ModelAndView();
		String pjax = request.getHeader("X-PJAX");
		String url = extractPathFromPattern();
		
		if (StringUtils.isNotBlank(pjax) && "true".equals(pjax)) {
			mv.setViewName("examples/charts/" + url);
		} else {
			mv.addObject("include", "examples/charts/" + url + ".jsp");
			mv.setViewName("index");
		}
		
	    return mv;
	}
	
}
