package com.github.xuzw.forexroo_crm_ui.database.model;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月16日 下午5:36:37
 */
public enum AgentStatusEnum implements NamedValue {
    unknown(0, "未知"), normal(1, "正常"), closing(2, "销户"), disable(3, "禁用");

    private int value;
    private String comment;

    private AgentStatusEnum(int value, String comment) {
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
