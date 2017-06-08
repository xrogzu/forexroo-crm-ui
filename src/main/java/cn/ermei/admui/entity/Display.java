package cn.ermei.admui.entity;

import java.io.Serializable;
import java.util.Date;

public class Display implements Serializable {

	private static final long serialVersionUID = -8206130543972490434L;

	private Long displayId;
	private String navigationColor;
	private String acrossFlag;
	private String menuTheme;
	private String menuDisplay;
	private String menuTxtIcon;
	private String themeColor;
	private String tabFlag;
	private Boolean globalFlag;
	private Boolean defaultFlag;
	private User user;
	private Date updateTime;

	public Long getDisplayId() {
		return displayId;
	}

	public void setDisplayId(Long displayId) {
		this.displayId = displayId;
	}

	public String getNavigationColor() {
		return navigationColor;
	}

	public void setNavigationColor(String navigationColor) {
		this.navigationColor = navigationColor;
	}

	public String getAcrossFlag() {
		return acrossFlag;
	}

	public void setAcrossFlag(String acrossFlag) {
		this.acrossFlag = acrossFlag;
	}

	public String getMenuTheme() {
		return menuTheme;
	}

	public void setMenuTheme(String menuTheme) {
		this.menuTheme = menuTheme;
	}

	public String getMenuDisplay() {
		return menuDisplay;
	}

	public void setMenuDisplay(String menuDisplay) {
		this.menuDisplay = menuDisplay;
	}

	public String getMenuTxtIcon() {
		return menuTxtIcon;
	}

	public void setMenuTxtIcon(String menuTxtIcon) {
		this.menuTxtIcon = menuTxtIcon;
	}

	public String getThemeColor() {
		return themeColor;
	}

	public void setThemeColor(String themeColor) {
		this.themeColor = themeColor;
	}

	public String getTabFlag() {
		return tabFlag;
	}

	public void setTabFlag(String tabFlag) {
		this.tabFlag = tabFlag;
	}

	public Boolean getGlobalFlag() {
		return globalFlag;
	}

	public void setGlobalFlag(Boolean globalFlag) {
		this.globalFlag = globalFlag;
	}

	public Boolean getDefaultFlag() {
		return defaultFlag;
	}

	public void setDefaultFlag(Boolean defaultFlag) {
		this.defaultFlag = defaultFlag;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

}