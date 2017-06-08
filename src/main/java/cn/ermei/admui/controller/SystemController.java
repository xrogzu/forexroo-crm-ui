package cn.ermei.admui.controller;

import java.awt.Font;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cn.ermei.admui.entity.Blacklist;
import cn.ermei.admui.entity.Display;
import cn.ermei.admui.entity.LogConfig;
import cn.ermei.admui.entity.Menu;
import cn.ermei.admui.entity.Role;
import cn.ermei.admui.entity.User;
import cn.ermei.admui.exception.InitMenuException;
import cn.ermei.admui.service.BlacklistService;
import cn.ermei.admui.service.DisplayService;
import cn.ermei.admui.service.LogService;
import cn.ermei.admui.service.MenuService;
import cn.ermei.admui.service.RoleService;
import cn.ermei.admui.service.UserService;
import cn.ermei.admui.util.Md5Utils;
import cn.ermei.admui.vo.UserVo;

import com.xinguang.xvcode.generator.Generator;
import com.xinguang.xvcode.generator.PngVCGenerator;

@Controller
@RequestMapping("/system")
public class SystemController extends BaseController {

	Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private MenuService menuService;
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private LogService logService;
	@Autowired
	private BlacklistService blacklistService;
	@Autowired
	private DisplayService displayService;

	/**
	 * 用户名密码登录认证
	 */
	@RequestMapping(value = "/loginValidate")
	public ModelAndView loginValidate(UserVo user, RedirectAttributes attr) {
		
		ModelAndView mv = new ModelAndView();
		user.setLastLoginIp(getIp());
		if (blacklistService.queryByIp(user.getLastLoginIp()) != null) {
			mv.setViewName("redirect:/noauth");
			return mv;
		}
		
		if (session.getAttribute("validCode") != null
				&& (StringUtils.isBlank(user.getValidCode())
						|| !user.getValidCode().equalsIgnoreCase((String)session.getAttribute("validCode")))) {
			attr.addFlashAttribute("message", "验证码错误！");
			mv.setViewName("redirect:/login");
			return mv;
		}
		
		if (StringUtils.isBlank(user.getLoginType())) {
			user.setPassword(Md5Utils.hash(user.getPassword()));
		}
		
		boolean result = userService.login(user);
		if (result) {
			try {
				List<Menu> menuList = menuService.queryHierarchical(user);
				user.setMenus(menuList);
				user.setMenuMap(menuService.buildMenuMap(menuService.query(user)));
				session.setAttribute("loginUser", user);
			    mv.setViewName("redirect:/");
			    if (StringUtils.isNotBlank(user.getRemember())) {
					addUserCookie(user);
				}
			} catch (InitMenuException e) {
				attr.addFlashAttribute("message", e.getMessage());
				mv.setViewName("redirect:/login");
			}
		} else {
			attr.addFlashAttribute("message", "用户名或密码错误！");
			mv.setViewName("redirect:/login");
		}
	    return mv;
	}
	
	/**
	 * 退出
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout() {
		
		session.invalidate();
		addCookie("ckLoginName", "", 60);
		addCookie("ckPassword", "", 60);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/login");
		
	    return mv;
	}
	
	/**
	 * 菜单管理，根据是否为pjax请求，返回不同页面
	 */
	@RequestMapping(value = "/menu", method = RequestMethod.GET)
	public ModelAndView menu() {
		
		ModelAndView mv = new ModelAndView();
		String pjax = request.getHeader("X-PJAX");
		
		if (StringUtils.isNotBlank(pjax) && "true".equals(pjax)) {
			mv.setViewName("system/menu");
		} else {
			mv.addObject("include", "system/menu.jsp");
			mv.setViewName("index");
		}
		
	    return mv;
	}
	
	/**
	 * 用户管理，根据是否为pjax请求，返回不同页面
	 */
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public ModelAndView user() {
		
		ModelAndView mv = new ModelAndView();
		String pjax = request.getHeader("X-PJAX");
		
		int total = userService.getTotal();
		List<Role> roleList = roleService.queryRoleUserCount();
		List<User> userList = userService.queryAll();
		mv.addObject("total", total);
		mv.addObject("roleList", roleList);
		mv.addObject("userList", userList);
		
		if (StringUtils.isNotBlank(pjax) && "true".equals(pjax)) {
			mv.setViewName("system/user");
		} else {
			mv.addObject("include", "system/user.jsp");
			mv.setViewName("index");
		}
		
	    return mv;
	}
	
	/**
	 * 日志信息，根据是否为pjax请求，返回不同页面
	 */
	@RequestMapping(value = "/log", method = RequestMethod.GET)
	public ModelAndView log() {
		
		ModelAndView mv = new ModelAndView();
		String pjax = request.getHeader("X-PJAX");
		
		List<LogConfig> configList = logService.queryAllConfig();
		List<User> userList = userService.queryAll();
		mv.addObject("configList", configList);
		mv.addObject("userList", userList);
		
		if (StringUtils.isNotBlank(pjax) && "true".equals(pjax)) {
			mv.setViewName("system/log");
		} else {
			mv.addObject("include", "system/log.jsp");
			mv.setViewName("index");
		}
		
	    return mv;
	}
	
	/**
	 * 黑名单，根据是否为pjax请求，返回不同页面
	 */
	@RequestMapping(value = "/blacklist", method = RequestMethod.GET)
	public ModelAndView blacklist() {
		
		ModelAndView mv = new ModelAndView();
		String pjax = request.getHeader("X-PJAX");
		
		List<Blacklist> blList = blacklistService.queryAll();
		mv.addObject("blList", blList);
		
		if (StringUtils.isNotBlank(pjax) && "true".equals(pjax)) {
			mv.setViewName("system/blacklist");
		} else {
			mv.addObject("include", "system/blacklist.jsp");
			mv.setViewName("index");
		}
		
	    return mv;
	}
	
	/**
	 * 账户信息，根据是否为pjax请求，返回不同页面
	 */
	@RequestMapping(value = "/account", method = RequestMethod.GET)
	public ModelAndView account() {
		
		ModelAndView mv = new ModelAndView();
		String pjax = request.getHeader("X-PJAX");
		
		if (StringUtils.isNotBlank(pjax) && "true".equals(pjax)) {
			mv.setViewName("system/account/index");
		} else {
			mv.addObject("include", "system/account/index.jsp");
			mv.setViewName("index");
		}
		mv.addObject("includeInner", "message.jsp");
		
	    return mv;
	}
	
	/**
	 * 账户信息-消息，根据是否为pjax请求，返回不同页面
	 */
	@RequestMapping(value = "/account/message", method = RequestMethod.GET)
	public ModelAndView accountMessage(String from) {
		
		ModelAndView mv = new ModelAndView();
		String pjax = request.getHeader("X-PJAX");
		
		if (StringUtils.isNotBlank(pjax) && "true".equals(pjax)) {
			if (StringUtils.isNotBlank(from) && "account".equals(from)) {
				mv.setViewName("system/account/message");
			} else {
				mv.addObject("includeInner", "message.jsp");
				mv.setViewName("system/account/index");
			}
		} else {
			mv.addObject("include", "system/account/index.jsp");
			mv.addObject("includeInner", "message.jsp");
			mv.setViewName("index");
		}
		
	    return mv;
	}
	
	/**
	 * 账户信息-日志，根据是否为pjax请求，返回不同页面
	 */
	@RequestMapping(value = "/account/log", method = RequestMethod.GET)
	public ModelAndView accountLog(String from) {
		
		ModelAndView mv = new ModelAndView();
		String pjax = request.getHeader("X-PJAX");
		
		if (StringUtils.isNotBlank(pjax) && "true".equals(pjax)) {
			if (StringUtils.isNotBlank(from)) {
				mv.setViewName("system/log-table");
			} else {
				mv.addObject("includeInner", "../log-table.jsp");
				mv.setViewName("system/account/index");
			}
		} else {
			mv.addObject("include", "system/account/index.jsp");
			mv.addObject("includeInner", "../log-table.jsp");
			mv.setViewName("index");
		}
		
	    return mv;
	}
	
	/**
	 * 账户信息-密码，根据是否为pjax请求，返回不同页面
	 */
	@RequestMapping(value = "/account/password", method = RequestMethod.GET)
	public ModelAndView accountPassword(String from) {
		
		ModelAndView mv = new ModelAndView();
		String pjax = request.getHeader("X-PJAX");
		
		if (StringUtils.isNotBlank(pjax) && "true".equals(pjax)) {
			if (StringUtils.isNotBlank(from)) {
				mv.setViewName("system/account/password");
			} else {
				mv.addObject("includeInner", "password.jsp");
				mv.setViewName("system/account/index");
			}
		} else {
			mv.addObject("include", "system/account/index.jsp");
			mv.addObject("includeInner", "password.jsp");
			mv.setViewName("index");
		}
		
	    return mv;
	}
	
	/**
	 * 账户信息-显示，根据是否为pjax请求，返回不同页面
	 */
	@RequestMapping(value = "/account/display", method = RequestMethod.GET)
	public ModelAndView accountDisplay(String from) {
		
		ModelAndView mv = new ModelAndView();
		String pjax = request.getHeader("X-PJAX");
		
		Display userDisplay = displayService.queryByUser(loginUser.getUserId());
		mv.addObject("userDisplay", userDisplay);
		
		if (StringUtils.isNotBlank(pjax) && "true".equals(pjax)) {
			if (StringUtils.isNotBlank(from)) {
				mv.setViewName("system/settings/display");
			} else {
				mv.addObject("includeInner", "../settings/display.jsp");
				mv.setViewName("system/account/index");
			}
		} else {
			mv.addObject("include", "system/account/index.jsp");
			mv.addObject("includeInner", "../settings/display.jsp");
			mv.setViewName("index");
		}
		
	    return mv;
	}
	
	/**
	 * 显示设置，根据是否为pjax请求，返回不同页面
	 */
	@RequestMapping(value = "/settings/display", method = RequestMethod.GET)
	public ModelAndView settingsDisplay() {
		
		ModelAndView mv = new ModelAndView();
		String pjax = request.getHeader("X-PJAX");
		
		Display globalDisplay = displayService.queryGlobal();
		mv.addObject("globalDisplay", globalDisplay);
		
		if (StringUtils.isNotBlank(pjax) && "true".equals(pjax)) {
			mv.setViewName("system/settings/display");
		} else {
			mv.addObject("include", "system/settings/display.jsp");
			mv.setViewName("index");
		}
		
	    return mv;
	}
	
	/**
	 * 日志设置，根据是否为pjax请求，返回不同页面
	 */
	@RequestMapping(value = "/settings/log", method = RequestMethod.GET)
	public ModelAndView settingsLog() {
		
		ModelAndView mv = new ModelAndView();
		String pjax = request.getHeader("X-PJAX");
		
		List<LogConfig> configList = logService.queryAllConfig();
		mv.addObject("configList", configList);
		
		if (StringUtils.isNotBlank(pjax) && "true".equals(pjax)) {
			mv.setViewName("system/settings/log");
		} else {
			mv.addObject("include", "system/settings/log.jsp");
			mv.setViewName("index");
		}
		
	    return mv;
	}
	
	@RequestMapping(value = "/captcha", method = RequestMethod.GET)
	public void captcha() {
		
        Integer height = 80;
        Integer width = 240;
        Integer count = 4;
        Font font = new Font("Arial", Font.ITALIC | Font.BOLD, 56); // 字体
        
        Generator generator = new PngVCGenerator(width, height, count, font);
        response.setContentType("image/png");
        OutputStream stream = null;
		try {
			stream = response.getOutputStream();
			generator.write2out(stream);
	        stream.flush();
	        stream.close();
	        String validCode = generator.text();
	        session.setAttribute("validCode", validCode);
		} catch (IOException e) {
			logger.error("获取登录验证码失败！", e);
		}
	}
	
	private void addUserCookie(User user) {
		addCookie("ckLoginName", user.getLoginName(), 30*24*60*60);
		addCookie("ckPassword", user.getPassword(), 30*24*60*60);
	}
	
	
}
