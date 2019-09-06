package com.starjoys.tool.packonline.modules.packrecord.service;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.modules.packrecord.dao.APKChangeDao;
import com.starjoys.tool.packonline.modules.packrecord.entity.APKChangeEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * 通用功能打包记录业务逻辑层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/16
 */

@Service
public class CommonPackRecordService extends BaseService implements IBaseManagerService<APKChangeEntity> {

    @Resource
    private APKChangeDao apkChangeDao;


    @Override
    public ResultBean<List<APKChangeEntity>> findAllData() {
        ResultBean<List<APKChangeEntity>> resultBean = new ResultBean<>();
        List<APKChangeEntity> commonRecordList = apkChangeDao.findAllList();
//        sendLog("获取的通用功能打包记录数据 " + commonRecordList);
        setResultBean(resultBean, true, "成功获取所有数据", commonRecordList);
        return resultBean;
    }

    @Override
    public ResultBean<List<APKChangeEntity>> findAllData(APKChangeEntity entity) {
        return null;
    }

    @Transactional(readOnly = true)
    @Override
    public ResultBean<List<APKChangeEntity>> findDataByPage(APKChangeEntity entity) {
//        sendLog("分页数据查询 " + entity);
        ResultBean<List<APKChangeEntity>> resultBean = new ResultBean<>();
        List<APKChangeEntity> apkChangeList = apkChangeDao.findListByPage(entity);
        resultBean.setTotal(apkChangeDao.findCountByPage());
        setResultBean(resultBean, true, "成功获取所有数据", apkChangeList);
        return resultBean;
    }

    @Override
    public ResultBean<APKChangeEntity> addData(APKChangeEntity entity) {
        return null;
    }

    @Override
    public ResultBean<APKChangeEntity> changeStatus(String id) {
        return null;
    }

    @Override
    public ResultBean<APKChangeEntity> updateData(APKChangeEntity entity) {
        return null;
    }

    @Override
    public ResultBean<APKChangeEntity> getData(String id) {
        return null;
    }
}
