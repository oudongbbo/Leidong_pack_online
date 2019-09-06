package com.starjoys.tool.packonline.modules.index.controller;

import com.starjoys.tool.packonline.bean.HttpAttributeBean;
import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseController;
import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.index.service.LoginService;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserGroupEntity;
import com.starjoys.tool.packonline.utils.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 登录控制层类
 *
 * @author Andy
 * @version 1.0
 * @create 2016/12/30
 */

@Controller
@RequestMapping("/login")
public class LoginController extends BaseController {

    @Resource
    private LoginService loginService;

    /**
     * 显示登录界面
     *
     * @return 页面名
     */
    @RequestMapping(method = RequestMethod.GET, value = "")
    public String show() {
        sendLog("接受到get登录请求");
        return WebPathConfig.JSP_PATH_LOGIN;
    }

    /**
     * 登录处理
     *
     * @param request 请求
     * @param model   模型
     * @param session 会话
     */
    @RequestMapping(method = RequestMethod.POST, value = "")
    public String login(HttpServletRequest request, Model model, HttpSession session) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        sendLog("接受到post登录请求 username:" + username + " password: " + password);

        if (!StringUtils.isNotEmpty(username)) { // 用户名空
            sendLog("用户名为空");
            addBackToLoginAttr(model, username, password, "用户名不能为空!");
            return WebPathConfig.JSP_PATH_LOGIN;
        }
        if (!StringUtils.isNotEmpty(password)) { // 密码为空
            sendLog("密码为空");
            addBackToLoginAttr(model, username, password, "密码不能为空!");
            return WebPathConfig.JSP_PATH_LOGIN;
        }

        ResultBean<UserEntity> resultBean = loginService.login(username, password);
        if (resultBean.isSuccess()) { // 登录成功
            // 把当前用户数据保存到会话中
            sendLog("把当前用户数据保存到会话中");
            UserEntity currentUser = resultBean.getRows();
            session.setAttribute(GlobalConfig.SESSION_KEY_USER, currentUser);
            // 获取权限
            UserGroupEntity userGroupEntity = loginService.getUserGroup(String.valueOf(currentUser.getUserGroupId()));
            if (userGroupEntity != null && userGroupEntity.getStatus() == BaseEntity.FLAG_STATUS_ACTIVE) {
                // 把当前用户权限数据保存到会话中
                sendLog("把当前用户权限数据保存到会话中");
                session.setAttribute(GlobalConfig.SESSION_KEY_USER_GROUP, userGroupEntity);

                String userGroupMenus = userGroupEntity.getGroupMenus();
                if (userGroupMenus != null) { // 用户权限菜单不为空
                    sendLog("获取用户权限菜单保存到会话中");
                    session.setAttribute(GlobalConfig.SESSION_KEY_USER_GROUP_MENUS, userGroupMenus.split(","));
                }
                String userGroupActs = userGroupEntity.getGroupActs();
                if (userGroupActs != null) { // 用户权限菜单不为空
                    sendLog("获取用户权限操作保存到会话中");
                    session.setAttribute(GlobalConfig.SESSION_KEY_USER_GROUP_ACTS, userGroupActs.split(","));
                }
            }
            // 跳转主界面
            sendLog("跳转主界面");
            return WebPathConfig.REDIRECT_PATH_INDEX;
        } else { // 登录失败
            sendLog("登录失败, 返回登录页面");
            addBackToLoginAttr(model, username, password, resultBean.getMessage());
            return WebPathConfig.JSP_PATH_LOGIN;
        }
    }

    /**
     * 设置返回登录的参数
     *
     * @param model    模型
     * @param username 用户名
     * @param password 密码
     */
    private void addBackToLoginAttr(Model model, String username, String password, String errorMsg) {
        addResponseAttr(model,
                new HttpAttributeBean("username", username),
                new HttpAttributeBean("password", password),
                new HttpAttributeBean("errorMsg", errorMsg));
    }

}
