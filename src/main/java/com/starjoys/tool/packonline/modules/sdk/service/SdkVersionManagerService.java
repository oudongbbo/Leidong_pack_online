package com.starjoys.tool.packonline.modules.sdk.service;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.bean.ValidationResultBean;
import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.modules.sdk.dao.SdkVersionDao;
import com.starjoys.tool.packonline.modules.sdk.dao.SdkVersionOverseaDao;
import com.starjoys.tool.packonline.modules.sdk.entity.SdkEntity;
import com.starjoys.tool.packonline.utils.ValidationUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * sdk版本业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/5/8
 */

@Service
public class SdkVersionManagerService extends BaseService implements IBaseManagerService<SdkEntity> {

    @Resource
    private SdkVersionDao sdkVersionDao;

    @Resource
    private SdkVersionOverseaDao sdkVersionOverseaDao;

    @Override
    public ResultBean<List<SdkEntity>> findAllData() {
        return null;
    }

    @Override
    public ResultBean<List<SdkEntity>> findAllData(SdkEntity entity) {
        sendLog("调用查询所有数据方法 " + entity);
        ResultBean<List<SdkEntity>> resultBean = new ResultBean<>();
        List<SdkEntity> list;
        if (entity.isOversea()) {
           list  = sdkVersionOverseaDao.findList(entity);
        } else {
            list  = sdkVersionDao.findList(entity);
        }
        if (list != null) {
            sendLog("sdkVersion去掉已经删除的");
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i).getStatus() == BaseEntity.FLAG_STATUS_DEL) {
                    list.remove(i);
                    i--;
                }
            }
        }
        setResultBean(resultBean, true, "获取成功", list);
        return resultBean;
    }

    @Override
    public ResultBean<List<SdkEntity>> findDataByPage(SdkEntity entity) {
        return findAllData(entity);
    }

    @Override
    public ResultBean<SdkEntity> addData(SdkEntity entity) {
        return null;
    }

    @Override
    public ResultBean<SdkEntity> changeStatus(String id) {
        return null;
    }

    @Override
    public ResultBean<SdkEntity> updateData(SdkEntity entity) {
        sendLog("调用编辑数据的方法 " + entity);

        ResultBean<SdkEntity> resultBean = new ResultBean<>();
        if (validateBaseData(resultBean, entity)) { // 通过验证
            if (validateDaoData(resultBean, entity)) {

                if (entity.isOversea()) {
                    // 编辑数据库的数据
                    sdkVersionOverseaDao.update(entity);
                } else {
                    // 编辑数据库的数据
                    sdkVersionDao.update(entity);
                }

                setResultBean(resultBean, true, "编辑成功");
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
    private boolean validateBaseData(ResultBean<SdkEntity> resultBean, SdkEntity entity) {
        // 对数据对象验证
        if (entity.getVer() == null) {
            setResultBeanError(resultBean, "更新说明不能为空");
            return false;
        }

        // 对版本对象验证
        ValidationResultBean validationResultBean = ValidationUtils.validateEntity(entity.getVer());
        sendLog("检验bean的基本数据结果 " + validationResultBean);
        if (validationResultBean.isHasErrors()) { // 存在错误
            setResultBeanError(resultBean, ValidationUtils.getFirstErrorMessage(validationResultBean));
            return false;
        }

        return true;
    }

    /**
     * 验证数据库数据
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     * @return 是否验证成功
     */
    private boolean validateDaoData(ResultBean<SdkEntity> resultBean, SdkEntity entity) {

        // 获取当前要修改的打包工具
        SdkEntity daoEntity;
        if (entity.isOversea()) {
            daoEntity = sdkVersionOverseaDao.get(entity.getVer().getSdkVerId());
        } else {
            daoEntity = sdkVersionDao.get(entity.getVer().getSdkVerId());
        }
        if (daoEntity == null) {
            setResultBeanError(resultBean, "找不到此SDK版本信息");
            return false;
        }

        return true;
    }

    @Override
    public ResultBean<SdkEntity> getData(String id) {
        return null;
    }
}
