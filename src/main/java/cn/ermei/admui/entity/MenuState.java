package cn.ermei.admui.entity;

import java.io.Serializable;

public class MenuState implements Serializable {

	private static final long serialVersionUID = 1119328761917095970L;

	private Boolean selected;

	public Boolean getSelected() {
		return selected;
	}

	public void setSelected(Boolean selected) {
		this.selected = selected;
	}

}