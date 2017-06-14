package com.github.xuzw.forexroo_crm_ui.controller;

import static com.github.xuzw.forexroo.entity.Tables.USER;

import java.sql.SQLException;
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

    @RequestMapping(value = "/all", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String all(String dateStart, String dateEnd, String auditStatus, String searchKeyword, HttpServletRequest request) throws SQLException {
        DatatablesCriterias criterias = DatatablesCriterias.getFromRequest(request);
        Integer offset = criterias.getStart();
        Integer numberOfRows = criterias.getLength();
        String search = "%" + searchKeyword + "%";
        DSLContext db = DSL.using(Jooq.buildConfiguration());
        Condition condition = USER.OPEN_ACCOUNT_STATUS.eq(OpenAccountStatusEnum.auditing.getValue()).and(USER.NICKNAME.like(search).or(USER.PHONE.like(search)).or(USER.MT4_REAL_ACCOUNT.like(search)));
        List<ExtUser> rows = db.selectFrom(USER).where(condition).limit(offset, numberOfRows).fetchInto(ExtUser.class);
        for (ExtUser extUser : rows) {
            extUser.setOpenAccountPictureUrl(OssUtils.generatePresignedUrl(extUser.getOpenAccountPictureUrl()));
            extUser.setOpenAccountSignUrl(OssUtils.generatePresignedUrl(extUser.getOpenAccountSignUrl()));
        }
        long totalRecords = db.fetchCount(USER);
        long totalDisplayRecords = db.fetchCount(USER, condition);
        return JSON.toJSONString(DatatablesResponse.build(new DataSet<>(rows, totalRecords, totalDisplayRecords), criterias));
    }

    public static class ExtUser extends User {
        private static final long serialVersionUID = 1L;
        private String myBrokerNickname;
        private String myAgentName;
        private Integer openAccountAuditUserName;

        public String getMyBrokerNickname() {
            return myBrokerNickname;
        }

        public void setMyBrokerNickname(String myBrokerNickname) {
            this.myBrokerNickname = myBrokerNickname;
        }

        public String getMyAgentName() {
            return myAgentName;
        }

        public void setMyAgentName(String myAgentName) {
            this.myAgentName = myAgentName;
        }

        public Integer getOpenAccountAuditUserName() {
            return openAccountAuditUserName;
        }

        public void setOpenAccountAuditUserName(Integer openAccountAuditUserName) {
            this.openAccountAuditUserName = openAccountAuditUserName;
        }
    }
}
