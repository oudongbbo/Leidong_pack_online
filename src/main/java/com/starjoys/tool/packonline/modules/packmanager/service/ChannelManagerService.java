package com.starjoys.tool.packonline.modules.packmanager.service;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.bean.ValidationResultBean;
import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.common.config.ResPathConfig;
import com.starjoys.tool.packonline.modules.packmanager.dao.ChannelDao;
import com.starjoys.tool.packonline.modules.packmanager.dao.ChannelVersionDao;
import com.starjoys.tool.packonline.modules.packmanager.entity.ChannelEntity;
import com.starjoys.tool.packonline.modules.packmanager.entity.ChannelVersionEntity;
import com.starjoys.tool.packonline.modules.packmanager.utils.GameParamUtils;
import com.starjoys.tool.packonline.utils.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.sql.Timestamp;
import java.util.List;

/**
 * 渠道管理业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/23
 */

@Service
public class ChannelManagerService extends BaseService implements IBaseManagerService<ChannelEntity> {

    @Resource
    private ChannelDao channelDao;

    @Resource
    private ChannelVersionDao channelVersionDao;

    @Override
    public ResultBean<List<ChannelEntity>> findAllData(ChannelEntity entity) {
        return null;
    }

    @Override
    public ResultBean<List<ChannelEntity>> findAllData() {
//        sendLog("接收到查找所有数据请求");
        ResultBean<List<ChannelEntity>> resultBean = new ResultBean<>();
        List<ChannelEntity> list = channelDao.findAllList();
        if (list != null) {
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i).getStatus() == BaseEntity.FLAG_STATUS_DEL) {
                    list.remove(i);
                    i--;
                }
            }
        }
        setResultBean(resultBean, true, "获取成功", list);
//        sendLog("查找结果 " + resultBean);
        return resultBean;
    }

    @Transactional(readOnly = true)
    @Override
    public ResultBean<List<ChannelEntity>> findDataByPage(ChannelEntity entity) {
//        sendLog("分页数据查询 " + entity);
        ResultBean<List<ChannelEntity>> resultBean = new ResultBean<>();
        List<ChannelEntity> channelList = channelDao.findListByPage(entity);
        resultBean.setTotal(channelDao.findCountByPage());
        setResultBean(resultBean, true, "成功获取所有数据", channelList);
        return resultBean;
    }

    @Override
    public ResultBean<ChannelEntity> addData(ChannelEntity entity) {
        sendLog("调用添加数据的方法 " + entity);
        ResultBean<ChannelEntity> resultBean = new ResultBean<>();
        if (validateData(resultBean, entity)) { // 通过验证
            int existResult = validateDataExist(entity);
            if (existResult != 0) { // 0代表已经存在并且未删除
                // 设置创建时间
                Timestamp currentTime = new Timestamp(System.currentTimeMillis());
                entity.setCchCreateDate(currentTime);
                entity.getVer().setCchVerUpDate(currentTime);
                // 处理上传文件
                if (handlerUploadFile(resultBean, entity)) { // 处理成功
                    handlerAddDao(resultBean, entity, existResult); // 调用插入操作
                }

                // 处理失败,删除刚上传的data包
                if (!resultBean.isSuccess()) {
                    // 删除此游戏临时的data包
                    removeDataFile(entity);
                }

            } else {
                setResultBeanError(resultBean, "当前渠道已存在");
            }
        }
        sendLog("添加数据的结果 " + resultBean);
        return resultBean;
    }

    @Override
    public ResultBean<ChannelEntity> updateData(ChannelEntity entity) {
        sendLog("调用编辑数据的方法 " + entity);
        ResultBean<ChannelEntity> resultBean = new ResultBean<>();
        if (validateData(resultBean, entity)) { // 通过验证
            int existResult = validateDataExist(entity);
            sendLog("检查存在结果 " + existResult);
            if (existResult != 2) { // 存在
                // 设置更新时间
                Timestamp currentTime = new Timestamp(System.currentTimeMillis());
                entity.getVer().setCchVerUpDate(currentTime);
                // 处理上传文件
                if (handlerUploadFile(resultBean, entity)) { // 处理成功
                    handlerUpdateDao(resultBean, entity); // 调用更新操作
                }

                // 处理失败,删除刚上传的data包
                if (!resultBean.isSuccess()) {
                    // 删除此游戏临时的data包
                    removeDataFile(entity);
                }

            } else { // 不存在
                setResultBeanError(resultBean, "当前渠道不存在");
            }
        }
        sendLog("编辑数据的结果 " + resultBean);
        return resultBean;
    }

    /**
     * 验证基础数据
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     * @return 是否验证成功
     */
    private boolean validateData(ResultBean<ChannelEntity> resultBean, ChannelEntity entity) {
        sendLog("调用验证数据方法 resultBean: " + resultBean + " entity: " + entity);

        // 对数据对象验证
        ValidationResultBean validationResultBean = ValidationUtils.validateEntity(entity);
        sendLog("检验bean的基本数据结果 " + validationResultBean);
        if (validationResultBean.isHasErrors()) { // 存在错误
            setResultBeanError(resultBean, ValidationUtils.getFirstErrorMessage(validationResultBean));
            return false;
        }

        // 渠道信息校验
        validationResultBean = ValidationUtils.validateEntity(entity.getVer());
        if (validationResultBean.isHasErrors()) {
            setResultBeanError(resultBean, ValidationUtils.getFirstErrorMessage(validationResultBean));
            return false;
        }

        // 对上传的文件进行验证
        String dataFileName = getFileName(entity.getCchDataFile());
        sendLog("获取到的data文件名 " + dataFileName);
        if (dataFileName == null) {
            setResultBeanError(resultBean, "渠道data必须上传");
            return false;
        }
        if (!dataFileName.endsWith(".zip")) {
            setResultBeanError(resultBean, "只支持zip压缩包格式");
            return false;
        }

        if (GameParamUtils.isIllegal(entity.getCchAllParam())) {
            setResultBeanError(resultBean, "全部参数中有非法字符");
            return false;
        }
        if (GameParamUtils.isIllegal(entity.getCchRequireParam())) {
            setResultBeanError(resultBean, "必填参数中有非法字符");
            return false;
        }

        return true;
    }

    /**
     * 验证数据是否存在
     *
     * @param entity 数据对象
     * @return 返回结果数字
     */
    private int validateDataExist(ChannelEntity entity) {
        sendLog("调用数据是否存在方法");
        // 判断是否存在
        ChannelEntity daoEntity = channelDao.getByCchId(entity.getCchId());
        sendLog("获取到的数据 " + daoEntity);
        if (daoEntity != null) {
            if (daoEntity.getStatus() == BaseEntity.FLAG_STATUS_ACTIVE) {
                return 0; // 存在而且未删除
            } else {
                return 1; // 存在但是删除了
            }
        }
        return 2; // 不存在
    }

    /**
     * 处理上传的文件
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     * @return 是否处理成功
     */
    private boolean handlerUploadFile(ResultBean<ChannelEntity> resultBean, ChannelEntity entity) {
        sendLog("调用处理上传文件方法 resultBean: " + resultBean + " entity: " + entity);

        // 处理渠道Data, 文件夹创建
        String dateStr = DateUtils.getDateStringFormat(entity.getVer().getCchVerUpDate().getTime());
        entity.getVer().setCchVerUpFDate(dateStr); // 把文件夹时间存放进去
        String dataSaveCommonPath = entity.getCchShortName() + File.separator + dateStr; // 本地与资源的通用路径
        String dataSavePath = ResPathConfig.RESOURCE_PLATFORM_DATA + File.separator + dataSaveCommonPath; // 组装解压路径字符串
        sendLog("组装data数据的保存路径 " + dataSavePath);
        File dataSavePathFile = new File(ResPathConfig.buildSystemLocalPath(dataSavePath)); // 组装文件解压的路径
        if (!dataSavePathFile.exists()) { // 创建文件夹
            dataSavePathFile.mkdirs();
        }

        // 移动data文件
        String oriFileName = getFileName(entity.getCchDataFile());
        String newDataFileName = entity.getCchShortName() + oriFileName.substring(oriFileName.lastIndexOf('.')); // data文件的新文件名
        File dataFile = fileTransferTo(entity.getCchDataFile(),
                dataSavePathFile.getAbsolutePath(), newDataFileName);
        sendLog("移动上传的data压缩文件后 " + dataFile);
        if (dataFile == null) {
            setResultBeanError(resultBean, "渠道data数据转移失败");
            return false;
        }
        // 把移动后的data文件存入, 方便失败的时候可以删除
        entity.setLocalResourceDataFile(dataFile);

        // 保存data文件资源路径
        String dataResourcePath = ResPathConfig.VIRTUAL_PATH_RESOURCE_PLATFORM_DATA
                + File.separator + dataSaveCommonPath; // 组装资源路径
        String dataFinalPath = dataResourcePath + File.separator + dataFile.getName();
        if (SystemUtils.isWindowsOS()) {
            dataFinalPath = dataFinalPath.replaceAll("\\\\", "/");
        }
        entity.getVer().setCchVerUpDataPath(dataFinalPath);

        // 解压data文件到临时目录
        File unRarTempPathFile = new File(
                ResPathConfig.buildSystemLocalPath(ResPathConfig.RESOURCE_INPUT_SDK_DATA)
                        + File.separator + dateStr);
        entity.setLocalDataTempDirFile(unRarTempPathFile);
        unRarTempPathFile.mkdirs();
        sendLog("解压文件的临时地址 " + unRarTempPathFile.getAbsolutePath());
        boolean unRarResult = ZipUtils.unRar(dataFile.getAbsolutePath(), unRarTempPathFile.getAbsolutePath()); // 解压文件
        if (!unRarResult) {
            setResultBeanError(resultBean, "渠道data解压失败");
            return false;
        }

        // 分析data的结构是否正确
        if (!analyseDataPath(resultBean, entity, unRarTempPathFile.getAbsolutePath())) { // 结构不正确
            return false;
        }

        // 把临时目录中的data移到打包目录中
        File platformSdksPathFile = new File(
                ResPathConfig.buildSystemLocalPath(ResPathConfig.PACK_PLATFORM_SDKS));
        sendLog("把临时文件复制到此地址 " + platformSdksPathFile.getAbsolutePath());
        // 先把上一次存在打包目录中的删除
        File lastSdkPathFile = new File(platformSdksPathFile, entity.getCchShortName()); // 上一次上传打包目录中的sdkData文件
        if (lastSdkPathFile.exists()) {
            sendLog(" 上一次上传打包目录中的sdkData已经存在, 把已有的删除");
            FileUtil.delDir(lastSdkPathFile);
        }
//        unRarPath.mkdirs(); // 删除后也要创建一次, 因此无论存不存在都要创建一次文件夹
        FileUtil.copyDirectiory(unRarTempPathFile.getAbsolutePath(), platformSdksPathFile.getAbsolutePath(), false); // 把临时文件夹中的渠道data复制到sdk中
        FileUtil.delDir(unRarTempPathFile); // 删除data临时目录

        // 处理渠道角标
        if (!handlerSubscript(resultBean, entity)) { // 处理失败
            return false;
        }

        // 处理plugin文件
        if (!handlerPlugin(resultBean, entity)) { // 处理失败
            return false;
        }

        return true;
    }

    /**
     * 处理plugin文件
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     * @return 处理是否成功
     */
    private boolean handlerPlugin(ResultBean<ChannelEntity> resultBean, ChannelEntity entity) {
        // 判断是否SDK自营渠道
        if (entity.getCchId() == null || !entity.getCchId().equals("100")) {
            return true;
        }

        // 判断文件是否存在, 是否符合格式
        String fileName;
        if ((fileName = getFileName(entity.getCchPluginFile())) == null) {
            setResultBeanError(resultBean, "SDK自营渠道必须上传plugin文件");
            return false;
        }
        if (!fileName.endsWith(".zip")) {
            setResultBeanError(resultBean, "plugin文件只支持zip压缩包格式");
            return false;
        }

        // 组装plugin压缩包的存放地址
        File pluginSavePathFile = new File(
                ResPathConfig.buildSystemLocalPath(ResPathConfig.RESOURCE_PLATFORM_PLUGIN)
                        + File.separator + entity.getVer().getCchVerUpFDate());
        FileUtil.createDir(pluginSavePathFile); // 创建文件夹
        sendLog("组装plugin压缩包的存放地址 " + pluginSavePathFile.getAbsolutePath());
        // 移动到存放地址, 并改名
        String pluginNewFileName = entity.getCchShortName() + fileName.substring(fileName.lastIndexOf('.'));
        File pluginSaveFile = fileTransferTo(entity.getCchPluginFile(), pluginSavePathFile.getAbsolutePath(),
                pluginNewFileName);
        if (pluginSaveFile == null || !pluginSaveFile.exists()) {
            setResultBeanError(resultBean, "渠道plugin文件转移失败");
            return false;
        }
        sendLog("移动到存放地址, 并改名 " + pluginSaveFile.getAbsolutePath());

        // 组装plugin压缩包里面文件的存放地址
        File pluginUnRarPathFile = new File(ResPathConfig.buildSystemLocalPath(ResPathConfig.PACK_PLATFORM_PLUGIN));
        if (pluginUnRarPathFile.exists()) {
            sendLog("已经存在文件, 把已有的删除");
            FileUtil.delDir(pluginUnRarPathFile);
        }
        FileUtil.createDir(pluginUnRarPathFile);
        sendLog("组装plugin压缩包里面文件的存放地址 " + pluginUnRarPathFile.getAbsolutePath());
        // 把plugin压缩包中的所有文件解压到对应打包目录plugin中
        boolean unRarResult = ZipUtils.unRar(pluginSaveFile.getAbsolutePath(), pluginUnRarPathFile.getAbsolutePath()); // 解压文件
        if (!unRarResult) {
            setResultBeanError(resultBean, "渠道plugin解压失败");
            return false;
        }

        return true;
    }


    /**
     * 处理角标
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     * @return 是否处理成功
     */
    private boolean handlerSubscript(ResultBean<ChannelEntity> resultBean, ChannelEntity entity) {
        String subLTFileName = getFileName(entity.getCchLTIconFile()); // 左上
        String subRTFileName = getFileName(entity.getCchRTIconFile()); // 右上
        String subLBFileName = getFileName(entity.getCchLBIconFile()); // 左下
        String subRBFileName = getFileName(entity.getCchRBIconFile()); // 右下
        if (subLTFileName == null && subRTFileName == null && subLBFileName == null && subRBFileName == null) {
            return true; // 四个角标都没有不需要处理
        }

        // 组装角标的存放地址
        File subscriptSavePathFile = new File(
                ResPathConfig.buildSystemLocalPath(ResPathConfig.RESOURCE_PLATFORM_SUBSCRIPT)
                        + File.separator + entity.getCchShortName());
//                        + File.separator + entity.getVer().getCchVerUpFDate());
        FileUtil.createDir(subscriptSavePathFile); // 创建文件夹
        sendLog("组装角标的存放地址 " + subscriptSavePathFile.getAbsolutePath());

        // 组装角标的打包存放地址
        File subscriptPackPathFile = new File(
                ResPathConfig.buildSystemLocalPath(ResPathConfig.PACK_PLATFORM_ICONS_SUBSCRIPT)
                        + File.separator + entity.getCchShortName());
        FileUtil.createDir(subscriptPackPathFile); // 创建文件夹
        sendLog("组装角标的打包存放地址 " + subscriptPackPathFile.getAbsolutePath());

        // 处理各个角的角标
        if (!handlerCornerSubscript(resultBean, entity, subscriptSavePathFile, subscriptPackPathFile,
                entity.getCchLTIconFile(), subLTFileName, "leftTop", "左上"))
            return false;
        if (!handlerCornerSubscript(resultBean, entity, subscriptSavePathFile, subscriptPackPathFile,
                entity.getCchRTIconFile(), subRTFileName, "rightTop", "右上"))
            return false;
        if (!handlerCornerSubscript(resultBean, entity, subscriptSavePathFile, subscriptPackPathFile,
                entity.getCchLBIconFile(), subLBFileName, "leftBottom", "左下"))
            return false;
        if (!handlerCornerSubscript(resultBean, entity, subscriptSavePathFile, subscriptPackPathFile,
                entity.getCchRBIconFile(), subRBFileName, "rightBottom", "右下"))
            return false;

        return true;
    }


    /**
     * 处理各个角的角标
     *
     * @param resultBean            结果集
     * @param entity                数据对象
     * @param subscriptSavePathFile 角标保存路径文件
     * @param subscriptPackPathFile 角标打包目录保存路径文件
     * @param subscriptUploadFile   角标的上传文件
     * @param oriFileName           上传文件名
     * @param newFileName           新的文件名
     * @param sqlTip                sql中显示的提示
     * @return 是否处理成功
     */
    private boolean handlerCornerSubscript(ResultBean<ChannelEntity> resultBean, ChannelEntity entity,
                                           File subscriptSavePathFile, File subscriptPackPathFile,
                                           MultipartFile subscriptUploadFile, String oriFileName,
                                           String newFileName, String sqlTip) {
        // 如果旧文件名为空, 代表不用处理
        if (oriFileName == null) {
            return true;
        }

        // 格式检查
        if (!oriFileName.endsWith(".png")) {
            setResultBeanError(resultBean, "角标文件只支持png格式");
            return false;
        }

        // 角标文件移动到存储目录中
        File subscriptSaveFile = fileTransferTo(subscriptUploadFile,
                subscriptSavePathFile.getAbsolutePath(),
                newFileName + oriFileName.substring(oriFileName.indexOf('.')));
        if (subscriptSaveFile == null || !subscriptSaveFile.exists()) {
            sendLog(sqlTip + "角标文件移动失败");
            setResultBeanError(resultBean, sqlTip + "角标文件移动失败");
            return false;
        }
        sendLog("角标文件移动到存储目录中 " + subscriptSaveFile.getAbsolutePath());
        if (!ImageUtils.isFitDimension(subscriptSaveFile, GlobalConfig.ICON_IMAGE_SIZE)) {
            sendLog(sqlTip + "角标文件限制宽高为512");
            setResultBeanError(resultBean, sqlTip + "角标文件限制宽高为512");
            return false;
        }

        // 角标文件复制到打包目录中
        File subscriptPackFile = new File(subscriptPackPathFile.getAbsoluteFile()
                + File.separator + subscriptSaveFile.getName());
        boolean copyResult = FileUtil.copyFile(subscriptSaveFile, subscriptPackFile); // 复制
        if (!copyResult) {
            sendLog(sqlTip + "角标文件复制到打包目录失败");
            setResultBeanError(resultBean, sqlTip + "角标文件复制到打包目录失败");
            return false;
        }
        sendLog("角标文件复制到打包目录中 " + subscriptPackFile.getAbsolutePath());

        // 角标字符串组装
        String cchSubscript = entity.getCchSubscript();
        if (cchSubscript == null) {
            cchSubscript = "";
        }

        if (cchSubscript.trim().equals("")) { // 为空直接添加
            cchSubscript = cchSubscript + sqlTip;
        } else {
            if (!cchSubscript.contains(sqlTip)) { // 代表里面还没有这个角标, 以|分隔并添加进去
                cchSubscript = cchSubscript + "|" + sqlTip;
            }
        }
        entity.setCchSubscript(cchSubscript);
        sendLog("角标字符串 " + cchSubscript);

        return true;
    }


    /**
     * 处理添加到数据库
     *
     * @param resultBean  结果集
     * @param entity      数据对象
     * @param existResult 是否存在
     */
    private void handlerAddDao(ResultBean<ChannelEntity> resultBean, ChannelEntity entity, int existResult) {
        sendLog("调用处理真正添加到数据库的方法 " + entity);
        entity.getVer().setCchVerUpStatus(1); // 首次接入标识

        int result = -1;
//        if (existResult == 2) { // 插入
        sendLog("插入渠道表");
        if (channelDao.insert(entity) == 1) { // 先插入到渠道表中
            sendLog("插入渠道版本表");
            result = channelVersionDao.insert(entity); // 插入到渠道版本表中
        }
//        } else if (existResult == 1) { // 更新
//            sendLog("更新渠道中被停用的");
//            entity.setStatus(BaseEntity.FLAG_STATUS_ACTIVE);
//            if (channelDao.update(entity) == 1) { // 更新渠道中被停用的
//                sendLog("插入渠道版本表");
//                result = channelVersionDao.insert(entity); // 插入到渠道版本表中
//            }
//        }

        if (result == 1) {
            setResultBean(resultBean, true, "数据添加成功");
        } else {
            setResultBeanError(resultBean, "数据添加到数据库失败，请检查数据库设置");
        }
    }


    /**
     * 处理更新到数据库
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     */
    private void handlerUpdateDao(ResultBean<ChannelEntity> resultBean, ChannelEntity entity) {
        sendLog("调用处理真正编辑到数据库的方法 " + entity);

        // 把所有当前渠道都设置为不是最新
        ChannelEntity updateIsNewEntity = new ChannelEntity();
        updateIsNewEntity.setVer(new ChannelVersionEntity());
        updateIsNewEntity.getVer().setIsNew(BaseEntity.FLAG_BOOLEAN_FALSE); // 设置不是最新
        updateIsNewEntity.setId(entity.getId());
        int isNewResult = channelVersionDao.updateIsNew(updateIsNewEntity);
        sendLog("所有当前渠道设置为不是最新 " + updateIsNewEntity + " result:" + isNewResult);

        // 把数据插入渠道版本中
        int versionResult = channelVersionDao.insert(entity);
        sendLog("插入渠道版本结果 " + versionResult);
        if (versionResult == 1) {
            entity.setStatus(BaseEntity.FLAG_STATUS_ACTIVE); // 游戏设置为启用的
            int result = channelDao.update(entity);
            sendLog("更新渠道信息结果 " + result);

            if (result == 1) {
                setResultBean(resultBean, true, "更新成功");
            } else {
                setResultBeanError(resultBean, "更新失败");
            }
        }
    }

    @Override
    public ResultBean<ChannelEntity> changeStatus(String id) {
        sendLog("调用修改状态方法 " + id);
        ResultBean<ChannelEntity> resultBean = new ResultBean<>();
//        if (removeLocalFile(resultBean, id)) { // 删除成功
            sendLog("删除本地文件成功, 删除数据库数据");
            channelVersionDao.delete(id);
            channelDao.delete(id);
            resultBean.setSuccess(true);
//        }
        return resultBean;
    }

    /**
     * 删除本地文件
     *
     * @param resultBean 结果集
     * @param id         id
     * @return 处理结果
     */
    private boolean removeLocalFile(ResultBean<ChannelEntity> resultBean, String id) {
        sendLog("调用删除本地文件方法 " + id);

        // 获取对象数据
        ChannelEntity entity = channelDao.get(id);
        sendLog("获取到的对象 " + entity);
        if (entity == null || entity.getStatus() == BaseEntity.FLAG_STATUS_DEL) {
            setResultBeanError(resultBean, "此渠道不存在");
            return false;
        }

        // 删除data
        File localFile = new File(
                ResPathConfig.buildSystemLocalPath(ResPathConfig.RESOURCE_PLATFORM_DATA)
                        + File.separator + entity.getCchShortName());
        FileUtil.delDir(localFile);
        sendLog("进行删除渠道操作 " + localFile.getAbsolutePath());

        return true;
    }

    @Override
    public ResultBean<ChannelEntity> getData(String id) {
        return null;
    }

    /**
     * 删除cp和星趣包
     *
     * @param entity 游戏对象类
     */
    public void removeDataFile(ChannelEntity entity) {
        // 删除data数据所存放的资源目录的上一层目录
//        File localFile = new File(entity.getVer().getCchVerUpDataPath());
        File dataFile = entity.getLocalResourceDataFile();
        if (dataFile != null && dataFile.exists()) {
            FileUtil.delDir(dataFile.getParentFile());
            sendLog("进行删除资源目录渠道data文件操作 " + dataFile.getAbsolutePath());
        }


        // 删除data解压的临时目录
        File dataTempDirFile = entity.getLocalDataTempDirFile();
        if (dataTempDirFile != null && dataTempDirFile.exists()) {
            FileUtil.delDir(dataTempDirFile);
            sendLog("进行删除渠道data的临时目录操作 " + dataTempDirFile);
        }

    }


    /**
     * 修改数据 只修改标签数据, 不更新版本
     * @param entity 对象
     * @return 结果集
     */
    public ResultBean<ChannelEntity> changeData(ChannelEntity entity) {
        sendLog("调用修改数据的方法 " + entity);

        ResultBean<ChannelEntity> resultBean = new ResultBean<>();
        if (validateChangeData(resultBean, entity)) { // 通过验证

            int existResult = validateDataExist(entity);
            sendLog("检查存在结果 " + existResult);
            if (existResult != 2) {  // 不存在此渠道

                // 处理渠道角标
                if (handlerSubscript(resultBean, entity)) { // 角标处理成功

                    int result = channelDao.update(entity); // 渠道更新操作
                    sendLog("更新渠道信息结果 " + result);

                    if (result == 1) {
                        setResultBean(resultBean, true, "修改成功");
                    } else {
                        setResultBeanError(resultBean, "修改失败");
                    }

                }

            } else {
                setResultBeanError(resultBean, "当前渠道不存在");
            }

        }
        sendLog("修改数据的结果 " + resultBean);
        return resultBean;

    }

    /**
     * 验证基础数据
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     * @return 是否验证成功
     */
    private boolean validateChangeData(ResultBean<ChannelEntity> resultBean, ChannelEntity entity) {
        sendLog("调用验证修改数据方法 resultBean: " + resultBean + " entity: " + entity);

        // 对数据对象验证
        ValidationResultBean validationResultBean = ValidationUtils.validateEntity(entity);
        sendLog("检验bean的基本数据结果 " + validationResultBean);
        if (validationResultBean.isHasErrors()) { // 存在错误
            setResultBeanError(resultBean, ValidationUtils.getFirstErrorMessage(validationResultBean));
            return false;
        }

        return true;
    }



    private static final String DATA_USE = "use";

    private static final String DATA_USE_DATA = "data";

    private static final String DATA_USE_PERMISSIONS = "permissions.txt";

    private static final String DATA_USE_PLUGS = "plugs.txt";

    /** use路径下包括的文件名 **/
    private static final String[] usePathIncludeNameArray = {
            DATA_USE_DATA, DATA_USE_PERMISSIONS, DATA_USE_PLUGS
    };

    /**
     * 分析渠道data解压出来文件的目录结构是否符合
     * @param resultBean 结果集
     * @param entity 渠道对象
     * @param unRarPath 解压路径
     * @return 分析结果
     */
    private boolean analyseDataPath(ResultBean<ChannelEntity> resultBean, ChannelEntity entity, String unRarPath) {
        File unRarPathFile = new File(unRarPath);
        File[] firstPathFileList = unRarPathFile.listFiles();
        if (firstPathFileList != null) {


            int c = 0;
            File firstPathFile = null; // 第一层
            for (File file : firstPathFileList) {
                if (file.getName().equals(entity.getCchShortName()) && file.isDirectory()) {
                    // 第一层必须是与渠道缩写相同的命名文件夹
                    firstPathFile = file;
                    break;
                }
                c++;
            }
            if (c != firstPathFileList.length && firstPathFile != null) {


                // 遍历下一层目录
                File[] dataFileList = firstPathFile.listFiles();
                if (dataFileList != null) {
                    int i = 0;
                    File usePathFile = null; // use文件夹路径文件
                    for (; i < dataFileList.length; i++) {
                        File file = dataFileList[i];

                        // 判断有没有use文件夹, 并且use为文件夹
                        if (file.getName().equals(DATA_USE)) {
                            if (file.isDirectory()) {
                                usePathFile = file;
                                break;
                            }
                        }
                    }
                    if (i != dataFileList.length && usePathFile != null) { // 代表找到了use文件夹
                        File[] useFileList = usePathFile.listFiles();
                        if (useFileList != null) {

                            // 判断use文件夹中的目录结构, 与usePathInclude一一匹配
                            int count = 0;
                            for (String name : usePathIncludeNameArray) {
                                for (File useFile : useFileList) {
                                    if (name.equals(useFile.getName())) {

                                        // 判断use文件夹里面的data是否为文件夹
                                        if (name.equals(DATA_USE_DATA)) {
                                            if (!useFile.isDirectory()) { // 不是文件夹, 不算
                                                break;
                                            }
                                        }

                                        // 匹配到计数器加一
                                        count++;
                                        break;
                                    }
                                }
                            }
                            // 符合基本目录结构
                            if (count == usePathIncludeNameArray.length) {
                                // 找出渠道data版本号文件名, 以v开头的文本
                                for (File useFile : useFileList) {
                                    String fileName = useFile.getName().toLowerCase();
                                    if (fileName.startsWith("v") && fileName.endsWith(".txt")) {
                                        // 从版本文本名中获取版本号, 切除以v开头以及后面的.txt后缀
                                        String versionName = fileName.substring(1, fileName.lastIndexOf('.'));
                                        if (StringUtils.isNotEmpty(versionName)) {
                                            entity.getVer().setCchVerName(versionName);
                                            return true;
                                        }
                                    }
                                }
                                setResultBeanError(resultBean, "渠道data压缩包中找不到版本号文本");
                                return false;
                            }

                        }
                    }
                }


            } else {
                setResultBeanError(resultBean, "渠道data压缩包中的首目录的文件夹必须以渠道标识命名");
                return false;
            }


        }


        setResultBeanError(resultBean, "渠道data压缩包中的目录结构不正确");
        return false;
    }


}
