package cn.ermei.admui.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.ermei.admui.entity.Menu;
import cn.ermei.admui.entity.MenuRole;
import cn.ermei.admui.entity.Role;
import cn.ermei.admui.entity.User;
import cn.ermei.admui.mapper.BaseMapper;
import cn.ermei.admui.mapper.RoleMapper;
import cn.ermei.admui.service.RoleService;

/**
 * 角色Service实现
 * @author dk
 */

@Service
@Transactional
public class RoleServiceImpl extends BaseServiceImpl<Role> implements RoleService {

	@Autowired
	private RoleMapper mapper;
	
	@Override
	protected BaseMapper<Role> getMapper() {
		return mapper;
	}

	@Override
	@Transactional(readOnly = true)
	public List<Role> queryRole(Menu menu) {
		return mapper.queryRole(menu);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Role> queryRoleUserCount() {
		return mapper.queryRoleUserCount();
	}

	@Override
	public void saveMenuRole(MenuRole menuRole) {
		mapper.saveMenuRole(menuRole);
	}

	@Override
	public void save(Role role) {
		if (role != null) {
			if (role.getRoleId() == null) {
				mapper.save(role);
			} else {
				mapper.update(role);
				mapper.deleteMenuRole(role.getRoleId());
			}
			MenuRole menuRole = new MenuRole();
			for (Long menuId : role.getRoleAuth()) {
				menuRole.setMenuId(menuId);
				menuRole.setRoleId(role.getRoleId());
				saveMenuRole(menuRole);
			}
		}
	}

	@Override
	public void deleteMenuRole(Menu menu) {
		mapper.deleteMenuRoleByMenu(menu);
	}
	
	@Override
	public void deleteRole(Long roleId) {
		mapper.deleteUserRole(roleId);
		mapper.deleteMenuRole(roleId);
		mapper.delete(roleId);
	}

	@Override
	@Transactional(readOnly = true)
	public List<User> queryUser(Long roleId) {
		return mapper.queryUser(roleId);
	}
}
