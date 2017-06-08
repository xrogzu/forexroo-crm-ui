package cn.ermei.admui.enums;


public enum OperateType {

	add("新增"),
	update("修改"),
	delete("删除");

	private String name;

	OperateType(String name) {
		this.name = name;
	}

	public String getName() {
		return this.name;
	}

}
