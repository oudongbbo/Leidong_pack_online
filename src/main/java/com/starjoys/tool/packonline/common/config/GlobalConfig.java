package com.starjoys.tool.packonline.common.config;

/**
 * 公用静态参数
 *
 * @author Andy
 * @version 1.0
 * @create 2016/12/30
 */

public interface GlobalConfig {

    /** 本地资源路径的MAC绝对路径前缀 **/
    public static boolean IS_MODE_ONLINE = true;//true是线上模式，false是线下模式
    public static String  RUN_MODE_ONLINE = "online";
    public static String  RUN_MODE_DEVELOP = "develop";

    /** 本地资源路径的MAC绝对路径前缀 **/
    public static String PACK_RESOURCE_USER_HOME = System.getProperties().getProperty("user.home");

    /** 打包工具文件夹路径前缀 **/
    public static String PACK_FRONT = "/WorkFile/MayaFactory/LDApkPackOnline";

    /** 打包工具文件夹绝对路径前缀 **/
    public static String PACK_ABSFRONT = PACK_RESOURCE_USER_HOME + "/WorkFile/MayaFactory/LDApkPackOnline";

    /** 项目名 **/
    String PROJECT_NAME = "Leidong_pack_online";

    /** 自己公司发布标识, 如果是其他公司则为否 将屏蔽功能 **/
    boolean IS_OWN_COMPANY_PUBLISH = true;

    /** 当前用户的会话键 **/
    String SESSION_KEY_USER = "currentUser";

    /** 当前用户组的会话键 **/
    String SESSION_KEY_USER_GROUP = "currentUserGroup";

    /** 当前用户组可操作菜单列表的会话键 **/
    String SESSION_KEY_USER_GROUP_MENUS = "currentUserGroupMenus";

    /** 当前用户组菜单列表可操作的会话键 **/
    String SESSION_KEY_USER_GROUP_ACTS = "currentUserGroupActs";

    /** 推广包最大打包数 **/
    int PACK_MD_MAX_NUM = 50;

    /** 清除以前的打包文件天数差 **/
    int CLEAR_PRE_PACK_DAY_DIFF = 2;

    /** 服务器渠道打包运行参数数据 **/
    String APP_KEY_CCH_PACK_RUNNING_PARAM_MAP = "cchPackRunningParamMap";

    /** 图标图片宽高 **/
    int ICON_IMAGE_SIZE = 512;

    /** 除了添加游戏以外, 超级管理员的公司id都为-1 **/
    int COMPANY_ID_FOR_SUPER_MANAGER = -1;

}
