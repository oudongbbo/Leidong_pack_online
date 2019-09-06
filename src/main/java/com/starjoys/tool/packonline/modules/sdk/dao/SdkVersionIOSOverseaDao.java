package com.starjoys.tool.packonline.modules.sdk.dao;

import com.starjoys.tool.packonline.common.base.BaseDao;
import com.starjoys.tool.packonline.common.base.MyBatisDao;
import com.starjoys.tool.packonline.modules.sdk.entity.SdkIOSEntity;

/**
 * sdk版本 ios海外基础数据访问层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/5/19
 */

@MyBatisDao
public interface SdkVersionIOSOverseaDao extends BaseDao<SdkIOSEntity> {

    /**
     * 更新是否最新
     *
     * @param entity 数据对象
     * @return 结果
     */
    public int updateIsNew(SdkIOSEntity entity);

}
