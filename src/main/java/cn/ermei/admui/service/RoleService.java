package cn.ermei.admui.service;

import java.util.List;

import cn.ermei.admui.entity.Menu;
import cn.ermei.admui.entity.MenuRole;
import cn.ermei.admui.entity.Role;
import cn.ermei.admui.entity.User;

/** 
 * 角色Service
 * @author dk
 */
public interface RoleService extends BaseService<Role>{
	
	/**
     * <p>根据菜单查询授权角色</p>
     *
     * @param   menu  要查询授权角色的菜单
     * @return  符合条件的角色集合
     */
	List<Role> queryRole(Menu menu);
	
	/**
     * <p>查询所有角色及其对应用户数量</p>
     *
     * @return  角色及其对应用户数量集合
     */
	List<Role> queryRoleUserCount();
	
	/**
     * <p>保存菜单角色授权</p>
     *
     * @param   menuRole  要保存的菜单角色授权
     */
	void saveMenuRole(MenuRole menuRole);
	
	/**
     * <p>根据菜单删除菜单及其所有子菜单的角色授权</p>
     *
     * @param   menuRole  要保存的菜单角色关联
     */
	void deleteMenuRole(Menu menu);
	
	/**
     * <p>根据id删除角色</p>
     *
     * @param   roleId  要删除的角色id
     */
	void deleteRole(Long roleId);
	
	/**
     * <p>根据角色id查询用户集合</p>
     *
     * @param   roleId  要查询用户集合的角色id
     * @return  符合条件的用户集合
     */
	List<User> queryUser(Long roleId);
}
