package com.github.xuzw.forexroo_crm_ui.database.model;

import com.github.xuzw.forexroo.entity.tables.pojos.User;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月16日 下午5:04:49
 */
public class ExtUser extends User {
    private static final long serialVersionUID = 1L;
    private int status;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
