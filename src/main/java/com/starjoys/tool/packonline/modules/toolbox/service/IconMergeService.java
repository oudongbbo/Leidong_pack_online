package com.starjoys.tool.packonline.modules.toolbox.service;

import com.starjoys.tool.packonline.bean.PackResultBean;
import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BasePackService;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.common.config.ResPathConfig;
import com.starjoys.tool.packonline.modules.packmanager.dao.ChannelDao;
import com.starjoys.tool.packonline.modules.packmanager.dao.GameDao;
import com.starjoys.tool.packonline.modules.packmanager.entity.ChannelEntity;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameEntity;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameParamEntity;
import com.starjoys.tool.packonline.modules.toolboxrecord.dao.IconMergeRecordDao;
import com.starjoys.tool.packonline.modules.toolboxrecord.entity.IconMergeRecordEntity;
import com.starjoys.tool.packonline.utils.FileUtil;
import com.starjoys.tool.packonline.utils.ImageUtils;
import com.starjoys.tool.packonline.utils.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;

/**
 * 图标合并业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/22
 */

@Service
@Scope("prototype")
public class IconMergeService extends BasePackService {

    @Resource
    private ChannelDao channelDao;

    @Resource
    private GameDao gameDao;

    @Resource
    private IconMergeRecordDao iconMergeRecordDao;

    /** 结果集 **/
    private ResultBean<PackResultBean> mResultBean;

    /** 合并图标数据对象 **/
    private IconMergeRecordEntity mIconMergeEntity;

    /** 原始图标文件名 **/
    private String mOriIconFileName;
    /** 原始图标文件名后缀 **/
    private String mOriIconFileEnd;

    /** 开始时间 **/
    private long mStartTime;

    /** 输入目录中的图标文件 **/
    private File mInputIconFile;

    /** 是否选择了游戏 **/
    private boolean mHasGame;


    /**
     * 打包操作全过程
     *
     * @return 结果集
     */
    public ResultBean<PackResultBean> submitPack(IconMergeRecordEntity iconMergeRecordEntity) {
        sendLog("提交打包请求 " + iconMergeRecordEntity);
        // 新建结果集
        mResultBean = new ResultBean<>();
        mIconMergeEntity = iconMergeRecordEntity;

        // 检查数据
        if (checkData()) {
            mStartTime = System.currentTimeMillis();

            // 打包
            startPack();

            // 删除上传图标文件
            removeInputFile();
        }

        return mResultBean;
    }

    /**
     * 检查数据
     *
     * @return 是否成功
     */
    private boolean checkData() {
        // 整个数据对象判断
        if (mIconMergeEntity == null) {
            setResultBeanError(mResultBean, "提交的数据不能为空");
            return false;
        }

        // 渠道判断
        if (mIconMergeEntity.getCch() == null) {
            setResultBeanError(mResultBean, "没有选择渠道");
            return false;
        }
        ChannelEntity cchDaoEntity = channelDao.get(mIconMergeEntity.getCch().getId() + "");
        if (cchDaoEntity == null || cchDaoEntity.getStatus() == BaseEntity.FLAG_STATUS_DEL) {
            setResultBeanError(mResultBean, "选择的渠道不存在");
            return false;
        }
        // 放入从数据库中取出的渠道信息
        mIconMergeEntity.setCch(cchDaoEntity);

        // 角标方向判断
        String direction = mIconMergeEntity.getIcMergeRecordDirection();
        if (!StringUtils.isNotEmpty(direction)) {
            setResultBeanError(mResultBean, "没有选择渠道角标方向");
            return false;
        }

        // 上传文件判断
        mOriIconFileName = getFileName(mIconMergeEntity.getIconFile());
        if (mOriIconFileName == null) {
            setResultBeanError(mResultBean, "游戏图标不能为空");
            return false;
        }
        if (!mOriIconFileName.endsWith(".png")) {
            setResultBeanError(mResultBean, "游戏图标只支持png图片格式");
            return false;
        }
        // 后缀
        mOriIconFileEnd = mOriIconFileName.substring(mOriIconFileName.indexOf('.'));

        // 游戏判断
        GameEntity gameEntity = mIconMergeEntity.getGame();
        if (gameEntity != null && gameEntity.getId() > 0) { // 如果有指定游戏, 将从数据库中获取游戏信息
            GameEntity gameDaoEntity = gameDao.get(gameEntity.getId() + "");
            if (gameDaoEntity == null) {
                setResultBeanError(mResultBean, "找不到此游戏");
                return false;
            }
            // 放入从数据库中取出的游戏信息
            mHasGame = true; // 标记为有选择游戏的
            mIconMergeEntity.setGame(gameDaoEntity);
        }

        // 判断输出大小
        if (mIconMergeEntity.getZoomSize() <= 0) {
            setResultBeanError(mResultBean, "合并后图标的宽高必须大于0");
            return false;
        }

        return true;
    }

    /**
     * 开始进行打包操作
     */
    private void startPack() {
        sendLog("执行开始打包方法");

        // 转移图标文件
        mInputIconFile = transferIconFile();
        if (mInputIconFile == null) {
            setResultBeanError(mResultBean, "图标文件转移失败");
            return;
        }
        if (!ImageUtils.isFitDimension(mInputIconFile, GlobalConfig.ICON_IMAGE_SIZE)) {
            setResultBeanError(mResultBean, "图标文件限制宽高为512");
            return;
        }
        sendLog("把文件转移到input目录中 " + mInputIconFile);

        // 获取角标文件路径
        String subscriptFilePath = getSubscriptFilePath();
        if (subscriptFilePath == null) {
            setResultBeanError(mResultBean, "找不到此方向角标文件");
            return;
        }
        sendLog("角标路径 " + subscriptFilePath);

        // 合并后的路径结果集
        PackResultBean packResultBean = generatePackResultBean(ResPathConfig.RELATIVE_PATH_RESOURCE_PACK_OTHER,
                mIconMergeEntity.getUs().getUsername(), mStartTime);
        FileUtil.createDir(packResultBean.getLocalDownloadDirFile()); // 创建目录
        mResultBean.setRows(packResultBean); // 把打包结果集放到总的结果集中

        // 输出的目录
        String iconLocalOutput = packResultBean.getLocalDownloadDirFile().getAbsolutePath() + File.separator + "icon.png";

        // 拼接cmd   zIcon.bat 指令 图标路径 角标路径 输出路径
        String cmdCommend = getCommandFromPackTools(PACK_TOOLS_NAME_BATSH_PACK_ICON, CMD_FILE_TYPE_BAT_OR_SH);
        cmdCommend += " merge " + mInputIconFile.getAbsolutePath() + " " + subscriptFilePath
                + " " + iconLocalOutput;
        sendLog("cmd命令 " + cmdCommend);

        try {
            // 开始打包过程
            ResultBean<String> runtimeResultBean = quickExec(cmdCommend);
            sendLog("cmd执行结果 " + runtimeResultBean);

            // 设置打包log数据
            packResultBean.setPackLogs(runtimeResultBean.getMessage());

            if (runtimeResultBean.isSuccess()) {
                sendLog("cmd执行成功");

                boolean packResult = handlePackResult(packResultBean); // 处理打包结果
                if (packResult) { // 成功
                    sendLog("打包成功");
                    setResultBean(mResultBean, true, "打包成功");

                    // 设置成功结果数据
                    mIconMergeEntity.setIcMergeRecordEndDate(new Timestamp(System.currentTimeMillis()));
                    mIconMergeEntity.setIcMergeRecordOutput(getDownloadFilePath(packResultBean));

                    // 处理图片缩放
                    if (mIconMergeEntity.getZoomSize() != GlobalConfig.ICON_IMAGE_SIZE) {
                        handleImageZoom(iconLocalOutput);
                    }

                    // 处理图标结果
                    handleIconResult(iconLocalOutput);

                } else { // 打包失败
                    sendLog("cmd打包执行完成，但找不到输出文件，请查看打包过程日志");
                    setResultBeanError(mResultBean, "cmd打包执行完成，但找不到输出文件，请查看打包过程日志");
                }

            } else { // 打包失败
                sendLog("cmd打包执行过程中出错");
                setResultBeanError(mResultBean, "cmd打包执行过程中出错，请查看打包过程日志");
            }

        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
            sendLog("执行CMD异常");
            setResultBeanError(mResultBean, "执行cmd命令抛出异常");
        }

        // 设置开始时间和结果信息
        mIconMergeEntity.setIcMergeRecordStartDate(new Timestamp(mStartTime));
        if (!mResultBean.isSuccess()) {
            mIconMergeEntity.setIcMergeRecordMsgResult(mResultBean.getMessage());
        }
        iconMergeRecordDao.insert(mIconMergeEntity);

    }

    /**
     * 转移图标文件
     *
     * @return 转移后的图标文件
     */
    private File transferIconFile() {
        // 把文件转移到input目录中
        String transferToPath = generateInputFilePath(ResPathConfig.buildSystemLocalPath(
                ResPathConfig.RESOURCE_INPUT_ICON_MERGE), mStartTime); // 获取上传文件的转移目录
        String inputFileName = generateInputFileName(mIconMergeEntity.getUs().getUsername(), mStartTime);
        return fileTransferTo(mIconMergeEntity.getIconFile(), transferToPath,
                inputFileName + mOriIconFileEnd);
    }

    /**
     * 获取角标文件路径
     *
     * @return 角标文件路径
     */
    private String getSubscriptFilePath() {
        // 角标方向
        String subscriptDirection = mIconMergeEntity.getIcMergeRecordDirection();
        // 角标父路径
        File subscriptPackPathFile = new File(
                ResPathConfig.buildSystemLocalPath(ResPathConfig.PACK_PLATFORM_ICONS_SUBSCRIPT)
                        + File.separator + mIconMergeEntity.getCch().getCchShortName());
        // 角标文件名
        String subscriptFileName = null;
        switch (subscriptDirection) {
            case "左上": {
                subscriptFileName = "leftTop";
                break;
            }
            case "右上": {
                subscriptFileName = "rightTop";
                break;
            }
            case "左下": {
                subscriptFileName = "leftBottom";
                break;
            }
            case "右下": {
                subscriptFileName = "rightBottom";
                break;
            }
        }

        if (subscriptFileName != null) {
            // 路径拼接   打包角标路径/角标方向名.png
            File subscriptFile = new File(subscriptPackPathFile.getAbsolutePath()
                    + File.separator + subscriptFileName + mOriIconFileEnd);
            if (subscriptFile.exists()) { // 存在, 返回路径
                return subscriptFile.getAbsolutePath();
            }
        }

        return null;
    }

    /**
     * 处理图片缩放
     * @param iconLocalOutput 合并后的图片输出地址
     */
    private void handleImageZoom(String iconLocalOutput) throws IOException, InterruptedException {
        // 拼接cmd   zIcon.bat 指令 图标路径 角标路径 输出路径
        String cmdCommend = getCommandFromPackTools(PACK_TOOLS_NAME_BATSH_PACK_ICON, CMD_FILE_TYPE_BAT_OR_SH);
        cmdCommend += " zoom " + mIconMergeEntity.getZoomSize() + " " + iconLocalOutput + " " + iconLocalOutput;
        sendLog("图片缩放cmd命令 " + cmdCommend);
        ResultBean<String> runtimeResult = quickExec(cmdCommend);
        sendLog(runtimeResult.getMessage());
    }

    /**
     * 处理图标的结果, 判断是否有选择游戏, 有的话自动复制到打包目录中
     *
     * @param iconLocalOutput 图标本地输出地址
     */
    private void handleIconResult(String iconLocalOutput) {
        if (mHasGame) {
            // 把图标文件复制到打包目录中
            GameParamEntity gameParamEntity = new GameParamEntity();
            gameParamEntity.setCch(mIconMergeEntity.getCch());
            gameParamEntity.setGame(mIconMergeEntity.getGame());
            File apkPackIconsPathFile = new File(wrapIconPackLocalPath(gameParamEntity,
                    ResPathConfig.PACK_PLATFORM_ICONS));

            FileUtil.createDir(apkPackIconsPathFile); // 创建目录
            boolean copyResult = FileUtil.copyFile(new File(iconLocalOutput),
                    new File(apkPackIconsPathFile, "icon.png")); // 复制到打包目录中
            sendLog("复制到打包目录中结果 " + copyResult + " 复制前地址 "
                    + iconLocalOutput + " 复制后地址 " + apkPackIconsPathFile.getAbsolutePath());

            // 删除下载地址, 有选择游戏时自动复制到对应的图标目录中
            mResultBean.getRows().setSingleApkFilePath(null);

            mResultBean.setMessage(mResultBean.getMessage() + "， 图标已成功复制到对应打包目录中");
        }
    }

    /**
     * 删除上传目录中的文件
     */
    private void removeInputFile() {
        // 删除图标文件
        if (mInputIconFile != null) {
            FileUtil.delDir(mInputIconFile);
        }
    }

}
