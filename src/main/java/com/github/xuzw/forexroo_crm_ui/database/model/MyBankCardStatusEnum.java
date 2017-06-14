package com.github.xuzw.forexroo_crm_ui.database.model;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月7日 上午10:34:16
 */
public enum MyBankCardStatusEnum implements NamedValue {
    not(0, "未绑定"), binding(1, "绑定中"), binding_success(2, "绑定成功"), binding_fail(3, "绑定失败"), unbinding(4, "解绑中"), unbinding_success(5, "解绑成功"), unbinding_fail(6, "解绑失败");

    private int value;
    private String comment;

    private MyBankCardStatusEnum(int value, String comment) {
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
