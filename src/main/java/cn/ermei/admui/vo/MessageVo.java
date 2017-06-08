package cn.ermei.admui.vo;

import cn.ermei.admui.entity.Message;

public class MessageVo extends Message {

	private static final long serialVersionUID = 1247649456112624446L;

	private Integer start;
	private Integer limit;
	private Integer page;

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

}
