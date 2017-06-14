package com.github.xuzw.forexroo_crm_ui;

import java.util.ArrayList;
import java.util.List;

import javax.jms.JMSException;

import org.apache.activemq.ActiveMQConnection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import com.github.xuzw.activemq_utils.ActiveMq;
import com.github.xuzw.forexroo_crm_ui.utils.OssUtils;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月13日 下午4:02:26
 */
@Component
public class ContextRefreshedEventListener implements ApplicationListener<ContextRefreshedEvent> {
    private static final Logger log = LoggerFactory.getLogger(ContextRefreshedEventListener.class);

    @Override
    public void onApplicationEvent(ContextRefreshedEvent evt) {
        OssUtils.init();
        ApplicationContextHolder.set(evt.getApplicationContext());
        try {
            String brokerUrl = "failover:tcp://119.23.62.18:61616";
            List<String> responseTopics = new ArrayList<>();
            responseTopics.add("History_Rates_Info_Result_Topic");
            responseTopics.add("Register_User_Info_Result_Topic");
            responseTopics.add("Get_Tick_Last_Result_Topic");
            responseTopics.add("Get_User_Info_Result_Topic");
            responseTopics.add("Deposit_User_Info_Result_Topic");
            ActiveMq.init(ActiveMQConnection.DEFAULT_USER, ActiveMQConnection.DEFAULT_PASSWORD, brokerUrl, responseTopics);
        } catch (JMSException e) {
            log.error("", e);
        }
    }
}
