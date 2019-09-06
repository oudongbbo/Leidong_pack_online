package com.starjoys.tool.packonline.modules.systemlog.controller;

import com.starjoys.tool.packonline.bean.HttpAttributeBean;
import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseController;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.system.controller.UserManagerController;
import com.starjoys.tool.packonline.modules.systemlog.entity.PackLogEntity;
import com.starjoys.tool.packonline.modules.systemlog.service.PackLogService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 打包日志控制层类
 *
 * @author Adny
 * @version 1.0
 * @create 2017/5/4
 */

@Controller
@RequestMapping("/systemLog/packLog")
public class PackLogController extends BaseController {

    @Resource
    private PackLogService packLogService;

    @Resource
    private UserManagerController userManagerController;

    @RequestMapping("")
    public String show(HttpServletRequest request, Model model) {
        sendLog("接收到显示打包日志请求");
        addResponseAttr(model,
                new HttpAttributeBean("userList", userManagerController.findAllListWithAuth(request).getRows()));
        return WebPathConfig.JSP_PATH_SYSTEM_LOG_PACK_LOG;
    }

    @RequestMapping("/list")
    @ResponseBody
    public ResultBean<List<PackLogEntity>> list(HttpServletRequest request, PackLogEntity packLogEntity) {
        sendLog("接受到显示打包日志列表请求 " + packLogEntity);
        return packLogService.findListByPage(packLogEntity);
    }

}
