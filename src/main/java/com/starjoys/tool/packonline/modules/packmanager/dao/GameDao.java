package com.starjoys.tool.packonline.modules.packmanager.dao;

import com.starjoys.tool.packonline.common.base.BaseDao;
import com.starjoys.tool.packonline.common.base.MyBatisDao;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameEntity;

/**
 * 游戏信息数据访问层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/16
 */

@MyBatisDao
public interface GameDao extends BaseDao<GameEntity> {

    /**
     * 通过游戏id获取游戏对象
     *
     * @param id 游戏id
     * @return 游戏数据对象
     */
    public GameEntity getByGameId(String id);

    /**
     * 通过游戏标识获取游戏对象
     *
     * @param gameShortName 游戏标识
     * @return 游戏数据对象
     */
    public GameEntity getByGameShortName(String gameShortName);

    /**
     * 获取指定id的带版本的游戏对象
     *
     * @param id
     * @return 游戏数据对象
     */
    public GameEntity getWithVer(String id);

}
