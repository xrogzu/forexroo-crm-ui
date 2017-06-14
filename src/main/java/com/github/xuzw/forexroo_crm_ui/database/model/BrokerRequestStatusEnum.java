package com.github.xuzw.forexroo_crm_ui.database.model;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月6日 上午10:56:49
 */
public enum BrokerRequestStatusEnum implements NamedValue {
    not(0, "未申请"), requesting(1, "申请中"), auditing(2, "审核中"), auditing_success(3, "审核成功"), auditing_fail(4, "审核失败");

    private int value;
    private String comment;

    private BrokerRequestStatusEnum(int value, String comment) {
        this.value = value;
        this.comment = comment;
    }

    @Override
    public int getValue() {
        return value;
    }

    @Override
    public String getComment() {
        return comment;
    }
}
