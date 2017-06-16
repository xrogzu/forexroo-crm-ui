package com.github.xuzw.forexroo_crm_ui.controller;

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
import com.github.xuzw.forexroo.entity.tables.daos.UserDao;
import com.github.xuzw.forexroo.entity.tables.pojos.User;
import com.github.xuzw.forexroo_crm_ui.database.Jooq;
import com.github.xuzw.forexroo_crm_ui.database.model.BooleanEnum;
import com.github.xuzw.forexroo_crm_ui.database.model.BrokerRequestStatusEnum;
import com.github.xuzw.forexroo_crm_ui.database.model.ExtUser;
import com.github.xuzw.forexroo_crm_ui.database.model.OpenAccountStatusEnum;
import com.github.xuzw.forexroo_crm_ui.database.model.UserStatusEnum;
import com.github.xuzw.forexroo_crm_ui.utils.OssUtils;
import com.github.xuzw.forexroo_crm_ui.utils.YyyyMmDd;

import cn.ermei.admui.controller.BaseController;
import cn.ermei.admui.vo.UserVo;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月16日 下午2:26:34
 */
@Controller
@RequestMapping("/broker")
public class BrokerController extends BaseController {

    @RequestMapping(value = "/auditSuccess", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String auditSuccess(Long id) {
        UserVo loginUser = (UserVo) session.getAttribute("loginUser");
        JSONObject jsonResponse = new JSONObject();
        try {
            UserDao userDao = new UserDao(Jooq.buildConfiguration());
            User user = userDao.fetchOneById(id);
            if (user.getBrokerRequestStatus() != BrokerRequestStatusEnum.auditing.getValue()) {
                throw new Exception("状态异常");
            }
            int status = BrokerRequestStatusEnum.auditing_success.getValue();
            long timestamp = System.currentTimeMillis();
            String auditUserName = loginUser.getLoginName();
            Map<Field<?>, Object> map = new HashMap<>();
            map.put(USER.BROKER_REQUEST_STATUS, status);
            map.put(USER.BROKER_REQUEST_AUDIT_TIMESTAMP, timestamp);
            map.put(USER.BROKER_REQUEST_AUDIT_USER_ID, loginUser.getUserId());
            map.put(USER.BROKER_REQUEST_AUDIT_USER_NAME, auditUserName);
            map.put(USER.BROKER_REQUEST_AUDIT_SUCCESS_TIME, timestamp);
            DSL.using(Jooq.buildConfiguration()).update(USER).set(map).where(USER.ID.equal(user.getId())).execute();
            jsonResponse.put("code", 0);
            jsonResponse.put("brokerRequestStatus", status);
            jsonResponse.put("brokerRequestAuditTimestamp", timestamp);
            jsonResponse.put("brokerRequestAuditUserName", auditUserName);
        } catch (Exception e) {
            jsonResponse.put("code", 1);
            jsonResponse.put("message", ExceptionUtils.getMessage(e));
        }
        return jsonResponse.toJSONString();
    }

    @RequestMapping(value = "/auditFail", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String auditFail(Long id, Integer reason) {
        UserVo loginUser = (UserVo) session.getAttribute("loginUser");
        JSONObject jsonResponse = new JSONObject();
        try {
            UserDao userDao = new UserDao(Jooq.buildConfiguration());
            User user = userDao.fetchOneById(id);
            if (user.getBrokerRequestStatus() != BrokerRequestStatusEnum.auditing.getValue()) {
                throw new Exception("状态异常");
            }
            int status = OpenAccountStatusEnum.auditing_fail.getValue();
            long timestamp = System.currentTimeMillis();
            String auditUserName = loginUser.getLoginName();
            Map<Field<?>, Object> map = new HashMap<>();
            map.put(USER.BROKER_REQUEST_AUDIT_FAIL_REASON, reason);
            map.put(USER.BROKER_REQUEST_STATUS, status);
            map.put(USER.BROKER_REQUEST_AUDIT_TIMESTAMP, timestamp);
            map.put(USER.BROKER_REQUEST_AUDIT_USER_ID, loginUser.getUserId());
            map.put(USER.BROKER_REQUEST_AUDIT_USER_NAME, auditUserName);
            DSL.using(Jooq.buildConfiguration()).update(USER).set(map).where(USER.ID.equal(user.getId())).execute();
            jsonResponse.put("code", 0);
            jsonResponse.put("brokerRequestAuditFailReason", reason);
            jsonResponse.put("brokerRequestStatus", status);
            jsonResponse.put("brokerRequestAuditTimestamp", timestamp);
            jsonResponse.put("brokerRequestAuditUserName", auditUserName);
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
        Condition dateStartCondition = StringUtils.isBlank(dateStart) ? null : USER.REGISTER_TIME.ge(YyyyMmDd.parse("yyyy年MM月dd日", dateStart).firstMillsecond());
        Condition dateEndCondition = StringUtils.isBlank(dateEnd) ? null : USER.REGISTER_TIME.le(YyyyMmDd.parse("yyyy年MM月dd日", dateEnd).lastMillsecond());
        Condition auditStatusCondition = auditStatus == null ? null : USER.OPEN_ACCOUNT_STATUS.eq(auditStatus);
        Condition searchKeywordCondition = StringUtils.isBlank(searchKeyword) ? null : USER.NICKNAME.like(search).or(USER.OPEN_ACCOUNT_REALNAME.like(search)).or(USER.PHONE.like(search)).or(USER.MT4_REAL_ACCOUNT.like(search));
        Condition finalCondition = Jooq.and(DSL.condition(true), dateStartCondition, dateEndCondition, auditStatusCondition, searchKeywordCondition);
        List<User> rows = db.selectFrom(USER).where(finalCondition).limit(offset, numberOfRows).fetchInto(User.class);
        for (User user : rows) {
            if (StringUtils.isNoneBlank(user.getOpenAccountPictureUrl())) {
                user.setOpenAccountPictureUrl(OssUtils.generatePresignedUrl(user.getOpenAccountPictureUrl(), "image/resize,h_150"));
            }
            if (StringUtils.isNoneBlank(user.getBrokerRequestSignUrl())) {
                user.setBrokerRequestSignUrl(OssUtils.generatePresignedUrl(user.getBrokerRequestSignUrl(), "image/resize,h_150/rotate,270"));
            }
        }
        long totalRecords = db.fetchCount(USER);
        long totalDisplayRecords = db.fetchCount(USER, finalCondition);
        return JSON.toJSONString(DatatablesResponse.build(new DataSet<>(rows, totalRecords, totalDisplayRecords), criterias));
    }

    @RequestMapping(value = "/all", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String all(String dateStart, String dateEnd, Integer auditStatus, String searchKeyword, HttpServletRequest request) throws SQLException, ParseException {
        DatatablesCriterias criterias = DatatablesCriterias.getFromRequest(request);
        Integer offset = criterias.getStart();
        Integer numberOfRows = criterias.getLength();
        String search = "%" + searchKeyword + "%";
        DSLContext db = DSL.using(Jooq.buildConfiguration());
        Condition dateStartCondition = StringUtils.isBlank(dateStart) ? null : USER.REGISTER_TIME.ge(YyyyMmDd.parse("yyyy年MM月dd日", dateStart).firstMillsecond());
        Condition dateEndCondition = StringUtils.isBlank(dateEnd) ? null : USER.REGISTER_TIME.le(YyyyMmDd.parse("yyyy年MM月dd日", dateEnd).lastMillsecond());
        Condition auditStatusCondition = auditStatus == null ? null : USER.OPEN_ACCOUNT_STATUS.eq(auditStatus);
        Condition searchKeywordCondition = StringUtils.isBlank(searchKeyword) ? null : USER.NICKNAME.like(search).or(USER.OPEN_ACCOUNT_REALNAME.like(search)).or(USER.PHONE.like(search)).or(USER.MT4_REAL_ACCOUNT.like(search));
        Condition finalCondition = Jooq.and(DSL.condition(true), dateStartCondition, dateEndCondition, auditStatusCondition, searchKeywordCondition);
        List<ExtUser> rows = db.selectFrom(USER).where(finalCondition).limit(offset, numberOfRows).fetchInto(ExtUser.class);
        for (ExtUser user : rows) {
            if (user.getIsDisable() == BooleanEnum.yes.getValue()) {
                user.setStatus(UserStatusEnum.disable.getValue());
            } else if (user.getIsClosing() == BooleanEnum.yes.getValue()) {
                user.setStatus(UserStatusEnum.closing.getValue());
            } else if (user.getOpenAccountStatus() == OpenAccountStatusEnum.auditing_success.getValue()) {
                user.setStatus(UserStatusEnum.normal.getValue());
            } else {
                user.setStatus(UserStatusEnum.register.getValue());
            }
            if (StringUtils.isNoneBlank(user.getOpenAccountPictureUrl())) {
                user.setOpenAccountPictureUrl(OssUtils.generatePresignedUrl(user.getOpenAccountPictureUrl(), "image/resize,h_150"));
            }
            if (StringUtils.isNoneBlank(user.getBrokerRequestSignUrl())) {
                user.setBrokerRequestSignUrl(OssUtils.generatePresignedUrl(user.getBrokerRequestSignUrl(), "image/resize,h_150/rotate,270"));
            }
        }
        long totalRecords = db.fetchCount(USER);
        long totalDisplayRecords = db.fetchCount(USER, finalCondition);
        return JSON.toJSONString(DatatablesResponse.build(new DataSet<>(rows, totalRecords, totalDisplayRecords), criterias));
    }
}
