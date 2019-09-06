package com.starjoys.tool.packonline.common.base;

import com.starjoys.tool.packonline.common.config.ResPathConfig;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameParamEntity;

import java.io.File;

/**
 * 基础业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2016/12/29
 */

public abstract class BaseService extends BaseWebClazz {

    /** 本地备份删除文件的文件夹名 **/
    public static final String DELETE_BACKUP_DIR = "delete_backup";

    /**
     * 获取游戏类型名
     *
     * @param gameType 游戏类型 0默认 1独代 2联运
     * @return 游戏类型名
     */
    protected static String getGameTypeName(int gameType) {
        String typeFileName = null;
        switch (gameType) {
            case 0:
                typeFileName = "Default";
                break; // 默认
            case 1:
                typeFileName = "Dudai";
                break; // 独代
            case 2:
                typeFileName = "Lianyun";
                break; // 联运
        }
        return typeFileName;
    }


    /**
     * 包装渠道类型的图标本地资源路径
     *
     * @param localPathResource 本地资源路径
     * @return 包装后的本地资源渠道类型路径
     */
    public static String wrapIconPackLocalPath(GameParamEntity gameParamEntity, String localPathResource) {
        int gameType = gameParamEntity.getGame().getGameType(); // 游戏类型
        String typeFileName = getGameTypeName(gameType); // 游戏类型名
        String fileSavePath = ResPathConfig.buildSystemLocalPath(localPathResource); // 文件保存路径
        if (gameType == 1) { // 独代 游戏标识 + 渠道标识
            fileSavePath = fileSavePath + File.separator
                    + typeFileName + File.separator
                    + gameParamEntity.getGame().getGameShortName() + File.separator
                    + gameParamEntity.getGame().getGameId() + File.separator
                    + gameParamEntity.getCch().getCchShortName();
        } else if (gameType == 2) { // 联运  游戏ID + 渠道标识
            fileSavePath = fileSavePath + File.separator
                    + typeFileName + File.separator
                    + gameParamEntity.getGame().getGameId() + File.separator
                    + gameParamEntity.getCch().getCchShortName();
        } else {
            return null;
        }
        return fileSavePath;
    }


    /**
     * 拼接本地文件
     * @param relPath 相对路径
     * @return 返回本地文件
     */
    protected static File getLocalResFile(String relPath) {
        if (relPath.startsWith("/")) {
            return new File(ResPathConfig.buildSystemLocalPath(
                    ResPathConfig.RESOURCE_FRONT
                            + relPath));
        } else {
            return new File(ResPathConfig.buildSystemLocalPath(
                    ResPathConfig.RESOURCE_FRONT
                            + File.separator + relPath));
        }
    }

}
