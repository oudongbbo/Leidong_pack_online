package com.starjoys.tool.packonline.modules.systemlog.controller;

import com.starjoys.tool.packonline.bean.HttpAttributeBean;
import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseController;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.system.controller.UserManagerController;
import com.starjoys.tool.packonline.modules.systemlog.entity.ActionLogEntity;
import com.starjoys.tool.packonline.modules.systemlog.service.ActionLogService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 行为日志控制层类
 *
 * @author Adny
 * @version 1.0
 * @create 2017/4/1
 */

@Controller
@RequestMapping("/systemLog/actionLog")
public class ActionLogController extends BaseController {

    @Resource
    private ActionLogService actionLogService;

    @Resource
    private UserManagerController userManagerController;

    @RequestMapping("")
    public String show(HttpServletRequest request, Model model) {
        sendLog("接收到显示行为日志请求");
        addResponseAttr(model,
                new HttpAttributeBean("userList", userManagerController.findAllListWithAuth(request).getRows()));
        return WebPathConfig.JSP_PATH_SYSTEM_LOG_ACTION_LOG;
    }

    @RequestMapping("/list")
    @ResponseBody
    public ResultBean<List<ActionLogEntity>> list(HttpServletRequest request, ActionLogEntity actionLogEntity) {
        sendLog("接受到显示行为日志列表请求 " + actionLogEntity);
        return actionLogService.findListByPage(actionLogEntity);
    }

}
