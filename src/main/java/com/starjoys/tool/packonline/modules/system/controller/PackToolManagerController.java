package com.starjoys.tool.packonline.modules.system.controller;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseManagerController;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.system.entity.PackToolEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import com.starjoys.tool.packonline.modules.system.service.PackToolManagerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 打包工具管理控制层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/5/4
 */

@Controller
@RequestMapping("/system/packToolManager")
public class PackToolManagerController extends BaseManagerController<PackToolEntity> {

    @Resource
    private PackToolManagerService packToolManagerService;

    @Override
    protected IBaseManagerService<PackToolEntity> getBaseManagerService() {
        return packToolManagerService;
    }

    @Override
    public String show(HttpServletRequest request, Model model) {
        sendLog("接受到显示打包工具管理页面的请求");
//        addResponseAttr(model, new HttpAttributeBean("companyList", packToolManagerService.findAllData().getRows()));
        return WebPathConfig.JSP_PATH_SYSTEM_PACK_TOOL_MANAGER;
    }

    @Override
    public ResultBean<PackToolEntity> add(HttpServletRequest request, PackToolEntity entity) {
        UserEntity userEntity = (UserEntity) request.getSession(false).getAttribute(GlobalConfig.SESSION_KEY_USER);
        entity.getRecord().setUs(userEntity);
        return super.add(request, entity);
    }

    @Override
    public ResultBean<PackToolEntity> edit(HttpServletRequest request, PackToolEntity entity) {
        UserEntity userEntity = (UserEntity) request.getSession(false).getAttribute(GlobalConfig.SESSION_KEY_USER);
        entity.getRecord().setUs(userEntity);
        return super.edit(request, entity);
    }

    @RequestMapping("/change")
    @ResponseBody
    public ResultBean<PackToolEntity> change(HttpServletRequest request, PackToolEntity entity) {
        return packToolManagerService.changeData(entity);
    }


}
