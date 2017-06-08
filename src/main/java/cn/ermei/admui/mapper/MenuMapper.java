package cn.ermei.admui.mapper;

import java.util.List;
import java.util.Map;

import cn.ermei.admui.entity.Menu;
import cn.ermei.admui.entity.Role;
import cn.ermei.admui.entity.User;

/** 
 * MenuMapper
 * @author dk
 */
public interface MenuMapper extends BaseMapper<Menu> {
	
	List<Menu> queryByUser(User user);
	
	List<Menu> queryByRole(Role role);
	
	void saveMenuRole(Map<String, Object> paraMap);
	
	void deleteMenuRole(Menu menu);
	
	String generateFirstLayer();
	
	void deleteMenu(Menu menu);
	
	List<Menu> queryTop();
	
	void updateTopOrder(Menu menu);
	
	List<Long> queryTopChildrenIds(Menu topMenu);
}
