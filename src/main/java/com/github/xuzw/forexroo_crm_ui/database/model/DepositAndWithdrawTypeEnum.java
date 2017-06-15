package com.github.xuzw.forexroo_crm_ui.database.model;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月12日 下午12:06:40
 */
public enum DepositAndWithdrawTypeEnum implements NamedValue {
    deposit(1, "入金"), withdraw(2, "出金"), increase_credit(3, "增加信用"), reduce_credit(4, "减少信用"), commission_deposit(101, "佣金入金"), share_deposit(102, "分成入金"), reward_deposit(103, "奖励入金");

    private int value;
    private String comment;

    private DepositAndWithdrawTypeEnum(int value, String comment) {
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
