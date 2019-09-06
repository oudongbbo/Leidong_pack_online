package com.starjoys.tool.packonline.modules.toolboxrecord.controller;

import com.starjoys.tool.packonline.bean.HttpAttributeBean;
import com.starjoys.tool.packonline.common.base.BaseManagerController;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.packmanager.controller.GameManagerController;
import com.starjoys.tool.packonline.modules.packmanager.service.ChannelManagerService;
import com.starjoys.tool.packonline.modules.system.controller.UserManagerController;
import com.starjoys.tool.packonline.modules.toolboxrecord.entity.IconMergeRecordEntity;
import com.starjoys.tool.packonline.modules.toolboxrecord.service.IconMergeRecordService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 渠道打包记录控制层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/2/27
 */

@Controller
@RequestMapping("/toolboxRecord/iconMergeRecord")
public class IconMergeRecordController extends BaseManagerController<IconMergeRecordEntity> {

    @Resource
    private IconMergeRecordService iconMergeRecordService;

    @Resource
    private GameManagerController gameManagerController;

    @Resource
    private UserManagerController userManagerController;

    @Resource
    private ChannelManagerService channelManagerService;

    @Override
    protected IBaseManagerService<IconMergeRecordEntity> getBaseManagerService() {
        return iconMergeRecordService;
    }

    @Override
    public String show(HttpServletRequest request, Model model) {
        addResponseAttr(model,
                new HttpAttributeBean("gameList", gameManagerController.findAllListWithAuth(request).getRows()),
                new HttpAttributeBean("cchList", channelManagerService.findAllData().getRows()),
                new HttpAttributeBean("userList", userManagerController.findAllListWithAuth(request).getRows()));
        return WebPathConfig.JSP_PATH_TOOLBOX_RECORD_ICON_MERGE_RECORD;
    }

}
