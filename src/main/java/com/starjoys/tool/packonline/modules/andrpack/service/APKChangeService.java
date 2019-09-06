package com.starjoys.tool.packonline.modules.andrpack.service;

import com.starjoys.tool.packonline.bean.PackResultBean;
import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BasePackService;
import com.starjoys.tool.packonline.common.config.ResPathConfig;
import com.starjoys.tool.packonline.modules.packmanager.dao.GameDao;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameEntity;
import com.starjoys.tool.packonline.modules.packrecord.dao.APKChangeDao;
import com.starjoys.tool.packonline.modules.packrecord.entity.APKChangeEntity;
import com.starjoys.tool.packonline.utils.Apktools;
import com.starjoys.tool.packonline.utils.FileUtil;
import com.starjoys.tool.packonline.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;

/**
 * APK基本功能修改业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/22
 */

@Service
public class APKChangeService extends BasePackService {

    @Resource
    private APKChangeDao apkChangeDao;

    @Resource
    private GameDao gameDao;

    /**
     * 打包操作全过程
     *
     * @param localInputFile  本地上传文件
     * @param iconInputFile   图标上传文件
     * @param apkChangeEntity apk修改数据
     * @return 结果集
     */
    public ResultBean<PackResultBean> submitPack(APKChangeEntity apkChangeEntity,
                                                 MultipartFile localInputFile,
                                                 MultipartFile iconInputFile) {
        // 新建结果集
        ResultBean<PackResultBean> resultBean = new ResultBean<>();

        String fileSource = apkChangeEntity.getApkChangeFileSource(); // 母包来源

        // 开始时间
        long mStartTime = System.currentTimeMillis();
        apkChangeEntity.setApkChangeStartDate(new Timestamp(mStartTime));

        boolean result;
        // 通用处理
        result = commonCheckData(resultBean, apkChangeEntity, iconInputFile); // 通用检查数据
        if (result) {

            String inputPath = generateInputFilePath(ResPathConfig.buildSystemLocalPath(
                    ResPathConfig.RESOURCE_INPUT_COMMON), mStartTime); // 输入路径
            String inputFrontFileName = generateInputFileName(apkChangeEntity.getUser().getUsername(),
                    mStartTime); // 输入的文件名

            result = commonHandlerData(resultBean, apkChangeEntity, iconInputFile,
                    inputPath, inputFrontFileName); // 通用数据处理

            if (result) {

                // 分开处理
                if (fileSource.equals(FILE_SOURCE_FROM_LOCAL)) { // 母包来源选本地上传处理
                    result = localHandlerData(resultBean, apkChangeEntity,
                            localInputFile, inputPath, inputFrontFileName);
                } else if (fileSource.equals(FILE_SOURCE_FROM_SERVER)) { // 母包来源选服务器处理
                    result = serverHandlerData(resultBean, apkChangeEntity, inputPath, inputFrontFileName);
                } else {
                    result = false;
                    setResultBeanError(resultBean, "母包来源选择有误");
                }

                if (result) {
                    // 开始打包
                    startPack(resultBean, apkChangeEntity);
                }

            }

        }

        // 删除上传的文件
        removeInputFile(apkChangeEntity);
        // 返回结果集
        return resultBean;
    }

    /**
     * 通用数据检查
     *
     * @param resultBean      结果集
     * @param apkChangeEntity 数据对象
     * @param iconInputFile   修改图标文件
     * @return 是否通过
     */
    private boolean commonCheckData(ResultBean<PackResultBean> resultBean,
                                    APKChangeEntity apkChangeEntity,
                                    MultipartFile iconInputFile) {
        // 判断是否更改图标
        if (fileIsEmpty(iconInputFile)) {
            apkChangeEntity.setApkChangeIcon(BaseEntity.FLAG_BOOLEAN_TRUE);
        } else {
            apkChangeEntity.setApkChangeIcon(BaseEntity.FLAG_BOOLEAN_FALSE);
        }

        // 修改项目全为空
        if (!StringUtils.isNotEmpty(apkChangeEntity.getApkChangeName())
                && !StringUtils.isNotEmpty(apkChangeEntity.getApkChangePackage())
                && !StringUtils.isNotEmpty(apkChangeEntity.getApkChangeVersionName())
                && !StringUtils.isNotEmpty(apkChangeEntity.getApkChangeVersionNo())
                && !StringUtils.isNotEmpty(apkChangeEntity.getApkChangeMdId())
                && !StringUtils.isNotEmpty(apkChangeEntity.getApkChangeGameId())
                && !StringUtils.isNotEmpty(apkChangeEntity.getApkChangeCchId())
                && apkChangeEntity.getApkChangeIcon() == BaseEntity.FLAG_BOOLEAN_FALSE) {
            setResultBean(resultBean, false, "修改项目全为空");
            return false;
        }

        return true;
    }

    /**
     * 通用数据处理
     *
     * @param resultBean         结果集
     * @param apkChangeEntity    数据对象
     * @param iconInputFile      修改图标文件
     * @param inputPath          路径
     * @param inputFrontFileName 文件前缀名
     * @return 是否通过
     */
    private boolean commonHandlerData(ResultBean<PackResultBean> resultBean,
                                      APKChangeEntity apkChangeEntity,
                                      MultipartFile iconInputFile,
                                      String inputPath,
                                      String inputFrontFileName) {
        if (apkChangeEntity.getApkChangeIcon() == BaseEntity.FLAG_BOOLEAN_TRUE) {
            // 进行apk图标数据的配置
            String iconFileName = getFileName(iconInputFile);
            if (iconFileName.endsWith(".png")) {
                File iconTransferFile = fileTransferTo(iconInputFile, inputPath,
                        inputFrontFileName + ".png"); // 移动图标文件
                apkChangeEntity.setOtherParamIconFile(iconTransferFile);
            } else { // 图标格式不符合
                setResultBean(resultBean, false, "图标只支持png格式");
                return false;
            }
        }

        return true;
    }

    /**
     * 本地上传数据处理
     *
     * @param resultBean      结果集
     * @param localInputFile  文件数组
     * @param apkChangeEntity apk修改数据对象
     * @return 检查是否通过
     */
    private boolean localHandlerData(ResultBean<PackResultBean> resultBean,
                                     APKChangeEntity apkChangeEntity,
                                     MultipartFile localInputFile,
                                     String inputPath,
                                     String inputFrontFileName) {

        String cpFileName; // 母包文件名

        if (localInputFile == null || (cpFileName = getFileName(localInputFile)) == null) { // 上传的母包为空
            setResultBean(resultBean, false, "上传的母包为空");
            return false;
        }
        if (!cpFileName.endsWith(".apk")) { // 母包格式不符
            setResultBean(resultBean, false, "母包只支持apk文件");
            return false;
        }

        // 把上传的apk文件转移到特定上传目录中
        File inputFile = fileTransferTo(localInputFile, inputPath,
                inputFrontFileName + ".apk"); // 移动母包文件


        // 读取游戏信息
        GameEntity daoEntity = null;
        // 读取游戏id
        String gameId = Apktools.getGameSdkGid(inputFile.getAbsolutePath());
        if (StringUtils.isNotEmpty(gameId)) {
            apkChangeEntity.getGame().setGameId(gameId);

            daoEntity = gameDao.get(gameId);
        }

        // 读取游戏名
        String gameName = "";
        if (daoEntity == null) {
            // 从apk中读取游戏名
            String gameNameFromApk = Apktools.getAppName(inputFile.getAbsolutePath());
            if (gameNameFromApk != null) {
                gameName = gameNameFromApk;
            }
        } else {
            // 从数据库中读取游戏名
            gameName = daoEntity.getGameName();
        }
        apkChangeEntity.getGame().setGameName(gameName);

        // 把转移后的文件储存在对象中
        apkChangeEntity.setOtherParamCPFile(inputFile);

        return true;
    }

    /**
     * 母包来源选服务器的数据处理
     *
     * @param resultBean         结果集
     * @param apkChangeEntity    数据对象
     * @param inputPath          文件路径
     * @param inputFrontFileName 文件前缀名
     * @return 是否处理成功
     */
    private boolean serverHandlerData(ResultBean<PackResultBean> resultBean,
                                      APKChangeEntity apkChangeEntity,
                                      String inputPath,
                                      String inputFrontFileName) {
        // 获取所选游戏的信息
        GameEntity daoEntity = gameDao.getWithVer(apkChangeEntity.getGame().getId() + "");
        if (daoEntity == null || daoEntity.getStatus() == BaseEntity.FLAG_STATUS_DEL) {
            setResultBeanError(resultBean, "找不到此游戏");
            return false;
        }
        apkChangeEntity.setGame(daoEntity); // 把游戏信息存储到对象中

        // 获取游戏母包路径
        String gameFilePath = ResPathConfig.RESOURCE_FRONT +
                daoEntity.getVer().getGameVerUpSJoysPath();
        gameFilePath = ResPathConfig.buildSystemLocalPath(gameFilePath);
        // 包装成文件类
        File gameFile = new File(gameFilePath);
        if (!gameFile.exists()) {
            setResultBeanError(resultBean, "找不到此游戏的母包");
            return false;
        }
        sendLog("母包路径: " + gameFile.getAbsolutePath() + " 母包名: " + gameFile.getName());

        // 复制到input目录
        File targetFile = new File(inputPath + File.separator + inputFrontFileName + ".apk");
        sendLog("复制到: " + targetFile.getAbsolutePath());

        if (!FileUtil.copyFile(gameFile, targetFile)) {
            setResultBeanError(resultBean, "复制母包到input目录时失败");
            return false;
        }

        // 把转移后的文件储存在对象中
        apkChangeEntity.setOtherParamCPFile(targetFile);

        return true;
    }


    /**
     * 开始进行打包操作
     *
     * @param resultBean      结果集
     * @param apkChangeEntity apk修改数据对象
     */
    private void startPack(ResultBean<PackResultBean> resultBean, APKChangeEntity apkChangeEntity) {
        sendLog("执行开始打包方法");

        // 生成打包结果集
        PackResultBean packResultBean = generatePackResultBean(ResPathConfig.RELATIVE_PATH_RESOURCE_PACK_OTHER,
                apkChangeEntity.getUser().getUsername(), apkChangeEntity.getApkChangeStartDate().getTime());
        FileUtil.createDir(packResultBean.getLocalDownloadDirFile()); // 创建目录
        sendLog("生成的打包结果集对象 " + packResultBean);

        // 拼接cmd
//        String cmdCommend = getCmdWithPacktoolsJar(PACK_TOOLS_JAR_ZCOMMMON)+"  ";
        String cmdCommend = getCommandFromPackTools(PACK_TOOLS_NAME_BATSH_PACK_COMMON, CMD_FILE_TYPE_BAT_OR_SH) +"  ";
        cmdCommend += wrapCommendParam(apkChangeEntity) + " -o " + packResultBean.getLocalDownloadDirFile().getAbsolutePath();
        sendLog("拼接后的cmd命令 " + cmdCommend);

        // 执行调用可执行文件, 进行打包
        try {
            ResultBean<String> runtimeResultBean = quickExec(cmdCommend);
            packResultBean.setPackLogs(runtimeResultBean.getMessage());
            sendLog("cmd执行结果 " + runtimeResultBean);
            if (runtimeResultBean.isSuccess()) {
                sendLog("cmd执行成功");

                boolean packResult = handlePackResult(packResultBean); // 处理打包结果
                sendLog("处理打包结果 " + packResult);
                if (packResult) { // 成功打包
                    sendLog("打包成功");
                    setResultBean(resultBean, true, "", packResultBean);

                    // 打包成功生成结束时间
                    apkChangeEntity.setApkChangeEndDate(new Timestamp(System.currentTimeMillis()));
                    apkChangeEntity.setApkChangeOutput(getDownloadFilePath(packResultBean)); // 获取输出文件地址

                } else { // 打包失败
                    sendLog("cmd打包执行完成，但找不到输出文件，请查看打包过程日志");
                    setResultBean(resultBean, false,
                            "cmd打包执行完成，但找不到输出文件, 请联系技术人员解决", packResultBean);
                }
            } else { // 打包失败
                sendLog("cmd打包执行过程中出错, 请联系技术人员解决");
                setResultBean(resultBean, false,
                        "cmd打包执行过程中出错, 请联系技术人员解决", packResultBean);
            }
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
            sendLog("执行CMD异常, 请联系技术人员解决");
            setResultBean(resultBean, false,
                    "执行cmd命令抛出异常, 请联系技术人员解决", packResultBean);
        }

        // 插入打包数据
        copyInputFileToResource(packResultBean, apkChangeEntity);
        apkChangeEntity.setApkChangeResultMsg(resultBean.getMessage());
        apkChangeDao.insert(apkChangeEntity);
    }

    /**
     * 包装命令行参数
     *
     * @param apkChangeEntity apk修改数据对象
     * @return 包装结果字符串
     */
    private String wrapCommendParam(APKChangeEntity apkChangeEntity) {
        sendLog("执行包装命令参数方法 " + apkChangeEntity);
        String commendParam = apkChangeEntity.getOtherParamCPFile().getAbsolutePath(); // 母包地址
        if (StringUtils.isNotEmpty(apkChangeEntity.getApkChangeName())) { // 修改名
            commendParam += " -an " + apkChangeEntity.getApkChangeName();
        }
        if (StringUtils.isNotEmpty(apkChangeEntity.getApkChangePackage())) { // 修改包名
            commendParam += " -pn " + apkChangeEntity.getApkChangePackage();
        }
        if (StringUtils.isNotEmpty(apkChangeEntity.getApkChangeVersionNo())) { // 修改版本号
            commendParam += " -vc " + apkChangeEntity.getApkChangeVersionNo();
        }
        if (StringUtils.isNotEmpty(apkChangeEntity.getApkChangeVersionName())) { // 修改版本名
            commendParam += " -vn " + apkChangeEntity.getApkChangeVersionName();
        }
        if (apkChangeEntity.getApkChangeIcon() == BaseEntity.FLAG_BOOLEAN_TRUE) { // 修改图标
            commendParam += " -i " + apkChangeEntity.getOtherParamIconFile().getAbsolutePath();
        }
        if (StringUtils.isNotEmpty(apkChangeEntity.getApkChangeGameId())) { // 修改游戏id
            commendParam += " -gid " + apkChangeEntity.getApkChangeGameId();
        }
        if (StringUtils.isNotEmpty(apkChangeEntity.getApkChangeCchId())) { // 修改渠道id
            commendParam += " -pid " + apkChangeEntity.getApkChangeCchId();
        }
        if (StringUtils.isNotEmpty(apkChangeEntity.getApkChangeMdId())) { // 修改推广包id
            commendParam += " -mid " + apkChangeEntity.getApkChangeMdId();
        }
        return commendParam;
    }


    /**
     * 把母包复制到资源目录中
     *
     * @param packResultBean  打包结果集
     * @param apkChangeEntity 数据对象
     */
    private void copyInputFileToResource(PackResultBean packResultBean, APKChangeEntity apkChangeEntity) {
        // 母包路径
        File inputFile = apkChangeEntity.getOtherParamCPFile(); // 母包文件
        String inputFileName = inputFile.getName();  // 母包文件名

        // 目标路径
        String targetFilePath =
                packResultBean.getLocalDownloadDirFile().getAbsolutePath()
                        + File.separator + inputFileName;

        // 复制
        FileUtil.copyFile(inputFile, new File(targetFilePath));
        sendLog("母包复制到资源目录: 原 " + inputFile.getAbsolutePath() + " 目标 " + targetFilePath);


        // 把虚拟路径放入
        String inputFileVirtualPath = packResultBean.getVirtualDownloadDir()
                + File.separator + inputFileName; // 母包虚拟路径
        apkChangeEntity.setApkChangeInput(inputFileVirtualPath);
    }

    /**
     * 删除上传目录中的文件
     *
     * @param apkChangeEntity apk修改数据对象
     */
    private void removeInputFile(APKChangeEntity apkChangeEntity) {
        // 删除apk文件
        if (apkChangeEntity.getOtherParamCPFile() != null) {
            FileUtil.delDir(apkChangeEntity.getOtherParamCPFile());
        }
        // 删除图标文件
        if (apkChangeEntity.getOtherParamIconFile() != null) {
            FileUtil.delDir(apkChangeEntity.getOtherParamIconFile());
        }
    }

}
