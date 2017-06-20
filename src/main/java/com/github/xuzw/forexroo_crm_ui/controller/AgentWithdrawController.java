package com.github.xuzw.forexroo_crm_ui.controller;

import static com.github.xuzw.forexroo.entity.Tables.AGENT;
import static com.github.xuzw.forexroo.entity.Tables.AGENT_DEPOSIT_AND_WITHDRAW;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.jooq.Condition;
import org.jooq.DSLContext;
import org.jooq.Field;
import org.jooq.impl.DSL;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.dandelion.datatables.core.ajax.DataSet;
import com.github.dandelion.datatables.core.ajax.DatatablesCriterias;
import com.github.dandelion.datatables.core.ajax.DatatablesResponse;
import com.github.xuzw.forexroo.entity.tables.daos.AgentDepositAndWithdrawDao;
import com.github.xuzw.forexroo.entity.tables.pojos.AgentDepositAndWithdraw;
import com.github.xuzw.forexroo_crm_ui.database.Jooq;
import com.github.xuzw.forexroo_crm_ui.database.model.AgentDepositAndWithdrawStatusEnum;
import com.github.xuzw.forexroo_crm_ui.database.model.AgentDepositAndWithdrawTypeEnum;
import com.github.xuzw.forexroo_crm_ui.database.model.DepositAndWithdrawStatusEnum;
import com.github.xuzw.forexroo_crm_ui.database.model.ExtAgentDepositAndWithdraw;
import com.github.xuzw.forexroo_crm_ui.utils.YyyyMmDd;

import cn.ermei.admui.controller.BaseController;
import cn.ermei.admui.vo.UserVo;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月19日 上午11:38:00
 */
@Controller
@RequestMapping("/agentWithdraw")
public class AgentWithdrawController extends BaseController {

    @RequestMapping(value = "/auditSuccess", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String auditSuccess(Long id) {
        UserVo loginUser = (UserVo) session.getAttribute("loginUser");
        JSONObject jsonResponse = new JSONObject();
        try {
            AgentDepositAndWithdrawDao dao = new AgentDepositAndWithdrawDao(Jooq.buildConfiguration());
            AgentDepositAndWithdraw agentDepositAndWithdraw = dao.findById(id);
            if (agentDepositAndWithdraw.getStatus() != AgentDepositAndWithdrawStatusEnum.auditing.getValue()) {
                throw new Exception("状态异常");
            }
            Map<Field<?>, Object> map = new HashMap<>();
            int status = DepositAndWithdrawStatusEnum.auditing_success.getValue();
            long responseTimestamp = System.currentTimeMillis();
            String auditUserName = loginUser.getLoginName();
            map.put(AGENT_DEPOSIT_AND_WITHDRAW.STATUS, status);
            map.put(AGENT_DEPOSIT_AND_WITHDRAW.AUDIT_TIMESTAMP, responseTimestamp);
            map.put(AGENT_DEPOSIT_AND_WITHDRAW.AUDIT_USER_ID, loginUser.getUserId());
            map.put(AGENT_DEPOSIT_AND_WITHDRAW.AUDIT_USER_NAME, auditUserName);
            map.put(AGENT_DEPOSIT_AND_WITHDRAW.AUDIT_SUCCESS_TIME, responseTimestamp);
            DSL.using(Jooq.buildConfiguration()).update(AGENT_DEPOSIT_AND_WITHDRAW).set(map).where(AGENT_DEPOSIT_AND_WITHDRAW.ID.equal(id)).execute();
            jsonResponse.put("code", 0);
            jsonResponse.put("status", status);
            jsonResponse.put("auditTimestamp", responseTimestamp);
            jsonResponse.put("auditUserName", auditUserName);
        } catch (Exception e) {
            jsonResponse.put("code", 1);
            jsonResponse.put("message", ExceptionUtils.getMessage(e));
        }
        return jsonResponse.toJSONString();
    }

    @RequestMapping(value = "/auditFail", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String auditFail(Long id) {
        UserVo loginUser = (UserVo) session.getAttribute("loginUser");
        JSONObject jsonResponse = new JSONObject();
        try {
            AgentDepositAndWithdrawDao dao = new AgentDepositAndWithdrawDao(Jooq.buildConfiguration());
            AgentDepositAndWithdraw agentDepositAndWithdraw = dao.findById(id);
            if (agentDepositAndWithdraw.getStatus() != AgentDepositAndWithdrawStatusEnum.auditing.getValue()) {
                throw new Exception("状态异常");
            }
            Map<Field<?>, Object> map = new HashMap<>();
            int status = DepositAndWithdrawStatusEnum.auditing_fail.getValue();
            long responseTimestamp = System.currentTimeMillis();
            String auditUserName = loginUser.getLoginName();
            map.put(AGENT_DEPOSIT_AND_WITHDRAW.STATUS, status);
            map.put(AGENT_DEPOSIT_AND_WITHDRAW.AUDIT_TIMESTAMP, responseTimestamp);
            map.put(AGENT_DEPOSIT_AND_WITHDRAW.AUDIT_USER_ID, loginUser.getUserId());
            map.put(AGENT_DEPOSIT_AND_WITHDRAW.AUDIT_USER_NAME, auditUserName);
            DSL.using(Jooq.buildConfiguration()).update(AGENT_DEPOSIT_AND_WITHDRAW).set(map).where(AGENT_DEPOSIT_AND_WITHDRAW.ID.equal(id)).execute();
            jsonResponse.put("code", 0);
            jsonResponse.put("status", status);
            jsonResponse.put("auditTimestamp", responseTimestamp);
            jsonResponse.put("auditUserName", auditUserName);
        } catch (Exception e) {
            jsonResponse.put("code", 1);
            jsonResponse.put("message", ExceptionUtils.getMessage(e));
        }
        return jsonResponse.toJSONString();
    }

    @RequestMapping(value = "/auditList", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String auditList(String dateStart, String dateEnd, Integer auditStatus, String searchKeyword, HttpServletRequest request) throws SQLException, ParseException {
        DatatablesCriterias criterias = DatatablesCriterias.getFromRequest(request);
        Integer offset = criterias.getStart();
        Integer numberOfRows = criterias.getLength();
        String search = "%" + searchKeyword + "%";
        DSLContext db = DSL.using(Jooq.buildConfiguration());
        Condition dateStartCondition = StringUtils.isBlank(dateStart) ? null : AGENT_DEPOSIT_AND_WITHDRAW.TIME.ge(YyyyMmDd.parse("yyyy年MM月dd日", dateStart).firstMillsecond());
        Condition dateEndCondition = StringUtils.isBlank(dateEnd) ? null : AGENT_DEPOSIT_AND_WITHDRAW.TIME.le(YyyyMmDd.parse("yyyy年MM月dd日", dateEnd).lastMillsecond());
        Condition auditStatusCondition = auditStatus == null ? null : AGENT_DEPOSIT_AND_WITHDRAW.STATUS.eq(auditStatus);
        Condition searchKeywordCondition = StringUtils.isBlank(searchKeyword) ? null : AGENT_DEPOSIT_AND_WITHDRAW.AGENT_ID.like(search);
        Condition finalCondition = Jooq.and(DSL.condition(true), dateStartCondition, dateEndCondition, auditStatusCondition, searchKeywordCondition);
        List<Field<?>> fields = new ArrayList<>();
        fields.addAll(Arrays.asList(AGENT_DEPOSIT_AND_WITHDRAW.fields()));
        fields.add(AGENT.NAME.as("agentName"));
        List<ExtAgentDepositAndWithdraw> rows = db.select(fields).from(AGENT_DEPOSIT_AND_WITHDRAW).leftJoin(AGENT).on(AGENT_DEPOSIT_AND_WITHDRAW.AGENT_ID.eq(AGENT.ID)).where(finalCondition).limit(offset, numberOfRows).fetchInto(ExtAgentDepositAndWithdraw.class);
        long totalRecords = db.fetchCount(AGENT_DEPOSIT_AND_WITHDRAW);
        long totalDisplayRecords = db.fetchCount(AGENT_DEPOSIT_AND_WITHDRAW, finalCondition);
        return JSON.toJSONString(DatatablesResponse.build(new DataSet<>(rows, totalRecords, totalDisplayRecords), criterias));
    }

    @RequestMapping(value = "/commissionDepositList", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String commissionDepositList(String dateStart, String dateEnd, String searchKeyword, HttpServletRequest request) throws SQLException, ParseException {
        DatatablesCriterias criterias = DatatablesCriterias.getFromRequest(request);
        Integer offset = criterias.getStart();
        Integer numberOfRows = criterias.getLength();
        String search = "%" + searchKeyword + "%";
        DSLContext db = DSL.using(Jooq.buildConfiguration());
        Condition typeCondition = AGENT_DEPOSIT_AND_WITHDRAW.TYPE.eq(AgentDepositAndWithdrawTypeEnum.commission_deposit.getValue());
        Condition dateStartCondition = StringUtils.isBlank(dateStart) ? null : AGENT_DEPOSIT_AND_WITHDRAW.TIME.ge(YyyyMmDd.parse("yyyy年MM月dd日", dateStart).firstMillsecond());
        Condition dateEndCondition = StringUtils.isBlank(dateEnd) ? null : AGENT_DEPOSIT_AND_WITHDRAW.TIME.le(YyyyMmDd.parse("yyyy年MM月dd日", dateEnd).lastMillsecond());
        Condition searchKeywordCondition = StringUtils.isBlank(searchKeyword) ? null : AGENT_DEPOSIT_AND_WITHDRAW.AGENT_ID.like(search);
        Condition finalCondition = Jooq.and(typeCondition, dateStartCondition, dateEndCondition, searchKeywordCondition);
        List<Field<?>> fields = new ArrayList<>();
        fields.addAll(Arrays.asList(AGENT_DEPOSIT_AND_WITHDRAW.fields()));
        fields.add(AGENT.NAME.as("agentName"));
        List<ExtAgentDepositAndWithdraw> rows = db.select(fields).from(AGENT_DEPOSIT_AND_WITHDRAW).leftJoin(AGENT).on(AGENT_DEPOSIT_AND_WITHDRAW.AGENT_ID.eq(AGENT.ID)).where(finalCondition).limit(offset, numberOfRows).fetchInto(ExtAgentDepositAndWithdraw.class);
        long totalRecords = db.fetchCount(AGENT_DEPOSIT_AND_WITHDRAW);
        long totalDisplayRecords = db.fetchCount(AGENT_DEPOSIT_AND_WITHDRAW, finalCondition);
        return JSON.toJSONString(DatatablesResponse.build(new DataSet<>(rows, totalRecords, totalDisplayRecords), criterias));
    }
}
