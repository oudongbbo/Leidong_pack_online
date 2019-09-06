package com.starjoys.tool.packonline.modules.system.controller;

import com.alibaba.fastjson.JSON;
import com.starjoys.tool.packonline.bean.HttpAttributeBean;
import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseManagerController;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.system.entity.UserGroupEntity;
import com.starjoys.tool.packonline.modules.system.service.CompanyManagerService;
import com.starjoys.tool.packonline.modules.system.service.MenuManagerService;
import com.starjoys.tool.packonline.modules.system.service.UserGroupManagerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 用户组管理控制器类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/4
 */

@Controller
@RequestMapping("/system/userGroupManager")
public class UserGroupManagerController extends BaseManagerController<UserGroupEntity> {

    @Resource
    private UserGroupManagerService userGroupManagerService;

    @Resource
    private MenuManagerService menuManagerService;

    @Resource
    private CompanyManagerService companyManagerService;

    @Override
    protected IBaseManagerService<UserGroupEntity> getBaseManagerService() {
        return userGroupManagerService;
    }

    @Override
    public String show(HttpServletRequest request, Model model) {
        addResponseAttr(model,
                new HttpAttributeBean("groupList", userGroupManagerService.findAllData().getRows()),
                new HttpAttributeBean("companyList", companyManagerService.findAllData().getRows()),
                new HttpAttributeBean("menuListJson",
                        JSON.toJSONString(menuManagerService.findDataByStatus().getRows())));
        return WebPathConfig.JSP_PATH_SYSTEM_USER_GROUP_MANAGER;
    }


    @RequestMapping("/authSet")
    @ResponseBody
    public ResultBean<UserGroupEntity> authSet(UserGroupEntity userGroupEntity) {
        return userGroupManagerService.updateAuth(userGroupEntity);
    }

}
