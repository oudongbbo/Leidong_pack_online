package com.starjoys.tool.packonline.modules.systemlog.dao;

import com.starjoys.tool.packonline.common.base.BaseDao;
import com.starjoys.tool.packonline.common.base.MyBatisDao;
import com.starjoys.tool.packonline.modules.systemlog.entity.ActionLogEntity;

/**
 * 操作日志数据访问层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/16
 */

@MyBatisDao
public interface ActionLogDao extends BaseDao<ActionLogEntity> {
}
