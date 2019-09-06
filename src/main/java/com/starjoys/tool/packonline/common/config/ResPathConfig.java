package com.starjoys.tool.packonline.common.config;

import com.starjoys.tool.packonline.modules.packmanager.entity.GameEntity;
import com.starjoys.tool.packonline.utils.SystemUtils;

import java.io.File;

/**
 * 物理路径配置文件
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/13
 */

public abstract class ResPathConfig implements GlobalConfig {

    //*************************************** 打包工具文件夹路径 **************************************


    /**
     * 打包工具平台路径前缀
     **/
    public final static String PACK_PLATFORM_FRONT = PACK_FRONT + File.separator + "platform";

    /**
     * 打包工具工具箱路径前缀
     **/
    public final static String PACK_TOOLBOX_FRONT = PACK_FRONT + File.separator + "toolbox";

    /**
     * 打包工具文件夹路径的渠道data文件夹
     **/
    public final static String PACK_PLATFORM_SDKS = PACK_PLATFORM_FRONT + File.separator + "sdks";

    /**
     * 打包工具文件夹路径的渠道icons文件夹
     **/
    public final static String PACK_PLATFORM_ICONS = PACK_PLATFORM_FRONT + File.separator + "icons";

    /**
     * 打包工具文件夹路径的渠道icons角标文件文件夹
     **/
    public final static String PACK_PLATFORM_ICONS_SUBSCRIPT = PACK_PLATFORM_ICONS + File.separator + "Default";

    /**
     * 打包工具文件夹路径的渠道配置文件文件夹
     **/
    public final static String PACK_PLATFORM_CONFIGS = PACK_PLATFORM_FRONT
            + File.separator + "configs";

    /**
     * 打包工具文件夹路径的渠道插件文件文件夹
     **/
    public final static String PACK_PLATFORM_PLUGIN = PACK_PLATFORM_FRONT + File.separator + "plugin" + File.separator + "smali";

    /**
     * 打包工具工具箱架包路径前缀
     **/
    public final static String PACK_TOOLBOX_TOOLJAR = PACK_TOOLBOX_FRONT + File.separator + "tooljar";

    //*************************************** 资源文件相对路径 **************************************
    /**
     * 相对资源路径的上传文件夹
     **/
    public final static String RELATIVE_PATH_RESOURCE_INPUT = "input";

    /**
     * 相对资源路径的打包文件夹
     **/
    public final static String RELATIVE_PATH_RESOURCE_PACK = "pack";

    /**
     * 相对资源路径的渠道文件夹
     **/
    public final static String RELATIVE_PATH_RESOURCE_PLATFORM = "platform";

    /**
     * 相对资源路径的游戏文件夹
     **/
    public final static String RELATIVE_PATH_RESOURCE_GAME = "game";

    /**
     * 相对资源路径的打包工具文件夹
     **/
    public final static String RELATIVE_PATH_RESOURCE_PACKTOOL = "packtool";

    /**
     * 相对资源路径的SDK文件夹
     **/
    public final static String RELATIVE_PATH_RESOURCE_SDK = "sdk";

    /**
     * 相对资源路径的SDK IOS文件夹
     **/
    public final static String RELATIVE_PATH_RESOURCE_SDK_IOS = "sdkIOS";

    /**
     * 相对资源路径的md和cch的打包文件夹
     **/
    public final static String RELATIVE_PATH_RESOURCE_PACK_MAIN = RELATIVE_PATH_RESOURCE_PACK + File.separator + "main";

    /**
     * 相对资源路径其他打包文件夹
     **/
    public final static String RELATIVE_PATH_RESOURCE_PACK_OTHER = RELATIVE_PATH_RESOURCE_PACK + File.separator + "other";

    /**
     * 相对资源路径的渠道DATA文件夹
     **/
    public final static String RELATIVE_PATH_RESOURCE_PLATFORM_DATA = RELATIVE_PATH_RESOURCE_PLATFORM + File.separator + "data";

    /**
     * 相对资源路径的渠道角标文件夹
     **/
    public final static String RELATIVE_PATH_RESOURCE_PLATFORM_ICON = RELATIVE_PATH_RESOURCE_PLATFORM + File.separator + "icon";

    /**
     * 相对资源路径的渠道插件文件夹
     **/
    public final static String RELATIVE_PATH_RESOURCE_PLATFORM_PLUGIN = RELATIVE_PATH_RESOURCE_PLATFORM + File.separator + "plugin";

    /**
     * 相对资源路径的渠道角标文件夹
     **/
    public final static String RELATIVE_PATH_RESOURCE_PLATFORM_SUBSCRIPT = RELATIVE_PATH_RESOURCE_PLATFORM + File.separator + "subscript";

    /**
     * 相对资源路径的游戏CP文件夹
     **/
    public final static String RELATIVE_PATH_RESOURCE_GAME_CP = RELATIVE_PATH_RESOURCE_GAME + File.separator + "cp";

    /**
     * 相对资源路径的游戏sjoys文件夹
     **/
    public final static String RELATIVE_PATH_RESOURCE_GAME_SDK = RELATIVE_PATH_RESOURCE_GAME + File.separator + "leidong";

    /**
     * 相对资源路径的上传推广包文件夹
     **/
    public final static String RELATIVE_PATH_RESOURCE_INPUT_MD = RELATIVE_PATH_RESOURCE_INPUT + File.separator + "md";

    /**
     * 相对资源路径的上传通用包文件夹
     **/
    public final static String RELATIVE_PATH_RESOURCE_INPUT_COMMON = RELATIVE_PATH_RESOURCE_INPUT + File.separator + "common";

    /**
     * 相对资源路径的上传渠道包文件夹
     **/
    public final static String RELATIVE_PATH_RESOURCE_INPUT_PLATFORM = RELATIVE_PATH_RESOURCE_INPUT + File.separator + "platform";

    /**
     * 相对资源路径的上传图标合并文件夹
     **/
    public final static String RELATIVE_PATH_RESOURCE_INPUT_ICON_MERGE = RELATIVE_PATH_RESOURCE_INPUT + File.separator + "iconMerge";

    /**
     * 相对资源路径的上传渠道data临时文件夹
     **/
    public final static String RELATIVE_PATH_RESOURCE_INPUT_SDK_DATA = RELATIVE_PATH_RESOURCE_INPUT + File.separator + "sdkData";

    /**
     * 相对资源路径打包日志文件夹
     **/
    public final static String RELATIVE_PATH_RESOURCE_PACK_LOG = RELATIVE_PATH_RESOURCE_PACK + File.separator + "log";


    //************************************* 资源文件虚拟路径 **************************************
    /**
     * 虚拟路径资源路径前缀
     **/
    public final static String VIRTUAL_PATH_RESOURCE_FRONT = File.separator + GlobalConfig.PROJECT_NAME + File.separator + "resource";

    /**
     * 虚拟路径资源路径的上传文件夹
     **/
    public final static String VIRTUAL_PATH_RESOURCE_INPUT = VIRTUAL_PATH_RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_INPUT;

    /**
     * 虚拟路径资源路径的打包文件夹
     **/
    public final static String VIRTUAL_PATH_RESOURCE_PACK = VIRTUAL_PATH_RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_PACK;

    /**
     * 虚拟路径资源路径的渠道文件夹
     **/
    public final static String VIRTUAL_PATH_RESOURCE_PLATFORM = VIRTUAL_PATH_RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_PLATFORM;

    /**
     * 虚拟路径资源路径的游戏文件夹
     **/
    public final static String VIRTUAL_PATH_RESOURCE_GAME = VIRTUAL_PATH_RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_GAME;

    /**
     * 虚拟路径资源路径的打包工具文件夹
     **/
    public final static String VIRTUAL_PATH_RESOURCE_PACKTOOL = VIRTUAL_PATH_RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_PACKTOOL;

    /**
     * 虚拟路径资源路径的SDK文件夹
     **/
    public final static String VIRTUAL_PATH_RESOURCE_SDK = VIRTUAL_PATH_RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_SDK;

    /**
     * 虚拟路径资源路径的SDK IOS文件夹
     **/
    public final static String VIRTUAL_PATH_RESOURCE_SDK_IOS = VIRTUAL_PATH_RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_SDK_IOS;

    /**
     * 虚拟路径资源路径的md和cch的打包文件夹
     **/
    public final static String VIRTUAL_PATH_RESOURCE_PACK_MAIN = VIRTUAL_PATH_RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_PACK_MAIN;

    /**
     * 虚拟路径资源路径其他打包文件夹
     **/
    public final static String VIRTUAL_PATH_RESOURCE_PACK_OTHER = VIRTUAL_PATH_RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_PACK_OTHER;

    /**
     * 虚拟路径资源路径的渠道DATA文件夹
     **/
    public final static String VIRTUAL_PATH_RESOURCE_PLATFORM_DATA = VIRTUAL_PATH_RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_PLATFORM_DATA;

    /**
     * 虚拟路径资源路径的渠道插件文件夹
     **/
    public final static String VIRTUAL_PATH_RESOURCE_PLATFORM_PLUGIN = VIRTUAL_PATH_RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_PLATFORM_PLUGIN;

    /**
     * 虚拟路径资源路径的渠道图标文件夹
     **/
    public final static String VIRTUAL_PATH_RESOURCE_PLATFORM_ICON = VIRTUAL_PATH_RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_PLATFORM_ICON;

    /**
     * 虚拟路径资源路径的渠道角标文件夹
     **/
    public final static String VIRTUAL_PATH_RESOURCE_PLATFORM_SUBSCRIPT = VIRTUAL_PATH_RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_PLATFORM_SUBSCRIPT;

    /**
     * 虚拟路径资源路径的游戏CP文件夹
     **/
    public final static String VIRTUAL_PATH_RESOURCE_GAME_CP = VIRTUAL_PATH_RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_GAME_CP;

    /**
     * 虚拟路径资源路径的游戏sjoys文件夹
     **/
    public final static String VIRTUAL_PATH_RESOURCE_GAME_SJOYS = VIRTUAL_PATH_RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_GAME_SDK;

    /**
     * 虚拟路径资源路径的打包日志文件夹
     **/
    public final static String VIRTUAL_PATH_RESOURCE_PACK_LOG = VIRTUAL_PATH_RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_PACK_LOG;


    //*************************************** 资源文件本地路径 **************************************


    /**
     * 本地资源路径前缀
     **/
    public final static String RESOURCE_FRONT = "TomcatResource" + File.separator + GlobalConfig.PROJECT_NAME;

    /**
     * 本地资源路径的上传文件夹
     **/
    public final static String RESOURCE_INPUT = RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_INPUT;

    /**
     * 本地资源路径的打包文件夹
     **/
    public final static String RESOURCE_PACK = RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_PACK;

    /**
     * 本地资源路径的渠道文件夹
     **/
    public final static String RESOURCE_PLATFORM = RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_PLATFORM;

    /**
     * 本地资源路径的游戏文件夹
     **/
    public final static String RESOURCE_GAME = RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_GAME;

    /**
     * 本地资源路径的打包工具文件夹
     **/
    public final static String RESOURCE_PACKTOOL = RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_PACKTOOL;

    /**
     * 本地资源路径的SDK文件夹
     **/
    public final static String RESOURCE_SDK = RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_SDK;

    /**
     * 本地资源路径的SDK IOS文件夹
     **/
    public final static String RESOURCE_SDK_IOS = RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_SDK_IOS;

    /**
     * 本地资源路径的md和cch的打包文件夹
     **/
    public final static String RESOURCE_PACK_MAIN = RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_PACK_MAIN;


    /**
     * 本地资源路径其他打包文件夹
     **/
    public final static String RESOURCE_PACK_OTHER = RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_PACK_OTHER;

    /**
     * 本地资源路径的渠道DATA文件夹
     **/
    public final static String RESOURCE_PLATFORM_DATA = RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_PLATFORM_DATA;

    /**
     * 本地资源路径的渠道图标文件夹
     **/
    public final static String RESOURCE_PLATFORM_ICON = RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_PLATFORM_ICON;

    /**
     * 本地资源路径的渠道插件文件夹
     **/
    public final static String RESOURCE_PLATFORM_PLUGIN = RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_PLATFORM_PLUGIN;

    /**
     * 本地资源路径的渠道角标文件夹
     **/
    public final static String RESOURCE_PLATFORM_SUBSCRIPT = RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_PLATFORM_SUBSCRIPT;

    /**
     * 本地资源路径的游戏CP文件夹
     **/
    public final static String RESOURCE_GAME_CP = RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_GAME_CP;

    /**
     * 本地资源路径的游戏SJOYS文件夹
     **/
    public final static String RESOURCE_GAME_SDK = RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_GAME_SDK;

    /**
     * 本地资源路径上传广告推广包文件夹
     **/
    public final static String RESOURCE_INPUT_MD = RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_INPUT_MD;

    /**
     * 本地资源路径上传通用打包文件夹
     **/
    public final static String RESOURCE_INPUT_COMMON = RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_INPUT_COMMON;

    /**
     * 本地资源路径上传渠道包文件夹
     **/
    public final static String RESOURCE_INPUT_PLATFORM = RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_INPUT_PLATFORM;

    /**
     * 本地资源路径上传图标合并文件夹
     **/
    public final static String RESOURCE_INPUT_ICON_MERGE = RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_INPUT_ICON_MERGE;

    /**
     * 本地资源路径渠道data临时文件夹
     **/
    public final static String RESOURCE_INPUT_SDK_DATA = RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_INPUT_SDK_DATA;

    /**
     * 本地资源路径打包日志文件夹
     **/
    public final static String RESOURCE_PACK_LOG = RESOURCE_FRONT + File.separator + RELATIVE_PATH_RESOURCE_PACK_OTHER;


    /**
     * 获取当前系统本地路径前缀
     *
     * @return 当前本地路径前缀
     */
    private static String getSystemLocalPathABSFront() {
        String absFront = "";
        switch (SystemUtils.getOSName()) {
            case SystemUtils.IS_MAC_OS: {
                absFront = PACK_RESOURCE_USER_HOME;
            }
        }
        return absFront;
    }

    /**
     * 包装当前系统的本地资源路径
     *
     * @return 包装后的本地资源路径
     */
    public static String buildSystemLocalPath(String localPathResource) {
        return getSystemLocalPathABSFront() + File.separator + localPathResource;
    }


    /**
     * 获取游戏apk的本地资源路径
     *
     * @param parentPath 前缀地址
     * @param gameEntity 游戏数据对象
     * @param isCp       是否为cp包(cp 与 sdk 包) 如果有 parentPath, 将无视
     * @return 路径字符串
     */
    public static String getGameApkLocalParentPath(String parentPath, GameEntity gameEntity, boolean isCp) {
        String path = "";
        if (parentPath != null) {
            path = path + parentPath + File.separator;
        } else {
            // 自动拼接前部分
            String front;
            if (isCp) {
                front = RESOURCE_GAME_CP;
            } else {
                front = RESOURCE_GAME_SDK;
            }
            path = path + buildSystemLocalPath(front) + File.separator;
        }
        path = path + gameEntity.getGameShortName();
        if (gameEntity.getVer() != null) { // 版本不为空继续拼接时间目录
            path = path + File.separator + gameEntity.getVer().getGameVerUpFDate();
        }
        return path;
    }

    /**
     * 获取游戏apk的本地路径, 自动拼接前缀
     *
     * @param gameEntity 游戏数据对象
     * @param isCp       是否为cp包(cp 与 sjoy 包)
     * @return 路径字符串
     */
    public static String getGameApkLocalParentPath(GameEntity gameEntity, boolean isCp) {
        return getGameApkLocalParentPath(null, gameEntity, isCp);
    }

    /**
     * 游戏apk名前缀 cp
     **/
    public static String GAME_APK_NAME_FRONT_CP = "cp_";
    /**
     * 游戏apk名前缀 leidong
     **/
    public static String GAME_APK_NAME_FRONT_SDK = "leidong_";

    /**
     * 获取游戏apk名称
     *
     * @param gameEntity 游戏数据对象
     * @param isCp       是否为cp包 (cp 与 sjoy 包)
     * @return 路径字符串
     */
    public static String getGameApkName(GameEntity gameEntity, boolean isCp) {
        String front;
        if (isCp) {
            front = GAME_APK_NAME_FRONT_CP;
        } else {
            front = GAME_APK_NAME_FRONT_SDK;
        }
        return front + gameEntity.getGameId() + "_" + gameEntity.getVer().getGameVerUpFDate() + ".apk";
    }


    /**
     * 直接获取游戏apk文件路径
     *
     * @param gameEntity 游戏数据对象
     * @param isCp       是否为cp包 (cp 与 sjoy 包)
     * @return apk文件路径
     */
    public static String getGameApkFilePath(GameEntity gameEntity, boolean isCp) {
        return getGameApkLocalParentPath(gameEntity, isCp) + File.separator + getGameApkName(gameEntity, isCp);
    }


}
