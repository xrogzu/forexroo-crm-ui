package cn.ermei.admui.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ermei.admui.entity.Message;
import cn.ermei.admui.entity.Role;
import cn.ermei.admui.entity.User;
import cn.ermei.admui.enums.MessageType;
import cn.ermei.admui.exception.DuplicateLoginNameException;
import cn.ermei.admui.service.LogService;
import cn.ermei.admui.service.MessageService;
import cn.ermei.admui.service.UserService;
import cn.ermei.admui.util.Md5Utils;
import cn.ermei.admui.vo.LogVo;
import cn.ermei.admui.vo.MessageVo;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

	Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private UserService userService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private LogService logService;
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> save(User user) {
		
		boolean add = false;
		if (user.getUserId() == null) {
			add = true;
		}
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			user.setCreateUser(loginUser);
			user.setUpdateUser(loginUser);
			userService.saveUser(user);
			jsonMap.put("success", true);
			jsonMap.put("msg", "修改成功！");
			if (add) {
				user.setCreateTime(new Date());
				user.setLoginCount(0L);
				jsonMap.put("user", user);
				jsonMap.put("msg", "添加成功！");
			} else {
				// sendMsg 示例
				Message msg = new Message();
				msg.setUserId(user.getUserId());
				msg.setTitle("您的账户信息已修改。");
				msg.setContent("管理员修改了您的账户信息。");
				msg.setType(MessageType.SYSTEM);
				messageService.sendMsg(msg);
			}
		} catch (DuplicateLoginNameException e) {
			jsonMap.put("msg", e.getMessage());
			logger.error("保存用户失败！", e);
		} catch (Exception e) {
			jsonMap.put("msg", "服务器繁忙，请稍后再试！");
			logger.error("保存用户失败！", e);
		}
		return jsonMap;
	}
	
	@RequestMapping(value = "/role", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> role(Long userId) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			List<Role> roleList = userService.queryRole(userId);
			jsonMap.put("success", true);
			jsonMap.put("auth", roleList);
		} catch (Exception e) {
			logger.error("获取用户角色失败！", e);
		}
		
		return jsonMap;
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(Long[] userId) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			userService.deleteUser(userId);
			jsonMap.put("success", true);
		} catch (Exception e) {
			logger.error("删除用户失败！", e);
		}
		
		return jsonMap;
	}
	
	@RequestMapping(value = "/forbid", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> forbid(Long[] userId) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			userService.forbid(userId);
			jsonMap.put("success", true);
		} catch (Exception e) {
			logger.error("禁用用户失败！", e);
		}
		
		return jsonMap;
	}
	
	@RequestMapping(value = "/check", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> check(String oldPwd) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			User user = new User();
			user.setLoginName(loginUser.getLoginName());
			user.setPassword(oldPwd);
			if (userService.checkPassword(user)) {
				jsonMap.put("success", true);
			} else {
				jsonMap.put("success", false);
			}
		} catch (Exception e) {
			jsonMap.put("success", false);
			logger.error("校验用户对应密码失败！", e);
		}
		
		return jsonMap;
	}
	
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> changePassword(User user) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			if (StringUtils.isNotBlank(user.getPassword())) {
				user.setUserId(loginUser.getUserId());
				user.setPassword(Md5Utils.hash(user.getPassword()));
				user.setUpdateUser(loginUser);
				userService.update(user);
				jsonMap.put("success", true);
			}
		} catch (Exception e) {
			logger.error("修改密码失败！", e);
		}
		
		return jsonMap;
	}
	
	@RequestMapping(value = "/account", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> account() {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			MessageVo msgVo = new MessageVo();
			msgVo.setUserId(loginUser.getUserId());
			int msgCount = messageService.getCountByUser(msgVo);
			
			LogVo logVo = new LogVo();
			logVo.setUser(loginUser);
			int logCount = logService.getCount(logVo);
			
			jsonMap.put("success", true);
			jsonMap.put("msgCount", msgCount);
			jsonMap.put("logCount", logCount);
		} catch (Exception e) {
			logger.error("获取账户信息失败！", e);
		}
		
		return jsonMap;
	}
	
}
