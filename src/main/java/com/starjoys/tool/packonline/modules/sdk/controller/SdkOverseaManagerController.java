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
import java.util.List;

/**
 * 海外sdk管理控制层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/5/9
 */

@Controller
@RequestMapping("/sdk/sdkOverseaManager")
public class SdkOverseaManagerController extends BaseManagerController<SdkEntity> {

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
        model.addAttribute("sdkList", sdkManagerService.findAllDataOversea().getRows());
        model.addAttribute("cchList", channelManagerService.findAllData().getRows()); // 获取渠道列表
        return WebPathConfig.JSP_PATH_SDK_OVERSEA_MANAGER;
    }

    @Override
    public ResultBean<List<SdkEntity>> list(HttpServletRequest request, SdkEntity entity) {
        entity.setOversea(true);
        return super.list(request, entity);
    }

    @Override
    public ResultBean<SdkEntity> add(HttpServletRequest request, SdkEntity entity) {
        UserEntity userEntity = (UserEntity) request.getSession(false).getAttribute(GlobalConfig.SESSION_KEY_USER);
        entity.getVer().setUs(userEntity);

        entity.setOversea(true); // 标记是海外sdk

        return super.add(request, entity);
    }

    @Override
    public ResultBean<SdkEntity> edit(HttpServletRequest request, SdkEntity entity) {
        UserEntity userEntity = (UserEntity) request.getSession(false).getAttribute(GlobalConfig.SESSION_KEY_USER);
        entity.getVer().setUs(userEntity);

        entity.setOversea(true); // 标记是海外sdk

        return super.edit(request, entity);
    }

    @RequestMapping("/change")
    @ResponseBody
    public ResultBean<SdkEntity> change(SdkEntity entity) {
        entity.setOversea(true); // 标记是海外sdk
        return sdkManagerService.changeData(entity);
    }


}
