package com.starjoys.tool.packonline.modules.system.service;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.bean.ValidationResultBean;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.modules.system.dao.CompanyDao;
import com.starjoys.tool.packonline.modules.system.entity.CompanyEntity;
import com.starjoys.tool.packonline.utils.ValidationUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * 公司管理业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/4/13
 */

@Service
public class CompanyManagerService extends BaseService implements IBaseManagerService<CompanyEntity> {

    @Resource
    private CompanyDao companyDao;

    @Override
    public ResultBean<List<CompanyEntity>> findAllData() {
        sendLog("查询所有数据");
        ResultBean<List<CompanyEntity>> resultBean = new ResultBean<>();
        List<CompanyEntity> list = companyDao.findAllList();
        if (list != null) { // 列表不为空
            setResultBean(resultBean, true, "查询成功", list);
        } else { // 列表为空
            setResultBeanError(resultBean, "查询出错");
        }
//        sendLog("返回查询结果 " + resultBean);
        return resultBean;
    }

    @Override
    public ResultBean<List<CompanyEntity>> findAllData(CompanyEntity entity) {
        return null;
    }

    @Transactional(readOnly = true)
    @Override
    public ResultBean<List<CompanyEntity>> findDataByPage(CompanyEntity entity) {
//        sendLog("分页数据查询 " + entity);
        ResultBean<List<CompanyEntity>> resultBean = new ResultBean<>();
        List<CompanyEntity> companyList = companyDao.findListByPage(entity);
        resultBean.setTotal(companyDao.findCountByPage());
        setResultBean(resultBean, true, "成功获取所有数据", companyList);
        return resultBean;
    }

    @Transactional
    @Override
    public ResultBean<CompanyEntity> addData(CompanyEntity entity) {
        ResultBean<CompanyEntity> resultBean = new ResultBean<>();
        if (validateBaseData(resultBean, entity)) // 基础数据
            if (validateDaoData(resultBean, entity, true)) // 数据库数据
                handleAddDao(resultBean, entity); // 处理
        return resultBean;
    }

    /**
     * 验证基础数据
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     * @return 是否验证成功
     */
    private boolean validateBaseData(ResultBean<CompanyEntity> resultBean, CompanyEntity entity) {
        // 对数据对象验证
        ValidationResultBean validationResultBean = ValidationUtils.validateEntity(entity);
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
     * @param isAdd      是否为添加操作
     * @return 是否验证成功
     */
    private boolean validateDaoData(ResultBean<CompanyEntity> resultBean, CompanyEntity entity, boolean isAdd) {

        // 检查是否存在
        if (!isAdd) {
            CompanyEntity daoEntity = companyDao.get(entity.getCompanyId() + "");
            if (daoEntity == null) {
                setResultBeanError(resultBean, "找不到此公司");
                return false;
            }
            entity.setCompanyName(daoEntity.getCompanyName());
        }

        List<CompanyEntity> daoList = companyDao.findList(entity);
        if (daoList.size() > 0) { // 检查存在
            if (isAdd || daoList.get(0).getCompanyId() != entity.getCompanyId()) {
                setResultBeanError(resultBean, "此公司名称已存在");
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
    private void handleAddDao(ResultBean<CompanyEntity> resultBean, CompanyEntity entity) {

        // 插入公司
        companyDao.insert(entity);

        setResultBean(resultBean, true, "添加成功");
    }


    @Override
    public ResultBean<CompanyEntity> changeStatus(String id) {
        return null;
    }


    @Transactional
    @Override
    public ResultBean<CompanyEntity> updateData(CompanyEntity entity) {
        ResultBean<CompanyEntity> resultBean = new ResultBean<>();
        if (validateBaseData(resultBean, entity)) // 基础数据
            if (validateDaoData(resultBean, entity, false)) // 数据库数据
                handleUpdateDao(resultBean, entity); // 处理
        return resultBean;
    }

    /**
     * 处理更新到数据库
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     */
    private void handleUpdateDao(ResultBean<CompanyEntity> resultBean, CompanyEntity entity) {

        // 更新公司
        companyDao.update(entity);

        setResultBean(resultBean, true, "更新成功");
    }


    @Override
    public ResultBean<CompanyEntity> getData(String id) {
        return null;
    }
}
