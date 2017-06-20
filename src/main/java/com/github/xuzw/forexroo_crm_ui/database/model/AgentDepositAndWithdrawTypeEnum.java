package com.github.xuzw.forexroo_crm_ui.database.model;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月20日 上午11:31:16
 */
public enum AgentDepositAndWithdrawTypeEnum implements NamedValue {
    deposit(1, "入金"), withdraw(2, "出金"), commission_deposit(101, "佣金入金");

    private int value;
    private String comment;

    private AgentDepositAndWithdrawTypeEnum(int value, String comment) {
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
