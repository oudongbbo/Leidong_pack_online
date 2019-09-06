package com.starjoys.tool.packonline.modules.index.controller;

import com.starjoys.tool.packonline.common.base.BaseController;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 注销控制层类
 *
 * @author Andy
 * @version 1.0
 * @create 2016/12/30
 */

@Controller
@RequestMapping("/logout")
public class LogoutController extends BaseController {

    /**
     * 注销处理
     *
     * @param httpServletResponse 响应对象
     * @param session 会话
     */
    @RequestMapping("")
    public void logout(HttpServletResponse httpServletResponse, HttpSession session) {

        Object userObj = session.getAttribute(GlobalConfig.SESSION_KEY_USER);
        if (userObj != null) { // 移除用户的登录状态
            session.removeAttribute(GlobalConfig.SESSION_KEY_USER);
        }

        // 返回登录页面
        try {
            httpServletResponse.sendRedirect(WebPathConfig.URL_PATH_LOGIN);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
