package com.github.xuzw.forexroo_crm_ui.database.model;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月15日 下午4:56:11
 */
public enum BooleanEnum implements NamedValue {
    no(0, "否"), yes(1, "是");

    private int value;
    private String comment;

    private BooleanEnum(int value, String comment) {
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
