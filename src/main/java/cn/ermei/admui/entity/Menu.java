package cn.ermei.admui.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import cn.ermei.admui.enums.OperateType;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.annotation.JsonProperty;

public class Menu implements Serializable {

	private static final long serialVersionUID = 8952513617025317472L;

	@JsonProperty("id")
	private Long menuId;
	@JsonProperty("text")
	private String name;
	@JsonIgnore
	private Long parentId;
	private String layer;
	private String icon;
	@JsonInclude(Include.NON_EMPTY)
	private String url;
	@JsonIgnore
	private User createUser;
	@JsonIgnore
	private Date createTime;
	@JsonIgnore
	private User updateUser;
	@JsonIgnore
	private Date updateTime;
	@JsonProperty("children")
	private List<Menu> menus;
	@JsonProperty("auth")
	@JsonInclude(Include.NON_EMPTY)
	private List<Role> roles;
	@JsonInclude(Include.NON_EMPTY)
	private OperateType type;
	@JsonInclude(Include.NON_EMPTY)
	private Integer rank;
	@JsonIgnore
	private Boolean permission;
	@JsonInclude(Include.NON_EMPTY)
	private MenuState state;
	@JsonInclude(Include.NON_EMPTY)
	private String orderNo;
	@JsonIgnore
	private String originalOrderNo;
	@JsonIgnore
	private List<Long> ids;

	public Long getMenuId() {
		return menuId;
	}

	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public String getLayer() {
		return layer;
	}

	public void setLayer(String layer) {
		this.layer = layer;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
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

	public List<Menu> getMenus() {
		return menus;
	}

	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public OperateType getType() {
		return type;
	}

	public void setType(OperateType type) {
		this.type = type;
	}

	public Integer getRank() {
		return rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

	public Boolean getPermission() {
		return permission;
	}

	public void setPermission(Boolean permission) {
		this.permission = permission;
	}

	public MenuState getState() {
		return state;
	}

	public void setState(MenuState state) {
		this.state = state;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getOriginalOrderNo() {
		return originalOrderNo;
	}

	public void setOriginalOrderNo(String originalOrderNo) {
		this.originalOrderNo = originalOrderNo;
	}

	public List<Long> getIds() {
		return ids;
	}

	public void setIds(List<Long> ids) {
		this.ids = ids;
	}

}