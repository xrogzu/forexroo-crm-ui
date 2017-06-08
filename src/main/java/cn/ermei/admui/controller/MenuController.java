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
import cn.ermei.admui.enums.OperateType;
import cn.ermei.admui.service.MenuService;
import cn.ermei.admui.service.RoleService;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/menu")
public class MenuController extends BaseController {

	Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private MenuService menuService;
	@Autowired
	private RoleService roleService;
	
	@RequestMapping(value = "/all", method = RequestMethod.GET)
	@ResponseBody
	public List<Menu> all() {
		
		List<Menu> menuList = menuService.queryAll();
		return menuList;
	}
	
	@RequestMapping(value = "/roles", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> roles(Menu menu) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			List<Role> roleList = roleService.queryRole(menu);
			jsonMap.put("success", true);
			jsonMap.put("auth", roleList);
		} catch (Exception e) {
			logger.error("获取菜单角色失败！", e);
		}
		return jsonMap;
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> save() {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		mapper.setSerializationInclusion(Include.NON_EMPTY); // 非null及非""
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT); // "" as null Obj
		mapper.enable(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY); // single Obj as array
		
		JavaType javaType = mapper.getTypeFactory().constructCollectionType(List.class, Menu.class);
		try {
			String jsonStr = request.getParameter("menu");
			logger.debug(jsonStr);
			List<Menu> menuList = mapper.readValue(jsonStr, javaType);
			menuService.saveAll(menuList, loginUser);
			jsonMap.put("success", true);
			
			// 新增顶部菜单时，返回菜单的id和layer
			if (menuList.get(0).getParentId() == 0 && OperateType.add.equals(menuList.get(0).getType())) {
				jsonMap.put("id", menuList.get(0).getMenuId());
				jsonMap.put("layer", menuList.get(0).getLayer());
			}
		} catch (Exception e) {
			logger.error("菜单保存失败！", e);
		}
		
		return jsonMap;
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(Menu menu) {
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			menuService.deleteMenu(menu);
			jsonMap.put("success", true);
		}  catch (Exception e) {
			logger.error("菜单删除失败！", e);
			jsonMap.put("msg", "菜单删除失败！");
		}
		return jsonMap;
	}
	
	@RequestMapping(value = "/updateTopOrder", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateTopOrder(String topMenus) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.setSerializationInclusion(Include.NON_EMPTY); // 非null及非""
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT); // "" as null Obj
		mapper.enable(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY); // single Obj as array
		
		JavaType javaType = mapper.getTypeFactory().constructCollectionType(List.class, Menu.class);
		
		try {
			List<Menu> topMenuList = mapper.readValue(topMenus, javaType);
			menuService.updateTopOrder(topMenuList);
			jsonMap.put("success", true);
		} catch (Exception e) {
			logger.error("更改顶部菜单顺序失败！", e);
		}
		return jsonMap;
	}
	
}
