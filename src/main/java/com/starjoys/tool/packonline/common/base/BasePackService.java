package com.starjoys.tool.packonline.common.base;

import com.starjoys.tool.packonline.bean.KeyValueBean;
import com.starjoys.tool.packonline.bean.PackResultBean;
import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.utils.*;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 基础打包业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/18
 */

public class BasePackService extends BaseService {

    public static final String PACK_TOOLS_JAR_ZPID = "packtools_pid.jar";
    public static final String PACK_TOOLS_JAR_ZMID = "packtools_mid.jar";
    public static final String PACK_TOOLS_JAR_ZCOMMMON = "packtools_common.jar";

    /**
     * 压缩文件的打包工具名
     **/
    public static final String PACK_TOOLS_NAME_JAR_ZIP_FILE = "tools_zip";

    /**
     * 推广包的打包工具名
     **/
    public static final String PACK_TOOLS_NAME_BATSH_PACK_MID = "zMid";
    /**
     * apk基本功能修改的打包工具名
     **/
    public static final String PACK_TOOLS_NAME_BATSH_PACK_COMMON = "zCommon";
    /**
     * 渠道打包的打包工具名
     **/
    public static final String PACK_TOOLS_NAME_BATSH_PACK_PID = "zPid";

    /**
     * 合并图标的打包工具名
     **/
    public static final String PACK_TOOLS_NAME_BATSH_PACK_ICON = "zIcon";

    /**
     * cmd调用的文件类型为无
     **/
    public static final int CMD_FILE_TYPE_NONE = -1;
    /**
     * cmd调用的文件类型为bat或者sh
     **/
    public static final int CMD_FILE_TYPE_BAT_OR_SH = 1;
    /**
     * cmd调用的文件类型为jar
     **/
    public static final int CMD_FILE_TYPE_JAR = 2;

    /**
     * bat文件后缀
     **/
    public static final String FILE_TYPE_BAT_NAME = ".bat";
    /**
     * sh文件后缀
     **/
    public static final String FILE_TYPE_SH_NAME = ".sh";
    /**
     * jar文件后缀
     **/
    public static final String FILE_TYPE_JAR_NAME = ".jar";


    /**
     * 来自本地
     **/
    public static final String FILE_SOURCE_FROM_LOCAL = "1";
    /**
     * 来自服务器
     **/
    public static final String FILE_SOURCE_FROM_SERVER = "2";


    /**
     * 生成保存文件的路径
     *
     * @param frontPath 路径的前面部分
     * @param username  用户id
     * @return 拼接后的文件存储地址
     */
    protected String generateSaveFilePath(String frontPath, String username) {
        return generateSaveFilePath(frontPath, username, System.currentTimeMillis());
    }

    /**
     * 生成保存文件的路径
     *
     * @param frontPath 路径的前面部分
     * @param username  用户id
     * @param time      时间戳(yyyyMMddHHmmss)
     * @return 拼接后的文件存储地址
     */
    protected String generateSaveFilePath(String frontPath, String username, long time) {
        String dateStr = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date(time));
        if (StringUtils.isNotEmpty(frontPath)) {
            return frontPath + File.separator + dateStr + File.separator + username;
        } else {
            return dateStr + File.separator + username;
        }
    }

    /**
     * 生成input文件路径
     *
     * @param frontPath 路径前部分
     * @param time      时间
     * @return input文件路径
     */
    protected String generateInputFilePath(String frontPath, long time) {
        String dateStr = new SimpleDateFormat("yyyyMMdd").format(new Date(time));
        File pathFile = new File(frontPath + File.separator + dateStr);
        FileUtil.createDir(pathFile);
        return pathFile.getAbsolutePath();
    }

    /**
     * 生成input文件名
     *
     * @param username 用户名
     * @param time     时间戳
     * @return 文件名
     */
    protected String generateInputFileName(String username, long time) {
        return time + "_" + username;
    }

    /**
     * 生成打包结果信息类
     *
     * @param frontPath 前缀
     * @param username  用户名
     * @param time      时间戳
     * @return 打包结果信息类
     */
    protected PackResultBean generatePackResultBean(String frontPath, String username, long time) {
        return new PackResultBean(this.generateSaveFilePath(frontPath, username, time));
    }

    /**
     * 生成打包结果信息类
     *
     * @param frontPath 前缀
     * @param username  用户名
     * @return 打包结果信息类
     */
    protected PackResultBean generatePackResultBean(String frontPath, String username) {
        return new PackResultBean(this.generateSaveFilePath(frontPath, username));
    }


    /**
     * 生成打包结果信息类
     *
     * @param username 用户名
     * @param time     时间戳
     * @return 打包结果信息类
     */
    protected PackResultBean generatePackResultBean(String username, long time) {
        return new PackResultBean(this.generateSaveFilePath("", username, time));
    }

    /**
     * 生成打包结果信息类
     *
     * @param username 用户名
     * @return 打包结果信息类
     */
    protected PackResultBean generatePackResultBean(String username) {
        return new PackResultBean(this.generateSaveFilePath("", username));
    }


    /**
     * 获取使用打包工具的cmd命令
     *
     * @param fileName 文件名
     * @return cmd命令
     */
    protected String getCommandFromPackTools(String fileName) {
        return getCommandFromPackTools(fileName, CMD_FILE_TYPE_NONE);
    }

    /**
     * 获取使用打包工具的cmd命令
     *
     * @param fileName 文件名
     * @param fileType 文件类型
     * @return cmd命令
     */
    protected String getCommandFromPackTools(String fileName, int fileType) {
        String packToolsPath = getClass().getResource("/packtools").getPath(); // 打包工具路径

        if (packToolsPath.contains(":")) {
            packToolsPath = packToolsPath.substring(1, packToolsPath.length());
        }
        String command = "";

        switch (fileType) {

            case CMD_FILE_TYPE_BAT_OR_SH:
                // bat或者sh类型自动判断系统进行拼接
                if (SystemUtils.isWindowsOS()) {
                    //Windows下
                    fileName += FILE_TYPE_BAT_NAME;
                    command = packToolsPath + File.separator + "cmd" + File.separator + fileName + " ";
                } else {
                    //Mac下，分线上和线下
                    fileName += FILE_TYPE_SH_NAME;
                    if (GlobalConfig.IS_MODE_ONLINE) {
                        command = packToolsPath + File.separator + GlobalConfig.RUN_MODE_ONLINE + File.separator + fileName + " ";
                    } else {
                        command = packToolsPath + File.separator + GlobalConfig.RUN_MODE_DEVELOP + File.separator + fileName + " ";
                    }
                }
                break;

            case CMD_FILE_TYPE_JAR:  // jar类型

                fileName += FILE_TYPE_JAR_NAME;
                command = "java -jar " + packToolsPath + fileName + " ";
                break;

            case CMD_FILE_TYPE_NONE:

                command = packToolsPath + fileName + " ";
                break;
        }

//        if (!isWindowsOS) {
//            commend += "/bin/bash -c echo \"sj123456\" | sudo -S "; // mac自动增加权限
//        }


        return command;
    }

    /**
     * 获取使用打包工具的cmd命令
     *
     * @param jarName 文件名
     * @return cmd命令
     */
    protected String getCmdWithPacktoolsJar(String jarName) {

//        cd /Users/smalli/WorkFile/3K/3KFactory/ApkPackOnline;
//        java -jar /Users/smalli/WorkFile/3K/3KFactory/ApkPackOnline/toolbox/tooljar/packtools_pid.jar $@

        String cmd_cd = " cd " + GlobalConfig.PACK_ABSFRONT;
        String cmd_jar = " java -jar " + GlobalConfig.PACK_ABSFRONT + "/toolbox/tooljar/" + jarName;

        return cmd_cd + " && " + cmd_jar;
    }

    /**
     * 快速执行cmd命令
     *
     * @param cmdCommend cmd命令
     * @return 结果集
     * @throws IOException
     * @throws InterruptedException
     */
    protected ResultBean<String> quickExec(String cmdCommend) throws IOException, InterruptedException {

        System.out.println("1-启动终端：" + cmdCommend);

        ResultBean<String> resultBean = new ResultBean<>();
        Process process = Runtime.getRuntime().exec(cmdCommend);

        System.out.println("2-已经调用Runtime.getRuntime().exec");
        //打印cmd信息流

        String LogsStr = RuntimeUtils.getConsoleLogsStr(process);

        System.out.println("3-已经打印进程");

        int runResult = process.waitFor();
        if (runResult == 0) {
            resultBean.setSuccess(true);
        } else {
            resultBean.setSuccess(false);
        }
        resultBean.setMessage("");
        return resultBean;
    }

    /**
     * 处理打包结果
     *
     * @param packResultBean 打包结果信息
     * @return 是否成功打包
     * @throws IOException          IO异常
     * @throws InterruptedException 中断异常
     */
    protected boolean handlePackResult(PackResultBean packResultBean) throws IOException, InterruptedException {
        File localDownloadDirFile = packResultBean.getLocalDownloadDirFile(); // 本地下载目录文件类
        String[] fileNameArray = localDownloadDirFile.list(); // 获取下载目录里面所有文件
        String localDownloadDir = localDownloadDirFile.getAbsolutePath(); // 本地下载目录
        String VirtualDownloadDir = packResultBean.getVirtualDownloadDir(); // 虚拟下载目录

        if (fileNameArray == null || fileNameArray.length <= 0) {
            // 没文件
            sendLog("找不到生成的文件, 打包结果失败");
        } else {
            if (fileNameArray.length > 1) { // 如果文件数量大于1个, 需要进行压缩操作

                // 调用cmd压缩
                String commend = getCommandFromPackTools(PACK_TOOLS_NAME_JAR_ZIP_FILE, CMD_FILE_TYPE_JAR)
                        + localDownloadDir;
                ResultBean<String> runtimeResult = quickExec(commend);

                // 压缩结果处理
                sendLog("压缩文件日志 " + runtimeResult.getMessage());
                File localDownloadParentFile = localDownloadDirFile.getParentFile(); // apk的上一级目录
                File[] downloadParentFileArray = localDownloadParentFile.listFiles();
                sendLog("上一层目录 " + localDownloadParentFile.getAbsolutePath());

                File zipFile = null;
                if (downloadParentFileArray != null) {
                    for (File file : downloadParentFileArray) {
                        String fileName = file.getName();
                        if (fileName.equals(localDownloadDirFile.getName() + ".zip")) { // 找到生成后的zip文件
                            zipFile = new File(localDownloadDirFile, fileName);
                            boolean copyResult = FileUtil.copyFile(file, zipFile); // 把zip剪切到apk目录中
                            sendLog("原zip " + file.getAbsolutePath() + " 移动后zip " + zipFile.getAbsolutePath());
                            if (copyResult) { // 复制成功
                                // 删除复制前的zip文件
                                FileUtil.delDir(file);
                                // 把zip文件路径保存起来
                                packResultBean.setZipFilePath(VirtualDownloadDir + File.separator + fileName);
                            } else { // 处理失败
                                return false;
                            }
                        }
                    }

                    if (zipFile == null) { // 没有zip文件都判定为失败
                        return false;
                    }
                }

                // apk下载列表
                List<KeyValueBean> apkDownloadList = new ArrayList<>();
                for (String fileName : fileNameArray) {
                    if (fileName.endsWith(".apk")) { // 是apk就进行包装下载地址, 并添加到下载列表中
                        apkDownloadList.add(new KeyValueBean(fileName, VirtualDownloadDir + File.separator + fileName));
                    }
                }
                sendLog("apk下载列表 " + apkDownloadList);

                if (apkDownloadList.size() != 0) {
                    // 成功装配好下载列表
                    packResultBean.setFilePathList(apkDownloadList);
                    return true;
                }
            } else { // 只有一个文件时直接放到单个里面
                packResultBean.setSingleApkFilePath(VirtualDownloadDir + File.separator + fileNameArray[0]);
                return true;
            }


        }

        return false;
    }


    /**
     * 获取下载文件地址
     *
     * @param packResultBean 打包结果集
     * @return 文件地址
     */
    protected String getDownloadFilePath(PackResultBean packResultBean) {
        if (packResultBean.getZipFilePath() != null) { // 返回zip文件地址
            return packResultBean.getZipFilePath();
        }
        if (packResultBean.getSingleApkFilePath() != null) { // 返回单个apk文件地址
            return packResultBean.getSingleApkFilePath();
        }
        return null;
    }


}
