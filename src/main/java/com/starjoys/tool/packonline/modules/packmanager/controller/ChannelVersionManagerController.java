package com.starjoys.tool.packonline.modules.packmanager.controller;

import com.starjoys.tool.packonline.common.base.BaseManagerController;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.packmanager.entity.ChannelEntity;
import com.starjoys.tool.packonline.modules.packmanager.service.ChannelVersionManagerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 渠道版本管理控制层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/2/6
 */

@Controller
@RequestMapping("/packManager/cchVersion")
public class ChannelVersionManagerController extends BaseManagerController<ChannelEntity> {

    @Resource
    private ChannelVersionManagerService channelVersionManagerService;

    @Override
    protected IBaseManagerService<ChannelEntity> getBaseManagerService() {
        return channelVersionManagerService;
    }

    @Override
    public String show(HttpServletRequest request, Model model) {
        sendLog("显示渠道版本管理页面");
        return WebPathConfig.JSP_PATH_CHANNEL_VERSION_MANAGER;
    }



}
