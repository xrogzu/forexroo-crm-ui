package cn.ermei.admui.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.ermei.admui.entity.Menu;
import cn.ermei.admui.entity.MenuState;
import cn.ermei.admui.entity.Role;
import cn.ermei.admui.entity.User;
import cn.ermei.admui.enums.OperateType;
import cn.ermei.admui.exception.InitMenuException;
import cn.ermei.admui.mapper.BaseMapper;
import cn.ermei.admui.mapper.MenuMapper;
import cn.ermei.admui.service.MenuService;
import cn.ermei.admui.service.RoleService;

/**
 * 菜单Service实现
 * @author dk
 */

@Service
@Transactional
public class MenuServiceImpl extends BaseServiceImpl<Menu> implements MenuService {

	@Autowired
	private RoleService roleService;
	@Autowired
	private MenuMapper mapper;

	/**
     * <p>菜单层级的最大深度</p>
     *
     * <pre>
     * Admui最多支持5级菜单
     * </pre>
     */
	private static final int MENU_LAYER_LIMIT = 5;
	
	@Override
	protected BaseMapper<Menu> getMapper() {
		return mapper;
	}

	@Override
	@Transactional(readOnly = true)
	public List<Menu> queryHierarchical(User user) throws InitMenuException {
		
		List<Menu> menuTree = new ArrayList<Menu>();
		List<Menu> menuList = mapper.queryByUser(user);
		
		// 检查授权菜单是否为空
		if (menuList == null || menuList.isEmpty()) {
			throw new InitMenuException("当前用户未授权任何菜单！");
		}
		
		List<Menu> rootMenus = getRootMenus(menuList);
		for (Menu rootMenu : rootMenus) {
			buildChildMenus(rootMenu, menuList);
			menuTree.add(rootMenu);
		}
		
		return menuTree;
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<Menu> queryHierarchical(Role role) throws InitMenuException {
		
		List<Menu> menuTree = new ArrayList<Menu>();
		List<Menu> menuList = mapper.queryByRole(role);
		
		// 检查授权菜单是否为空
		if (menuList == null || menuList.isEmpty()) {
			throw new InitMenuException("当前角色未授权任何菜单！");
		}
		
		List<Menu> rootMenus = getRootMenus(menuList);
		for (Menu rootMenu : rootMenus) {
			buildChildMenus(rootMenu, menuList);
			menuTree.add(rootMenu);
		}
		
		return menuTree;
	}
	
	/**
     * <p>获取所有根菜单</p>
     *
     * @param   menus  在此菜单列表中获取所有根菜单
     * @return  符合根菜单条件的菜单List，List可能为empty
     */
	private List<Menu> getRootMenus(List<Menu> menus) {
		
		List<Menu> rootMenus = new ArrayList<Menu>();
		for (Menu menu : menus) {
			if (menu.getParentId() == 0) {
				rootMenus.add(menu);
			}
		}
		
		return rootMenus;
	}

	/**
     * <p>递归组装子菜单</p>
     *
     * @param  parentMenu  组装此菜单的子菜单
     * @param  menus  used for {@link #getChildMenus(Menu, List)}
     * @return 符合子菜单条件的菜单List，List可能为empty
     */
	private void buildChildMenus(Menu parentMenu, List<Menu> menus) {
		
		List<Menu> childMenus = getChildMenus(parentMenu, menus);
		if (!childMenus.isEmpty()) {
			parentMenu.setMenus(childMenus);
			for (Menu child : childMenus) {
				buildChildMenus(child, menus);
			}
		} else {
			if (parentMenu.getPermission() != null && parentMenu.getPermission()) {
				MenuState state = new MenuState();
				state.setSelected(true);
				parentMenu.setState(state);
			}
		}
	}
	
	/**
     * <p>获取父菜单下所有的子菜单</p>
     *
     * @param  parentMenu  获取此菜单下所有的子菜单
     * @param  menus  从此菜单List中获取符合条件的菜单
     * @return 符合子菜单条件的菜单List，List可能为empty
     */
	private List<Menu> getChildMenus(Menu parentMenu, List<Menu> menus) {
		
		List<Menu> childMenus = new ArrayList<Menu>();
		for (Menu menu : menus) {
			if (menu.getParentId().equals(parentMenu.getMenuId())) {
				childMenus.add(menu);
			}
		}
		return childMenus;
	}

	@Override
	public List<Menu> query(User user) throws InitMenuException {
		
		List<Menu> menuList = mapper.queryByUser(user);
		
		// 检查授权菜单是否为空
		if (menuList == null || menuList.isEmpty()) {
			throw new InitMenuException("当前用户未授权任何菜单！");
		}
		
		// 检查layer数据合法性
		for (Menu menu : menuList) {
			if (menu.getLayer().length() > MENU_LAYER_LIMIT * 2) {
				throw new InitMenuException("菜单layer长度超出最大限度！");
			}
			if (menu.getLayer().length() % 2 != 0) {
				throw new InitMenuException("菜单layer格式有误！");
			}
		}
		
		return menuList;
	}

	@Override
	public List<Menu> queryAll() {
		
		List<Menu> menuTree = new ArrayList<Menu>();
		List<Menu> menuList = mapper.queryAll();
		
		List<Menu> rootMenus = getRootMenus(menuList);
		for (Menu rootMenu : rootMenus) {
			buildChildMenus(rootMenu, menuList);
			menuTree.add(rootMenu);
		}
		
		return menuTree;
	}

	@Override
	public void saveAll(List<Menu> menuList, User user) {
		
		List<Menu> list = new ArrayList<Menu>();
		if (menuList != null && !menuList.isEmpty()) {
			// 此处menu一定是顶部(一级)菜单
			for (Menu menu : menuList) {
				menu.setCreateUser(user);
				menu.setUpdateUser(user);
				menu.setParentId(0L);
				menu.setRank(1);
				// 新增的顶部(一级)菜单需要生成layer
				if (OperateType.add.equals(menu.getType())) {
					menu.setLayer(generateFirstLayer());
				}
				rebuildList(menu, list);
			}
		}
		
		Map<String, Menu> layerMap = new HashMap<String, Menu>();
		for (Menu menu: list) {
			if (menu.getType() != null) {
				if (OperateType.add.equals(menu.getType())) {
					// 用map将新增的顶部(一级)菜单的menuId置入子菜单parentId
					if (menu.getParentId() == null) {
						menu.setParentId(layerMap.get(menu.getLayer().substring(0, menu.getLayer().length() - 2)).getMenuId());
					}
					
					// 保存菜单
					mapper.save(menu);
					layerMap.put(menu.getLayer(), menu);
					
					// 保存菜单授权
					if (menu.getRoles() != null && !menu.getRoles().isEmpty()) {
						Map<String, Object> paraMap = null;
						for (Role role : menu.getRoles()) {
							paraMap = new HashMap<String, Object>();
							paraMap.put("menuId", menu.getMenuId());
							paraMap.put("roleId", role.getRoleId());
							mapper.saveMenuRole(paraMap);
						}
					}
				} else if (OperateType.update.equals(menu.getType())) {
					// 更新菜单
					mapper.update(menu);
					
					// 保存菜单授权
					if (menu.getRoles() != null && !menu.getRoles().isEmpty()) {
						// 删除菜单授权
						mapper.deleteMenuRole(menu);
						Map<String, Object> paraMap = null;
						for (Role role : menu.getRoles()) {
							paraMap = new HashMap<String, Object>();
							paraMap.put("menuId", menu.getMenuId());
							paraMap.put("roleId", role.getRoleId());
							mapper.saveMenuRole(paraMap);
						}
					}
				} else if (OperateType.delete.equals(menu.getType())) {
					// 删除菜单授权
					mapper.deleteMenuRole(menu);
					// 删除菜单
					mapper.delete(menu.getMenuId());
				}
			}
		}
		
	}

	/**
     * <p>递归将菜单及其子菜单置入list</p>
     * 
     * <pre>
     * 子菜单继承父菜单type
     * 子菜单自动生成layer
     * </pre>
     * @param  menu
     * @param  list
     */
	private void rebuildList(Menu menu, List<Menu> list) {
		
		if (menu != null) {
			list.add(menu);
			if (menu.getMenus() != null && !menu.getMenus().isEmpty()) {
				Menu m = null;
				String layer = "";
				OperateType type = null;
				for (int i = 0 ; i < menu.getMenus().size(); i++) {
					m = menu.getMenus().get(i);
					// 同级菜单顺序发生变化，他的兄弟菜单和子菜单均需要一起重新生成
					if (m.getType() != null) {
						type = OperateType.update;
					}
					
					if (i < 9) {
						layer = menu.getLayer() + "0" + (i+1);
					} else {
						layer = menu.getLayer() + (i+1);
					}
					m.setLayer(layer); // 根据顶部菜单生成并设置layer
					m.setParentId(menu.getMenuId());
					m.setCreateUser(menu.getCreateUser());
					m.setUpdateUser(menu.getUpdateUser());
					// 如果父菜单有操作（type不为null）并且当前菜单没有操作（type为null），所有子菜单继承父菜单type
					if (menu.getType() != null && m.getType() == null) {
						m.setType(menu.getType());
					}
					
					if (m.getType() == null && type != null) {
						m.setType(type);
					}
					rebuildList(m, list);
				}
			}
		}
	}

	@Override
	public String generateFirstLayer() {
		
		String layer = mapper.generateFirstLayer();
		if (layer.length() == 1) {
			layer = "0" + layer;
		}
		return layer;
	}

	@Override
	public Map<String, Menu> buildMenuMap(List<Menu> menuList) {

		Map<String, Menu> menuMap = new HashMap<String, Menu>();
		for (Menu menu : menuList) {
			if (StringUtils.isNotBlank(menu.getUrl())) {
				menuMap.put(menu.getUrl(), menu);
			}
		}
		return menuMap;
	}

	@Override
	public void deleteMenu(Menu menu) {
		roleService.deleteMenuRole(menu);
		mapper.deleteMenu(menu);
	}

	@Override
	public void updateTopOrder(List<Menu> topMenus) {
		for (Menu menu : queryTop()) {
			for (Menu topMenu : topMenus) {
				if (menu.getMenuId().equals(topMenu.getMenuId())) {
					if (topMenu.getOrderNo().length() == 1) {
						topMenu.setOrderNo("0" + topMenu.getOrderNo());
					}
					topMenu.setOriginalOrderNo(menu.getLayer().substring(0, 2) + "%");
					topMenu.setIds(queryTopChildrenIds(topMenu));
					break;
				}
			}
		}
		
		for (Menu topMenu : topMenus) {
			mapper.updateTopOrder(topMenu);
		}
	}

	@Override
	public List<Menu> queryTop() {
		return mapper.queryTop();
	}

	@Override
	public List<Long> queryTopChildrenIds(Menu topMenu) {
		return mapper.queryTopChildrenIds(topMenu);
	}
}
