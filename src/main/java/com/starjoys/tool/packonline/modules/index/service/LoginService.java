package com.starjoys.tool.packonline.modules.index.service;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.modules.system.dao.UserDao;
import com.starjoys.tool.packonline.modules.system.dao.UserGroupDao;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserGroupEntity;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 登录业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2016/12/30
 */

@Service
public class LoginService extends BaseService {

    @Resource
    private UserDao userDao;

    @Resource
    private UserGroupDao userGroupDao;

    /**
     * 用户登录业务逻辑
     *
     * @param username 用户名
     * @param password 密码
     * @return 结果信息
     */
    public ResultBean<UserEntity> login(String username, String password) {
//        sendLog("登录开始 username:" + username + " password:" + password);
        UserEntity user = userDao.get(username);
        sendLog("获取到的用户:" + user);

        ResultBean<UserEntity> resultBean = new ResultBean<>();
        resultBean.setRows(user);
        if (user == null) { // 用户不存在
            sendLog("用户不存在");
            resultBean.setSuccess(false);
            resultBean.setMessage("用户名不存在!");
        } else if (!user.getPassword().equals(password)) { // 密码不正确
            sendLog("密码不正确");
            resultBean.setSuccess(false);
            resultBean.setMessage("密码不正确!");
        } else { // 登录成功
            sendLog("用户判断成功");
            resultBean.setSuccess(true);
            resultBean.setMessage("登录成功!");
        }
        return resultBean;
    }

    /**
     * 获取对应用户组
     *
     * @param userGroupId 用户组标识
     * @return 用户组对象
     */
    public UserGroupEntity getUserGroup(String userGroupId) {
//        sendLog("获取对应的用户组 userGroupId:" + userGroupId);
        UserGroupEntity userGroupEntity = userGroupDao.get(userGroupId);
//        sendLog("对应的用户组信息 " + userGroupEntity);
        return userGroupEntity;
    }


}
