package com.starjoys.tool.packonline.modules.andrpack.service;

import com.starjoys.tool.packonline.bean.ConsoleLineBean;
import com.starjoys.tool.packonline.bean.PackResultBean;
import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BasePackService;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.common.config.ResPathConfig;
import com.starjoys.tool.packonline.modules.packmanager.dao.GameDao;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameEntity;
import com.starjoys.tool.packonline.modules.packrecord.dao.MdRecordDao;
import com.starjoys.tool.packonline.modules.packrecord.entity.MdRecordEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserGroupEntity;
import com.starjoys.tool.packonline.utils.Apktools;
import com.starjoys.tool.packonline.utils.FileUtil;
import com.starjoys.tool.packonline.utils.RuntimeUtils;
import com.starjoys.tool.packonline.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.sql.Timestamp;
import java.util.List;

/**
 * 推广包打包业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/13
 */

@Service
public class MdPackService extends BasePackService {

    @Resource
    private MdRecordDao mdRecordDao;

    @Resource
    private GameDao gameDao;

    /**
     * 开始打包业务逻辑
     *
     * @param uploadFile     上传的文件
     * @param mdRecordEntity 推广包打包记录对象
     * @param fileSource     母包来源
     * @return 结果集
     */
    public ResultBean<PackResultBean> startPack(MdRecordEntity mdRecordEntity,
                                                MultipartFile uploadFile,
                                                String fileSource,
                                                UserGroupEntity userGroupEntity) {
        sendLog("开始打包业务逻辑");

        // 获取数据
        ResultBean<PackResultBean> resultBean = new ResultBean<>(); // 结果集
        String startNumStr = mdRecordEntity.getMdRecordStart(); // 开始标识
        String endNumStr = mdRecordEntity.getMdRecordEnd(); // 结束标识
        String username = mdRecordEntity.getUser().getUsername(); // 用户名, 保存路径需要
        long createTime = System.currentTimeMillis(); // 开始时间
        PackResultBean packResultBean; // 打包结果信息类

        if (!GlobalConfig.IS_OWN_COMPANY_PUBLISH && FILE_SOURCE_FROM_SERVER.equals(fileSource)) {
            setResultBean(resultBean, false, "只支持本地上传");
            return resultBean;
        }

        // 判断数据
        if (!StringUtils.isNotEmpty(startNumStr)) {
            sendLog("开始标识为空");
            setResultBean(resultBean, false, "开始标识不能为空");
        } else {
            int startNum; // 开始标识数字
            int endNum = 0; // 结束标识数字
            int packNum; // 打包个数

            try {
                // 把字符串标识转换为数字标识, 来计算
                startNum = Integer.parseInt(startNumStr);
                if (StringUtils.isNotEmpty(endNumStr)) {
                    endNum = Integer.parseInt(endNumStr);
                    packNum = endNum - startNum + 1; // 通过结束标识和开始标识计算出打包个数
                } else {
                    packNum = 1; // 当没有结束标识时, 意味只打一个包
                }

                if ((endNum == 0 || endNum >= startNum) && (endNum == 0 || packNum <= GlobalConfig.PACK_MD_MAX_NUM)) {

                    if (startNum >= 10000 && startNum <= 1000000 && (endNum == 0 || endNum >= 10000)
                            && endNum <= 1000000) { // 起始标识与结束标识都大于10000

                        // 限制媒体id, 防止填写错误
                        int companyId = userGroupEntity.getCompany().getCompanyId();
                        if (companyId == 1) {
                            if (!((startNum >= 10005 && startNum <= 199999) && (endNum >= 10005 && endNum <= 199999))) {
                                setResultBeanError(resultBean, "星趣媒体id从10005-199999");
                                return resultBean;
                            }
                        } else if (companyId == 2) {
                            if (!((startNum >= 200005 && startNum <= 299999) && (endNum >= 200005 && endNum <= 299999))) {
                                setResultBeanError(resultBean, "天拓媒体id从200005-299999");
                                return resultBean;
                            }
                        } else {
                            setResultBeanError(resultBean, "识别不了此帐号的公司id，请找技术人员配置");
                            return resultBean;
                        }

                        // 结束标识为0 或 大于起始标识时 直接打包
                        // 最多只能打50个包

                        // 转移文件到资源文件的input目录
                        String transferToPath = generateInputFilePath(ResPathConfig.buildSystemLocalPath(
                                ResPathConfig.RESOURCE_INPUT_MD), createTime); // 获取上传文件的转移目录
                        String newFrontFileName = generateInputFileName(username, createTime);

                        // 母包来源分开处理
                        boolean handlerResult;
                        if (fileSource.equals(BasePackService.FILE_SOURCE_FROM_LOCAL)) {
                            handlerResult = localHandlerData(resultBean, mdRecordEntity,
                                    uploadFile, transferToPath, newFrontFileName);
                        } else if (fileSource.equals(BasePackService.FILE_SOURCE_FROM_SERVER)) {
                            handlerResult = serverHandlerData(resultBean, mdRecordEntity,
                                    transferToPath, newFrontFileName);
                        } else {
                            handlerResult = false;
                            setResultBeanError(resultBean, "");
                        }

                        if (handlerResult) { // 母包来源处理成功

                            // 生成打包结果信息类, 并放入结果集中
                            packResultBean = generatePackResultBean(ResPathConfig.RELATIVE_PATH_RESOURCE_PACK_MAIN,
                                    username, createTime);
                            resultBean.setRows(packResultBean);

                            File apkInputFile = mdRecordEntity.getTransferInputFile(); // apk转移后的文件

                            try {

                                // ***************************开始执行打包过程****************************************
                                // 打包记录添加打包个数与开始时间
                                mdRecordEntity.setMdRecordNum(packNum);
                                mdRecordEntity.setMdRecordStartDate(new Timestamp(createTime));

                                // 获取打包工具路径, 并拼接cmd命令行字符串
//                                String cmdCommend = getCmdWithPacktoolsJar(PACK_TOOLS_JAR_ZPID)
                                String cmdCommend = getCommandFromPackTools(PACK_TOOLS_NAME_BATSH_PACK_MID, CMD_FILE_TYPE_BAT_OR_SH)
                                        + apkInputFile.getAbsolutePath(); // 打包工具路径与apk文件路径拼接
                                if (endNum == 0) {
                                    cmdCommend = cmdCommend + " " + startNumStr + " " + startNumStr; // 只拼接开始标识
                                } else {
                                    cmdCommend = cmdCommend + " " + startNumStr + " " + endNumStr; // 拼接开始标识与结束标识
                                }
                                cmdCommend = cmdCommend + " " + packResultBean.getLocalDownloadDirFile().getAbsolutePath(); // 本地存储地址的绝对路径拼接到命令中

                                // 调用cmd进行打包
                                sendLog("开始调用cmd打包 cmdCommend: " + cmdCommend + " oriPath:"
                                        + apkInputFile.getAbsolutePath());
                                ResultBean<String> runtimeResult = quickExec(cmdCommend);
                                // 调用获取控制台的打包日志
                                packResultBean.setPackLogs(runtimeResult.getMessage()); // 存储控制台打包日志

                                sendLog("cmd结果集 " + runtimeResult);

                                // cmd执行结束, 进行结果判断
                                if (runtimeResult.isSuccess()) { // cmd执行正常结束
                                    // 获取apk路径, 并判断打包的结果 String consoleApkPath = getApkPathByConsoleLogs(lineList);
                                    boolean handleResult = handlePackResult(packResultBean); // 下载地址
                                    if (handleResult) { // apk路径获取成功
                                        // 返回控制台日志以及拼接后的apk路径
                                        setResultBean(resultBean, true, "", packResultBean);
                                        sendLog("成功打包!!!");

                                        // 成功打包会添加结束时间
                                        mdRecordEntity.setMdRecordEndDate(new Timestamp(System.currentTimeMillis())); // 添加打包结束时间
                                        mdRecordEntity.setMdRecordOutput(getDownloadFilePath(packResultBean)); // 获取输出文件地址

                                    } else { // apk路径获取失败, 意味结果失败
                                        setResultBean(resultBean, false,
                                                "cmd执行正常, 但找不到生成的包，请联系技术人员解决", packResultBean);
                                    }

                                } else { // cmd异常结束
                                    setResultBean(resultBean, false, "cmd异常结束，请联系技术人员解决", packResultBean);
                                }

                                // ******************************执行完打包过程********************************************

                            } catch (Exception e) { // 打包出错
                                e.printStackTrace();
                                sendLog("cmd 打包失败");
                                setResultBean(resultBean, false, "打包过程出错，请联系技术人员解决");
                            }

                            // 插入打包记录
                            mdRecordEntity.setMdRecordFileSource(fileSource); // 设置母包来源
                            mdRecordEntity.setMdRecordResultMsg(resultBean.getMessage()); // 添加打包记录结果信息
                            mdRecordDao.insert(mdRecordEntity); // 调用增加打包记录的业务逻辑方法

                        }

                    } else { // 失败, 因为起始标识与结束标识必须大于10000
                        setResultBean(resultBean, false, "起始标识与结束标识必须在10000~1000000范围内");
                    }
                } else { // 失败,因为起始标识大于结束标识
                    setResultBean(resultBean, false, "起始标识不能大于结束标识，并且最多只能同时打50个推广包");
                }

            } catch (NumberFormatException ex) { // 字符串转数字出错
                ex.printStackTrace();
                sendLog("标识出现非数字字符");
                setResultBean(resultBean, false, "标识出现非数字字符");
            } finally {
                // 处理完后删除上传文件
                if (mdRecordEntity.getTransferInputFile() != null) {
                    FileUtil.delDir(mdRecordEntity.getTransferInputFile());
                }
            }

        }

        return resultBean;
    }


    /**
     * 通过控制台日志, 获取apk路径
     *
     * @param lineList 控制台行列表
     * @return apk路径
     */
    @Deprecated
    private String getApkPathByConsoleLogs(List<String> lineList) {
        if (lineList != null && lineList.size() != 0) {
            // 获取最后一行, 验证是否有成功标识
            int lastNum = lineList.size() - 1;
            ConsoleLineBean lastLineBean = RuntimeUtils.unwarpConsoleLine(lineList.get(lastNum));
            sendLog("最后一行日志 " + lastLineBean);
            if (lastLineBean.getMessage() != null && lastLineBean.getMessage().equals(RuntimeUtils.SUCCESS_SIGN)) { // 成功
                // 获取倒数第二行日志, 从中获取生成的apk相对路径
                ConsoleLineBean lastSecondLineBean = RuntimeUtils.unwarpConsoleLine(lineList.get(lastNum - 1));
                sendLog("倒数第二行日志 " + lastSecondLineBean);
                return File.separator + lastSecondLineBean.getMessage().split(RuntimeUtils.FILE_PATH_DIVIDE)[1];
            }
        }
        return null;
    }

    /**
     * 本地上传数据处理
     *
     * @param resultBean     结果集
     * @param localInputFile 文件数组
     * @param mdRecordEntity apk修改数据对象
     * @return 检查是否通过
     */
    private boolean localHandlerData(ResultBean<PackResultBean> resultBean,
                                     MdRecordEntity mdRecordEntity,
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
            mdRecordEntity.getGame().setGameId(gameId);

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
        mdRecordEntity.getGame().setGameName(gameName);


        // 把转移后的文件储存在对象中
        mdRecordEntity.setTransferInputFile(inputFile);

        return true;
    }


    /**
     * 母包来源选服务器的数据处理
     *
     * @param resultBean         结果集
     * @param mdRecordEntity     数据对象
     * @param inputPath          文件路径
     * @param inputFrontFileName 文件前缀名
     * @return 是否处理成功
     */
    private boolean serverHandlerData(ResultBean<PackResultBean> resultBean,
                                      MdRecordEntity mdRecordEntity,
                                      String inputPath,
                                      String inputFrontFileName) {
        // 获取所选游戏的信息
        GameEntity daoEntity = gameDao.getWithVer(mdRecordEntity.getGame().getId() + "");
        if (daoEntity == null || daoEntity.getStatus() == BaseEntity.FLAG_STATUS_DEL) {
            setResultBeanError(resultBean, "找不到此游戏");
            return false;
        }
        mdRecordEntity.setGame(daoEntity); // 把游戏信息存储到对象中

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
        mdRecordEntity.setTransferInputFile(targetFile);

        return true;
    }


}
