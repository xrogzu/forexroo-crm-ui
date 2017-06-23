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
import com.github.xuzw.activemq_utils.ActiveMq;
import com.github.xuzw.forexroo.entity.tables.daos.UserDao;
import com.github.xuzw.forexroo.entity.tables.pojos.User;
import com.github.xuzw.forexroo_crm_ui.database.Jooq;
import com.github.xuzw.forexroo_crm_ui.database.model.BooleanEnum;
import com.github.xuzw.forexroo_crm_ui.database.model.ExtUser;
import com.github.xuzw.forexroo_crm_ui.database.model.OpenAccountStatusEnum;
import com.github.xuzw.forexroo_crm_ui.database.model.UserStatusEnum;
import com.github.xuzw.forexroo_crm_ui.utils.OssUtils;
import com.github.xuzw.forexroo_crm_ui.utils.YyyyMmDd;

import cn.ermei.admui.controller.BaseController;
import cn.ermei.admui.vo.UserVo;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月13日 下午3:14:06
 */
@Controller
@RequestMapping("/dealer")
public class DealerController extends BaseController {

    @RequestMapping(value = "/auditSuccess", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String auditSuccess(Long id) {
        UserVo loginUser = (UserVo) session.getAttribute("loginUser");
        JSONObject jsonResponse = new JSONObject();
        try {
            UserDao userDao = new UserDao(Jooq.buildConfiguration());
            User user = userDao.fetchOneById(id);
            if (user.getOpenAccountStatus() != OpenAccountStatusEnum.auditing.getValue()) {
                throw new Exception("状态异常");
            }
            JSONObject json = new JSONObject();
            json.put("username", user.getPhone());
            json.put("leverage", 100);
            json.put("groupname", "demoforexroo");
            json.put("password", user.getPassword());
            json.put("investor", user.getPassword());
            json.put("phonepwd", user.getPassword());
            JSONObject resp = ActiveMq.sendRequestAndAwait("Register_User_Info_Topic", json);
            String mt4RealAccount = resp.getString("login");
            if (StringUtils.isBlank(mt4RealAccount) || mt4RealAccount.equals("0")) {
                throw new Exception("无效的mt4账号");
            }
            int openAccountStatus = OpenAccountStatusEnum.auditing_success.getValue();
            long openAccountAuditTimestamp = System.currentTimeMillis();
            String openAccountAuditUserName = loginUser.getLoginName();
            Map<Field<?>, Object> map = new HashMap<>();
            map.put(USER.MT4_REAL_ACCOUNT, mt4RealAccount);
            map.put(USER.OPEN_ACCOUNT_STATUS, openAccountStatus);
            map.put(USER.OPEN_ACCOUNT_AUDIT_TIMESTAMP, openAccountAuditTimestamp);
            map.put(USER.OPEN_ACCOUNT_AUDIT_USER_ID, loginUser.getUserId());
            map.put(USER.OPEN_ACCOUNT_AUDIT_USER_NAME, openAccountAuditUserName);
            map.put(USER.OPEN_ACCOUNT_AUDIT_SUCCESS_TIME, openAccountAuditTimestamp);
            DSL.using(Jooq.buildConfiguration()).update(USER).set(map).where(USER.ID.equal(user.getId())).execute();
            jsonResponse.put("code", 0);
            jsonResponse.put("mt4RealAccount", mt4RealAccount);
            jsonResponse.put("openAccountStatus", openAccountStatus);
            jsonResponse.put("openAccountAuditTimestamp", openAccountAuditTimestamp);
            jsonResponse.put("openAccountAuditUserName", openAccountAuditUserName);
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
            if (user.getOpenAccountStatus() != OpenAccountStatusEnum.auditing.getValue()) {
                throw new Exception("状态异常");
            }
            int openAccountStatus = OpenAccountStatusEnum.auditing_fail.getValue();
            long openAccountAuditTimestamp = System.currentTimeMillis();
            String openAccountAuditUserName = loginUser.getLoginName();
            Map<Field<?>, Object> map = new HashMap<>();
            map.put(USER.OPEN_ACCOUNT_AUDIT_FAIL_REASON, reason);
            map.put(USER.OPEN_ACCOUNT_STATUS, openAccountStatus);
            map.put(USER.OPEN_ACCOUNT_AUDIT_TIMESTAMP, openAccountAuditTimestamp);
            map.put(USER.OPEN_ACCOUNT_AUDIT_USER_ID, loginUser.getUserId());
            map.put(USER.OPEN_ACCOUNT_AUDIT_USER_NAME, openAccountAuditUserName);
            DSL.using(Jooq.buildConfiguration()).update(USER).set(map).where(USER.ID.equal(user.getId())).execute();
            jsonResponse.put("code", 0);
            jsonResponse.put("openAccountAuditFailReason", reason);
            jsonResponse.put("openAccountStatus", openAccountStatus);
            jsonResponse.put("openAccountAuditTimestamp", openAccountAuditTimestamp);
            jsonResponse.put("openAccountAuditUserName", openAccountAuditUserName);
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
        Condition searchKeywordCondition = StringUtils.isBlank(searchKeyword) ? null : USER.NICKNAME.like(search).or(USER.PHONE.like(search)).or(USER.MT4_REAL_ACCOUNT.like(search));
        Condition finalCondition = Jooq.and(DSL.condition(true), dateStartCondition, dateEndCondition, auditStatusCondition, searchKeywordCondition);
        List<User> rows = db.selectFrom(USER).where(finalCondition).limit(offset, numberOfRows).fetchInto(User.class);
        for (User user : rows) {
            if (StringUtils.isNoneBlank(user.getOpenAccountPictureUrl())) {
                user.setOpenAccountPictureUrl(OssUtils.generatePresignedUrl(user.getOpenAccountPictureUrl(), "image/resize,h_150"));
            }
            if (StringUtils.isNoneBlank(user.getOpenAccountSignUrl())) {
                user.setOpenAccountSignUrl(OssUtils.generatePresignedUrl(user.getOpenAccountSignUrl(), "image/resize,h_150/rotate,270"));
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
            if (StringUtils.isNoneBlank(user.getAvatar())) {
                user.setAvatar(OssUtils.generatePresignedUrl(user.getAvatar(), "image/resize,h_25"));
            }
            if (StringUtils.isNoneBlank(user.getOpenAccountPictureUrl())) {
                user.setOpenAccountPictureUrl(OssUtils.generatePresignedUrl(user.getOpenAccountPictureUrl(), "image/resize,h_150"));
            }
            if (StringUtils.isNoneBlank(user.getOpenAccountSignUrl())) {
                user.setOpenAccountSignUrl(OssUtils.generatePresignedUrl(user.getOpenAccountSignUrl(), "image/resize,h_150/rotate,270"));
            }
        }
        long totalRecords = db.fetchCount(USER);
        long totalDisplayRecords = db.fetchCount(USER, finalCondition);
        return JSON.toJSONString(DatatablesResponse.build(new DataSet<>(rows, totalRecords, totalDisplayRecords), criterias));
    }
}
