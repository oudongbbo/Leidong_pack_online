package com.starjoys.tool.packonline.modules.system.service;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.bean.ValidationResultBean;
import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.modules.system.dao.PackToolRecordDao;
import com.starjoys.tool.packonline.modules.system.entity.PackToolEntity;
import com.starjoys.tool.packonline.utils.ValidationUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 打包工具业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/5/4
 */

@Service
public class PackToolRecordManagerService extends BaseService implements IBaseManagerService<PackToolEntity> {

    @Resource
    private PackToolRecordDao packToolRecordDao;

    @Override
    public ResultBean<List<PackToolEntity>> findAllData() {
        return null;
    }

    @Override
    public ResultBean<List<PackToolEntity>> findAllData(PackToolEntity entity) {
        sendLog("调用查询所有数据方法 " + entity);
        ResultBean<List<PackToolEntity>> resultBean = new ResultBean<>();
        List<PackToolEntity> list = packToolRecordDao.findList(entity);
        if (list != null) {
            sendLog("PackToolRecord去掉已经删除的");
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
    public ResultBean<List<PackToolEntity>> findDataByPage(PackToolEntity entity) {
        return findAllData(entity);
    }

    @Override
    public ResultBean<PackToolEntity> addData(PackToolEntity entity) {
        return null;
    }

    @Override
    public ResultBean<PackToolEntity> changeStatus(String id) {
        return null;
    }

    /**
     * 验证基础数据
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     * @return 是否验证成功
     */
    private boolean validateBaseData(ResultBean<PackToolEntity> resultBean, PackToolEntity entity) {
        // 对数据对象验证
        if (entity.getRecord() == null) {
            setResultBeanError(resultBean, "更新说明不能为空");
            return false;
        }

        // 对打包记录对象验证
        ValidationResultBean validationResultBean = ValidationUtils.validateEntity(entity.getRecord());
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
    private boolean validateDaoData(ResultBean<PackToolEntity> resultBean, PackToolEntity entity) {

        // 获取当前要修改的打包工具
        PackToolEntity daoEntity = packToolRecordDao.get(entity.getRecord().getPtRecordId() + "");
        if (daoEntity == null) {
            setResultBeanError(resultBean, "找不到此打包工具记录");
            return false;
        }

        return true;
    }

    @Override
    public ResultBean<PackToolEntity> updateData(PackToolEntity entity) {
        sendLog("调用编辑数据的方法 " + entity);

        ResultBean<PackToolEntity> resultBean = new ResultBean<>();
        if (validateBaseData(resultBean, entity)) { // 通过验证
            if (validateDaoData(resultBean, entity)) {
                // 编辑打包工具记录
                packToolRecordDao.update(entity);

                setResultBean(resultBean, true, "编辑成功");
            }

        }
        sendLog("编辑数据的结果 " + resultBean);
        return resultBean;
    }

    @Override
    public ResultBean<PackToolEntity> getData(String id) {
        return null;
    }


}
