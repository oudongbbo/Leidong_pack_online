package com.starjoys.tool.packonline.utils;

import com.starjoys.tool.packonline.bean.ConsoleLineBean;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Administrator
 * @version 1.0
 * @create 2017/1/13
 */

public class RuntimeUtils {

    /**
     * 信息分割
     **/
    public final static String MESSAGE_DIVIDE = "-->";

    /**
     * 方法分割
     **/
    public final static String METHOD_DIVIDE = "---->";

    /**
     * 成功标识
     **/
    public final static String SUCCESS_SIGN = "success";

    /**
     * 文件路径分割
     **/
    public final static String FILE_PATH_DIVIDE = "：";

    /**
     * 获取cmd控制台日志字符串
     *
     * @param process 进程
     * @return 日志字符串
     * @throws IOException 异常
     */
    public static String getConsoleLogsStr(Process process) throws IOException {
        StringBuilder logStr = new StringBuilder();
        if (process != null) {
            LineNumberReader inputLine = new LineNumberReader(new InputStreamReader(process.getInputStream()));
            String line;

            while ((line = inputLine.readLine()) != null) {
                if (StringUtils.isNotEmpty(line)) {
                    wrapLine(logStr, line);
                }
            }
            inputLine.close();
        }
        return logStr.toString();
    }

    /**
     * 获取cmd控制台日志列表
     *
     * @param process 进程
     * @return 日志列表
     * @throws IOException 异常
     */
    public static List<String> getConsoleLogsList(Process process) throws IOException {
        List<String> lineList = new ArrayList<>();
        if (process != null) {
            LineNumberReader inputLine = new LineNumberReader(
                    new InputStreamReader(process.getInputStream()));
            String line;

            while ((line = inputLine.readLine()) != null) {
                if (StringUtils.isNotEmpty(line)) {
                    lineList.add(line);
                }
            }
        }
        return lineList;
    }

    /**
     * 控制台日志列表转为字符串
     *
     * @param lineList 日志列表
     * @return 日志字符串
     */
    public static String consoleLogsListToString(List<String> lineList) {
        StringBuilder logStr = new StringBuilder();
        for (String line : lineList) {
            wrapLine(logStr, line);
        }
        return logStr.toString();
    }

    /**
     * 包装字符串行
     *
     * @param builder 字符串构造器
     * @param oriStr  原始字符串
     * @return 包装后的
     */
    private static StringBuilder wrapLine(StringBuilder builder, String oriStr) {
        return builder.append("line").append(MESSAGE_DIVIDE).append(oriStr).append("\n");
    }

    /**
     * 拆开拆开控制台行
     *
     * @param oriConsoleLine 原始控制台行
     * @return 控制台行信息
     * @throws Exception 异常
     */
    public static ConsoleLineBean unwarpConsoleLine(String oriConsoleLine) {
        ConsoleLineBean consoleLineBean = null;
        if (oriConsoleLine != null && StringUtils.isNotEmpty(oriConsoleLine)) {
            String[] consoleLineArray1 = oriConsoleLine.split(MESSAGE_DIVIDE); // 把信息与前缀分割出来
            if (consoleLineArray1.length == 2) { // 能分割出来说明是前缀和信息, 符合最基本的控制台数据
                String prefix = consoleLineArray1[0]; // 前缀
                String message = consoleLineArray1[1]; // 信息, 有可能带方法信息

                if (message.contains(METHOD_DIVIDE)) { // 包含方法分割线

                } else { // 没包含方法分割线, 说明只有前缀和信息
                    consoleLineBean = new ConsoleLineBean(prefix, "", message);
                }
            }
        }
        return consoleLineBean;
    }


}
