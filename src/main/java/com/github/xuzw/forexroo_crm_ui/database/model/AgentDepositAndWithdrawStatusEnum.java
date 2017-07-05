package com.github.xuzw.forexroo_crm_ui.database.model;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月20日 上午10:18:31
 */
public enum AgentDepositAndWithdrawStatusEnum implements NamedValue {
    auditing(0, "审核中"), auditing_success(1, "审核成功"), auditing_fail(2, "审核失败");

    private int value;
    private String comment;

    private AgentDepositAndWithdrawStatusEnum(int value, String comment) {
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
