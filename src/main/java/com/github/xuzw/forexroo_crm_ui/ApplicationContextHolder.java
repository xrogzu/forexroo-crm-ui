package com.github.xuzw.forexroo_crm_ui;

import org.springframework.context.ApplicationContext;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月13日 下午3:05:40
 */
public class ApplicationContextHolder {
    private static ApplicationContext applicationContext;

    public static ApplicationContext get() {
        return applicationContext;
    }

    public static void set(ApplicationContext applicationContext) {
        ApplicationContextHolder.applicationContext = applicationContext;
    }
}
