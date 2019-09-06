package com.starjoys.tool.packonline.modules.packmanager.dao;

import com.starjoys.tool.packonline.common.base.BaseDao;
import com.starjoys.tool.packonline.common.base.MyBatisDao;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameEntity;

/**
 * 游戏版本信息数据访问层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/16
 */

@MyBatisDao
public interface GameVersionDao extends BaseDao<GameEntity> {

    /**
     * 更新是否最新标识
     *
     * @param entity 数据对象
     * @return 结果
     */
    public int updateIsNew(GameEntity entity);

    /**
     * 删除所有对应的游戏版本信息
     *
     * @param id 游戏id
     * @return 结果
     */
    public int deleteAll(String id);

    /**
     * 更新路径
     * @return 结果
     */
    public int updatePath(GameEntity entity);

}
