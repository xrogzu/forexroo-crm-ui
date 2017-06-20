package com.github.xuzw.forexroo_crm_ui.database.model;

import com.github.xuzw.forexroo.entity.tables.pojos.AgentDepositAndWithdraw;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月20日 上午10:26:21
 */
public class ExtAgentDepositAndWithdraw extends AgentDepositAndWithdraw {
    private static final long serialVersionUID = 1L;
    private String agentName;

    public String getAgentName() {
        return agentName;
    }

    public void setAgentName(String agentName) {
        this.agentName = agentName;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
