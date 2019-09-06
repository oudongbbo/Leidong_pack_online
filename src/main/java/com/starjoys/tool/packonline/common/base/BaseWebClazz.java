package com.starjoys.tool.packonline.common.base;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.config.ResPathConfig;
import com.starjoys.tool.packonline.utils.MyLoggerUtils;
import com.starjoys.tool.packonline.utils.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Locale;

/**
 * 业务逻辑层、控制层等通用类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/3
 */

public abstract class BaseWebClazz {

    /**
     * 发送控制台日志
     *
     * @param message 日志信息
     */
    protected void sendLog(String message) {
        MyLoggerUtils.info("****************** " + buildMessage(message) +
                " ****************************************************************");
    }


    /**
     * 格式化打印出的日志信息
     *
     * @param msg 打印日志信息
     * @return 日志信息
     */
    private String buildMessage(String msg) {
        StackTraceElement[] trace = new Throwable().fillInStackTrace().getStackTrace();
        String caller = "";
        String className = "";
        int line = -1;
        for (int i = 2; i < trace.length; i++) {
            Class<?> clazz = trace[i].getClass();
            if (!clazz.equals(BaseWebClazz.class)) {
                // 获取调用此工具的方法名和行数
                className = trace[i].getClassName();
                className = className.substring(className.lastIndexOf('.') + 1);
                caller = trace[i].getMethodName();
                line = trace[i].getLineNumber();
                break;
            }
        }
        // 格式化输出信息, 增加了线程,方法名和行数
        return String.format(Locale.CHINA, "Thread:%d, Class:%s, Method:%s, Line:%d, Message:%s", Thread
                .currentThread().getId(), className, caller, line, msg);
    }

    /**
     * 设置结果数据类的数据
     *
     * @param resultBean 结果数据类
     * @param isSuc      是否成功
     * @param message    结果信息
     */
    protected void setResultBean(ResultBean resultBean, boolean isSuc, String message) {
        if (resultBean != null) {
            resultBean.setSuccess(isSuc);
            resultBean.setMessage(message);
        }
    }

    /**
     * 设置结果数据类的数据
     *
     * @param resultBean   结果数据类
     * @param isSuc        是否成功
     * @param message      结果信息
     * @param resultObject 结果对象
     */
    protected void setResultBean(ResultBean resultBean, boolean isSuc, String message, Object resultObject) {
        if (resultBean != null) {
            this.setResultBean(resultBean, isSuc, message);
            resultBean.setRows(resultObject);
        }
    }

    /**
     * 设置结果数据类的错误数据
     *
     * @param resultBean 结果数据类
     * @param message    出错的结果信息
     */
    protected void setResultBeanError(ResultBean resultBean, String message) {
        if (resultBean != null) {
            this.setResultBean(resultBean, false, message);
        }
    }

    /**
     * 获取文件名称
     *
     * @param multipartFile 上传文件
     * @return 文件名
     */
    protected String getFileName(MultipartFile multipartFile) {
        if (multipartFile != null && !multipartFile.isEmpty()) { // 文件不为空
            String originalName = multipartFile.getOriginalFilename();
            if (originalName != null) { // 文件名不为空
                return originalName;
            }
        }
        return null;
    }

    /**
     * 上传的文件是否为空
     * @param multipartFile 上传的文件
     * @return 是否为空
     */
    protected boolean fileIsEmpty(MultipartFile multipartFile) {
        return multipartFile != null && !multipartFile.isEmpty();
    }

    /**
     * 上传文件转移, 转移到默认的文件夹中
     *
     * @param multipartFile 上传文件
     * @param newFileName   新文件名
     * @return 返回目的地文件
     */
    protected File fileTransferTo(MultipartFile multipartFile, String newFileName) {
        return fileTransferTo(multipartFile,
                ResPathConfig.buildSystemLocalPath(ResPathConfig.RESOURCE_INPUT), newFileName);
    }

    /**
     * 上传文件转移
     *
     * @param multipartFile  上传文件
     * @param transferToPath 转移地址
     * @param newFileName    新文件名
     * @return 返回目的地文件
     */
    protected File fileTransferTo(MultipartFile multipartFile, String transferToPath, String newFileName) {
        sendLog("开始转移文件");
        String originalName = getFileName(multipartFile);
        if (originalName != null) {
            sendLog("文件大小:" + multipartFile.getSize() + " 文件名:" + originalName);

            File targetFile;
            if (StringUtils.isNotEmpty(newFileName)) {
                targetFile = new File(transferToPath, newFileName);
            } else {
                targetFile = new File(transferToPath, originalName);
            }

            sendLog("保存的目录 " + targetFile.getAbsolutePath());
            if (!targetFile.exists()) { // 目录不存在, 创建目录
                sendLog("目录不存在, 创建目录");
                targetFile.mkdirs();
            }

            //保存
            try {
                sendLog("正在转移文件");
                multipartFile.transferTo(targetFile);

                sendLog("转移成功");
                return targetFile;
            } catch (Exception e) {
                e.printStackTrace();
                sendLog("转移失败");
            }
        }

        // 失败
        return null;
    }

}
