package com.starjoys.tool.packonline.modules.sdk.dao;

import com.starjoys.tool.packonline.common.base.BaseDao;
import com.starjoys.tool.packonline.common.base.MyBatisDao;
import com.starjoys.tool.packonline.modules.sdk.entity.SdkIOSEntity;

/**
 * sdk ios数据访问层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/5/18
 */

@MyBatisDao
public interface SdkIOSDao extends BaseDao<SdkIOSEntity> {

    /**
     * 通过名称获取
     *
     * @return 返回列表
     */
    public SdkIOSEntity getByName(SdkIOSEntity entity);

    /**
     * 通过渠道id获取
     *
     * @return 返回列表
     */
    public SdkIOSEntity getByCchId(SdkIOSEntity entity);



}
