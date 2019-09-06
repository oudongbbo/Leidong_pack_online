package com.starjoys.tool.packonline.modules.sdk.service;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.bean.ValidationResultBean;
import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.common.config.ResPathConfig;
import com.starjoys.tool.packonline.modules.packmanager.dao.ChannelDao;
import com.starjoys.tool.packonline.modules.packmanager.entity.ChannelEntity;
import com.starjoys.tool.packonline.modules.sdk.dao.SdkDao;
import com.starjoys.tool.packonline.modules.sdk.dao.SdkOverseaDao;
import com.starjoys.tool.packonline.modules.sdk.dao.SdkVersionDao;
import com.starjoys.tool.packonline.modules.sdk.dao.SdkVersionOverseaDao;
import com.starjoys.tool.packonline.modules.sdk.entity.SdkEntity;
import com.starjoys.tool.packonline.modules.sdk.entity.SdkVersionEntity;
import com.starjoys.tool.packonline.utils.DateUtils;
import com.starjoys.tool.packonline.utils.ValidationUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.File;
import java.sql.Timestamp;
import java.util.List;

/**
 * sdk业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/5/8
 */

@Service
public class SdkManagerService extends BaseService implements IBaseManagerService<SdkEntity> {

    @Resource
    private SdkDao sdkDao;

    @Resource
    private SdkVersionDao sdkVersionDao;

    @Resource
    private ChannelDao channelDao;

    @Resource
    private SdkOverseaDao sdkOverseaDao;

    @Resource
    private SdkVersionOverseaDao sdkVersionOverseaDao;

    @Override
    public ResultBean<List<SdkEntity>> findAllData() {
        ResultBean<List<SdkEntity>> resultBean = new ResultBean<>();
        List<SdkEntity> sdkEntityList = sdkDao.findAllList();
        sdkEntityList = removeDelData(sdkEntityList);
        setResultBean(resultBean, true, "成功获取所有数据", sdkEntityList);
        return resultBean;
    }

    /**
     * 获取所有海外sdk数据
     *
     * @return 列表
     */
    public ResultBean<List<SdkEntity>> findAllDataOversea() {
        ResultBean<List<SdkEntity>> resultBean = new ResultBean<>();
        List<SdkEntity> sdkEntityList = sdkOverseaDao.findAllList();
        sdkEntityList = removeDelData(sdkEntityList);
        setResultBean(resultBean, true, "成功获取所有海外数据", sdkEntityList);
        return resultBean;
    }

    /**
     * 删除del标识的数据
     *
     * @param sdkEntityList 数据列表
     * @return 删除后的列表
     */
    private List<SdkEntity> removeDelData(List<SdkEntity> sdkEntityList) {
        for (int i = 0; i < sdkEntityList.size(); i++) {
            if (sdkEntityList.get(i).getStatus() == BaseEntity.FLAG_STATUS_DEL) {
                sdkEntityList.remove(i);
                i--;
            }
        }
        return sdkEntityList;
    }

    @Override
    public ResultBean<List<SdkEntity>> findAllData(SdkEntity entity) {
        return null;
    }

    @Transactional(readOnly = true)
    @Override
    public ResultBean<List<SdkEntity>> findDataByPage(SdkEntity entity) {
        sendLog("分页数据查询 " + entity);
        ResultBean<List<SdkEntity>> resultBean = new ResultBean<>();
        List<SdkEntity> sdkList;
        if (entity.isOversea()) {
            sdkList = sdkOverseaDao.findListByPage(entity);
            resultBean.setTotal(sdkOverseaDao.findCountByPage());
        } else {
            sdkList = sdkDao.findListByPage(entity);
            resultBean.setTotal(sdkDao.findCountByPage());
        }
        setResultBean(resultBean, true, "成功获取所有数据", sdkList);
        return resultBean;
    }

    @Transactional
    @Override
    public ResultBean<SdkEntity> addData(SdkEntity entity) {
        ResultBean<SdkEntity> resultBean = new ResultBean<>();
        if (validateBaseData(resultBean, entity, false)) { // 验证基础数据
            if (validateDaoData(resultBean, entity, true)) { // 验证数据库数据

                // 设置时间
                Timestamp currentDateTime = new Timestamp(System.currentTimeMillis());
                entity.setSdkCreateDate(currentDateTime);
                entity.getVer().setSdkVerUpDate(currentDateTime);

                if (handlerUploadFile(resultBean, entity)) { // 处理上传文件
                    handleAddDao(resultBean, entity); // 添加到数据库
                }
            }
        }
        return resultBean;
    }

    /**
     * 处理添加到数据库
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     */
    private void handleAddDao(ResultBean<SdkEntity> resultBean, SdkEntity entity) {

        if (entity.isOversea()) {
            // 插入sdk
            sdkOverseaDao.insert(entity);

            // 插入sdk版本
            sdkVersionOverseaDao.insert(entity);
        } else {
            // 插入sdk
            sdkDao.insert(entity);

            // 插入sdk版本
            sdkVersionDao.insert(entity);
        }

        setResultBean(resultBean, true, "添加成功");
    }

    @Override
    public ResultBean<SdkEntity> changeStatus(String id) {
        return null;
    }

    @Transactional
    @Override
    public ResultBean<SdkEntity> updateData(SdkEntity entity) {
        ResultBean<SdkEntity> resultBean = new ResultBean<>();
        if (validateBaseData(resultBean, entity, false)) { // 验证基础数据
            if (validateDaoData(resultBean, entity, false)) { // 验证数据库数据

                // 设置时间
                Timestamp currentDateTime = new Timestamp(System.currentTimeMillis());
                entity.getVer().setSdkVerUpDate(currentDateTime);

                if (handlerUploadFile(resultBean, entity)) { // 处理上传文件
                    handleUpdateDao(resultBean, entity); // 更新到数据库
                }
            }
        }
        return resultBean;
    }

    /**
     * 处理更新到数据库
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     */
    private void handleUpdateDao(ResultBean<SdkEntity> resultBean, SdkEntity entity) {

        SdkEntity entityForIsNew = new SdkEntity();
        entityForIsNew.setVer(new SdkVersionEntity());

        entityForIsNew.setSdkId(entity.getSdkId());
        entityForIsNew.getVer().setIsNew(BaseEntity.FLAG_STATUS_DEL);

        if (entity.isOversea()) {
            // 更新把所有sdk版本设置为不是最新
            sdkVersionOverseaDao.updateIsNew(entityForIsNew);

            // 更新sdk
            sdkOverseaDao.update(entity);

            // 插入sdk版本
            sdkVersionOverseaDao.insert(entity);

        } else {
            // 更新把所有sdk版本设置为不是最新
            sdkVersionDao.updateIsNew(entityForIsNew);

            // 更新sdk
            sdkDao.update(entity);

            // 插入sdk版本
            sdkVersionDao.insert(entity);
        }

        setResultBean(resultBean, true, "更新成功");
    }

    /**
     * 修改数据 只修改标签数据, 不更新版本
     *
     * @param entity 对象
     * @return 结果集
     */
    public ResultBean<SdkEntity> changeData(SdkEntity entity) {
        sendLog("调用修改数据的方法 " + entity);

        ResultBean<SdkEntity> resultBean = new ResultBean<>();
        if (validateBaseData(resultBean, entity, true)) { // 通过验证
            if (validateDaoData(resultBean, entity, false)) {

                if (entity.isOversea()) {
                    sdkOverseaDao.update(entity);
                } else {
                    // 修改
                    sdkDao.update(entity);
                }

                setResultBean(resultBean, true, "修改成功");
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
    private boolean validateBaseData(ResultBean<SdkEntity> resultBean, SdkEntity entity, boolean isChange) {
        // 对数据对象验证
//        ValidationResultBean validationResultBean = ValidationUtils.validateEntity(entity);
//        sendLog("检验bean的基本数据结果 " + validationResultBean);
//        if (validationResultBean.isHasErrors()) { // 存在错误
//            setResultBeanError(resultBean, ValidationUtils.getFirstErrorMessage(validationResultBean));
//            return false;
//        }

        // 检查渠道id
        if (entity.getCch() == null || entity.getCch().getId() <= 0) {
            setResultBeanError(resultBean, "渠道名称不能为空");
            return false;
        }

        if (!isChange) { // 是更新和添加操作时执行以下

            if (entity.getVer() == null) {
                setResultBeanError(resultBean, "更新说明不能为空");
                return false;
            }

            // 对里面的另一个对象验证
            ValidationResultBean validationResultBean = ValidationUtils.validateEntity(entity.getVer());
            sendLog("检验bean的基本数据结果 " + validationResultBean);
            if (validationResultBean.isHasErrors()) { // 存在错误
                setResultBeanError(resultBean, ValidationUtils.getFirstErrorMessage(validationResultBean));
                return false;
            }

        }

        return true;
    }

    /**
     * 验证数据库数据
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     * @param isAdd      是否为添加操作
     * @return 是否验证成功
     */
    private boolean validateDaoData(ResultBean<SdkEntity> resultBean, SdkEntity entity, boolean isAdd) {

        if (!isAdd) {
            // 获取当前要修改的对象
            SdkEntity daoEntity;
            if (entity.isOversea()) {
                daoEntity = sdkOverseaDao.get(entity.getSdkId());
            } else {
                daoEntity = sdkDao.get(entity.getSdkId());
            }
            if (daoEntity == null) {
                setResultBeanError(resultBean, "找不到此SDK");
                return false;
            }
        }

        // 查找渠道对象
        ChannelEntity daoCchEntity = channelDao.get(entity.getCch().getId() + "");
        if (daoCchEntity == null || daoCchEntity.getStatus() == BaseEntity.FLAG_STATUS_DEL) {
            setResultBeanError(resultBean, "找不到此渠道信息");
            return false;
        }
        entity.setCch(daoCchEntity);

        // 检查sdk表中有没有已经使用了此渠道的
        SdkEntity daoEntityBy_CchId;
        if (entity.isOversea()) {
            daoEntityBy_CchId = sdkOverseaDao.getBy_CchId(entity);
        } else {
            daoEntityBy_CchId = sdkDao.getBy_CchId(entity);
        }
        if (isAdd) { // 添加操作
            if (daoEntityBy_CchId != null) {
                setResultBeanError(resultBean, "已存在此SDK名称");
                return false;
            }
        } else { // 编辑操作
            if (daoEntityBy_CchId != null && !daoEntityBy_CchId.getSdkId().equals(entity.getSdkId())) {
                setResultBeanError(resultBean, "已存在此SDK名称");
                return false;
            }
        }

        entity.setSdkSystem("1");

        // 判断有关数据是否已经存在
//        SdkEntity daoEntityByName;
//        SdkEntity daoEntityByCchId;
//        if (entity.isOversea()) {
//            daoEntityByName = sdkOverseaDao.getByName(entity);
//            daoEntityByCchId = sdkOverseaDao.getByCchId(entity);
//        } else {
//            daoEntityByName = sdkDao.getByName(entity);
//            daoEntityByCchId = sdkDao.getByCchId(entity);
//        }
//
//        if (isAdd) { // 添加操作
//            if (daoEntityByName != null) {
//                setResultBeanError(resultBean, "已存在此SDK名称");
//                return false;
//            }
//            if (daoEntityByCchId != null) {
//                setResultBeanError(resultBean, "已存在此渠道ID");
//                return false;
//            }
//        } else { // 编辑操作
//            if (daoEntityByName != null && !daoEntityByName.getSdkId().equals(entity.getSdkId())) {
//                setResultBeanError(resultBean, "已存在此SDK名称");
//                return false;
//            }
//            if (daoEntityByCchId != null && !daoEntityByCchId.getSdkCchId().equals(entity.getSdkCchId())) {
//                setResultBeanError(resultBean, "已存在此渠道ID");
//                return false;
//            }
//        }

        return true;
    }

    /**
     * 处理上传的文件
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     * @return 是否处理成功
     */
    private boolean handlerUploadFile(ResultBean<SdkEntity> resultBean, SdkEntity entity) {

        // 检查上传的文件
        String oldFileName = getFileName(entity.getSdkUploadFile());
        sendLog("上传的文件名:" + oldFileName);
        if (oldFileName == null) {
            setResultBeanError(resultBean, "需要上传sdk压缩包");
            return false;
        }
        if (!oldFileName.endsWith(".zip") && !oldFileName.endsWith(".rar") && !oldFileName.endsWith(".7z")) {
            setResultBeanError(resultBean, "只能上传压缩包文件");
            return false;
        }

        // 开始上传文件的准备
        long time = entity.getVer().getSdkVerUpDate().getTime(); // 更新时间

        // 组装文件名
        String suffix = oldFileName.substring(oldFileName.lastIndexOf('.')); // 后缀名
        // 渠道id + sdk名称 + 版本 + 更新时间
        String newResFileName =
                entity.getCch().getCchId()
                        + "_" + entity.getCch().getCchName()
                        + "v" + entity.getVer().getSdkVerName()
                        + "_" + DateUtils.getDateStringFormat(time)
                        + suffix; // 资源文件中的文件名

        // 组装路径
        String toolResRelPath = ResPathConfig.RELATIVE_PATH_RESOURCE_SDK + File.separator
                + entity.getCch().getCchId() + "_" + entity.getCch().getCchName(); // 资源相对路径
        String toolResLocalPath = ResPathConfig.buildSystemLocalPath(
                ResPathConfig.RESOURCE_FRONT + File.separator + toolResRelPath); // 资源本地路径

        // 把文件转移到资源目录中
        File toolResFile = fileTransferTo(entity.getSdkUploadFile(), toolResLocalPath, newResFileName);
        if (toolResFile == null) {
            setResultBeanError(resultBean, "文件转移到资源文件夹失败");
            return false;
        }
        // 保存资源文件到对象中
        entity.getVer().setSdkVerUpPath(File.separator + toolResRelPath + File.separator + newResFileName);

        return true;
    }


    @Override
    public ResultBean<SdkEntity> getData(String id) {
        return null;
    }
}
