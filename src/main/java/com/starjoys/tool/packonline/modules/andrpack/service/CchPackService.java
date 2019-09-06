package com.starjoys.tool.packonline.modules.andrpack.service;

import com.starjoys.tool.packonline.bean.KeyValueBean;
import com.starjoys.tool.packonline.bean.PackResultBean;
import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BasePackService;
import com.starjoys.tool.packonline.common.config.ResPathConfig;
import com.starjoys.tool.packonline.modules.packmanager.dao.GameDao;
import com.starjoys.tool.packonline.modules.packmanager.dao.GameParamDao;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameEntity;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameParamEntity;
import com.starjoys.tool.packonline.modules.packrecord.dao.ChannelFileDao;
import com.starjoys.tool.packonline.modules.packrecord.dao.ChannelRecordDao;
import com.starjoys.tool.packonline.modules.packrecord.entity.ChannelFileEntity;
import com.starjoys.tool.packonline.modules.packrecord.entity.ChannelRecordEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import com.starjoys.tool.packonline.utils.FileUtil;
import com.starjoys.tool.packonline.utils.SystemUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * 推广包打包业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/13
 */

@Service
@Scope("prototype")
public class CchPackService extends BasePackService {

    @Resource
    private GameDao gameDao;

    @Resource
    private GameParamDao gameParamDao;

    @Resource
    private ChannelRecordDao channelRecordDao;

    @Resource
    private ChannelFileDao channelFileDao;

    /** 游戏id参数 **/
    private String mGameId;
    /** 游戏参数id列表参数 **/
    private List<String> mGameParamIdList;
    /** 用户参数 **/
    private UserEntity mUser;

    /** 从数据库读取的游戏参数列表 **/
    private List<GameParamEntity> mGameParamList;
    /** 结果集 **/
    private ResultBean<PackResultBean> mResultBean;
    /** 从数据库获取的当前游戏 **/
    private GameEntity mGameEntity;

    /** 开始时间戳 **/
    private long mStartTimeMillis;

    /** 转移到打包目录的文件 **/
    private File mInputFile;

    /**
     * 提交打包请求
     *
     * @param gameId          游戏Id
     * @param gameParamIdList 游戏参数id列表
     * @param user            用户
     * @param startTimeMillis 开始时间
     * @return 结果集
     */
    public ResultBean<PackResultBean> submitPack(String gameId, List<String> gameParamIdList,
                                                 UserEntity user, long startTimeMillis) {
        sendLog("开始打包业务逻辑");

        // 初始化数据
        mResultBean = new ResultBean<>(); // 结果集
        mGameId = gameId; // 游戏id
        mGameParamIdList = gameParamIdList; // 游戏参数id列表
        mUser = user; // 用户
        mStartTimeMillis = startTimeMillis; // 开始时间戳

        // 验证数据
        if (validData()) {

            // 开始打包
            startPack();
        }

        // 删除上传目录中的打包文件
        removeInputFile();
        return mResultBean;
    }

    public ResultBean<PackResultBean> submitCPPack(GameEntity gameEntity, UserEntity user) {
        sendLog("开始打包业务逻辑");

        // 初始化数据
        mResultBean = new ResultBean<>(); // 结果集
        mGameEntity = gameEntity; // 游戏对象
        mUser = user;

        // 开始打包
        startCPPack();

        // 删除上传目录中的打包文件
//        removeInputFile();
        return mResultBean;
    }


    /**
     * 验证数据
     *
     * @return 是否成功
     */
    private boolean validData() {
        sendLog("验证打包数据 gameId " + mGameId + " idList:" + mGameParamIdList);

        // 验证游戏是否存在
        mGameEntity = gameDao.getWithVer(mGameId);
        sendLog("获取到的游戏对象 " + mGameEntity);
        if (mGameEntity == null || mGameEntity.getStatus() == BaseEntity.FLAG_STATUS_DEL) { // 检查游戏是否存在
            setResultBeanError(mResultBean, "当前游戏不存在");
            return false;
        }

        // 验证游戏参数是否存在
        mGameParamList = gameParamDao.findListByIds(mGameParamIdList);
        sendLog("检查出的游戏参数列表 " + mGameParamList);
        if (mGameParamList == null || mGameParamList.size() != mGameParamIdList.size()) {
            setResultBeanError(mResultBean, "可能存在非法游戏参数Id");
            return false;
        }

        return true;
    }

    /**
     * 开始打包
     *
     * @return 是否成功
     */
    private boolean startPack() {

        // 先创建数据库需要数据
        ChannelFileEntity channelRecordFileEntity = createChannelRecord(); // 渠道打包记录对象

        // 先生成打包结果集, 并生成对应目录 /pack/main/时间/用户名/文件
        PackResultBean packResultBean = generatePackResultBean(ResPathConfig.RELATIVE_PATH_RESOURCE_PACK_MAIN,
                mUser.getUsername(), mStartTimeMillis);
        File apkOutputPathFile = packResultBean.getLocalDownloadDirFile(); // apk文件输出路径
        if (!apkOutputPathFile.exists()) {
            apkOutputPathFile.mkdirs();
        }
        sendLog("生成打包结果集 " + packResultBean + " 输出路径 " + apkOutputPathFile.getAbsolutePath());

        // 先把sjoy游戏包复制到input目录中再进行打包
        File sjoyGameApkOriFile = new File(ResPathConfig.getGameApkFilePath(mGameEntity, false)); // 获取sjoy游戏apk原始文件路径
        if (!sjoyGameApkOriFile.exists()) {
            sendLog("找不到对应sjoy游戏apk包");
            setResultBeanError(mResultBean, "找不到对应sjoy游戏apk包");
            return false;
        }
        mInputFile = new File(generateInputFilePath(ResPathConfig.buildSystemLocalPath(
                ResPathConfig.RESOURCE_INPUT_PLATFORM), mStartTimeMillis)
                + File.separator
                + generateInputFileName(mUser.getUsername(), mStartTimeMillis) + "_" + sjoyGameApkOriFile.getName());
        boolean copyResult = FileUtil.copyFile(sjoyGameApkOriFile, mInputFile);
        if (!copyResult) {
            sendLog("sjoy游戏包复制到input目录失败");
            setResultBeanError(mResultBean, "sjoy游戏包复制到input目录失败");
            return false;
        }


        // 先拼接cmd通用命令
//        String cmdCommend = getCmdWithPacktoolsJar(PACK_TOOLS_JAR_ZPID); // 获取调用打包工具的cmd命令
        String cmdCommend = getCommandFromPackTools(PACK_TOOLS_NAME_BATSH_PACK_PID, CMD_FILE_TYPE_BAT_OR_SH); // 获取调用打包工具的cmd命令
        cmdCommend = cmdCommend + " " + mInputFile.getAbsolutePath(); // 先把调用工具的命令和input拼接在一起

        // 设置cmd游戏类型标识
        String gameTypeCmd;
        if (mGameEntity.getGameType() == GameEntity.GAME_TYPE_LIANYUN) { // 联运
            gameTypeCmd = "LY";
        } else if (mGameEntity.getGameType() == GameEntity.GAME_TYPE_DUDAI) { // 独代
            gameTypeCmd = mGameEntity.getGameShortName();
        } else {
            sendLog("此游戏类型未知");
            setResultBeanError(mResultBean, "此游戏类型位置");
            return false;
        }

        // 先向数据库创建一条打包记录
        channelRecordDao.insert(channelRecordFileEntity);
        sendLog("插入后返回的id " + channelRecordFileEntity.getCchRecord().getCchRecordId());

        // 真正的打包过程
        try {

            // 循环进行打包
            String packLogs = ""; // 打包日志
            String packTimeCmd = "m"; // 默认多次打包标记
            int packSucCount = 0; // 打包成功次数计数
            for (int i = 0; i < mGameParamList.size(); i++) {
                GameParamEntity gameParamEntity = mGameParamList.get(i);
                String packTip = "第" + (i + 1) + "个打包";
                sendLog(packTip);

                // 最后一次打包将多次打包改成单次类型, 这样就会清除通用的反编译文件
                if (i == mGameParamList.size() - 1) {
                    packTimeCmd = "s"; // 单次打包标记
                }


                // 把游戏类型与拼接在一起 (调用工具命令 游戏apk路径 渠道缩写名 打包类型(独代或联运) 多次或一次打包(s一次 m多次) 输出路径)
                String finalCmdCommend = cmdCommend + " " + gameParamEntity.getCch().getCchShortName() + " " + gameTypeCmd
                        + " " + packTimeCmd + " " + apkOutputPathFile.getAbsolutePath() + " " + mUser.getUsername();
//                String finalCmdCommend = cmdCommend + " " + gameParamEntity.getCch().getCchShortName() + " " + gameTypeCmd
//                        + " " + packTimeCmd + " " + apkOutputPathFile.getAbsolutePath();
                sendLog("cmd命令 " + finalCmdCommend);

                // 执行cmd
                ResultBean<String> cmdResult = quickExec(finalCmdCommend);

                // 拼接日志
                sendLog("日志: " + cmdResult.getMessage());
                packLogs = packLogs + "******" + packTip + "*******\n" + cmdResult.getMessage() + "\n";
                packResultBean.setPackLogs(packLogs); // 把打包日志添加到打包结果中

                // 判断单个打包情况
                int singlePackResult = BaseEntity.FLAG_BOOLEAN_FALSE; // 默认失败
                if (!cmdResult.isSuccess()) { // cmd结果打包不成功
                    sendLog(packTip + "失败, cmd结果失败");
                } else if (!isExistPackFile(apkOutputPathFile, gameParamEntity)) { // 是否存在生成的打包文件, 有则成功,没则失败
                    sendLog(packTip + "失败, 文件不存在");
                } else {
                    singlePackResult = BaseEntity.FLAG_BOOLEAN_TRUE; // 结果设置为成功
                    packSucCount++; // 成功计数器加1
                    sendLog(packTip + "打包成功");
                }
                insertChannelFile(channelRecordFileEntity, gameParamEntity, singlePackResult); // // 把打包文件记录添加到数据库

            }

            // 打包结果处理
            boolean handleResult = handlePackResult(packResultBean);
            if (handleResult) {

                if (packSucCount == mGameParamList.size()) {
                    // 全部打包成功
                    sendLog("全部打包成功");
                    setResultBean(mResultBean, true, "打包成功", packResultBean);

                    sendLog("更新数据库的打包记录结束时间 " + channelRecordFileEntity);
                } else {
                    // 部分打包成功
                    sendLog("部分打包成功");
                    setResultBean(mResultBean, true, "部分打包成功，，请联系技术人员解决失败的渠道", packResultBean);
                }

                // 打包成功就把结束时间更新上去
                channelRecordFileEntity.getCchRecord().setCchRecordEndDate(new Timestamp(System.currentTimeMillis()));
                // 获取输出文件地址
                channelRecordFileEntity.getCchRecord().setCchRecordOutput(getDownloadFilePath(packResultBean));

            } else { // 打包失败
                sendLog("cmd打包执行完成，但找不到输出文件，请查看打包过程日志");
                setResultBean(mResultBean, false, "cmd打包执行完成，但找不到输出文件，请联系技术人员解决",
                        packResultBean);
            }

        } catch (Exception e) { // 打包失败
            e.printStackTrace();
            sendLog("执行CMD异常");
            setResultBean(mResultBean, false, "执行cmd命令抛出异常，请联系技术人员解决", packResultBean);
        }

        if (!mResultBean.isSuccess()) // 不成功才把结果信息加入
            channelRecordFileEntity.getCchRecord().setCchRecordResultMsg(mResultBean.getMessage()); // 结果信息
        channelRecordDao.update(channelRecordFileEntity);
        return true;
    }

    /**
     * 创建渠道记录对象
     *
     * @return 记录对象
     */
    private ChannelFileEntity createChannelRecord() {
        ChannelRecordEntity channelRecordEntity = new ChannelRecordEntity();
        channelRecordEntity.setUser(mUser);
        channelRecordEntity.setCchRecordStartDate(new Timestamp(mStartTimeMillis));
        channelRecordEntity.setCchRecordNum(mGameParamList.size());

        ChannelFileEntity channelFileEntity = new ChannelFileEntity();
        channelFileEntity.setCchRecord(channelRecordEntity);
        return channelFileEntity;
    }

    /**
     * 向数据库插入渠道文件记录
     *
     * @param channelRecordFileEntity 渠道打包记录对象
     * @param gameParamEntity         游戏参数对象
     * @param cchFileSuccess          是否成功打包
     */
    private void insertChannelFile(ChannelFileEntity channelRecordFileEntity, GameParamEntity gameParamEntity,
                                   int cchFileSuccess) {
        ChannelFileEntity channelFileEntity = new ChannelFileEntity();
        channelFileEntity.setCchRecord(channelRecordFileEntity.getCchRecord());
        channelFileEntity.setGameParam(gameParamEntity);
        channelFileEntity.setCchFileSuccess(cchFileSuccess);
        if (gameParamEntity.getRecord() != null) {
            channelFileEntity.setCchFileGPRecordData(gameParamEntity.getRecord().getGpRecordData());
        }
        channelFileDao.insert(channelFileEntity);
    }

    /**
     * 判断是否存在打包生成的文件
     *
     * @param outputPathFile  输出路径的文件对象
     * @param gameParamEntity 游戏参数数据对象
     * @return 是否存在
     */
    private boolean isExistPackFile(File outputPathFile, GameParamEntity gameParamEntity) {
        // 文件路径 格式 输出路径/渠道名_sjoys_时间_用户.apk
        String outputFilePath = outputPathFile.getAbsolutePath() + File.separator +
                gameParamEntity.getCch().getCchShortName() + "_" + mInputFile.getName();
        sendLog("生成出来的文件路径 " + outputFilePath);
        return new File(outputFilePath).exists();
    }


    /**
     * 开始cp包打包成星趣包
     *
     * @return 是否成功打包
     */
    private boolean startCPPack() {

        mStartTimeMillis = System.currentTimeMillis();

        //1.先把cp游戏包复制到input目录中再进行打包
        //2.
        //3.
        File gameCpApkFile = new File(ResPathConfig.getGameApkFilePath(mGameEntity, true)); //  获取cp游戏apk原始文件路径
        if (!gameCpApkFile.exists()) {
            sendLog("找不到对应CP游戏apk包");
            setResultBeanError(mResultBean, "找不到对应CP游戏apk包");
            return false;
        }
        mInputFile = new File(generateInputFilePath(ResPathConfig.buildSystemLocalPath(ResPathConfig.RESOURCE_INPUT_PLATFORM), mStartTimeMillis)
                + File.separator
                + gameCpApkFile.getName());

        sendLog("复制apk，从："+gameCpApkFile.getAbsolutePath()+"   到："+mInputFile.getAbsolutePath());

        boolean copyResult = FileUtil.copyFile(gameCpApkFile, mInputFile);


        if (!copyResult) {
            sendLog("cp游戏包复制到input目录失败");
            setResultBeanError(mResultBean, "cp游戏包复制到input目录失败");
            return false;
        }

        // 先拼接cmd通用命令
        String cmdCommend = ""; // 获取调用打包工具的cmd命令
//        cmdCommend = getCmdWithPacktoolsJar(PACK_TOOLS_JAR_ZPID) + " " + mInputFile.getAbsolutePath(); // 先把调用工具的命令和input拼接在一起
        cmdCommend = getCommandFromPackTools(PACK_TOOLS_NAME_BATSH_PACK_PID, CMD_FILE_TYPE_BAT_OR_SH) + " " + mInputFile.getAbsolutePath(); // 先把调用工具的命令和input拼接在一起

        String sdkOutputPath = ResPathConfig.getGameApkLocalParentPath(mGameEntity, false); // sjoy包的输出地址

        // 设置cmd游戏类型标识
        String gameType;
        if (mGameEntity.getGameType() == GameEntity.GAME_TYPE_LIANYUN) { // 联运
            gameType = "LY";
        } else if (mGameEntity.getGameType() == GameEntity.GAME_TYPE_DUDAI) { // 独代
            gameType = mGameEntity.getGameShortName();
        } else {
            sendLog("此游戏类型未知1");
            setResultBeanError(mResultBean, "此游戏类型位置");
            return false;
        }

        // 真正的打包过程
        try {

            // 把游戏类型与拼接在一起 (调用工具命令 游戏apk路径 渠道缩写名 打包类型(独代或联运) 多次或一次打包(s一次 m多次) 输出路径)
            cmdCommend = cmdCommend + " leidong " + gameType + " s " + sdkOutputPath.trim() + " " + mUser.getUsername();

            sendLog("cmd命令 " + cmdCommend);

            // 执行cmd
            ResultBean<String> cmdResult = quickExec(cmdCommend);

            // 拼接日志
            sendLog("日志: " + cmdResult.toString());

            // 判断当前打包情况
            if (cmdResult.isSuccess()) { // 打包不成功, 结束打包

                // 检查输出目录中是否存在文件
                File sdkOutputFile = new File(sdkOutputPath, ResPathConfig.GAME_APK_NAME_FRONT_SDK + mInputFile.getName());
                if (sdkOutputFile.exists()) {
                    // 文件路径使用旧的, 组装新的文件名, 并且进行重命名
                    File renameFile = new File(sdkOutputFile.getParent() + File.separator + ResPathConfig.getGameApkName(mGameEntity, false));

                    sdkOutputFile.renameTo(renameFile);

                    // 保存sdk包文件资源路径
                    String sdkResPath = ResPathConfig.getGameApkLocalParentPath(ResPathConfig.RELATIVE_PATH_RESOURCE_GAME_SDK, mGameEntity, false);

                    String sdkFinalPath = File.separator + sdkResPath + File.separator + renameFile.getName();
                    if (SystemUtils.isWindowsOS()) {
                        sdkFinalPath = sdkFinalPath.replaceAll("\\\\", "/");
                    }
                    mGameEntity.getVer().setGameVerUpSJoysPath(sdkFinalPath);

                    sendLog("CP打包成功 " + renameFile);
                    setResultBean(mResultBean, true, "CP打包成功");
                    return true;
                } else {
                    sendLog("CP打包CMD执行完成, 但没生成出SJOY包");
                    setResultBeanError(mResultBean, "CP打包CMD执行完成, 但没生成出SJOYS包");
                    return false;
                }
            } else {
                sendLog("cp打包失败");
                setResultBeanError(mResultBean, "cp打包失败,CMD结果失败");
                return false;
            }

        } catch (Exception e) { // 打包失败
            e.printStackTrace();
            sendLog("执行CMD异常");
            setResultBeanError(mResultBean, "CP包执行cmd命令抛出异常");
            return false;
        }
    }


    /**
     * 检查正在运行的打包
     *
     * @param paramIdList 将要打包的参数id列表
     * @param appParamMap 服务器所有正在打包的参数map
     * @return 结果集
     */
    public ResultBean<String> checkRunningPack(List<String> paramIdList, Map<String, List<String>> appParamMap) {
        sendLog("检查正在运行的打包参数 " + paramIdList + " map:" + appParamMap);
        ResultBean<String> resultBean = new ResultBean<>("", "确认打包", true); // 默认

        // 从数据库中获取游戏参数列表
        List<GameParamEntity> gameParamList = gameParamDao.findListByIds(paramIdList);

        if (gameParamList != null && gameParamList.size() > 0) { // 不为空

            List<KeyValueBean> existParamIdList = new ArrayList<>(); // 已经存在的参数id列表
            // 遍历所有数据, 找出重复的参数id, 并添加到重复参数id列表中
            Iterator<String> iterator = appParamMap.keySet().iterator();
            while (iterator.hasNext()) { // 遍历所有在map中的参数列表

                if (gameParamList.size() <= 0) { // 如果参数id列表被删光, 说明都重复了, 不用继续遍历
                    break;
                }

                String key = iterator.next();
                List<String> valueList = appParamMap.get(key);
                for (String value : valueList) { // 遍历从map中取出的参数列表中的参数id

                    if (gameParamList.size() <= 0) { // 如果参数id列表被删光, 说明都重复了, 不用继续遍历
                        break;
                    }

                    for (int i = 0; i < gameParamList.size(); i++) { // 遍历从传过来的
                        GameParamEntity gameParamEntity = gameParamList.get(i);
                        if (value.equals(gameParamEntity.getGameParamId() + "")) {
                            // 放入已存在参数列表
                            existParamIdList.add(new KeyValueBean(key, gameParamEntity));
                            gameParamList.remove(i);
                            i--; // 删除一个后, 指标需要退一个, 防止出错
                        }
                    }

                }
            }

            if (existParamIdList.size() != 0) { // 别人已经在打包的参数, 存在重复的参数
                StringBuilder frontBuilder = new StringBuilder(); // 前部分
                for (KeyValueBean existParam : existParamIdList) { // 组装前部分的渠道重复字符串
                    if (frontBuilder.length() != 0) {
                        frontBuilder.append(", ");
                    }
                    frontBuilder.append(((GameParamEntity) existParam.getValue()).getCch().getCchShortName());
                }
                frontBuilder.append(" 渠道已有用户");

                StringBuilder behindBuilder = new StringBuilder(); // 后部分
                String lastKey = "";
                for (KeyValueBean existParam : existParamIdList) { // 组装后部分的正在打包的用户字符串
                    String currentKey = existParam.getKey();
                    if (!currentKey.equals(lastKey)) {
                        if (behindBuilder.length() != 0) {
                            behindBuilder.append(", ");
                        }
                        behindBuilder.append(currentKey);
                        lastKey = currentKey;
                    }
                }
                frontBuilder.append(behindBuilder).append("在打包，同一个游戏不允许同时重复渠道打包");
//                setResultBean(resultBean, true, frontBuilder.toString());
                setResultBeanError(resultBean, frontBuilder.toString()); // 不允许打包
            }

        }

        return resultBean;
    }

    /**
     * 删除上传目录中的打包文件
     */
    private void removeInputFile() {
        if (mInputFile != null) {
            FileUtil.delDir(mInputFile);
        }
    }


}
