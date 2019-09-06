package com.starjoys.tool.packonline.modules.system.dao;

import com.starjoys.tool.packonline.common.base.BaseDao;
import com.starjoys.tool.packonline.common.base.MyBatisDao;
import com.starjoys.tool.packonline.modules.system.entity.MenuEntity;

import java.util.List;
import java.util.Map;

/**
 * 菜单数据访问层接口类
 *
 * @author Andy
 * @version 1.0
 * @create 2016/12/29
 */

@MyBatisDao
public interface MenuDao extends BaseDao<MenuEntity> {

    /**
     * 通过多个id查找多个菜单
     *
     * @param paramMap 集合
     * @return 菜单列表
     */
    public List<MenuEntity> findChildOrParentListByIds(Map<String, Object> paramMap);

    /**
     * 通过网址查找对应的菜单对象
     *
     * @param menuUrl 菜单网址
     * @return 菜单对象
     */
    public MenuEntity getByMenuUrl(String menuUrl);

    /**
     * 通过父id查找树形列表
     *
     * @param parentId 菜单父id
     * @return 菜单列表
     */
    public List<MenuEntity> findTreeListByParentId(int parentId);

    /**
     * 通过菜单名或菜单链接查找列表
     *
     * @param menuName 菜单名称
     * @param menuUrl  菜单链接
     * @return 菜单列表
     */
    public List<MenuEntity> findListByNameOrUrl(String menuName, String menuUrl);

    /**
     * 通过菜单名或菜单链接并排除相同id查找列表
     *
     * @param menuName 菜单名称
     * @param menuUrl  菜单链接
     * @param menuId   菜单id
     * @return 菜单列表
     */
    public List<MenuEntity> findListByNameOrUrlWithoutId(String menuName, String menuUrl, int menuId);

    /**
     * 更新所有与父菜单相关的模块id
     *
     * @param menuParentId 父菜单id
     * @return 结果
     */
    public int updateAllModuleIdByParentId(int menuParentId);

    /**
     * 通过多个id查找相关的父id并且去除本身是父类的菜单
     *
     * @param ids id字符串数组
     * @return 菜单的父类id列表
     */
    public List<Integer> findParentIdListByIdsWithoutParent(String[] ids);


}
