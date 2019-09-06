package com.starjoys.tool.packonline.modules.sdk.service;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.bean.ValidationResultBean;
import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.common.config.ResPathConfig;
import com.starjoys.tool.packonline.modules.sdk.dao.SdkIOSDao;
import com.starjoys.tool.packonline.modules.sdk.dao.SdkIOSOverseaDao;
import com.starjoys.tool.packonline.modules.sdk.dao.SdkVersionIOSDao;
import com.starjoys.tool.packonline.modules.sdk.dao.SdkVersionIOSOverseaDao;
import com.starjoys.tool.packonline.modules.sdk.entity.SdkIOSEntity;
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
 * sdk ios业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/5/19
 */

@Service
public class SdkIOSManagerService extends BaseService implements IBaseManagerService<SdkIOSEntity> {

    @Resource
    private SdkIOSDao sdkIOSDao;

    @Resource
    private SdkVersionIOSDao sdkVersionIOSDao;

    @Resource
    private SdkIOSOverseaDao sdkIOSOverseaDao;

    @Resource
    private SdkVersionIOSOverseaDao sdkVersionIOSOverseaDao;

    @Override
    public ResultBean<List<SdkIOSEntity>> findAllData() {
        ResultBean<List<SdkIOSEntity>> resultBean = new ResultBean<>();
        List<SdkIOSEntity> SdkIOSEntityList = sdkIOSDao.findAllList();
        SdkIOSEntityList = removeDelData(SdkIOSEntityList);
        setResultBean(resultBean, true, "成功获取所有数据", SdkIOSEntityList);
        return resultBean;
    }

    /**
     * 获取所有海外sdk数据
     *
     * @return 列表
     */
    public ResultBean<List<SdkIOSEntity>> findAllDataOversea() {
        ResultBean<List<SdkIOSEntity>> resultBean = new ResultBean<>();
        List<SdkIOSEntity> SdkIOSEntityList = sdkIOSOverseaDao.findAllList();
        SdkIOSEntityList = removeDelData(SdkIOSEntityList);
        setResultBean(resultBean, true, "成功获取所有海外数据", SdkIOSEntityList);
        return resultBean;
    }

    /**
     * 删除del标识的数据
     *
     * @param SdkIOSEntityList 数据列表
     * @return 删除后的列表
     */
    private List<SdkIOSEntity> removeDelData(List<SdkIOSEntity> SdkIOSEntityList) {
        for (int i = 0; i < SdkIOSEntityList.size(); i++) {
            if (SdkIOSEntityList.get(i).getStatus() == BaseEntity.FLAG_STATUS_DEL) {
                SdkIOSEntityList.remove(i);
                i--;
            }
        }
        return SdkIOSEntityList;
    }

    @Override
    public ResultBean<List<SdkIOSEntity>> findAllData(SdkIOSEntity entity) {
        return null;
    }

    @Transactional(readOnly = true)
    @Override
    public ResultBean<List<SdkIOSEntity>> findDataByPage(SdkIOSEntity entity) {
        sendLog("分页数据查询 " + entity);
        ResultBean<List<SdkIOSEntity>> resultBean = new ResultBean<>();
        List<SdkIOSEntity> sdkList;
        if (entity.isOversea()) {
            sendLog("");
            sdkList = sdkIOSOverseaDao.findListByPage(entity);
            resultBean.setTotal(sdkIOSOverseaDao.findCountByPage());
        } else {
            sdkList = sdkIOSDao.findListByPage(entity);
            resultBean.setTotal(sdkIOSDao.findCountByPage());
        }
        setResultBean(resultBean, true, "成功获取所有数据", sdkList);
        return resultBean;
    }

    @Transactional
    @Override
    public ResultBean<SdkIOSEntity> addData(SdkIOSEntity entity) {
        ResultBean<SdkIOSEntity> resultBean = new ResultBean<>();
        if (validateBaseData(resultBean, entity, false)) { // 验证基础数据
            if (validateDaoData(resultBean, entity, true)) { // 验证数据库数据
                sendLog("");
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
    private void handleAddDao(ResultBean<SdkIOSEntity> resultBean, SdkIOSEntity entity) {

        if (entity.isOversea()) {
            sendLog("海外 insert ");
            // 插入sdk
            sdkIOSOverseaDao.insert(entity);

            // 插入sdk版本
            sdkVersionIOSOverseaDao.insert(entity);
        } else {
            // 插入sdk
            sdkIOSDao.insert(entity);

            // 插入sdk版本
            sdkVersionIOSDao.insert(entity);
        }

        setResultBean(resultBean, true, "添加成功");
    }

    @Override
    public ResultBean<SdkIOSEntity> changeStatus(String id) {
        return null;
    }

    @Transactional
    @Override
    public ResultBean<SdkIOSEntity> updateData(SdkIOSEntity entity) {
        ResultBean<SdkIOSEntity> resultBean = new ResultBean<>();
        if (validateBaseData(resultBean, entity, false)) { // 验证基础数据
            if (validateDaoData(resultBean, entity, false)) { // 验证数据库数据
                sendLog("");

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
    private void handleUpdateDao(ResultBean<SdkIOSEntity> resultBean, SdkIOSEntity entity) {

        SdkIOSEntity entityForIsNew = new SdkIOSEntity();
        entityForIsNew.setVer(new SdkVersionEntity());

        entityForIsNew.setSdkId(entity.getSdkId());
        entityForIsNew.getVer().setIsNew(BaseEntity.FLAG_STATUS_DEL);

        if (entity.isOversea()) {
            sendLog("海外 updateIsNew");
            // 更新把所有sdk版本设置为不是最新
            sdkVersionIOSOverseaDao.updateIsNew(entityForIsNew);

            // 更新sdk
            sdkIOSOverseaDao.update(entity);

            // 插入sdk版本
            sdkVersionIOSOverseaDao.insert(entity);

        } else {
            // 更新把所有sdk版本设置为不是最新
            sdkVersionIOSDao.updateIsNew(entityForIsNew);

            // 更新sdk
            sdkIOSDao.update(entity);

            // 插入sdk版本
            sdkVersionIOSDao.insert(entity);
        }

        setResultBean(resultBean, true, "更新成功");
    }

    /**
     * 修改数据 只修改标签数据, 不更新版本
     *
     * @param entity 对象
     * @return 结果集
     */
    public ResultBean<SdkIOSEntity> changeData(SdkIOSEntity entity) {
        sendLog("调用修改数据的方法 " + entity);

        ResultBean<SdkIOSEntity> resultBean = new ResultBean<>();
        if (validateBaseData(resultBean, entity, true)) { // 通过验证
            if (validateDaoData(resultBean, entity, false)) {
                sendLog("");

                if (entity.isOversea()) {
                    sdkIOSOverseaDao.update(entity);
                } else {
                    // 修改
                    sdkIOSDao.update(entity);
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
    private boolean validateBaseData(ResultBean<SdkIOSEntity> resultBean, SdkIOSEntity entity, boolean isChange) {
        // 对数据对象验证
        ValidationResultBean validationResultBean = ValidationUtils.validateEntity(entity);
        sendLog("检验bean的基本数据结果 " + validationResultBean);
        if (validationResultBean.isHasErrors()) { // 存在错误
            setResultBeanError(resultBean, ValidationUtils.getFirstErrorMessage(validationResultBean));
            return false;
        }

        if (!isChange) { // 是更新和添加操作时执行以下

            if (entity.getVer() == null) {
                setResultBeanError(resultBean, "更新说明不能为空");
                return false;
            }

            // 对里面的另一个对象验证
            validationResultBean = ValidationUtils.validateEntity(entity.getVer());
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
    private boolean validateDaoData(ResultBean<SdkIOSEntity> resultBean, SdkIOSEntity entity, boolean isAdd) {

        if (!isAdd) {
            // 获取当前要修改的对象
            SdkIOSEntity daoEntity;
            if (entity.isOversea()) {
                daoEntity = sdkIOSOverseaDao.get(entity.getSdkId());
            } else {
                daoEntity = sdkIOSDao.get(entity.getSdkId());
            }
            if (daoEntity == null) {
                setResultBeanError(resultBean, "找不到此SDK");
                return false;
            }
        }

        // 判断有关数据是否已经存在
        SdkIOSEntity daoEntityByName;
        SdkIOSEntity daoEntityByCchId;
        if (entity.isOversea()) {
            daoEntityByName = sdkIOSOverseaDao.getByName(entity);
            daoEntityByCchId = sdkIOSOverseaDao.getByCchId(entity);
        } else {
            daoEntityByName = sdkIOSDao.getByName(entity);
            daoEntityByCchId = sdkIOSDao.getByCchId(entity);
        }

        if (isAdd) { // 添加操作
            if (daoEntityByName != null) {
                setResultBeanError(resultBean, "已存在此SDK名称");
                return false;
            }
            if (daoEntityByCchId != null) {
                setResultBeanError(resultBean, "已存在此渠道ID");
                return false;
            }
        } else { // 编辑操作
            if (daoEntityByName != null && !daoEntityByName.getSdkId().equals(entity.getSdkId())) {
                setResultBeanError(resultBean, "已存在此SDK名称");
                return false;
            }
            if (daoEntityByCchId != null && !daoEntityByCchId.getSdkId().equals(entity.getSdkId())) {
                setResultBeanError(resultBean, "已存在此渠道ID");
                return false;
            }
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
    private boolean handlerUploadFile(ResultBean<SdkIOSEntity> resultBean, SdkIOSEntity entity) {

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
                entity.getSdkCchId()
                        + "_" + entity.getSdkName()
                        + "v" + entity.getVer().getSdkVerName()
                        + "_" + DateUtils.getDateStringFormat(time)
                        + suffix; // 资源文件中的文件名

        // 组装路径
        String toolResRelPath = ResPathConfig.RELATIVE_PATH_RESOURCE_SDK_IOS + File.separator
                + entity.getSdkCchId() + "_" + entity.getSdkName(); // 资源相对路径
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
    public ResultBean<SdkIOSEntity> getData(String id) {
        return null;
    }
}
