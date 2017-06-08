package cn.ermei.admui.mapper;

import java.util.List;

import cn.ermei.admui.entity.Menu;
import cn.ermei.admui.entity.MenuRole;
import cn.ermei.admui.entity.Role;
import cn.ermei.admui.entity.User;

/** 
 * RoleMapper
 * @author dk
 */
public interface RoleMapper extends BaseMapper<Role> {

	List<Role> queryRole(Menu menu);
	
	List<Role> queryRoleUserCount();
	
	void saveMenuRole(MenuRole menuRole);
	
	void deleteMenuRole(Long roleId);
	
	void deleteMenuRoleByMenu(Menu menu);
	
	void deleteUserRole(Long roleId);
	
	List<User> queryUser(Long roleId);
}
