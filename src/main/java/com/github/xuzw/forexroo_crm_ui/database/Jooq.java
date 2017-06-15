package com.github.xuzw.forexroo_crm_ui.database;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.jooq.Condition;
import org.jooq.Configuration;
import org.jooq.Operator;
import org.jooq.SQLDialect;
import org.jooq.impl.DSL;
import org.jooq.impl.DefaultConfiguration;

import com.alibaba.druid.pool.DruidDataSource;
import com.github.xuzw.forexroo_crm_ui.ApplicationContextHolder;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年4月7日 下午11:58:42
 */
public class Jooq {
    public static Configuration buildConfiguration(DataSource dataSource) {
        DefaultConfiguration configuration = new DefaultConfiguration();
        configuration.set(dataSource);
        configuration.setSQLDialect(SQLDialect.MYSQL);
        return configuration;
    }

    public static Configuration buildConfiguration() throws SQLException {
        return buildConfiguration(ApplicationContextHolder.get().getBean(DruidDataSource.class));
    }

    public static Condition and(Condition... conditions) {
        return condition(Operator.AND, conditions);
    }

    public static Condition or(Condition... conditions) {
        return condition(Operator.OR, conditions);
    }

    public static Condition condition(Operator operator, Condition... conditions) {
        List<Condition> list = new ArrayList<>();
        for (Condition x : conditions) {
            if (x != null) {
                list.add(x);
            }
        }
        return DSL.condition(operator, list);
    }
}
