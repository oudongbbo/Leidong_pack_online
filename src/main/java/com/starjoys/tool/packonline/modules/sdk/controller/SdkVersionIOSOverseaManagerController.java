package com.starjoys.tool.packonline.modules.sdk.controller;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseManagerController;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.sdk.entity.SdkIOSEntity;
import com.starjoys.tool.packonline.modules.sdk.service.SdkVersionIOSManagerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * sdk版本管理控制层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/5/9
 */

@Controller
@RequestMapping("/sdk/sdkVersionIOSOverseaManager")
public class SdkVersionIOSOverseaManagerController extends BaseManagerController<SdkIOSEntity> {

    @Resource
    private SdkVersionIOSManagerService sdkVersionIOSManagerService;

    @Override
    protected IBaseManagerService<SdkIOSEntity> getBaseManagerService() {
        return sdkVersionIOSManagerService;
    }

    @Override
    public String show(HttpServletRequest request, Model model) {
        sendLog("接受到显示页面的请求");
        return WebPathConfig.JSP_PATH_SDK_VERSION_IOS_OVERSEA_MANAGER;
    }

    @Override
    public ResultBean<List<SdkIOSEntity>> list(HttpServletRequest request, SdkIOSEntity entity) {
        entity.setOversea(true);
        return super.list(request, entity);
    }

    @Override
    public ResultBean<SdkIOSEntity> edit(HttpServletRequest request, SdkIOSEntity entity) {
        entity.setOversea(true);
        return super.edit(request, entity);
    }

}
