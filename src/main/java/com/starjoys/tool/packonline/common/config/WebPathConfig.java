package com.starjoys.tool.packonline.common.config;

/**
 * 页面跳转路径配置文件
 *
 * @author Andy
 * @version 1.0
 * @create 2016/12/31
 */
public interface WebPathConfig {

    //------ 完整路径

    /** 完整网址路径登录 **/
    String URL_PATH_LOGIN = "/" + GlobalConfig.PROJECT_NAME + "/login";

    //------ 重定位路径

    /** 重定位路径前缀 **/
    String REDIRECT_PATH_FRONT = "redirect:";

    /** 重定位路径首页 **/
    String REDIRECT_PATH_INDEX = REDIRECT_PATH_FRONT + "/index";

    //------ jsp页面路径

    /** jsp页面路径模块前缀 **/
    String JSP_PATH_MODULES_FRONT = "/modules";

    /** jsp页面路径登录 **/
    String JSP_PATH_LOGIN = JSP_PATH_MODULES_FRONT +  "/login";

    /** jsp页面路径首页 **/
    String JSP_PATH_INDEX = JSP_PATH_MODULES_FRONT + "/index";

    /** jsp页面路径用户管理 **/
    String JSP_PATH_USER_MANAGER = JSP_PATH_MODULES_FRONT + "/system/userManager";

    /** jsp页面路径系统管理用户组管理 **/
    String JSP_PATH_SYSTEM_USER_GROUP_MANAGER = JSP_PATH_MODULES_FRONT + "/system/userGroupManager";

    /** jsp页面路径菜单管理 **/
    String JSP_PATH_SYSTEM_MENU_MANAGER = JSP_PATH_MODULES_FRONT + "/system/menuManager";

    /** jsp页面路径系统管理公司管理 **/
    String JSP_PATH_SYSTEM_COMPANY_MANAGER = JSP_PATH_MODULES_FRONT + "/system/companyManager";

    /** jsp页面路径系统管理打包工具管理 **/
    String JSP_PATH_SYSTEM_PACK_TOOL_MANAGER = JSP_PATH_MODULES_FRONT + "/system/packToolManager";

    /** jsp页面路径系统管理打包工具记录管理 **/
    String JSP_PATH_SYSTEM_PACK_TOOL_RECORD_MANAGER = JSP_PATH_MODULES_FRONT + "/system/packToolRecordManager";

    /** jsp页面路径安卓推广包打包 **/
    String JSP_PATH_ANDROID_MD_PACK = JSP_PATH_MODULES_FRONT + "/andrpack/mdPack";

    /** jsp页面路径安卓APK打包 **/
    String JSP_PATH_ANDROID_APK_PACK = JSP_PATH_MODULES_FRONT + "/andrpack/apkChange";

    /** jsp页面路径安卓渠道打包 **/
    String JSP_PATH_ANDROID_CCH_PACK = JSP_PATH_MODULES_FRONT + "/andrpack/cchPack";

    /** jsp页面路径渠道管理 **/
    String JSP_PATH_CHANNEL_MANAGER = JSP_PATH_MODULES_FRONT + "/packmanager/channelManager";

    /** jsp页面路径渠道版本管理 **/
    String JSP_PATH_CHANNEL_VERSION_MANAGER = JSP_PATH_MODULES_FRONT + "/packmanager/channelVersionManager";

    /** jsp页面路径游戏管理 **/
    String JSP_PATH_GAME_MANAGER = JSP_PATH_MODULES_FRONT + "/packmanager/gameManager";

    /** jsp页面路径游戏版本管理 **/
    String JSP_PATH_GAME_VERSION_MANAGER = JSP_PATH_MODULES_FRONT + "/packmanager/gameVersionManager";

    /** jsp页面路径游戏参数管理 **/
    String JSP_PATH_GAME_PARAM_MANAGER = JSP_PATH_MODULES_FRONT + "/packmanager/gameParamManager";

    /** jsp页面路径游戏参数记录管理 **/
    String JSP_PATH_GAME_PARAM_RECORD_MANAGER = JSP_PATH_MODULES_FRONT + "/packmanager/gameParamRecordManager";

    /** jsp页面路径渠道打包记录 **/
    String JSP_PATH_PACK_RECORD_ALL = JSP_PATH_MODULES_FRONT + "/packRecord/allPackRecord";

    /** jsp页面路径渠道打包记录 **/
    String JSP_PATH_PACK_RECORD_CCH = JSP_PATH_MODULES_FRONT + "/packrecord/cchPackRecord";

    /** jsp页面路径推广包打包记录 **/
    String JSP_PATH_PACK_RECORD_MD = JSP_PATH_MODULES_FRONT + "/packrecord/mdPackRecord";

    /** jsp页面路径通用功能打包记录 **/
    String JSP_PATH_PACK_RECORD_COMMON = JSP_PATH_MODULES_FRONT + "/packrecord/commonPackRecord";

    /** jsp页面路径工具箱图标合并工具 **/
    String JSP_PATH_TOOLBOX_ICON_MERGE = JSP_PATH_MODULES_FRONT + "/toolbox/iconMerge";

    /** jsp页面路径工具箱记录图标合并记录 **/
    String JSP_PATH_TOOLBOX_RECORD_ICON_MERGE_RECORD = JSP_PATH_MODULES_FRONT + "/toolboxrecord/iconMergeRecord";

    /** jsp页面路径系统日志控制台日志 **/
    String JSP_PATH_SYSTEM_LOG_CONSOLE_LOG = JSP_PATH_MODULES_FRONT + "/systemlog/consoleLog";

    /** jsp页面路径系统日志行为日志 **/
    String JSP_PATH_SYSTEM_LOG_ACTION_LOG = JSP_PATH_MODULES_FRONT + "/systemlog/actionLog";

    /** jsp页面路径系统日志打包日志 **/
    String JSP_PATH_SYSTEM_LOG_PACK_LOG = JSP_PATH_MODULES_FRONT + "/systemlog/packLog";

    /** jsp页面路径sdk版本管理国内sdk管理 **/
    String JSP_PATH_SDK_MANAGER = JSP_PATH_MODULES_FRONT + "/sdk/sdkManager";

    /** jsp页面路径sdk版本管理国内sdk版本管理 **/
    String JSP_PATH_SDK_VERSION_MANAGER = JSP_PATH_MODULES_FRONT + "/sdk/sdkVersionManager";

    /** jsp页面路径sdk版本管理海外sdk管理 **/
    String JSP_PATH_SDK_OVERSEA_MANAGER = JSP_PATH_MODULES_FRONT + "/sdk/sdkOverseaManager";

    /** jsp页面路径sdk版本管理海外sdk版本管理 **/
    String JSP_PATH_SDK_VERSION_OVERSEA_MANAGER = JSP_PATH_MODULES_FRONT + "/sdk/sdkVersionOverseaManager";

    /** jsp页面路径sdk版本管理国内sdk ios管理 **/
    String JSP_PATH_SDK_IOS_MANAGER = JSP_PATH_MODULES_FRONT + "/sdk/sdkIOSManager";

    /** jsp页面路径sdk版本管理国内sdk ios版本管理 **/
    String JSP_PATH_SDK_VERSION_IOS_MANAGER = JSP_PATH_MODULES_FRONT + "/sdk/sdkVersionIOSManager";

    /** jsp页面路径sdk版本管理海外sdk ios管理 **/
    String JSP_PATH_SDK_IOS_OVERSEA_MANAGER = JSP_PATH_MODULES_FRONT + "/sdk/sdkIOSOverseaManager";

    /** jsp页面路径sdk版本管理海外sdk ios版本管理 **/
    String JSP_PATH_SDK_VERSION_IOS_OVERSEA_MANAGER = JSP_PATH_MODULES_FRONT + "/sdk/sdkVersionIOSOverseaManager";

}
