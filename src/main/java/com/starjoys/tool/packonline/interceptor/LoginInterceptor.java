package com.starjoys.tool.packonline.interceptor;

import com.starjoys.tool.packonline.common.base.BaseInterceptor;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 登录拦截器
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/1
 */
public class LoginInterceptor extends BaseInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object
            o) throws Exception {
        sendLog("登录拦截器preHandle");
        HttpSession session = httpServletRequest.getSession(false);
        if (session == null || session.getAttribute(GlobalConfig.SESSION_KEY_USER) == null) { // 如果会话不存在或用户不存在
            goLogin(httpServletResponse, null);
            return false;
        }

        sendLog("已经登录, 跳转首页");
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o,
                           ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
                                Object o, Exception e) throws Exception {

    }
}
