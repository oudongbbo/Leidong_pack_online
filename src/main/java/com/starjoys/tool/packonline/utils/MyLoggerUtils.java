package com.starjoys.tool.packonline.utils;

import org.apache.log4j.Logger;

/**
 * 我的日志输出工具
 *
 * @author Andy
 * @version 1.0
 * @create 2016/12/30
 */

public class MyLoggerUtils {

    // 实例化日志生成器对象
    private static Logger logger = Logger.getLogger(MyLoggerUtils.class);

    public static Logger getInstance() {
        return logger;
    }

    /**
     * 输出Info级别的日志
     *
     * @param info 日志信息
     */
    public static void info(String info) {
        logger.info(info);
    }

    /**
     * 输出Error级别的日志
     *
     * @param info 日志信息
     */
    public static void error(String info) {
        logger.error(info);
    }

    /**
     * 输出Warn级别的日志
     *
     * @param info 日志信息
     */
    public static void warn(String info) {
        logger.warn(info);
    }

    /**
     * 输出Debug级别的日志
     *
     * @param info 日志信息
     */
    public static void debug(String info) {
        logger.debug(info);
    }

    /**
     * 获取调用者的类名
     *
     * @return 标签信息
     */
//    private static String getTag() {
//        StackTraceElement[] trace = new Throwable().fillInStackTrace().getStackTrace();
//        String callingClass = "";
//        for (int i = 2; i < trace.length; i++) { // 调用者放在第三个元素以及之后
//            Class<?> clazz = trace[i].getClass();
//            if (!clazz.equals(MyLoggerUtils.class)) {
//                // 获取使用此工具的类名,类名包括了包名因此截取最后一个小数点后的类名
//                callingClass = trace[i].getClassName();
//                callingClass = callingClass.substring(callingClass.lastIndexOf('.') + 1);
//                break;
//            }
//        }
//        return callingClass;
//    }

    /**
     * 格式化打印出的日志信息
     *
     * @param msg 打印日志信息
     * @return 日志信息
     */
//    private static String buildMessage(String msg) {
//        StackTraceElement[] trace = new Throwable().fillInStackTrace().getStackTrace();
//        String caller = "";
//        int line = -1;
//        for (int i = 2; i < trace.length; i++) {
//            Class<?> clazz = trace[i].getClass();
//            if (!clazz.equals(MyLoggerUtils.class)) {
//                // 获取调用此工具的方法名和行数
//                caller = trace[i].getMethodName();
//                line = trace[i].getLineNumber();
//                break;
//            }
//        }
//        // 格式化输出信息, 增加了线程,方法名和行数
//        return String.format(Locale.CHINA, "Thread:%d, Class:%s, Method:%s, Line:%d, Message:%s", Thread
//                .currentThread().getId(), getTag(), caller, line, msg);
//    }

}
