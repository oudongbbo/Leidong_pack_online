package com.starjoys.tool.packonline.modules.systemlog.controller;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseController;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.systemlog.service.ConsoleLogService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 控制台日志控制类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/3/20
 */

@Controller
@RequestMapping("/systemLog/consoleLog")
public class ConsoleLogController extends BaseController {

    @Resource
    private ConsoleLogService consoleLogService;

    @RequestMapping("")
    public String show(HttpServletRequest request, Model model) {
        sendLog("接收到显示日志请求");
        ResultBean<String> resultBean = consoleLogService.load();
        model.addAttribute("result", resultBean);
        return WebPathConfig.JSP_PATH_SYSTEM_LOG_CONSOLE_LOG;
    }

    @RequestMapping("/submit")
    public void submit(HttpServletRequest request, HttpServletResponse response, Model model) {
        sendLog("接收到清除日志请求");
        consoleLogService.clear();
        try {
            response.sendRedirect("/" + GlobalConfig.PROJECT_NAME + "/systemLog/consoleLog");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
