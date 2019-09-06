package com.starjoys.tool.packonline.modules.packmanager.dao;

import com.starjoys.tool.packonline.common.base.BaseDao;
import com.starjoys.tool.packonline.common.base.MyBatisDao;
import com.starjoys.tool.packonline.modules.packmanager.entity.ChannelEntity;

/**
 * 渠道数据访问层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/16
 */

@MyBatisDao
public interface ChannelDao extends BaseDao<ChannelEntity> {

    /**
     * 通过渠道id获取渠道对象
     *
     * @param id 渠道id
     * @return 渠道数据对象
     */
    public ChannelEntity getByCchId(String id);

}
