package com.starjoys.tool.packonline.modules.packmanager.controller;

import com.alibaba.fastjson.JSON;
import com.starjoys.tool.packonline.bean.HttpAttributeBean;
import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseManagerController;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.packmanager.entity.ChannelEntity;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameParamEntity;
import com.starjoys.tool.packonline.modules.packmanager.service.ChannelManagerService;
import com.starjoys.tool.packonline.modules.packmanager.service.GameParamRecordManagerService;
import com.starjoys.tool.packonline.modules.packmanager.utils.GameParamUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 游戏版本管理控制层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/23
 */

@Controller
@RequestMapping("/packManager/gameParamRecord")
public class GameParamRecordManagerController extends BaseManagerController<GameParamEntity> {

    @Resource
    private GameParamRecordManagerService gameParamRecordManagerService;

    @Resource
    private ChannelManagerService channelManagerService;

    @Override
    protected IBaseManagerService<GameParamEntity> getBaseManagerService() {
        return gameParamRecordManagerService;
    }

    @Override
    public String show(HttpServletRequest request, Model model) {
        List<ChannelEntity> cchList = channelManagerService.findAllData().getRows(); // 获取渠道列表
        String cchListJson = JSON.toJSONString(cchList);
        addResponseAttr(model, new HttpAttributeBean("cchListJson", cchListJson));
        return WebPathConfig.JSP_PATH_GAME_PARAM_RECORD_MANAGER;
    }

    @Override
    public ResultBean<GameParamEntity> edit(HttpServletRequest request, GameParamEntity entity) {
        GameParamUtils.handlerParamData(request, entity);
        return super.edit(request, entity);
    }

    @RequestMapping("/updateRecordData")
    @ResponseBody
    public ResultBean<GameParamEntity> updateRecordData(HttpServletRequest request, GameParamEntity entity) {
        sendLog("接受到更新游戏参数渠道数据请求");
        if (GameParamUtils.handlerParamData(request, entity)) {
            return gameParamRecordManagerService.updateRecordData(entity);
        } else {
            return new ResultBean<>(null, "参数出现非法字符", false);
        }
    }

}
