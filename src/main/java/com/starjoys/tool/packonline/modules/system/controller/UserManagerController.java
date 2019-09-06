package com.starjoys.tool.packonline.modules.system.controller;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseManagerController;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.index.controller.LogoutController;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserGroupEntity;
import com.starjoys.tool.packonline.modules.system.service.UserGroupManagerService;
import com.starjoys.tool.packonline.modules.system.service.UserManagerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 用户管理控制层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/3
 */

@Controller
@RequestMapping("/user")
public class UserManagerController extends BaseManagerController<UserEntity> {

    @Resource
    private UserManagerService userManagerService;

    @Resource
    private UserGroupManagerService userGroupManagerService;

    @Resource
    private LogoutController logoutController;

    @Override
    protected IBaseManagerService<UserEntity> getBaseManagerService() {
        return userManagerService;
    }

    @Override
    public String show(HttpServletRequest request, Model model) {
        sendLog("显示用户管理界面");
        ResultBean<List<UserGroupEntity>> resultBean = userGroupManagerService.findAllData();
        model.addAttribute("userGroupList", resultBean.getRows());
        return WebPathConfig.JSP_PATH_USER_MANAGER;
    }

    /**
     * 带权限进行查找所有用户
     *
     * @param request 请求
     * @return 结果
     */
    public ResultBean<List<UserEntity>> findAllListWithAuth(HttpServletRequest request) {
        UserEntity userEntity = (UserEntity) request.getSession().getAttribute(GlobalConfig.SESSION_KEY_USER);
        return userManagerService.findAllData(userEntity);
    }

    @RequestMapping("/change")
    @ResponseBody
    public ResultBean<UserEntity> change(HttpServletRequest request, UserEntity entity) {
        sendLog("修改密码 " + entity);
        return userManagerService.changePassword(entity);
    }


    @RequestMapping("/changeMyPsw")
    @ResponseBody
    public ResultBean<UserEntity> changeMyPsw(HttpServletRequest request, UserEntity entity) {
        sendLog("修改自己的密码 " + entity);
        UserEntity currentUser = getCurrentUser(request);
        entity.setUserId(currentUser.getUserId());
        return userManagerService.changePassword(entity);
    }

}
