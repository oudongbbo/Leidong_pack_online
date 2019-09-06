package com.starjoys.tool.packonline.modules.packmanager.utils;

import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.common.config.ResPathConfig;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameEntity;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameParamEntity;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameParamRecordEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import com.starjoys.tool.packonline.utils.FileUtil;
import com.starjoys.tool.packonline.utils.SystemUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.util.Properties;
import java.util.Set;

/**
 *
 * @author Administrator
 * @version 1.0
 * @create 2017/2/15
 */

public class GameParamUtils {

    /**
     * 处理独有渠道参数
     *
     * @param request 请求
     * @param entity  数据对象
     */
    public static boolean handlerParamData(HttpServletRequest request, GameParamEntity entity) {
        // 设置当前操作者
        entity.getRecord().setUser((UserEntity) request.getSession().getAttribute(GlobalConfig.SESSION_KEY_USER));

        // 渠道参数处理
        String recordParamData = "";
        Set<String> keySet = request.getParameterMap().keySet();
        String prefix = "allParam-";
        String regex = "-";
        for (String key : keySet) {
//            sendLog("遍历参数key:" + key);
            if (key.startsWith(prefix)) { // 以allParam-开头的参数名
                String[] attrs = key.split(regex);
                if (attrs.length == 2) { // 参数名要符合格式
                    if (!recordParamData.equals("")) {
                        recordParamData += "\r\n";
                    }
                    String value = request.getParameter(key);
                    if (isIllegal(value)) { // 存在非法字符
                        return false;
                    }
                    String keyName = attrs[1].replaceAll(" ", "");
                    String param = keyName + "=" + value.replaceAll(" ", "");
                    System.out.println("符合的参数 value: " + value + " param: " + param);
                    recordParamData += param;
                }
            }
        }
//        sendLog("记录参数数据:" + recordParamData);
        entity.getRecord().setGpRecordData(recordParamData);
        return true;
    }


    /**
     * 做数据库处理之前调用
     *
     * @param entity 游戏参数对象
     */
    public static boolean beforeHandler(GameParamEntity entity) {
//        sendLog("调用数据库处理之前方法");

        // 添加固定渠道参数
        String commonParamData = "";
        String enterStr = "\r\n"; // 换行符
        if (entity.getRecord().getIsLandScape() != null)
            commonParamData += "isLandScape=" + entity.getRecord().getIsLandScape() + enterStr; // 横竖屏
        if (entity.getRecord().getIsFinal() != null)
            commonParamData += "isFinal=" + entity.getRecord().getIsFinal() + enterStr; // 是否定额
        if (entity.getRecord().getReplaceR() != null)
            commonParamData += "replaceR=" + entity.getRecord().getReplaceR() + enterStr; // 重建R文件
        if (entity.getRecord().getPname() != null) {
            String pname = entity.getRecord().getPname();
            boolean result = isIllegal(pname);
            if (result) { // 存在非法字符
                return false;
            }
            commonParamData += "pname=" + pname.replaceAll(" ", "") + enterStr; // 包名
        }
//        sendLog("固定渠道参数 " + commonParamData);
        if (entity.getRecord().getGpRecordData() != null) { // 后部分的参数不为空时, 把common参数装配到前部分
            commonParamData = commonParamData + entity.getRecord().getGpRecordData();
        }
        entity.getRecord().setGpRecordData(commonParamData); // 把固定参数放到前面

        // 把参数保存到本地配置文件中
        return GameParamUtils.saveParamToCfg(entity);
    }

    /**
     * 列表读取配置文件
     *
     * @param list 列表
     */
    public static void readCfgForList(List<GameParamEntity> list) {
        // 从本地配置文件中读取参数数据
        for (int i = 0; i < list.size(); i++) {
            GameParamEntity itemEntity = list.get(i);
            hasIcon(itemEntity); // 判断本地是否存在icon
            if (itemEntity.getRecord().getIsNew() == BaseEntity.FLAG_STATUS_ACTIVE) { // 只有最新的才从本地读取
                // 从本地配置文件读取参数数据
                String data = GameParamUtils.getParamFromCfgString(itemEntity); // 获取到的参数数据
                if (data != null) {
                    itemEntity.getRecord().setGpRecordData(data);
                }
            }
        }
    }

    /**
     * 判断打包本地目录是否存在icon
     *
     * @param gameParamEntity 游戏参数对象
     */
    private static void hasIcon(GameParamEntity gameParamEntity) {
        // 获取apk打包图标的路径
        String apkPackIconsPath = BaseService.wrapIconPackLocalPath(gameParamEntity,
                ResPathConfig.PACK_PLATFORM_ICONS);
        File iconFile = new File(apkPackIconsPath, "icon.png");
        if (iconFile.exists() && iconFile.isFile()) { // 判断是否存在icon
            gameParamEntity.setGameParamIcon(BaseEntity.FLAG_BOOLEAN_TRUE);
        } else {
            gameParamEntity.setGameParamIcon(BaseEntity.FLAG_BOOLEAN_FALSE);
        }
    }

    /**
     * 保存参数到配置文件中
     *
     * @param entity 数据对象
     * @return 是否成功
     */
    public static boolean saveParamToCfg(GameParamEntity entity) {
        File cfgPathFile = getParamCfgPathFile(entity.getGame()); // 获取cfg文件路径
        if (cfgPathFile == null) {
            return false;
        }
        if (!cfgPathFile.exists()) {
            cfgPathFile.mkdirs();
        }
        // 写入到配置文件中
        String cfgFilePath = cfgPathFile.getAbsolutePath() + File.separator
                + entity.getCch().getCchShortName() + ".cfg";
        FileUtil.write(cfgFilePath, entity.getRecord().getGpRecordData());
        return true;
    }

    /**
     * 从配置文件中获取参数
     *
     * @param cfgFile cfg文件
     * @return 参数
     */
    public static String getParamFromCfgString(File cfgFile) {
        if (cfgFile != null && cfgFile.exists()) {
            String cfgData = FileUtil.read(cfgFile.getAbsolutePath());
            if (SystemUtils.getOSName() == SystemUtils.IS_MAC_OS) { // mac设备上
                cfgData = cfgData.replaceAll("\n", "\r\n"); // 替换所有\n的换行符为\r\n
            }
            return cfgData;
        }
        return null;
    }

    /**
     * 从配置文件中获取参数
     *
     * @param entity 数据对象
     * @return 参数
     */
    public static String getParamFromCfgString(GameParamEntity entity) {
        return getParamFromCfgString(getParamCfgFile(entity));
    }

    /**
     * 从配置文件中获取参数, 并装配到数据对象中
     *
     * @param entity 数据对象
     * @return 参数
     */
    public static boolean readParamToEntity(GameParamEntity entity) {
        File cfgFile = getParamCfgFile(entity);
        if (cfgFile != null && cfgFile.exists()) {
            Properties properties = new Properties();
            FileInputStream input = null;
            try {
                // 读取cfg数据到配置信息对象中
                input = new FileInputStream(cfgFile);
                properties.load(input);
                String isLandScape = properties.getProperty("isLandScape");
                String isFinal = properties.getProperty("isFinal");
                String replaceR = properties.getProperty("replaceR");
                String pname = properties.getProperty("pname");

                // 给游戏参数记录设置配置数据
                GameParamRecordEntity recordEntity = entity.getRecord();
                if (recordEntity != null) {
                    recordEntity.setIsLandScape(isLandScape);
                    recordEntity.setIsFinal(isFinal);
                    recordEntity.setReplaceR(replaceR);
                    recordEntity.setPname(pname);

                    // 把整个参数文本直接放入游戏参数记录数据中
                    String cfgData = getParamFromCfgString(cfgFile);
                    recordEntity.setGpRecordData(cfgData);
                }
                // 给游戏设置配置数据
                GameEntity gameEntity = entity.getGame();
                if (gameEntity != null) {
                    gameEntity.setIsLandScape(isLandScape);
                    gameEntity.setIsFinal(isFinal);
                    gameEntity.setReplaceR(replaceR);
                }

            } catch (IOException e) {
                e.printStackTrace();
                return false;
            } finally {
                if (input != null) {
                    try {
                        input.close();
                    } catch (IOException e) {
                        input = null;
                    }
                }
            }
        }
        return true;
    }

    /**
     * 获取参数配置文件路径
     *
     * @param entity 数据对象
     * @return 文件路径
     */
    public static File getParamCfgPathFile(GameEntity entity) {
        int type = entity.getGameType();
        String configPath = ResPathConfig.buildSystemLocalPath(ResPathConfig.PACK_PLATFORM_CONFIGS)
                + File.separator;
        if (type == GameEntity.GAME_TYPE_DUDAI) { // 独代
            configPath += GameEntity.GAME_TYPE_NAME_DUDAI + File.separator + entity.getGameShortName()
                    + File.separator + entity.getGameId();
        } else if (type == GameEntity.GAME_TYPE_LIANYUN) { // 联运
            configPath += GameEntity.GAME_TYPE_NAME_LIANYUN + File.separator + entity.getGameId();
        } else {
            configPath = null;
        }
        if (configPath != null) {
            return new File(configPath);
        } else {
            return null;
        }
    }

    /**
     * 获取参数配置文件
     *
     * @param entity 数据对象
     * @return 配置文件
     */
    public static File getParamCfgFile(GameParamEntity entity) {
        File cfgPathFile = getParamCfgPathFile(entity.getGame()); // 获取cgf文件路径
        if (cfgPathFile == null) {
            return null;
        }
        String cfgFilePath = cfgPathFile.getAbsolutePath() + File.separator
                + entity.getCch().getCchShortName() + ".cfg";
        File cfgFile = new File(cfgFilePath);
        if (!cfgFile.exists()) {
            return null;
        }
        return cfgFile;
    }


    /**
     * 是否存在非法字符
     *
     * @param str 字符串
     * @return 是否有
     */
    public static boolean isIllegal(String str) {
        if (str.contains("\"")) {
            return true;
        }
        return false;
    }

    /**
     * 获取参数配置文件的首目录路径
     *
     * @param entity 数据对象
     * @return 文件路径
     */
    public static File getParamCfgFirstPathFile(GameEntity entity) {
        File cfgPathFile = getParamCfgPathFile(entity);
        if (cfgPathFile != null) {
            if (entity.getGameType() == GameEntity.GAME_TYPE_DUDAI) {
                return cfgPathFile.getParentFile(); // 组装cfg独代的首目录路径
            } else if (entity.getGameType() == GameEntity.GAME_TYPE_LIANYUN) {
                return cfgPathFile;
            }
        }
        return null;
    }

    /**
     * 获取参数配置文件的游戏类型目录路径
     *
     * @param entity 数据对象
     * @return 文件路径
     */
    public static File getParamCfgGameTypePathFile(GameEntity entity) {
        String gameTypeName;
        if (entity.getGameType() == GameEntity.GAME_TYPE_DUDAI) {
            gameTypeName = GameEntity.GAME_TYPE_NAME_DUDAI;
        } else if (entity.getGameType() == GameEntity.GAME_TYPE_LIANYUN) {
            gameTypeName = GameEntity.GAME_TYPE_NAME_LIANYUN; // 组装联运的首目录
        } else {
            return null;
        }

        String frontPath = ResPathConfig.buildSystemLocalPath(ResPathConfig.PACK_PLATFORM_CONFIGS);
        return new File(frontPath, gameTypeName);
    }


}
