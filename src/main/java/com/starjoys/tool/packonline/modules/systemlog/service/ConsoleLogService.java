package com.starjoys.tool.packonline.modules.systemlog.service;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.utils.SystemUtils;
import org.springframework.stereotype.Service;

import java.io.*;

/**
 * 控制台日志业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/3/20
 */

@Service
public class ConsoleLogService extends BaseService {

    /** win系统控制台日志路径 **/
    public static final String WIN_CONSOLE_LOG_PATH = "../logs/catalina.2017-01-04.log";

    /** mac系统控制台日志路径 **/
    public static final String MAC_CONSOLE_LOG_PATH = "/Users/sj_android/apache-tomcat-8.5.9/logs/catalina.out";

    /**
     * 读取控制台日志
     *
     * @return 返回结果集
     */
    public ResultBean<String> load() {
        sendLog("调用到读取日志逻辑");
        ResultBean<String> resultBean = new ResultBean<>();
        // 读取文件
        String path;
        if (SystemUtils.isWindowsOS()) {
            path = WIN_CONSOLE_LOG_PATH;
        } else {
            path = MAC_CONSOLE_LOG_PATH;
        }
        File logFile = new File(path);
        sendLog("读取文件路径 " + logFile.getAbsolutePath());
        if (logFile.exists()) {
            StringBuilder stringBuilder = new StringBuilder();
            try {
                BufferedReader reader = new BufferedReader(new FileReader(logFile));

                // 逐行读取
                String input;
                while ((input = reader.readLine()) != null) {
                    stringBuilder.append(input).append("\n");
                }
                String logStr = stringBuilder.toString();
                setResultBean(resultBean, true, "读取成功", logStr);
                sendLog("控制台日志 " + logStr);
                return resultBean;
            } catch (IOException e) {
                e.printStackTrace();
                setResultBeanError(resultBean, "控制台日志文件读取出错");
                return resultBean;
            }
        }
        setResultBeanError(resultBean, "控制台日志文件不存在");
        return resultBean;
    }

    /**
     * 清除控制台日志
     *
     * @return 返回结果集
     */
    public void clear() {
        sendLog("调用到清除日志逻辑");
        // 读取文件
        String path;
        if (SystemUtils.isWindowsOS()) {
            path = WIN_CONSOLE_LOG_PATH;
        } else {
            path = MAC_CONSOLE_LOG_PATH;
        }
        File logFile = new File(path);
        sendLog("读取文件路径 " + logFile.getAbsolutePath());
        if (logFile.exists()) {
            try {
                FileWriter fw = new FileWriter(logFile);
                fw.write("");
                fw.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
