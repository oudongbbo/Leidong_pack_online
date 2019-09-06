package com.starjoys.tool.packonline.modules.sdk.controller;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseManagerController;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.sdk.entity.SdkIOSEntity;
import com.starjoys.tool.packonline.modules.sdk.service.SdkIOSManagerService;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 海外sdk管理控制层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/5/9
 */

@Controller
@RequestMapping("/sdk/sdkIOSOverseaManager")
public class SdkIOSOverseaManagerController extends BaseManagerController<SdkIOSEntity> {

    @Resource
    private SdkIOSManagerService sdkIOSManagerService;


    @Override
    protected IBaseManagerService<SdkIOSEntity> getBaseManagerService() {
        return sdkIOSManagerService;
    }

    @Override
    public String show(HttpServletRequest request, Model model) {
        sendLog("接受到海外sdk ios管理页面的请求");
        model.addAttribute("sdkList", sdkIOSManagerService.findAllDataOversea().getRows());
        return WebPathConfig.JSP_PATH_SDK_IOS_OVERSEA_MANAGER;
    }

    @Override
    public ResultBean<List<SdkIOSEntity>> list(HttpServletRequest request, SdkIOSEntity entity) {
        entity.setOversea(true);
        return super.list(request, entity);
    }

    @Override
    public ResultBean<SdkIOSEntity> add(HttpServletRequest request, SdkIOSEntity entity) {
        UserEntity userEntity = (UserEntity) request.getSession(false).getAttribute(GlobalConfig.SESSION_KEY_USER);
        entity.getVer().setUs(userEntity);

        entity.setOversea(true); // 标记是海外sdk

        return super.add(request, entity);
    }

    @Override
    public ResultBean<SdkIOSEntity> edit(HttpServletRequest request, SdkIOSEntity entity) {
        UserEntity userEntity = (UserEntity) request.getSession(false).getAttribute(GlobalConfig.SESSION_KEY_USER);
        entity.getVer().setUs(userEntity);

        entity.setOversea(true); // 标记是海外sdk

        return super.edit(request, entity);
    }

    @RequestMapping("/change")
    @ResponseBody
    public ResultBean<SdkIOSEntity> change(SdkIOSEntity entity) {
        entity.setOversea(true); // 标记是海外sdk
        return sdkIOSManagerService.changeData(entity);
    }


}
