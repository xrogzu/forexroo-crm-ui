package com.github.xuzw.forexroo_crm_ui.database.model;

import com.github.xuzw.forexroo.entity.tables.pojos.User;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月16日 下午5:04:49
 */
public class ExtUser extends User {
    private static final long serialVersionUID = 1L;
    private int status;
    private String bankCardNumber;
    private String bankName;
    private String cardType;
    private String reservedPhone;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getBankCardNumber() {
        return bankCardNumber;
    }

    public void setBankCardNumber(String bankCardNumber) {
        this.bankCardNumber = bankCardNumber;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getCardType() {
        return cardType;
    }

    public void setCardType(String cardType) {
        this.cardType = cardType;
    }

    public String getReservedPhone() {
        return reservedPhone;
    }

    public void setReservedPhone(String reservedPhone) {
        this.reservedPhone = reservedPhone;
    }
}
