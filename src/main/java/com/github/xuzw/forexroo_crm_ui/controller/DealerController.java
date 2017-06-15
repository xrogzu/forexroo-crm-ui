package com.github.xuzw.forexroo_crm_ui.controller;

import static com.github.xuzw.forexroo.entity.Tables.USER;

import java.sql.SQLException;
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
import com.github.xuzw.forexroo_crm_ui.database.model.OpenAccountStatusEnum;
import com.github.xuzw.forexroo_crm_ui.utils.OssUtils;

import cn.ermei.admui.controller.BaseController;

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
            json.put("groupname", "testssss");
            json.put("password", "abc123456");
            json.put("investor", "abc123456");
            json.put("phonepwd", "abc123456");
            JSONObject resp = ActiveMq.sendRequestAndAwait("Register_User_Info_Topic", json);
            String mt4RealAccount = resp.getString("login");
            int openAccountStatus = OpenAccountStatusEnum.auditing_success.getValue();
            long openAccountAuditTimestamp = System.currentTimeMillis();
            Map<Field<?>, Object> map = new HashMap<>();
            map.put(USER.MT4_REAL_ACCOUNT, mt4RealAccount);
            map.put(USER.OPEN_ACCOUNT_STATUS, openAccountStatus);
            map.put(USER.OPEN_ACCOUNT_AUDIT_TIMESTAMP, openAccountAuditTimestamp);
            DSL.using(Jooq.buildConfiguration()).update(USER).set(map).where(USER.ID.equal(user.getId())).execute();
            jsonResponse.put("code", 0);
            jsonResponse.put("mt4RealAccount", mt4RealAccount);
            jsonResponse.put("openAccountStatus", openAccountStatus);
            jsonResponse.put("openAccountAuditTimestamp", openAccountAuditTimestamp);
        } catch (Exception e) {
            jsonResponse.put("code", 1);
            jsonResponse.put("message", ExceptionUtils.getMessage(e));
        }
        return jsonResponse.toJSONString();
    }

    @RequestMapping(value = "/auditFail", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String auditFail(Long id, Integer reason) {
        JSONObject jsonResponse = new JSONObject();
        try {
            UserDao userDao = new UserDao(Jooq.buildConfiguration());
            User user = userDao.fetchOneById(id);
            if (user.getOpenAccountStatus() != OpenAccountStatusEnum.auditing.getValue()) {
                throw new Exception("状态异常");
            }
            int openAccountStatus = OpenAccountStatusEnum.auditing_fail.getValue();
            long openAccountAuditTimestamp = System.currentTimeMillis();
            Map<Field<?>, Object> map = new HashMap<>();
            map.put(USER.OPEN_ACCOUNT_AUDIT_FAIL_REASON, reason);
            map.put(USER.OPEN_ACCOUNT_STATUS, openAccountStatus);
            map.put(USER.OPEN_ACCOUNT_AUDIT_TIMESTAMP, openAccountAuditTimestamp);
            DSL.using(Jooq.buildConfiguration()).update(USER).set(map).where(USER.ID.equal(user.getId())).execute();
            jsonResponse.put("code", 0);
            jsonResponse.put("openAccountAuditFailReason", reason);
            jsonResponse.put("openAccountStatus", openAccountStatus);
            jsonResponse.put("openAccountAuditTimestamp", openAccountAuditTimestamp);
        } catch (Exception e) {
            jsonResponse.put("code", 1);
            jsonResponse.put("message", ExceptionUtils.getMessage(e));
        }
        return jsonResponse.toJSONString();
    }

    @RequestMapping(value = "/all", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String all(String dateStart, String dateEnd, String auditStatus, String searchKeyword, HttpServletRequest request) throws SQLException {
        DatatablesCriterias criterias = DatatablesCriterias.getFromRequest(request);
        Integer offset = criterias.getStart();
        Integer numberOfRows = criterias.getLength();
        String search = "%" + searchKeyword + "%";
        DSLContext db = DSL.using(Jooq.buildConfiguration());
        Condition condition = USER.NICKNAME.like(search).or(USER.PHONE.like(search)).or(USER.MT4_REAL_ACCOUNT.like(search));
        List<User> rows = db.selectFrom(USER).where(condition).limit(offset, numberOfRows).fetchInto(User.class);
        for (User extUser : rows) {
            if (StringUtils.isNoneBlank(extUser.getOpenAccountPictureUrl())) {
                extUser.setOpenAccountPictureUrl(OssUtils.generatePresignedUrl(extUser.getOpenAccountPictureUrl()));
            }
            if (StringUtils.isNoneBlank(extUser.getOpenAccountSignUrl())) {
                extUser.setOpenAccountSignUrl(OssUtils.generatePresignedUrl(extUser.getOpenAccountSignUrl()));
            }
        }
        long totalRecords = db.fetchCount(USER);
        long totalDisplayRecords = db.fetchCount(USER, condition);
        return JSON.toJSONString(DatatablesResponse.build(new DataSet<>(rows, totalRecords, totalDisplayRecords), criterias));
    }
}
