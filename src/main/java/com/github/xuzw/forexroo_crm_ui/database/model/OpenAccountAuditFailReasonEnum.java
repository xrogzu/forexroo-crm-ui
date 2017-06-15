package com.github.xuzw.forexroo_crm_ui.database.model;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月15日 上午10:37:02
 */
public enum OpenAccountAuditFailReasonEnum implements NamedValue {
    unknown(0, "未知"), picture_not_clear(1, "手持身份证照不清晰"), sign_not_clear(2, "签名不清晰");

    private int value;
    private String comment;

    private OpenAccountAuditFailReasonEnum(int value, String comment) {
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
