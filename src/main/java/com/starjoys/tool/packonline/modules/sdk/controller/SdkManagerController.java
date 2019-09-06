package com.starjoys.tool.packonline.modules.sdk.controller;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseManagerController;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.packmanager.service.ChannelManagerService;
import com.starjoys.tool.packonline.modules.sdk.entity.SdkEntity;
import com.starjoys.tool.packonline.modules.sdk.service.SdkManagerService;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * sdk管理控制层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/5/9
 */

@Controller
@RequestMapping("/sdk/sdkManager")
public class SdkManagerController extends BaseManagerController<SdkEntity> {

    @Resource
    private SdkManagerService sdkManagerService;

    @Resource
    private ChannelManagerService channelManagerService;

    @Override
    protected IBaseManagerService<SdkEntity> getBaseManagerService() {
        return sdkManagerService;
    }

    @Override
    public String show(HttpServletRequest request, Model model) {
        sendLog("接受到国内sdk管理页面的请求");
        model.addAttribute("sdkList", sdkManagerService.findAllData().getRows());
        model.addAttribute("cchList", channelManagerService.findAllData().getRows()); // 获取渠道列表
        return WebPathConfig.JSP_PATH_SDK_MANAGER;
    }

    @Override
    public ResultBean<SdkEntity> add(HttpServletRequest request, SdkEntity entity) {
        UserEntity userEntity = (UserEntity) request.getSession(false).getAttribute(GlobalConfig.SESSION_KEY_USER);
        entity.getVer().setUs(userEntity);
        return super.add(request, entity);
    }

    @Override
    public ResultBean<SdkEntity> edit(HttpServletRequest request, SdkEntity entity) {
        UserEntity userEntity = (UserEntity) request.getSession(false).getAttribute(GlobalConfig.SESSION_KEY_USER);
        entity.getVer().setUs(userEntity);
        return super.edit(request, entity);
    }

    @RequestMapping("/change")
    @ResponseBody
    public ResultBean<SdkEntity> change(SdkEntity entity) {
        return sdkManagerService.changeData(entity);
    }


}
