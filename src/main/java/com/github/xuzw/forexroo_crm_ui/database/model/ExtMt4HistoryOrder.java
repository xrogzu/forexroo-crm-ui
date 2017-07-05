package com.github.xuzw.forexroo_crm_ui.database.model;

import com.github.xuzw.forexroo.entity.tables.pojos.Mt4HistoryOrder;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月22日 下午6:03:02
 */
public class ExtMt4HistoryOrder extends Mt4HistoryOrder {
    private static final long serialVersionUID = 1L;
    private Long userId;
    private String openAccountRealname;
    private String phone;
    private String nickname;
    private String myBrokerName;
    private String myAgentName;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getOpenAccountRealname() {
        return openAccountRealname;
    }

    public void setOpenAccountRealname(String openAccountRealname) {
        this.openAccountRealname = openAccountRealname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
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
