package com.starjoys.tool.packonline.modules.toolboxrecord.service;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.modules.toolboxrecord.dao.IconMergeRecordDao;
import com.starjoys.tool.packonline.modules.toolboxrecord.entity.IconMergeRecordEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * 渠道打包记录业务逻辑层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/16
 */

@Service
public class IconMergeRecordService extends BaseService implements IBaseManagerService<IconMergeRecordEntity> {

    @Resource
    private IconMergeRecordDao iconMergeRecordDao;

    @Override
    public ResultBean<List<IconMergeRecordEntity>> findAllData() {
        return null;
    }

    @Override
    public ResultBean<List<IconMergeRecordEntity>> findAllData(IconMergeRecordEntity entity) {
        return null;
    }

    @Transactional(readOnly = true)
    @Override
    public ResultBean<List<IconMergeRecordEntity>> findDataByPage(IconMergeRecordEntity entity) {
//        sendLog("分页数据查询 " + entity);
        ResultBean<List<IconMergeRecordEntity>> resultBean = new ResultBean<>();
        List<IconMergeRecordEntity> iconMergeRecordList = iconMergeRecordDao.findListByPage(entity);
        resultBean.setTotal(iconMergeRecordDao.findCountByPage());
        setResultBean(resultBean, true, "成功获取所有数据", iconMergeRecordList);
        return resultBean;
    }

    @Override
    public ResultBean<IconMergeRecordEntity> addData(IconMergeRecordEntity entity) {
        return null;
    }

    @Override
    public ResultBean<IconMergeRecordEntity> changeStatus(String id) {
        return null;
    }

    @Override
    public ResultBean<IconMergeRecordEntity> updateData(IconMergeRecordEntity entity) {
        return null;
    }

    @Override
    public ResultBean<IconMergeRecordEntity> getData(String id) {
        return null;
    }
}
