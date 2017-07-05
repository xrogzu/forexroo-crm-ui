package com.github.xuzw.forexroo_crm_ui.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @author 徐泽威 xuzewei_2012@126.com
 * @time 2017年6月15日 下午1:14:44
 */
public class YyyyMmDd {
    private int yyyy;
    private int mm;
    private int dd;

    public YyyyMmDd(int yyyy, int mm, int dd) {
        this.yyyy = yyyy;
        this.mm = mm;
        this.dd = dd;
    }

    public long firstMillsecond() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR, yyyy);
        calendar.set(Calendar.MONTH, mm);
        calendar.set(Calendar.DAY_OF_MONTH, dd);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        return calendar.getTimeInMillis();
    }

    public long lastMillsecond() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR, yyyy);
        calendar.set(Calendar.MONTH, mm);
        calendar.set(Calendar.DAY_OF_MONTH, dd);
        calendar.set(Calendar.HOUR_OF_DAY, 23);
        calendar.set(Calendar.MINUTE, 59);
        calendar.set(Calendar.SECOND, 59);
        calendar.set(Calendar.MILLISECOND, 999);
        return calendar.getTimeInMillis();
    }

    public String format(String format) {
        return new SimpleDateFormat(format).format(new Date(firstMillsecond()));
    }

    public int getYyyy() {
        return yyyy;
    }

    public int getMm() {
        return mm;
    }

    public int getDd() {
        return dd;
    }

    public static YyyyMmDd parse(String format, String string) throws ParseException {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new SimpleDateFormat(format).parse(string));
        return new YyyyMmDd(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DAY_OF_MONTH));
    }

    public static YyyyMmDd today() throws ParseException {
        Calendar calendar = Calendar.getInstance();
        return new YyyyMmDd(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DAY_OF_MONTH));
    }

    public static YyyyMmDd yesterday() throws ParseException {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DAY_OF_MONTH, -1);
        return new YyyyMmDd(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DAY_OF_MONTH));
    }
}
