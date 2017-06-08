package cn.ermei.admui.enums;

public enum UserState {

	NORMAL("正常"),
	FORBIDDEN("已禁用"),
	DELETED("已删除");

	private String name;

	UserState(String name) {
		this.name = name;
	}

	public String getName() {
		return this.name;
	}

}
