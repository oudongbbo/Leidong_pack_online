package com.starjoys.tool.packonline.modules.packmanager.controller;

import com.starjoys.tool.packonline.bean.HttpAttributeBean;
import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseManagerController;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.packmanager.entity.ChannelEntity;
import com.starjoys.tool.packonline.modules.packmanager.service.ChannelManagerService;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 渠道管理控制层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/23
 */

@Controller
@RequestMapping("/packManager/cch")
public class ChannelManagerController extends BaseManagerController<ChannelEntity> {

    @Resource
    private ChannelManagerService channelManagerService;

    @Override
    protected IBaseManagerService<ChannelEntity> getBaseManagerService() {
        return channelManagerService;
    }

    @Override
    public String show(HttpServletRequest request, Model model) {
        addResponseAttr(model,
                new HttpAttributeBean("cchList", channelManagerService.findAllData().getRows()));
        return WebPathConfig.JSP_PATH_CHANNEL_MANAGER;
    }

    @Override
    public ResultBean<ChannelEntity> add(HttpServletRequest request, ChannelEntity entity) {
        sendLog("添加数据user " + entity);
        UserEntity userEntity = (UserEntity) request.getSession(false).getAttribute(GlobalConfig.SESSION_KEY_USER);
        entity.getVer().setUser(userEntity);
        return channelManagerService.addData(entity);
    }

    @Override
    public ResultBean<ChannelEntity> edit(HttpServletRequest request, ChannelEntity entity) {
        sendLog("更新数据user " + entity);
        UserEntity userEntity = (UserEntity) request.getSession(false).getAttribute(GlobalConfig.SESSION_KEY_USER);
        entity.getVer().setUser(userEntity);
        return channelManagerService.updateData(entity);
    }

    /**
     * 修改数据
     *
     * @param entity 更改后的数据
     * @return 处理结果
     */
    @RequestMapping("/change")
    @ResponseBody
    public ResultBean<ChannelEntity> change(HttpServletRequest request, ChannelEntity entity) {
        sendLog("修改数据change " + entity);
        return channelManagerService.changeData(entity);
    }

}
