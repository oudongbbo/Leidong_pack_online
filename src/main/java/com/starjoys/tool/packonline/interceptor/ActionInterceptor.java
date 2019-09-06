package com.starjoys.tool.packonline.interceptor;

import com.starjoys.tool.packonline.common.base.BaseInterceptor;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import com.starjoys.tool.packonline.modules.systemlog.service.ActionLogService;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * 用户行为拦截器
 *
 * @author Andy
 * @version 1.0
 * @create 2017/3/27
 */

public class ActionInterceptor extends BaseInterceptor {

    @Resource
    ActionLogService actionLogService;

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o)
            throws Exception {
        Map<String, String[]> requestParamMap = httpServletRequest.getParameterMap();
        String requestUrl = httpServletRequest.getServletPath();
        String username = ((UserEntity) httpServletRequest.getSession()
                .getAttribute(GlobalConfig.SESSION_KEY_USER)).getUsername();
        actionLogService.handleAction(requestUrl, requestParamMap, username);
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o,
                           ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o,
                                Exception e) throws Exception {
    }
}
