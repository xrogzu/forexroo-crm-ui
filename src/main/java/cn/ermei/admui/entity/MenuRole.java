package cn.ermei.admui.entity;

import java.io.Serializable;

public class MenuRole implements Serializable {

	private static final long serialVersionUID = -2433600499302798008L;

	private Long menuId;
	private Long roleId;

	public Long getMenuId() {
		return menuId;
	}

	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

}