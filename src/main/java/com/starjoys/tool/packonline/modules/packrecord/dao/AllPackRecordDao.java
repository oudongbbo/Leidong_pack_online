package com.starjoys.tool.packonline.modules.packrecord.dao;

import com.starjoys.tool.packonline.common.base.BaseDao;
import com.starjoys.tool.packonline.common.base.MyBatisDao;
import com.starjoys.tool.packonline.modules.packrecord.entity.AllPackRecordEntity;
import com.starjoys.tool.packonline.modules.packrecord.entity.MdRecordEntity;

/**
 * 推广包和渠道包，打包记录数据访问层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/13
 */

@MyBatisDao
public interface AllPackRecordDao extends BaseDao<AllPackRecordEntity> {
}
