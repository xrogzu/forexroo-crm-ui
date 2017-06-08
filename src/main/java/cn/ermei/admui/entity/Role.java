package cn.ermei.admui.entity;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

public class Role implements Serializable {

	private static final long serialVersionUID = -6963926424568680378L;

	@JsonProperty("id")
	private Long roleId;
	@JsonProperty("text")
	private String roleName;
	@JsonIgnore
	private User createUser;
	@JsonIgnore
	private Date createTime;
	@JsonIgnore
	private User updateUser;
	@JsonIgnore
	private Date updateTime;
	private Boolean permission;
	@JsonIgnore
	private Integer count;
	@JsonIgnore
	private Long[] roleAuth;

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public User getCreateUser() {
		return createUser;
	}

	public void setCreateUser(User createUser) {
		this.createUser = createUser;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public User getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(User updateUser) {
		this.updateUser = updateUser;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Boolean getPermission() {
		return permission;
	}

	public void setPermission(Boolean permission) {
		this.permission = permission;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Long[] getRoleAuth() {
		return roleAuth;
	}

	public void setRoleAuth(Long[] roleAuth) {
		this.roleAuth = roleAuth;
	}

}