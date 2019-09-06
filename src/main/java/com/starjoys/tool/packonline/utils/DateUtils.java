package com.starjoys.tool.packonline.utils;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 日期工具
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/19
 */
public class DateUtils {

    /**
     * 两个日期的天数差计算
     *
     * @param firstDate  第一个日期
     * @param secondDate 第二个日期
     * @return 天数差值
     */
    public static int twoDayDiff(Date firstDate, Date secondDate) {
        if (firstDate != null && secondDate != null) {
            // 获取年中日，进行日差计算
            int field = Calendar.DAY_OF_YEAR;
            int firstDay = getFromCalendar(firstDate, field);
            int secondDay = getFromCalendar(secondDate, field);
            return Math.abs(firstDay - secondDay); // 返回绝对值
        }
        return -1; // 执行失败，返回-1
    }

    /**
     * 方便获取设置日期后的日历信息
     *
     * @param date  日期对象
     * @param field 获取指定信息
     * @return 年中日
     */
    public static int getFromCalendar(Date date, int field) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return calendar.get(field);
    }

    /**
     * 获取日期字符串格式化
     *
     * @param time 时间戳
     * @return
     */
    public static String getDateStringFormat(long time) {
        return new SimpleDateFormat("yyyyMMddHHmmss").format(new Date(time));
    }


    /**
     * 获取简单日期字符串格式化
     *
     * @param time 时间戳
     * @return
     */
    public static String getSimpleDateStringFormat(long time) {
        return new SimpleDateFormat("yyyyMMdd").format(new Date(time));
    }


}
