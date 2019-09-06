package com.starjoys.tool.packonline.modules.system.dao;

import com.starjoys.tool.packonline.common.base.BaseDao;
import com.starjoys.tool.packonline.common.base.MyBatisDao;
import com.starjoys.tool.packonline.modules.system.entity.PackToolEntity;

/**
 * 打包工具数据访问层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/5/4
 */

@MyBatisDao
public interface PackToolDao extends BaseDao<PackToolEntity> {

    /**
     * 通过名称获取
     *
     * @return 返回列表
     */
    public PackToolEntity getByName(PackToolEntity entity);

    /**
     * 通过文件名获取
     *
     * @return 返回列表
     */
    public PackToolEntity getByFileName(PackToolEntity entity);

}
