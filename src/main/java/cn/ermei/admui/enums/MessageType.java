package cn.ermei.admui.enums;

public enum MessageType {

	SYSTEM("系统消息"),
	TASK("任务消息"),
	SETTING("设置消息"),
	EVENT("事件消息"),
	OTHER("其他消息");

	private String name;

	MessageType(String name) {
		this.name = name;
	}

	public String getName() {
		return this.name;
	}

}
