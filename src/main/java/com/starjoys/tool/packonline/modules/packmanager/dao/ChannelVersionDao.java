package com.starjoys.tool.packonline.modules.packmanager.dao;

import com.starjoys.tool.packonline.common.base.BaseDao;
import com.starjoys.tool.packonline.common.base.MyBatisDao;
import com.starjoys.tool.packonline.modules.packmanager.entity.ChannelEntity;

/**
 * 渠道版本数据访问层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/16
 */

@MyBatisDao
public interface ChannelVersionDao extends BaseDao<ChannelEntity> {

    /**
     * 更新是否最新标识
     *
     * @param entity 数据对象
     * @return 结果
     */
    public int updateIsNew(ChannelEntity entity);

    /**
     * 删除所有对应的渠道版本信息
     *
     * @param id 渠道id
     * @return 结果
     */
    public int deleteAll(String id);

}
