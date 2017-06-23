package com.github.xuzw.forexroo_crm_ui.controller;

import static com.github.xuzw.forexroo.entity.Tables.MT4_HISTORY_ORDER;
import static com.github.xuzw.forexroo.entity.Tables.USER;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.jooq.Condition;
import org.jooq.DSLContext;
import org.jooq.Field;
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
import com.github.xuzw.forexroo_crm_ui.database.model.ExtMt4HistoryOrder;
import com.github.xuzw.forexroo_crm_ui.utils.YyyyMmDd;

import cn.ermei.admui.controller.BaseController;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月16日 下午12:53:04
 */
@Controller
@RequestMapping("/historyOrder")
public class Mt4HistoryOrderController extends BaseController {

    @RequestMapping(value = "/all", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String all(String dateStart, String dateEnd, String searchKeyword, HttpServletRequest request) throws SQLException, ParseException {
        DatatablesCriterias criterias = DatatablesCriterias.getFromRequest(request);
        Integer offset = criterias.getStart();
        Integer numberOfRows = criterias.getLength();
        String search = "%" + searchKeyword + "%";
        DSLContext db = DSL.using(Jooq.buildConfiguration());
        Condition dateStartCondition = StringUtils.isBlank(dateStart) ? null : MT4_HISTORY_ORDER.CLOSE_TIME.ge(YyyyMmDd.parse("yyyy年MM月dd日", dateStart).firstMillsecond());
        Condition dateEndCondition = StringUtils.isBlank(dateEnd) ? null : MT4_HISTORY_ORDER.CLOSE_TIME.le(YyyyMmDd.parse("yyyy年MM月dd日", dateEnd).lastMillsecond());
        Condition searchKeywordCondition = StringUtils.isBlank(searchKeyword) ? null : MT4_HISTORY_ORDER.LOGIN.like(search).or(MT4_HISTORY_ORDER.ORDER_ID.like(search));
        Condition finalCondition = Jooq.and(DSL.condition(true), dateStartCondition, dateEndCondition, searchKeywordCondition);
        List<Field<?>> fields = new ArrayList<>();
        fields.add(USER.NICKNAME);
        fields.add(USER.ID.as("userId"));
        fields.add(MT4_HISTORY_ORDER.LOGIN);
        fields.add(DSL.sum(MT4_HISTORY_ORDER.VOLUME).as("volume"));
        fields.add(DSL.sum(MT4_HISTORY_ORDER.COMMISSION).as("commission"));
        fields.add(DSL.sum(MT4_HISTORY_ORDER.TAXES).as("taxes"));
        fields.add(DSL.sum(MT4_HISTORY_ORDER.PROFIT).as("profit"));
        fields.add(USER.MY_BROKER_NAME);
        fields.add(USER.MY_AGENT_NAME);
        List<ExtMt4HistoryOrder> rows = db.select(fields).from(MT4_HISTORY_ORDER).leftJoin(USER).on(MT4_HISTORY_ORDER.LOGIN.eq(USER.MT4_REAL_ACCOUNT)).where(finalCondition).groupBy(MT4_HISTORY_ORDER.LOGIN).limit(offset, numberOfRows).fetchInto(ExtMt4HistoryOrder.class);
        long totalRecords = db.fetchCount(MT4_HISTORY_ORDER);
        long totalDisplayRecords = db.fetchCount(db.selectFrom(MT4_HISTORY_ORDER).where(finalCondition).groupBy(MT4_HISTORY_ORDER.LOGIN));
        return JSON.toJSONString(DatatablesResponse.build(new DataSet<>(rows, totalRecords, totalDisplayRecords), criterias));
    }
}
