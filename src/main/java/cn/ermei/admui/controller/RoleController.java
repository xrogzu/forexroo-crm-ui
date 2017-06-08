package cn.ermei.admui.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ermei.admui.entity.Menu;
import cn.ermei.admui.entity.Role;
import cn.ermei.admui.entity.User;
import cn.ermei.admui.exception.InitMenuException;
import cn.ermei.admui.service.MenuService;
import cn.ermei.admui.service.RoleService;

@Controller
@RequestMapping("/role")
public class RoleController extends BaseController {

	Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private MenuService menuService;
	@Autowired
	private RoleService roleService;
	
	@RequestMapping(value = "/menus", method = RequestMethod.GET)
	@ResponseBody
	public List<Menu> menus(Role role) {
		
		List<Menu> menuList = null;
		try {
			menuList = menuService.queryHierarchical(role);
		} catch (InitMenuException e) {
			logger.error(e.getMessage(), e);
		}
		
		return menuList;
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> save(Role role) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			boolean add = false;
			if (role.getRoleId() == null) {
				add = true;
			}
			role.setCreateUser(loginUser);
			role.setUpdateUser(loginUser);
			roleService.save(role);
			jsonMap.put("success", true);
			if (add) {
				jsonMap.put("id", role.getRoleId());
			}
		} catch (Exception e) {
			logger.error("角色保存失败！", e);
		}
		
		return jsonMap;
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(Long roleId) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			roleService.deleteRole(roleId);
			jsonMap.put("success", true);
		} catch (Exception e) {
			logger.error("角色删除失败！", e);
		}
		
		return jsonMap;
	}
	
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> user(Long roleId) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			List<User> userList = roleService.queryUser(roleId);
			jsonMap.put("success", true);
			jsonMap.put("data", userList);
		} catch (Exception e) {
			logger.error("获取角色对应用户失败！", e);
		}
		return jsonMap;
	}
}
