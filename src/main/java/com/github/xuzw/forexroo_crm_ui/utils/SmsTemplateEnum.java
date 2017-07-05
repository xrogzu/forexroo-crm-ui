package com.github.xuzw.forexroo_crm_ui.utils;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年4月25日 下午6:18:15
 */
public enum SmsTemplateEnum {
    tpl_91298(91298, "【Forexroo】亲爱的#name#，您关注的大师已经操作，详情请登录手机客户端查看。"), // 短信模板91298
    tpl_91297(91297, "【Forexroo】亲爱的代理商#name#，您的出金申请金额为：$#money#已失败，资金已返回代理商账户，详情请登录管理后台查看。"), // 短信模板91297
    tpl_91296(91296, "【Forexroo】亲爱的#name#，您的出金申请金额为：$#money#已失败，资金已返回交易账户，详情请登录手机客户端查看。"), // 短信模板91296
    tpl_91295(91295, "【Forexroo】亲爱的#name#，您的出金申请已提交，金额：$#money#，请注意查收银行账户，详情请登录手机客户端查看。"), // 短信模板91295
    unbind_bank_card_success(91294, "【Forexroo】亲爱的#name#，您的银行卡解绑成功，详情请登录手机客户端查看。"), // 短信模板91294
    unbind_bank_card(91293, "【Forexroo】亲爱的#name#，您正在解绑银行卡，验证码是#code#。如非本人操作，请忽略本短信。"), // 短信模板91293
    binded_bank_card_success(91292, "【Forexroo】亲爱的#name#，您的银行卡已绑定成功，详情请登录手机客户端查看。"), // 短信模板91292
    binded_bank_card(91291, "【Forexroo】亲爱的#name#，您正在绑定银行卡，验证码是#code#。如非本人操作，请忽略本短信。"), // 短信模板91291
    tpl_91290(91290, "【Forexroo】亲爱的经纪人#name#，您今日的返佣已经结算，金额：$#money#，详情请登录手机客户端查看。"), // 短信模板91290
    broker_request_audit_success(91289, "【Forexroo】亲爱的#name#，恭喜您，您的经纪人审核已通过，快去邀请更多人加入吧。"), // 短信模板91289
    broker_request_audit_fail(91288, "【Forexroo】亲爱的#name#，您的实名认证开户未通过审核，详情请登录手机客户端查看。"), // 短信模板91288
    broker_request_auditing(91287, "【Forexroo】亲爱的#name#，您的经纪人申请已提交，请耐心等待工作人员审核，审核结果会以短信通知。"), // 短信模板91287
    open_account_audit_success(91286, "【Forexroo】亲爱的#name#，恭喜您，您的实名认证开户认证成功，祝您投资愉快。"), // 短信模板91286
    open_account_audit_fail(91285, "【Forexroo】亲爱的#name#，您的实名认证开户未通过审核，详情请登录手机客户端查看。"), // 短信模板91285
    open_account_auditing(91284, "【Forexroo】亲爱的#name#，您的实名认证开户已经提交，请耐心等待工作人员审核，审核结果将会以短信通知。"), // 短信模板91284
    user_update_phone(91283, "【Forexroo】您正在修改手机号，验证码是#code#。如非本人操作，请忽略本短信。"), // 短信模板91283
    tpl_91282(91282, "【Forexroo】您正在修改密码，验证码是#code#。如非本人操作，请忽略本短信。"), // 短信模板91282
    tpl_91281(91281, "【Forexroo】您正找回密码，验证码是#code#。如非本人操作，请忽略本短信。"), // 短信模板91281
    register(91280, "【Forexroo】您正在注册，验证码是#code#。如非本人操作，请忽略本短信。"); // 短信模板91280

    private int templateId;

    private String template;

    private SmsTemplateEnum(int templateId, String template) {
        this.templateId = templateId;
        this.template = template;
    }

    public static SmsTemplateEnum parse(int id) {
        switch (id) {
        case 1:
            return register;
        case 2:
            return user_update_phone;
        case 3:
            return binded_bank_card;
        case 4:
            return unbind_bank_card;
        default:
            return null;
        }
    }

    public int getTemplateId() {
        return templateId;
    }

    public String getTemplate() {
        return template;
    }
}
