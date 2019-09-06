package com.starjoys.tool.packonline.modules.toolbox.controller;

import com.alibaba.fastjson.JSON;
import com.starjoys.tool.packonline.bean.HttpAttributeBean;
import com.starjoys.tool.packonline.bean.PackResultBean;
import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseController;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.andrpack.service.PackPathService;
import com.starjoys.tool.packonline.modules.packmanager.controller.GameManagerController;
import com.starjoys.tool.packonline.modules.packmanager.entity.ChannelEntity;
import com.starjoys.tool.packonline.modules.packmanager.service.ChannelManagerService;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import com.starjoys.tool.packonline.modules.toolbox.service.IconMergeService;
import com.starjoys.tool.packonline.modules.toolboxrecord.entity.IconMergeRecordEntity;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 图标合并控制层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/3/13
 */

@Controller
@RequestMapping("/toolbox/iconMerge")
@Scope("prototype")
public class IconMergeController extends BaseController {

    @Resource
    private ChannelManagerService channelManagerService;

    @Resource
    private GameManagerController gameManagerController;

    @Resource
    private IconMergeService iconMergeService;

    @Resource
    private PackPathService packPathService;

    @RequestMapping("")
    public String show(HttpServletRequest request, Model model) {
        sendLog("接受到图标合并界面显示请求");
        List<ChannelEntity> channelEntityList = channelManagerService.findAllData().getRows();
        addResponseAttr(model,
                new HttpAttributeBean("cchList", channelEntityList),
                new HttpAttributeBean("gameList", gameManagerController.findAllListWithAuth(request).getRows()),
                new HttpAttributeBean("cchListJson", JSON.toJSONString(channelEntityList)));
        return WebPathConfig.JSP_PATH_TOOLBOX_ICON_MERGE;
    }


    @RequestMapping(method = RequestMethod.POST, value = "/submit")
    @ResponseBody
    public ResultBean<PackResultBean> submit(HttpServletRequest request, IconMergeRecordEntity iconMergeRecordEntity) {
        sendLog("接受到合并图标操作请求");
        // 清除两天前的数据
        packPathService.clearPrePack();

        UserEntity currentUser = (UserEntity) request.getSession().getAttribute(GlobalConfig.SESSION_KEY_USER);
        iconMergeRecordEntity.setUs(currentUser);
        ResultBean<PackResultBean> resultBean = iconMergeService.submitPack(iconMergeRecordEntity);

        // 把结果添加到打包路径数据库中
        if (resultBean.getRows() != null) {
            packPathService.addPackPath(currentUser,
                    resultBean.getRows().getLocalDownloadDirFile().getAbsolutePath());
        }
        return resultBean;
    }


}
