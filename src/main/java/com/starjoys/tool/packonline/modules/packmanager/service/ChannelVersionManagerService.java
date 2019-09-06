package com.starjoys.tool.packonline.modules.packmanager.service;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.modules.packmanager.dao.ChannelVersionDao;
import com.starjoys.tool.packonline.modules.packmanager.entity.ChannelEntity;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 渠道版本管理业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/2/6
 */

@Service
public class ChannelVersionManagerService extends BaseService implements IBaseManagerService<ChannelEntity> {

    @Resource
    private ChannelVersionDao channelVersionDao;

    @Override
    public ResultBean<List<ChannelEntity>> findAllData() {
        return null;
    }

    @Override
    public ResultBean<List<ChannelEntity>> findAllData(ChannelEntity entity) {
//        sendLog("调用查询所有数据方法 " + entity);
        ResultBean<List<ChannelEntity>> resultBean = new ResultBean<>();
        List<ChannelEntity> list = channelVersionDao.findList(entity);
        if (list != null) {
            sendLog("遍历渠道版本列表");
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i).getStatus() == BaseEntity.FLAG_STATUS_DEL) {
                    list.remove(i);
                    i--;
                }
            }
        }
        setResultBean(resultBean, true, "获取成功", list);
//        sendLog("查找结果 " + resultBean);
        return resultBean;
    }

    @Override
    public ResultBean<List<ChannelEntity>> findDataByPage(ChannelEntity entity) {
        return findAllData(entity);
    }

    @Override
    public ResultBean<ChannelEntity> addData(ChannelEntity entity) {
        return null;
    }


    @Override
    public ResultBean<ChannelEntity> changeStatus(String id) {
        sendLog("调用修改状态方法 " + id);
        ResultBean<ChannelEntity> resultBean = new ResultBean<>();
        channelVersionDao.delete(id);

        resultBean.setSuccess(true);
        return resultBean;
    }

    @Override
    public ResultBean<ChannelEntity> updateData(ChannelEntity entity) {
        sendLog("调用更新数据方法 " + entity);
        ResultBean<ChannelEntity> resultBean = new ResultBean<>();
        int result = channelVersionDao.update(entity);
        if (result == 1) {
            setResultBean(resultBean, true, "编辑成功");
        } else {
            setResultBeanError(resultBean, "编辑失败");
        }
        sendLog("更新数据结果 " + resultBean);
        return resultBean;
    }

    @Override
    public ResultBean<ChannelEntity> getData(String id) {
        return null;
    }
}
