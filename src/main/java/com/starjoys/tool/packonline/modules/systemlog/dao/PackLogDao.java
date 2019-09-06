package com.starjoys.tool.packonline.modules.systemlog.dao;

import com.starjoys.tool.packonline.common.base.BaseDao;
import com.starjoys.tool.packonline.common.base.MyBatisDao;
import com.starjoys.tool.packonline.modules.systemlog.entity.PackLogEntity;

/**
 * 打包日志数据访问层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/5/2
 */

@MyBatisDao
public interface PackLogDao extends BaseDao<PackLogEntity> {
}
