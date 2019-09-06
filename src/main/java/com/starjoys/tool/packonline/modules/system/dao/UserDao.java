package com.starjoys.tool.packonline.modules.system.dao;

import com.starjoys.tool.packonline.common.base.BaseDao;
import com.starjoys.tool.packonline.common.base.MyBatisDao;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;

/**
 * 用户数据访问层接口
 *
 * @author Andy
 * @version 1.0
 * @create 2016/12/30
 */

@MyBatisDao
public interface UserDao extends BaseDao<UserEntity> {

    /**
     * 通过用户id查找用户
     *
     * @param entity 用户
     * @return 用户对象
     */
    public UserEntity getById(UserEntity entity);

    /**
     * 通过用户名查找用户
     *
     * @param username 用户名
     * @return 用户对象
     */
    public UserEntity getByUsername(String username);

    /**
     * 修改密码
     *
     * @param entity 数据对象
     * @return 用户对象
     */
    public int updatePassword(UserEntity entity);

}
