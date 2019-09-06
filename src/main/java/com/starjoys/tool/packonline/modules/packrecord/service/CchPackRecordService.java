package com.starjoys.tool.packonline.modules.packrecord.service;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.modules.packrecord.dao.ChannelRecordDao;
import com.starjoys.tool.packonline.modules.packrecord.entity.ChannelFileEntity;
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
public class CchPackRecordService extends BaseService implements IBaseManagerService<ChannelFileEntity> {

    @Resource
    private ChannelRecordDao channelRecordDao;

    @Override
    public ResultBean<List<ChannelFileEntity>> findAllData() {
        ResultBean<List<ChannelFileEntity>> resultBean = new ResultBean<>();
        List<ChannelFileEntity> channelRecordList = channelRecordDao.findAllList();
//        sendLog("获取的渠道打包记录数据 " + channelRecordList);
        setResultBean(resultBean, true, "成功获取所有数据", channelRecordList);
        return resultBean;
    }

    @Override
    public ResultBean<List<ChannelFileEntity>> findAllData(ChannelFileEntity entity) {
        return null;
    }

    @Transactional(readOnly = true)
    @Override
    public ResultBean<List<ChannelFileEntity>> findDataByPage(ChannelFileEntity entity) {
//        sendLog("分页数据查询 " + entity);
        ResultBean<List<ChannelFileEntity>> resultBean = new ResultBean<>();
        List<ChannelFileEntity> cchRecordList = channelRecordDao.findListByPage(entity);
        resultBean.setTotal(channelRecordDao.findCountByPage());
        setResultBean(resultBean, true, "成功获取所有数据", cchRecordList);
        return resultBean;
    }

    @Override
    public ResultBean<ChannelFileEntity> addData(ChannelFileEntity entity) {
        return null;
    }

    @Override
    public ResultBean<ChannelFileEntity> changeStatus(String id) {
        return null;
    }

    @Override
    public ResultBean<ChannelFileEntity> updateData(ChannelFileEntity entity) {
        return null;
    }

    @Override
    public ResultBean<ChannelFileEntity> getData(String id) {
        return null;
    }
}
