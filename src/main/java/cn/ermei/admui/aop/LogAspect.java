package cn.ermei.admui.aop;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import cn.ermei.admui.entity.Log;
import cn.ermei.admui.entity.LogConfig;
import cn.ermei.admui.entity.User;
import cn.ermei.admui.service.LogService;
import cn.ermei.admui.util.Md5Utils;

/**
 * 日志Aspect
 * @author dk
 */
@Component
@Aspect
public class LogAspect {

	Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private LogService logService;

	/**
	 * controller层切点
	 */
	@Pointcut("execution(* cn.ermei.admui.controller..*(..))")
	private void aspect() {}

	/**
     * <p>返回后通知，只拦截所有带了RequestMapping的方法</p>
     *
     * @param joinPoint  切入点对象，可以无该参数
     */
	@AfterReturning("aspect() && @annotation(org.springframework.web.bind.annotation.RequestMapping)")
	public void afterReturning(JoinPoint joinPoint) {
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
		String currentURL = request.getRequestURI();
		HttpSession session = request.getSession(false);
		
		// 根据sys_log_config配置表记录判断是否记录日志
		List<LogConfig> configs = logService.queryAllConfig();
		if (configs != null && !configs.isEmpty()) {
			for (LogConfig logConfig : configs) {
				if (currentURL.indexOf(logConfig.getUrl()) != -1) {
					Log log = new Log();
					log.setUrl(logConfig.getUrl());
					log.setType(logConfig.getType());
					
					// 记录参数
					String str = "[";
					String pName = null;
					String pValue = null;
					Enumeration<?> e = request.getParameterNames();
					while (e.hasMoreElements()) {
						pName = e.nextElement().toString();
						if (pName.equals("password")) {
							pValue = Md5Utils.hash(request.getParameter(pName));
						} else {
							pValue = request.getParameter(pName);
						}
						str += pName + "=" + pValue + " ";
					}
					log.setParams(str + "]");
					
					// 记录操作用户
					if (session != null && session.getAttribute("loginUser") != null) {
						User user = (User)session.getAttribute("loginUser");
						log.setUser(user);
						log.setUserIp(user.getLastLoginIp());
					}
					
					logService.save(log);
					break;
				}
			}
		}
		
	}

}
