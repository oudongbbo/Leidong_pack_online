package com.starjoys.tool.packonline.modules.packrecord.dao;

import com.starjoys.tool.packonline.common.base.BaseDao;
import com.starjoys.tool.packonline.common.base.MyBatisDao;
import com.starjoys.tool.packonline.modules.packrecord.entity.ChannelFileEntity;

/**
 * 渠道打包记录数据访问层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/16
 */

@MyBatisDao
public interface ChannelRecordDao extends BaseDao<ChannelFileEntity> {
}
