package com.github.xuzw.forexroo_crm_ui.utils;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jcabi.http.request.JdkRequest;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月7日 上午11:44:53
 */
public class ApistoreService {
    public static JSONObject sendSms(String mobile, SmsTemplateEnum smsTemplateEnum, JSONObject tplArgs) throws IOException {
        Map<String, String> params = new HashMap<>();
        params.put("key", "23ea02288ae1b784c17de701d77cda4c");
        params.put("mobile", mobile);
        params.put("tpl_id", String.valueOf(smsTemplateEnum.getTemplateId()));
        if (null != tplArgs) {
            params.put("tpl_val", tplArgs.toJSONString());
        }
        String json = new JdkRequest("http://v.apistore.cn/api/v14/xsend").uri().queryParams(params).back().method(com.jcabi.http.Request.GET).fetch().body();
        return JSON.parseObject(json);
    }

    public static JSONObject sendSms(String mobile, SmsTemplateEnum smsTemplateEnum) throws IOException {
        return sendSms(mobile, smsTemplateEnum, null);
    }
}
