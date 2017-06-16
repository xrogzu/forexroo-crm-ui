package com.github.xuzw.forexroo_crm_ui.database.model;

import com.github.xuzw.forexroo.entity.tables.pojos.Agent;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月16日 下午5:26:02
 */
public class ExtAgent extends Agent {
    private static final long serialVersionUID = 1L;
    private int status;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
