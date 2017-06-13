package com.github.xuzw.forexroo_crm_ui;

import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月13日 下午4:02:26
 */
@Component
public class ContextRefreshedEventListener implements ApplicationListener<ContextRefreshedEvent> {
    @Override
    public void onApplicationEvent(ContextRefreshedEvent evt) {
        ApplicationContextHolder.set(evt.getApplicationContext());
    }
}
