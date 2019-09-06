package com.starjoys.tool.packonline.modules.system.controller;

import com.starjoys.tool.packonline.common.base.BaseManagerController;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.system.entity.PackToolEntity;
import com.starjoys.tool.packonline.modules.system.service.PackToolRecordManagerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 打包工具记录管理控制层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/5/8
 */

@Controller
@RequestMapping("/system/packToolRecordManager")
public class PackToolRecordManagerController extends BaseManagerController<PackToolEntity> {

    @Resource
    private PackToolRecordManagerService packToolRecordManagerService;

    @Override
    protected IBaseManagerService<PackToolEntity> getBaseManagerService() {
        return packToolRecordManagerService;
    }

    @Override
    public String show(HttpServletRequest request, Model model) {
        sendLog("接受到显示打包工具管理页面的请求");
        return WebPathConfig.JSP_PATH_SYSTEM_PACK_TOOL_RECORD_MANAGER;
    }

}
