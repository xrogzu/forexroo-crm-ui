package cn.ermei.admui.vo;

import cn.ermei.admui.entity.User;

public class UserVo extends User {

	private static final long serialVersionUID = 3670480561242384636L;

	private String loginType;
	private String remember;
	private String validCode;

	public String getLoginType() {
		return loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}

	public String getRemember() {
		return remember;
	}

	public void setRemember(String remember) {
		this.remember = remember;
	}

	public String getValidCode() {
		return validCode;
	}

	public void setValidCode(String validCode) {
		this.validCode = validCode;
	}

}
