package com.starjoys.tool.packonline.listener;

import com.starjoys.tool.packonline.common.base.BasePackService;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.utils.SystemUtils;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;

import java.io.File;
import java.io.IOException;


/**
 * 项目启动监听器
 *
 * @author Andy
 * @version 1.0
 * @create 2017/3/2
 */

public class StartUpListener extends BasePackService implements ApplicationListener<ContextRefreshedEvent> {

    @Override
    public void onApplicationEvent(ContextRefreshedEvent evt) {

        // 防止启动两次
        if (evt.getApplicationContext().getParent() != null) {


            // 给mac上的.sh执行文件授权
            if (SystemUtils.getOSName() == SystemUtils.IS_MAC_OS) {

                sendLog("给mac上的.sh执行文件授权");

                try {
                    //Tomcat放在全局，避免放在某个用户名下
                    String cmdParentName = GlobalConfig.IS_MODE_ONLINE?GlobalConfig.RUN_MODE_ONLINE:GlobalConfig.RUN_MODE_DEVELOP;
                    String cmdFront = "chmod a+x /Library/Tomcat/webapps/Leidong_pack_online/WEB-INF/classes/packtools/"+cmdParentName+ File.separator;

                    Runtime.getRuntime().exec(cmdFront + "zCommon.sh"); // 授权通用功能打包执行文件
                    Runtime.getRuntime().exec(cmdFront + "zIcon.sh"); // 授权图标合并打包执行文件
                    Runtime.getRuntime().exec(cmdFront + "zMid.sh"); // 授权推广包打包执行文件
                    Runtime.getRuntime().exec(cmdFront + "zPid.sh"); // 授权渠道打包执行文件


                } catch (IOException e) {
                    sendLog("mac授权出错!");
                    e.printStackTrace();
                }
            }


        }

    }

}
