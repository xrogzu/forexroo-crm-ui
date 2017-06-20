package com.github.xuzw.forexroo_crm_ui.controller;

import static com.github.xuzw.forexroo.entity.Tables.DEPOSIT_AND_WITHDRAW;
import static com.github.xuzw.forexroo.entity.Tables.USER;

import java.sql.SQLException;
import java.text.ParseException;
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
import com.github.xuzw.activemq_utils.ActiveMq;
import com.github.xuzw.forexroo.entity.tables.daos.DepositAndWithdrawDao;
import com.github.xuzw.forexroo.entity.tables.pojos.DepositAndWithdraw;
import com.github.xuzw.forexroo_crm_ui.database.Jooq;
import com.github.xuzw.forexroo_crm_ui.database.model.DepositAndWithdrawStatusEnum;
import com.github.xuzw.forexroo_crm_ui.database.model.DepositAndWithdrawTypeEnum;
import com.github.xuzw.forexroo_crm_ui.database.model.ExtDepositAndWithdraw;
import com.github.xuzw.forexroo_crm_ui.utils.YyyyMmDd;

import cn.ermei.admui.controller.BaseController;
import cn.ermei.admui.vo.UserVo;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月19日 上午11:38:00
 */
@Controller
@RequestMapping("/withdraw")
public class WithdrawController extends BaseController {

    @RequestMapping(value = "/auditSuccess", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String auditSuccess(Long id) {
        UserVo loginUser = (UserVo) session.getAttribute("loginUser");
        JSONObject jsonResponse = new JSONObject();
        try {
            DepositAndWithdrawDao depositAndWithdrawDao = new DepositAndWithdrawDao(Jooq.buildConfiguration());
            DepositAndWithdraw depositAndWithdraw = depositAndWithdrawDao.findById(id);
            if (depositAndWithdraw.getStatus() != DepositAndWithdrawStatusEnum.auditing.getValue()) {
                throw new Exception("状态异常");
            }
            Map<Field<?>, Object> map = new HashMap<>();
            JSONObject mt4Request = new JSONObject();
            mt4Request.put("login", Integer.valueOf(depositAndWithdraw.getMt4RealAccount()));
            mt4Request.put("operationtype", depositAndWithdraw.getType());
            mt4Request.put("amount", Double.valueOf(depositAndWithdraw.getAmount()));
            map.put(DEPOSIT_AND_WITHDRAW.MT4_RAW_REQUEST, mt4Request.toJSONString());
            map.put(DEPOSIT_AND_WITHDRAW.MT4_REQUEST_TIME, System.currentTimeMillis());
            JSONObject mt4Response = ActiveMq.sendRequestAndAwait("Deposit_User_Info_Topic", mt4Request);
            String orderId = mt4Response.getString("orderid");
            boolean success = StringUtils.isNotBlank(orderId);
            if (!success) {
                throw new Exception(mt4Response.getString("error"));
            }
            int status = DepositAndWithdrawStatusEnum.auditing_success.getValue();
            long responseTimestamp = System.currentTimeMillis();
            String auditUserName = loginUser.getLoginName();
            map.put(DEPOSIT_AND_WITHDRAW.ORDER_ID, orderId);
            map.put(DEPOSIT_AND_WITHDRAW.MT4_RAW_RESPONSE, mt4Response.toJSONString());
            map.put(DEPOSIT_AND_WITHDRAW.MT4_RESPONSE_TIME, responseTimestamp);
            map.put(DEPOSIT_AND_WITHDRAW.STATUS, status);
            map.put(DEPOSIT_AND_WITHDRAW.AUDIT_TIMESTAMP, responseTimestamp);
            map.put(DEPOSIT_AND_WITHDRAW.AUDIT_USER_ID, loginUser.getUserId());
            map.put(DEPOSIT_AND_WITHDRAW.AUDIT_USER_NAME, auditUserName);
            map.put(DEPOSIT_AND_WITHDRAW.AUDIT_SUCCESS_TIME, responseTimestamp);
            DSL.using(Jooq.buildConfiguration()).update(DEPOSIT_AND_WITHDRAW).set(map).where(DEPOSIT_AND_WITHDRAW.ID.equal(id)).execute();
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
            DepositAndWithdrawDao depositAndWithdrawDao = new DepositAndWithdrawDao(Jooq.buildConfiguration());
            DepositAndWithdraw depositAndWithdraw = depositAndWithdrawDao.findById(id);
            if (depositAndWithdraw.getStatus() != DepositAndWithdrawStatusEnum.auditing.getValue()) {
                throw new Exception("状态异常");
            }
            Map<Field<?>, Object> map = new HashMap<>();
            int status = DepositAndWithdrawStatusEnum.auditing_fail.getValue();
            long responseTimestamp = System.currentTimeMillis();
            String auditUserName = loginUser.getLoginName();
            map.put(DEPOSIT_AND_WITHDRAW.STATUS, status);
            map.put(DEPOSIT_AND_WITHDRAW.AUDIT_TIMESTAMP, responseTimestamp);
            map.put(DEPOSIT_AND_WITHDRAW.AUDIT_USER_ID, loginUser.getUserId());
            map.put(DEPOSIT_AND_WITHDRAW.AUDIT_USER_NAME, auditUserName);
            DSL.using(Jooq.buildConfiguration()).update(DEPOSIT_AND_WITHDRAW).set(map).where(DEPOSIT_AND_WITHDRAW.ID.equal(id)).execute();
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
        Condition dateStartCondition = StringUtils.isBlank(dateStart) ? null : DEPOSIT_AND_WITHDRAW.TIME.ge(YyyyMmDd.parse("yyyy年MM月dd日", dateStart).firstMillsecond());
        Condition dateEndCondition = StringUtils.isBlank(dateEnd) ? null : DEPOSIT_AND_WITHDRAW.TIME.le(YyyyMmDd.parse("yyyy年MM月dd日", dateEnd).lastMillsecond());
        Condition auditStatusCondition = auditStatus == null ? null : DEPOSIT_AND_WITHDRAW.STATUS.eq(auditStatus);
        Condition searchKeywordCondition = StringUtils.isBlank(searchKeyword) ? null : DEPOSIT_AND_WITHDRAW.USER_ID.like(search);
        Condition finalCondition = Jooq.and(DSL.condition(true), dateStartCondition, dateEndCondition, auditStatusCondition, searchKeywordCondition);
        List<ExtDepositAndWithdraw> rows = db.select().from(DEPOSIT_AND_WITHDRAW).leftJoin(USER).on(DEPOSIT_AND_WITHDRAW.USER_ID.eq(USER.ID)).where(finalCondition).limit(offset, numberOfRows).fetchInto(ExtDepositAndWithdraw.class);
        long totalRecords = db.fetchCount(DEPOSIT_AND_WITHDRAW);
        long totalDisplayRecords = db.fetchCount(DEPOSIT_AND_WITHDRAW, finalCondition);
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
        Condition typeCondition = DEPOSIT_AND_WITHDRAW.TYPE.eq(DepositAndWithdrawTypeEnum.commission_deposit.getValue());
        Condition dateStartCondition = StringUtils.isBlank(dateStart) ? null : DEPOSIT_AND_WITHDRAW.TIME.ge(YyyyMmDd.parse("yyyy年MM月dd日", dateStart).firstMillsecond());
        Condition dateEndCondition = StringUtils.isBlank(dateEnd) ? null : DEPOSIT_AND_WITHDRAW.TIME.le(YyyyMmDd.parse("yyyy年MM月dd日", dateEnd).lastMillsecond());
        Condition searchKeywordCondition = StringUtils.isBlank(searchKeyword) ? null : DEPOSIT_AND_WITHDRAW.USER_ID.like(search);
        Condition finalCondition = Jooq.and(typeCondition, dateStartCondition, dateEndCondition, searchKeywordCondition);
        List<ExtDepositAndWithdraw> rows = db.select().from(DEPOSIT_AND_WITHDRAW).leftJoin(USER).on(DEPOSIT_AND_WITHDRAW.USER_ID.eq(USER.ID)).where(finalCondition).limit(offset, numberOfRows).fetchInto(ExtDepositAndWithdraw.class);
        long totalRecords = db.fetchCount(DEPOSIT_AND_WITHDRAW);
        long totalDisplayRecords = db.fetchCount(DEPOSIT_AND_WITHDRAW, finalCondition);
        return JSON.toJSONString(DatatablesResponse.build(new DataSet<>(rows, totalRecords, totalDisplayRecords), criterias));
    }
}
