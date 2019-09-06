package com.starjoys.tool.packonline.modules.system.dao;

import com.starjoys.tool.packonline.common.base.BaseDao;
import com.starjoys.tool.packonline.common.base.MyBatisDao;
import com.starjoys.tool.packonline.modules.system.entity.UserGroupEntity;

/**
 * 用户组数据访问层类
 *
 * @author Andy
 * @version 1.0
 * @create 2016/12/30
 */

@MyBatisDao
public interface UserGroupDao extends BaseDao<UserGroupEntity> {

    /**
     * 更新权限
     *
     * @param userGroupEntity 用户组对象
     * @return 结果
     */
    public int updateAuth(UserGroupEntity userGroupEntity);

}
