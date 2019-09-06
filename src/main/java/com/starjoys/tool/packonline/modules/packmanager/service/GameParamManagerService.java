package com.starjoys.tool.packonline.modules.packmanager.service;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.bean.ValidationResultBean;
import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.common.config.ResPathConfig;
import com.starjoys.tool.packonline.modules.packmanager.dao.ChannelDao;
import com.starjoys.tool.packonline.modules.packmanager.dao.GameDao;
import com.starjoys.tool.packonline.modules.packmanager.dao.GameParamDao;
import com.starjoys.tool.packonline.modules.packmanager.dao.GameParamRecordDao;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameEntity;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameParamEntity;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameParamRecordEntity;
import com.starjoys.tool.packonline.modules.packmanager.utils.GameParamUtils;
import com.starjoys.tool.packonline.utils.FileUtil;
import com.starjoys.tool.packonline.utils.ImageUtils;
import com.starjoys.tool.packonline.utils.ValidationUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.File;
import java.sql.Timestamp;
import java.util.List;

/**
 * 游戏参数管理业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/2/10
 */

@Service
public class GameParamManagerService extends BaseService implements IBaseManagerService<GameParamEntity> {

    @Resource
    private GameParamDao gameParamDao;

    @Resource
    private GameParamRecordDao gameParamRecordDao;

    @Resource
    private GameDao gameDao;

    @Resource
    private ChannelDao channelDao;

    @Override
    public ResultBean<List<GameParamEntity>> findAllData() {
        ResultBean<List<GameParamEntity>> resultBean = new ResultBean<>();
        List<GameParamEntity> gameEntityList = gameParamDao.findAllList();
        for (int i = 0; i < gameEntityList.size(); i++) {
            GameParamEntity gameParamEntity = gameEntityList.get(i);
            if (gameParamEntity.getStatus() == BaseEntity.FLAG_STATUS_DEL) {
                gameEntityList.remove(i);
                i--;
            }
        }
        // 读取配置文件
        GameParamUtils.readCfgForList(gameEntityList);
//        sendLog("获取的游戏参数列表数据 " + gameEntityList);
        setResultBean(resultBean, true, "成功获取所有数据", gameEntityList);
        return resultBean;
    }

    @Override
    public ResultBean<List<GameParamEntity>> findAllData(GameParamEntity entity) {
        return null;
    }

    @Transactional(readOnly = true)
    @Override
    public ResultBean<List<GameParamEntity>> findDataByPage(GameParamEntity entity) {
//        sendLog("分页数据查询 " + entity);
        ResultBean<List<GameParamEntity>> resultBean = new ResultBean<>();
        List<GameParamEntity> gameParamList = gameParamDao.findListByPage(entity);
        resultBean.setTotal(gameParamDao.findCountByPage());
        // 读取配置文件
        GameParamUtils.readCfgForList(gameParamList);


        setResultBean(resultBean, true, "成功获取所有数据", gameParamList);
        return resultBean;
    }

    @Transactional
    @Override
    public ResultBean<GameParamEntity> addData(GameParamEntity entity) {
        sendLog("调用添加数据的方法 " + entity);
        ResultBean<GameParamEntity> resultBean = new ResultBean<>();
        int companyId = entity.getGame().getCompany().getCompanyId();

        if (validateData(resultBean, entity, true)) { // 通过验证

            if (checkCompanyId(resultBean, entity, companyId)) { // 检查公司id

                // 设置创建时间
                Timestamp currentTime = new Timestamp(System.currentTimeMillis());
                entity.setGameParamCreateDate(currentTime); // 游戏参数创建时间
                entity.getRecord().setGpRecordUpDate(currentTime); // 游戏参数记录更新时间

                if (GameParamUtils.beforeHandler(entity)) {

                    // 处理上传文件
                    if (handlerUploadFile(resultBean, entity)) { // 处理成功
                        handlerAddDao(resultBean, entity); // 调用插入操作
                    }

                } else {
                    setResultBeanError(resultBean, "本地配置文件保存失败或者参数出现非法字符");
                }

            }

        }
        sendLog("添加数据的结果 " + resultBean);
        return resultBean;
    }


    /**
     * 验证基础数据
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     * @return 是否验证成功
     */
    private boolean validateData(ResultBean<GameParamEntity> resultBean, GameParamEntity entity, boolean isAdd) {
        sendLog("调用验证数据方法 resultBean: " + resultBean + " entity: " + entity);

        // 对数据对象验证
        ValidationResultBean validationResultBean = ValidationUtils.validateEntity(entity);
        sendLog("检验bean的基本数据结果 " + validationResultBean);
        if (validationResultBean.isHasErrors()) { // 存在错误
            setResultBeanError(resultBean, ValidationUtils.getFirstErrorMessage(validationResultBean));
            return false;
        }

        // 游戏参数记录信息校验
        validationResultBean = ValidationUtils.validateEntity(entity.getRecord());
        sendLog("检验bean的游戏参数记录数据结果 " + validationResultBean);
        if (validationResultBean.isHasErrors()) {
            setResultBeanError(resultBean, ValidationUtils.getFirstErrorMessage(validationResultBean));
            return false;
        }

        if (isAdd) { // 添加操作才执行
            // 判断game和cch是否为空
            if (entity.getGame() == null) {
                setResultBeanError(resultBean, "此游戏不存在");
                return false;
            }
            if (entity.getCch() == null) {
                setResultBeanError(resultBean, "此渠道不存在");
                return false;
            }

            // 查询游戏并判断游戏是否存在
            sendLog("检查游戏是否存在");
            entity.setGame(gameDao.get(entity.getGame().getId() + ""));
            if (entity.getGame() == null) {
                setResultBeanError(resultBean, "此游戏不存在");
                return false;
            }

            // 查询渠道并检查是否存在
            sendLog("检查渠道是否存在");
            entity.setCch(channelDao.get(entity.getCch().getId() + ""));
            if (entity.getCch() == null) {
                setResultBeanError(resultBean, "此渠道不存在");
                return false;
            }

            // 检查游戏参数是否存在
            sendLog("检查游戏参数是否存在");
            GameParamEntity getByKeyParamEntity = gameParamDao.getByKeyWithActive(
                    entity.getGame().getId() + "", entity.getCch().getId() + "");
            if (getByKeyParamEntity != null && getByKeyParamEntity.getStatus() == BaseEntity.FLAG_STATUS_ACTIVE) {
                setResultBeanError(resultBean, "此游戏参数已存在");
                return false;
            }
        } else { // 更新操作才执行

            // 检查游戏参数是否存在
            sendLog("检查游戏参数是否存在");
            GameParamEntity daoEntity =gameParamDao.get(entity.getGameParamId() + "");
            if (daoEntity == null) {
                setResultBeanError(resultBean, "此游戏参数不存在");
                return false;
            }
            // 补充渠道和游戏信息
            entity.setGame(daoEntity.getGame());
            entity.setCch(daoEntity.getCch());
        }

        return true;
    }

    /**
     * 处理上传的文件
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     * @return 是否处理成功
     */
    private boolean handlerUploadFile(ResultBean<GameParamEntity> resultBean, GameParamEntity entity) {
        sendLog("调用处理上传文件方法 resultBean: " + resultBean + " entity: " + entity);

        // 上传图标处理
        String iconFileName;
        if ((iconFileName = getFileName(entity.getIconFile())) != null) {
            if (!iconFileName.endsWith(".png")) {
                setResultBeanError(resultBean, "图标只支持png格式");
                return false;
            }

            entity.setGameParamIcon(BaseEntity.FLAG_BOOLEAN_TRUE); // 标记存在图标

            // 移动图标到本项目的资源路径中
            String iconSavePath = ResPathConfig.buildSystemLocalPath(ResPathConfig.RESOURCE_PLATFORM_ICON);
            sendLog("转移的图标文件夹 " + iconSavePath);
            String newIconFileName = entity.getCch().getCchShortName() + ".png"; // 新的角标文件名
            File iconFile = fileTransferTo(entity.getIconFile(), iconSavePath, newIconFileName);
            sendLog("转移上传的图标文件后 name:" + entity.getCch().getCchShortName() + ".png" + " file:" + iconFile);
            if (iconFile == null) { // 转移失败
                setResultBeanError(resultBean, "游戏参数图标转移失败");
                return false;
            }

            // 读取图标宽高
            int width = ImageUtils.readImageWidth(iconFile);
            int height = ImageUtils.readImageHeight(iconFile);
            if (width == -1 || height == -1) {
                iconFile.delete(); // 删除转移后的文件
                setResultBeanError(resultBean, "图标文件读取宽高失败");
                return false;
            }

            // 判断不能超过512
            if (width > GlobalConfig.ICON_IMAGE_SIZE || height > GlobalConfig.ICON_IMAGE_SIZE) { // 文件宽高判断只能512
                iconFile.delete(); // 删除转移后的文件
                setResultBeanError(resultBean, "图标文件限制宽高不能大于512");
                return false;
            }
            // 把图标文件复制到打包目录中
            String apkPackIconsPath = wrapIconPackLocalPath(entity,
                    ResPathConfig.PACK_PLATFORM_ICONS);
            if (apkPackIconsPath == null) {
                setResultBeanError(resultBean, "组建游戏参数图标打包路径时失败");
                return false;
            }
            // 创建目标目录
            File apkPackIconsPathFile = new File(apkPackIconsPath);
            FileUtil.createDir(apkPackIconsPathFile);
//            FileUtil.delDir(apkPackIconsPathFile); // 先删除

            boolean copyResult = FileUtil.copyFile(iconFile, new File(apkPackIconsPathFile, "icon.png")); // 再复制
            sendLog("复制图标文件到打包目录中 source:" + iconFile.getAbsolutePath() +
                    " target:" + apkPackIconsPathFile.getAbsolutePath());
            if (!copyResult) {
                setResultBeanError(resultBean, "游戏参数图标保存失败");
                return false;
            }
        }

        return true;
    }

    /**
     * 处理添加到数据库
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     */
    private void handlerAddDao(ResultBean<GameParamEntity> resultBean, GameParamEntity entity) {
        sendLog("调用处理真正添加到数据库的方法");

        int result = -1;
        sendLog("插入游戏参数表" + entity);
        if (gameParamDao.insert(entity) == 1) { // 先插入到游戏表中
            GameParamEntity daoEntity = gameParamDao.getByKeyWithActive(
                    entity.getGame().getId() + "", entity.getCch().getId() + "");
            sendLog("插入游戏参数成功 gameId:" + entity.getGame().getGameId()
                    + " cchId:" + entity.getCch().getCchId() + " daoEntity:" + daoEntity);
            sendLog("插入游戏参数记录表");
            entity.setGameParamId(daoEntity.getGameParamId()); // 设置刚刚添加的游戏参数id
            result = gameParamRecordDao.insert(entity); // 插入到游戏版本表中
        }

        if (result == 1) {
            setResultBean(resultBean, true, "数据添加成功");
        } else {
            setResultBeanError(resultBean, "数据添加到数据库失败，请检查数据库设置");
        }

    }

    public ResultBean<GameParamEntity> changeStatus(String id, int companyId) {
        sendLog("调用修改状态方法 " + id);
        ResultBean<GameParamEntity> resultBean = new ResultBean<>();

        GameParamEntity daoEntity = gameParamDao.get(id);
        if (checkCompanyId(resultBean, daoEntity, companyId)) { // 检查公司id
            gameParamRecordDao.delete(id);
            gameParamDao.delete(id);

            resultBean.setSuccess(true);
        }

        return resultBean;
    }

    @Override
    public ResultBean<GameParamEntity> changeStatus(String id) {
        return null;
    }

    @Transactional
    @Override
    public ResultBean<GameParamEntity> updateData(GameParamEntity entity) {
        sendLog("调用更新数据的方法 " + entity);
        ResultBean<GameParamEntity> resultBean = new ResultBean<>();
        int companyId = entity.getGame().getCompany().getCompanyId();
        if (validateData(resultBean, entity, false)) { // 通过验证

            if (checkCompanyId(resultBean, entity, companyId)) { // 检查公司id

                // 设置创建时间
                Timestamp currentTime = new Timestamp(System.currentTimeMillis());
                entity.getRecord().setGpRecordUpDate(currentTime); // 游戏参数记录更新时间

                if (GameParamUtils.beforeHandler(entity)) {

                    // 处理上传文件
                    if (handlerUploadFile(resultBean, entity)) { // 处理成功
                        handlerUpdateDao(resultBean, entity); // 调用插入操作
                    }

                } else {
                    setResultBeanError(resultBean, "本地配置文件保存失败或者参数出现非法字符");
                }

            }

        }
        sendLog("添加数据的结果 " + resultBean);
        return resultBean;
    }

    /**
     * 处理更新到数据库
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     */
    private void handlerUpdateDao(ResultBean<GameParamEntity> resultBean, GameParamEntity entity) {
        sendLog("调用处理真正编辑到数据库的方法 " + entity);

        // 把所有当前游戏参数记录都设置为不是最新
        GameParamEntity updateIsNewEntity = new GameParamEntity();
        updateIsNewEntity.setRecord(new GameParamRecordEntity());
        updateIsNewEntity.getRecord().setIsNew(BaseEntity.FLAG_BOOLEAN_FALSE); // 设置不是最新
        updateIsNewEntity.setGameParamId(entity.getGameParamId());
        int isNewResult = gameParamRecordDao.updateIsNew(updateIsNewEntity); // 更新为不是最新操作
        sendLog("所有当前游戏参数记录设置为不是最新 " + updateIsNewEntity + " result:" + isNewResult);

        // 把数据插入游戏参数记录中
        int recordResult = gameParamRecordDao.insert(entity); // 游戏参数记录插入操作
        sendLog("插入游戏参数记录结果 " + recordResult);
        if (recordResult == 1) {
            int result = gameParamDao.update(entity); // 游戏参数记录更新操作
            sendLog("更新游戏参数记录信息结果 " + result);
            if (result == 1) {
                setResultBean(resultBean, true, "更新成功");
            } else {
                setResultBeanError(resultBean, "更新失败");
            }
        }
    }

    /**
     * 检查公司id
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     * @return 检查结果
     */
    private boolean checkCompanyId(ResultBean<GameParamEntity> resultBean, GameParamEntity entity, int currentCompanyId) {

        if (currentCompanyId != GlobalConfig.COMPANY_ID_FOR_SUPER_MANAGER) { // 超级管理员直接跳过
            GameEntity daoEntity = entity.getGame();
            if (daoEntity == null || daoEntity.getStatus() == BaseEntity.FLAG_STATUS_DEL
                    || daoEntity.getCompany().getCompanyId() != currentCompanyId) {
                setResultBeanError(resultBean, "无权限");
                return false;
            }
        }

        return true;
    }


    @Override
    public ResultBean<GameParamEntity> getData(String id) {
        return null;
    }
}
