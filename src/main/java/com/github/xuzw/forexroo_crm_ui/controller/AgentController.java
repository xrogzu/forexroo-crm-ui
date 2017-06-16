package com.github.xuzw.forexroo_crm_ui.controller;

import static com.github.xuzw.forexroo.entity.Tables.AGENT;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.jooq.Condition;
import org.jooq.DSLContext;
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
import com.github.xuzw.forexroo.entity.tables.daos.AgentDao;
import com.github.xuzw.forexroo.entity.tables.pojos.Agent;
import com.github.xuzw.forexroo_crm_ui.database.Jooq;
import com.github.xuzw.forexroo_crm_ui.database.model.AgentStatusEnum;
import com.github.xuzw.forexroo_crm_ui.database.model.BooleanEnum;
import com.github.xuzw.forexroo_crm_ui.database.model.ExtAgent;
import com.github.xuzw.forexroo_crm_ui.utils.YyyyMmDd;

import cn.ermei.admui.controller.BaseController;
import cn.ermei.admui.vo.UserVo;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月16日 下午5:28:58
 */
@Controller
@RequestMapping("/agent")
public class AgentController extends BaseController {

    @RequestMapping(value = "/create", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String create(String name, String bankDetailOpeningBank, String bankDetailOpeningBankAddress, String bankDetailAccountNumber, String account, String password, HttpServletRequest request) throws SQLException, ParseException {
        UserVo loginUser = (UserVo) session.getAttribute("loginUser");
        JSONObject jsonResponse = new JSONObject();
        try {
            if (StringUtils.isBlank(name)) {
                throw new Exception("缺失必填项");
            }
            AgentDao agentDao = new AgentDao(Jooq.buildConfiguration());
            Agent agent = new Agent();
            agent.setName(name);
            agent.setBankDetailOpeningBank(bankDetailOpeningBankAddress);
            agent.setBankDetailOpeningBankAddress(bankDetailOpeningBankAddress);
            agent.setBankDetailAccountNumber(bankDetailAccountNumber);
            agent.setAccount(account);
            agent.setPassword(password);
            agent.setRegisterTime(System.currentTimeMillis());
            agent.setCreatorUserId(loginUser.getUserId());
            agent.setCreatorUserName(loginUser.getLoginName());
            agentDao.insert(agent);
            jsonResponse.put("code", 0);
        } catch (Exception e) {
            jsonResponse.put("code", 1);
            jsonResponse.put("message", ExceptionUtils.getMessage(e));
        }
        return jsonResponse.toJSONString();
    }

    @RequestMapping(value = "/all", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String all(String dateStart, String dateEnd, Integer auditStatus, String searchKeyword, HttpServletRequest request) throws SQLException, ParseException {
        DatatablesCriterias criterias = DatatablesCriterias.getFromRequest(request);
        Integer offset = criterias.getStart();
        Integer numberOfRows = criterias.getLength();
        String search = "%" + searchKeyword + "%";
        DSLContext db = DSL.using(Jooq.buildConfiguration());
        Condition dateStartCondition = StringUtils.isBlank(dateStart) ? null : AGENT.REGISTER_TIME.ge(YyyyMmDd.parse("yyyy年MM月dd日", dateStart).firstMillsecond());
        Condition dateEndCondition = StringUtils.isBlank(dateEnd) ? null : AGENT.REGISTER_TIME.le(YyyyMmDd.parse("yyyy年MM月dd日", dateEnd).lastMillsecond());
        Condition searchKeywordCondition = StringUtils.isBlank(searchKeyword) ? null : AGENT.NAME.like(search).or(AGENT.ID.like(search));
        Condition finalCondition = Jooq.and(DSL.condition(true), dateStartCondition, dateEndCondition, searchKeywordCondition);
        List<ExtAgent> rows = db.selectFrom(AGENT).where(finalCondition).limit(offset, numberOfRows).fetchInto(ExtAgent.class);
        for (ExtAgent agent : rows) {
            if (agent.getIsDisable() == BooleanEnum.yes.getValue()) {
                agent.setStatus(AgentStatusEnum.disable.getValue());
            } else if (agent.getIsClosing() == BooleanEnum.yes.getValue()) {
                agent.setStatus(AgentStatusEnum.closing.getValue());
            } else {
                agent.setStatus(AgentStatusEnum.normal.getValue());
            }
        }
        long totalRecords = db.fetchCount(AGENT);
        long totalDisplayRecords = db.fetchCount(AGENT, finalCondition);
        return JSON.toJSONString(DatatablesResponse.build(new DataSet<>(rows, totalRecords, totalDisplayRecords), criterias));
    }
}
