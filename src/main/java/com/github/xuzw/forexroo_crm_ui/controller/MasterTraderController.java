package com.github.xuzw.forexroo_crm_ui.controller;

import static com.github.xuzw.forexroo.entity.Tables.MASTER_TRADER_RANKINGS_HISTORY;
import static com.github.xuzw.forexroo.entity.Tables.USER;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jooq.Condition;
import org.jooq.DSLContext;
import org.jooq.impl.DSL;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.dandelion.datatables.core.ajax.DataSet;
import com.github.dandelion.datatables.core.ajax.DatatablesCriterias;
import com.github.dandelion.datatables.core.ajax.DatatablesResponse;
import com.github.xuzw.forexroo_crm_ui.database.Jooq;
import com.github.xuzw.forexroo_crm_ui.database.model.ExtMasterTraderRankingsHistory;
import com.github.xuzw.forexroo_crm_ui.utils.YyyyMmDd;

import cn.ermei.admui.controller.BaseController;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月16日 下午12:53:04
 */
@Controller
@RequestMapping("/masterTrader")
public class MasterTraderController extends BaseController {

    @RequestMapping(value = "/top", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String top(HttpServletRequest request) throws SQLException, ParseException {
        DatatablesCriterias criterias = DatatablesCriterias.getFromRequest(request);
        DSLContext db = DSL.using(Jooq.buildConfiguration());
        Condition dateCondition = MASTER_TRADER_RANKINGS_HISTORY.TIME.eq(YyyyMmDd.yesterday().format("yyyy-MM-dd"));
        List<ExtMasterTraderRankingsHistory> rows = db.select().from(MASTER_TRADER_RANKINGS_HISTORY).leftJoin(USER).on(MASTER_TRADER_RANKINGS_HISTORY.USER_ID.eq(USER.ID)).where(dateCondition).orderBy(MASTER_TRADER_RANKINGS_HISTORY.TOTAL_PROFIT.desc()).fetchInto(ExtMasterTraderRankingsHistory.class);
        long totalRecords = db.fetchCount(MASTER_TRADER_RANKINGS_HISTORY);
        long totalDisplayRecords = db.fetchCount(MASTER_TRADER_RANKINGS_HISTORY, dateCondition);
        return JSON.toJSONString(DatatablesResponse.build(new DataSet<>(rows, totalRecords, totalDisplayRecords), criterias));
    }
}
