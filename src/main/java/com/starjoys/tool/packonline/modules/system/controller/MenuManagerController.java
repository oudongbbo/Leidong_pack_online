package com.starjoys.tool.packonline.modules.system.controller;

import com.starjoys.tool.packonline.common.base.BaseManagerController;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.system.entity.MenuEntity;
import com.starjoys.tool.packonline.modules.system.service.MenuManagerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 菜单管理控制器类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/4
 */

@Controller
@RequestMapping("/system/menuManager")
public class MenuManagerController extends BaseManagerController<MenuEntity> {

    @Resource
    private MenuManagerService menuManagerService;

    @Override
    protected IBaseManagerService<MenuEntity> getBaseManagerService() {
        return menuManagerService;
    }

    @Override
    public String show(HttpServletRequest request, Model model) {
        return WebPathConfig.JSP_PATH_SYSTEM_MENU_MANAGER;
    }

}
