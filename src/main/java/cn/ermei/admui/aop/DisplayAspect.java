package cn.ermei.admui.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import cn.ermei.admui.entity.Display;
import cn.ermei.admui.entity.User;
import cn.ermei.admui.service.DisplayService;

/**
 * 显示Aspect
 * @author dk
 */
@Component
@Aspect
public class DisplayAspect {

	Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private DisplayService displayService;

	/**
	 * controller层切点
	 */
	@Pointcut("execution(* cn.ermei.admui.controller..*(..))")
	private void aspect() {}

	/**
     * <p>前置通知，只拦截所有带了RequestMapping的方法</p>
     *
     * @param joinPoint  切入点对象，可以无该参数
     */
	@Before("aspect() && @annotation(org.springframework.web.bind.annotation.RequestMapping)")
	public void before(JoinPoint joinPoint) {
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
		HttpSession session = request.getSession(false);
		
		Display display = null;
		if (session != null && session.getAttribute("loginUser") != null) {
			User user = (User)session.getAttribute("loginUser");
			display = displayService.queryByUser(user.getUserId());
		} else {
			display = displayService.queryGlobal();
		}
		request.setAttribute("display", display);
		
	}

}
