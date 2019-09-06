package com.starjoys.tool.packonline.modules.packrecord.service;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.modules.packrecord.dao.AllPackRecordDao;
import com.starjoys.tool.packonline.modules.packrecord.entity.AllPackRecordEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * 推广包打包记录业务逻辑层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/16
 */

@Service
public class AllPackRecordService extends BaseService implements IBaseManagerService<AllPackRecordEntity> {

    @Resource
    private AllPackRecordDao allPackRecordDao;

    @Override
    public ResultBean<List<AllPackRecordEntity>> findAllData() {
        ResultBean<List<AllPackRecordEntity>> resultBean = new ResultBean<>();

        List<AllPackRecordEntity> allPackRecordDaoAllList = allPackRecordDao.findAllList();

        sendLog("获取的推广包打包记录数据 " + allPackRecordDaoAllList);
        setResultBean(resultBean, true, "成功获取所有数据", allPackRecordDaoAllList);
        return resultBean;
    }

    @Override
    public ResultBean<List<AllPackRecordEntity>> findAllData(AllPackRecordEntity entity) {
        return null;
    }

    @Transactional(readOnly = true)
    @Override
    public ResultBean<List<AllPackRecordEntity>> findDataByPage(AllPackRecordEntity entity) {
        sendLog("分页数据查询 " + entity);
        ResultBean<List<AllPackRecordEntity>> resultBean = new ResultBean<>();
        List<AllPackRecordEntity> mdRecordList = allPackRecordDao.findListByPage(entity);
        resultBean.setTotal(allPackRecordDao.findCountByPage());
        setResultBean(resultBean, true, "成功获取所有数据", mdRecordList);
        return resultBean;
    }

    @Override
    public ResultBean<AllPackRecordEntity> addData(AllPackRecordEntity entity) {
        return null;
    }

    @Override
    public ResultBean<AllPackRecordEntity> changeStatus(String id) {
        return null;
    }

    @Override
    public ResultBean<AllPackRecordEntity> updateData(AllPackRecordEntity entity) {
        return null;
    }

    @Override
    public ResultBean<AllPackRecordEntity> getData(String id) {
        return null;
    }
}
