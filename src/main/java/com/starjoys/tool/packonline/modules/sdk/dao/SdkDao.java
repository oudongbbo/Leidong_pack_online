package com.starjoys.tool.packonline.modules.sdk.dao;

import com.starjoys.tool.packonline.common.base.BaseDao;
import com.starjoys.tool.packonline.common.base.MyBatisDao;
import com.starjoys.tool.packonline.modules.sdk.entity.SdkEntity;

/**
 * sdk数据访问层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/5/9
 */

@MyBatisDao
public interface SdkDao extends BaseDao<SdkEntity> {

    /**
     * 通过名称获取
     *
     * @return 返回列表
     */
    public SdkEntity getByName(SdkEntity entity);

    /**
     * 通过渠道id获取
     *
     * @return 返回列表
     */
    public SdkEntity getBy_CchId(SdkEntity entity);

}
