package com.github.xuzw.forexroo_crm_ui.database.model;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月15日 下午4:38:02
 */
public enum UserStatusEnum implements NamedValue {
    register(0, "注册"), normal(1, "正常"), closing(2, "销户"), disable(3, "禁用");

    private int value;
    private String comment;

    private UserStatusEnum(int value, String comment) {
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
