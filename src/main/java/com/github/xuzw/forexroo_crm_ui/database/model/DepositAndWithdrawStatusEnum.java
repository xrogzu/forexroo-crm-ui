package com.github.xuzw.forexroo_crm_ui.database.model;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月19日 上午11:33:22
 */
public enum DepositAndWithdrawStatusEnum implements NamedValue {
    auditing(0, "审核中"), auditing_success(1, "审核成功"), auditing_fail(2, "审核失败");

    private int value;
    private String comment;

    private DepositAndWithdrawStatusEnum(int value, String comment) {
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
