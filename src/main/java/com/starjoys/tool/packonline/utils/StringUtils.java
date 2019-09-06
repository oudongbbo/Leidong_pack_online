package com.starjoys.tool.packonline.utils;

/**
 * 字符串工具类
 *
 * @author Andy
 * @version 1.0
 * @create 2016/12/30
 */

public class StringUtils {

    /**
     * 判断字符串是否有值
     *
     * @param str 字符串
     * @return 是否有值
     */
    public static boolean isNotEmpty(String str) {
        if (str == null || "".equals(str.trim())) {
            return false;
        }
        return true;
    }

    /**
     * 判断字符串是否有值
     *
     * @param str 字符串
     * @return 是否有值
     */
    public static boolean isEmpty(String str) {
        if (str == null || "".equals(str.trim())) {
            return true;
        }
        return false;
    }


    /**
     * 字符串加法运算
     *
     * @param numStr 准备计算的字符串数字数组
     * @return 计算结果
     * @throws NumberFormatException 数字转换异常
     */
    public static int add(String... numStr) throws NumberFormatException {
        int resultNum = 0;
        for (String str : numStr) {
            // 字符串数字转换
            int num = Integer.parseInt(str);
            resultNum += num; // 加法运算
        }
        return resultNum;
    }

    /**
     * 字符串减法运算
     *
     * @param firstNumStr  被减数
     * @param secondNumStr 准备计算的字符串数字数组
     * @return 计算结果
     * @throws NumberFormatException 数字转换异常
     */
    public static int sub(String firstNumStr, String... secondNumStr) throws NumberFormatException {
        int resultNum = 0;
        if (firstNumStr != null) { // 当被减数不会空时
            resultNum = Integer.parseInt(firstNumStr); // 设置被减数
        }
        for (String str : secondNumStr) {
            // 字符串数字转换
            int num = Integer.parseInt(str);
            resultNum -= num; // 减法运算
        }
        return resultNum;
    }


}
