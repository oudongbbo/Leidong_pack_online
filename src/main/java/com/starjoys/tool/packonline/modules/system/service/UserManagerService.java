package com.starjoys.tool.packonline.modules.system.service;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.bean.ValidationResultBean;
import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.modules.system.dao.UserDao;
import com.starjoys.tool.packonline.modules.system.dao.UserGroupDao;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserGroupEntity;
import com.starjoys.tool.packonline.utils.StringUtils;
import com.starjoys.tool.packonline.utils.ValidationUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.List;

/**
 * 用户管理业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/3
 */

@Service
public class UserManagerService extends BaseService implements IBaseManagerService<UserEntity> {

    @Resource
    private UserDao userDao;

    @Resource
    private UserGroupDao userGroupDao;

    @Override
    public ResultBean<List<UserEntity>> findAllData() {
//        sendLog("查找所有");
        ResultBean<List<UserEntity>> resultBean = new ResultBean<>();
        List<UserEntity> userEntityList = userDao.findAllList();
        if (userEntityList != null) {
            sendLog("获取所有数据成功");
            resultBean.setSuccess(true);
            resultBean.setMessage("获取所有数据成功");
            resultBean.setRows(userEntityList);
        } else {
            sendLog("获取所有数据失败");
            resultBean.setSuccess(true);
            resultBean.setMessage("获取所有数据失败");
        }
        return resultBean;
    }

    @Override
    public ResultBean<List<UserEntity>> findAllData(UserEntity entity) {
        sendLog("查找所有");
        ResultBean<List<UserEntity>> resultBean = new ResultBean<>();
        List<UserEntity> userEntityList = userDao.findList(entity);
        if (userEntityList != null) {
            resultBean.setSuccess(true);
            resultBean.setMessage("获取所有数据成功");
            resultBean.setRows(userEntityList);
        } else {
            resultBean.setSuccess(true);
            resultBean.setMessage("获取所有数据失败");
        }
        return resultBean;
    }

    @Override
    public ResultBean<List<UserEntity>> findDataByPage(UserEntity entity) {
        return null;
    }

    @Override
    public ResultBean<UserEntity> addData(UserEntity entity) {
        sendLog("开始添加数据");
        ResultBean<UserEntity> resultBean = new ResultBean<>();

        // 初步验证提交的表单
        sendLog("初步验证提交的表单");
        ValidationResultBean validationResult = ValidationUtils.validateEntity(entity);
        sendLog("验证结果 " + validationResult);
        if (validationResult.isHasErrors()) { // 验证失败
            String message = ValidationUtils.getFirstErrorMessage(validationResult);
            if (message == null) {
                message = "验证失败";
            }
            sendLog("验证失败 " + message);
            resultBean.setSuccess(false);
            resultBean.setMessage(message);
            return resultBean;
        }

        // 去掉所有空格
        entity.setUsername(entity.getUsername().replaceAll(" ", ""));

        // 通用数据验证
        String message = commonValidData(entity);
        sendLog("通用数据验证结果 " + message);
        if (message != null) {
            sendLog("通用验证失败");
            resultBean.setSuccess(false);
            resultBean.setMessage(message);
            return resultBean;
        }

        // 生成注册时间， 并调用插入数据
        String dateTime = new Timestamp(System.currentTimeMillis()).toString();
        sendLog("生成注册时间 " + dateTime);
        entity.setCreateTime(dateTime);
        sendLog("验证成功, 插入数据");
        int result = userDao.insert(entity);
        sendLog("插入数据结果 " + result);
        if (result == 1) { // 成功
            sendLog("添加数据成功");
            resultBean.setSuccess(true);
            resultBean.setMessage("添加数据成功");
        } else { // 失败
            sendLog("添加数据失败");
            resultBean.setSuccess(false);
            resultBean.setMessage("添加数据失败");
        }
        return resultBean;
    }

    @Override
    public ResultBean<UserEntity> changeStatus(String id) {
        sendLog("开始改变状态");
        int result = userDao.delete(id);
        sendLog("改变状态结果 " + result);
        ResultBean<UserEntity> resultBean = new ResultBean<>();
        if (result == 1) { // 成功
            sendLog("改变状态成功");
            resultBean.setSuccess(true);
            resultBean.setMessage("改变状态成功");
        } else {
            sendLog("改变状态失败");
            resultBean.setSuccess(false);
            resultBean.setMessage("改变状态失败");
        }
        return resultBean;
    }

    @Override
    public ResultBean<UserEntity> updateData(UserEntity entity) {
        sendLog("开始修改数据");
        ResultBean<UserEntity> resultBean = new ResultBean<>();

        // 初步验证提交的表单
        sendLog("初步验证提交的表单");
        ValidationResultBean validationResult = ValidationUtils.validateProperty(entity, new String[] {
                "username", "realname", "userGroupId", "email", "status"
        });
        sendLog("验证结果 " + validationResult);
        if (validationResult.isHasErrors()) { // 验证失败
            String message = ValidationUtils.getFirstErrorMessage(validationResult);
            if (message == null) {
                message = "验证失败";
            }
            sendLog("修改验证失败 " + message);
            resultBean.setSuccess(false);
            resultBean.setMessage(message);
            return resultBean;
        }

        // 通用数据验证
        String message = commonValidData(entity);
        sendLog("通用数据验证结果 " + message);
        if (message != null) {
            sendLog("修改数据的通用验证失败");
            resultBean.setSuccess(false);
            resultBean.setMessage(message);
            return resultBean;
        }

        int result = userDao.update(entity);
        sendLog("修改数据结果 " + result);
        if (result == 1) { // 成功
            sendLog("修改数据成功");
            resultBean.setSuccess(true);
            resultBean.setMessage("添加数据成功");
        } else { // 失败
            sendLog("修改数据失败");
            resultBean.setSuccess(false);
            resultBean.setMessage("添加数据失败");
        }
        return resultBean;
    }

    @Override
    public ResultBean<UserEntity> getData(String id) {
        return null;
    }

    /**
     * 通用数据验证
     *
     * @param userEntity 用户对象
     * @return 验证结果信息
     */
    private String commonValidData(UserEntity userEntity) {
        sendLog("通用数据验证");

        UserEntity userEntityDb = userDao.getByUsername(userEntity.getUsername());
        if (userEntityDb != null && userEntityDb.getUserId() != userEntity.getUserId()) {
            return "用户名已存在";
        }

        UserGroupEntity userGroupEntity = userGroupDao.get(userEntity.getUserGroupId() + "");
        if (userGroupEntity == null || userGroupEntity.getStatus() == BaseEntity.FLAG_STATUS_DEL) {
            return "此用户组不存在";
        }

        return null;
    }


    @Transactional
    public ResultBean<UserEntity> changePassword(UserEntity userEntity) {
        ResultBean<UserEntity> resultBean = new ResultBean<>();

        String oldPassword = userEntity.getOldPassword();
        String password = userEntity.getPassword();
        String confirmPassword = userEntity.getConfirmPassword();

        if (baseValidPassword(resultBean, oldPassword, "旧密码")
                && baseValidPassword(resultBean, password, "密码")
                && baseValidPassword(resultBean, confirmPassword, "确认密码")) {

            if (password.equals(confirmPassword)) {
                UserEntity daoEntity = userDao.getById(userEntity);
                sendLog("获取用户信息:" + daoEntity);
                if (daoEntity != null) {
                    if (daoEntity.getPassword().equals(oldPassword)) { // 验证旧密码是否相等
                        userEntity.setPassword(password);
                        userDao.updatePassword(userEntity); // 修改密码

                        setResultBean(resultBean, true, "密码修改成功");
                    } else {
                        setResultBeanError(resultBean, "旧密码不正确");
                    }
                } else {
                    setResultBeanError(resultBean, "找不到此用户或被禁用了");
                }
            } else {
                setResultBeanError(resultBean, "两次密码不相同");
            }
        }

        return resultBean;
    }

    private boolean baseValidPassword(ResultBean<UserEntity> resultBean, String password, String hint) {
        if (!StringUtils.isNotEmpty(password)) {
            setResultBeanError(resultBean, hint + "不能为空");
            return false;
        }

        if (password.length() < 6 || password.length() > 16) {
            setResultBeanError(resultBean, hint + "长度只能为6~16");
            return false;
        }

        return true;
    }



}
