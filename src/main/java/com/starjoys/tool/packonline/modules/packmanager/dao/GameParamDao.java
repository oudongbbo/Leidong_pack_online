package com.starjoys.tool.packonline.modules.packmanager.dao;

import com.starjoys.tool.packonline.common.base.BaseDao;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameParamEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 游戏参数数据层访问类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/2/10
 */

public interface GameParamDao extends BaseDao<GameParamEntity> {

    /**
     * 通过主键获取游戏参数对象
     *
     * @param gameId 游戏ID
     * @param cchId  渠道ID
     * @return 游戏参数对象
     */
    public GameParamEntity getByKeyWithActive(String gameId, String cchId);


    /**
     * 通过多个id查找出游戏参数列表
     *
     * @param list 游戏参数id列表
     * @return 游戏参数列表
     */
    public List<GameParamEntity> findListByIds(@Param("list")List<String> list);

}
