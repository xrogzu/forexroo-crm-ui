package com.github.xuzw.forexroo_crm_ui.database.model;

import com.github.xuzw.forexroo.entity.tables.pojos.DepositAndWithdraw;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月19日 下午2:42:13
 */
public class ExtDepositAndWithdraw extends DepositAndWithdraw {
    private static final long serialVersionUID = 1L;
    private String nickname;
    private String phone;
    private String openAccountRealname;
    private String myBrokerName;
    private String myAgentName;

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getOpenAccountRealname() {
        return openAccountRealname;
    }

    public void setOpenAccountRealname(String openAccountRealname) {
        this.openAccountRealname = openAccountRealname;
    }

    public String getMyBrokerName() {
        return myBrokerName;
    }

    public void setMyBrokerName(String myBrokerName) {
        this.myBrokerName = myBrokerName;
    }

    public String getMyAgentName() {
        return myAgentName;
    }

    public void setMyAgentName(String myAgentName) {
        this.myAgentName = myAgentName;
    }
}
