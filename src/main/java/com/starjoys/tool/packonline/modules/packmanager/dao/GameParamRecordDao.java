package com.starjoys.tool.packonline.modules.packmanager.dao;

import com.starjoys.tool.packonline.common.base.BaseDao;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameParamEntity;

/**
 * 游戏参数记录数据层访问类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/2/10
 */

public interface GameParamRecordDao extends BaseDao<GameParamEntity> {

    /**
     * 更新是否最新标识
     *
     * @param entity 数据对象
     * @return 结果
     */
    public int updateIsNew(GameParamEntity entity);

    /**
     * 更新游戏参数数据
     *
     * @param entity 数据对象
     * @return 结果
     */
    public int updateRecordData(GameParamEntity entity);


}
