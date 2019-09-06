package com.starjoys.tool.packonline.modules.packrecord.service;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.modules.packrecord.dao.MdRecordDao;
import com.starjoys.tool.packonline.modules.packrecord.entity.MdRecordEntity;
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
public class MdPackRecordService extends BaseService implements IBaseManagerService<MdRecordEntity> {

    @Resource
    private MdRecordDao mdRecordDao;

    @Override
    public ResultBean<List<MdRecordEntity>> findAllData() {
        ResultBean<List<MdRecordEntity>> resultBean = new ResultBean<>();
        List<MdRecordEntity> mdRecordList = mdRecordDao.findAllList();
        sendLog("获取的推广包打包记录数据 " + mdRecordList);
        setResultBean(resultBean, true, "成功获取所有数据", mdRecordList);
        return resultBean;
    }

    @Override
    public ResultBean<List<MdRecordEntity>> findAllData(MdRecordEntity entity) {
        return null;
    }

    @Transactional(readOnly = true)
    @Override
    public ResultBean<List<MdRecordEntity>> findDataByPage(MdRecordEntity entity) {
        sendLog("分页数据查询 " + entity);
        ResultBean<List<MdRecordEntity>> resultBean = new ResultBean<>();
        List<MdRecordEntity> mdRecordList = mdRecordDao.findListByPage(entity);
        resultBean.setTotal(mdRecordDao.findCountByPage());
        setResultBean(resultBean, true, "成功获取所有数据", mdRecordList);
        return resultBean;
    }

    @Override
    public ResultBean<MdRecordEntity> addData(MdRecordEntity entity) {
        return null;
    }

    @Override
    public ResultBean<MdRecordEntity> changeStatus(String id) {
        return null;
    }

    @Override
    public ResultBean<MdRecordEntity> updateData(MdRecordEntity entity) {
        return null;
    }

    @Override
    public ResultBean<MdRecordEntity> getData(String id) {
        return null;
    }
}
