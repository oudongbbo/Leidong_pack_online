package com.starjoys.tool.packonline.modules.andrpack.dao;

import com.starjoys.tool.packonline.common.base.BaseDao;
import com.starjoys.tool.packonline.common.base.MyBatisDao;
import com.starjoys.tool.packonline.modules.andrpack.entity.PackPathEntity;

import java.util.List;

/**
 * 打包路径数据访问层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/18
 */

@MyBatisDao
public interface PackPathDao extends BaseDao<PackPathEntity> {

    /** 通过删除标识查找列表 **/
    List<PackPathEntity> findListByStatus(int status);

}
