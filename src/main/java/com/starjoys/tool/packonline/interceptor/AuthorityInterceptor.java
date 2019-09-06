package com.starjoys.tool.packonline.interceptor;

import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BaseInterceptor;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.modules.index.service.AuthorityService;
import com.starjoys.tool.packonline.modules.system.entity.UserGroupEntity;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 权限拦截器
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/3
 */
public class AuthorityInterceptor extends BaseInterceptor {

    @Resource
    private AuthorityService authorityService;

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object
            o) throws Exception {
        sendLog("权限拦截器preHandle1");
        HttpSession session = httpServletRequest.getSession(false);
        if (session != null) {
            UserGroupEntity currentGroup = (UserGroupEntity) session.getAttribute(GlobalConfig.SESSION_KEY_USER_GROUP);
            sendLog("当前用户组对象 " + currentGroup);
//            String requestURI = httpServletRequest.getRequestURI().replace("/" + GlobalConfig.PROJECT_NAME, "");
            String requestURI = httpServletRequest.getServletPath();
            sendLog("拦截相对网址 " + requestURI);

            boolean authResult = false;

            if (currentGroup != null && currentGroup.getCompany() != null) {
                int groupId = currentGroup.getGroupId();
                UserGroupEntity daoEntity = authorityService.getUserGroup(groupId + "");
                if (daoEntity != null && daoEntity.getStatus() == BaseEntity.FLAG_STATUS_ACTIVE
                        && daoEntity.getCompany() != null) { // 查找出数据库中对应的用户组
                    if (!daoEntity.getGroupMenus().equals(currentGroup.getGroupMenus())
                            || !daoEntity.getGroupActs().equals(currentGroup.getGroupActs())
                            || daoEntity.getGroupSuperManager() != currentGroup.getGroupSuperManager()
                            || daoEntity.getCompany().getCompanyId() != currentGroup.getCompany().getCompanyId()) {
                        // 发现数据库中的权限不一样, 转到登录页面并提示权限已发生变化需要重新登录
                        session.removeAttribute(GlobalConfig.SESSION_KEY_USER); // 删除登录信息
                        goLogin(httpServletResponse, BaseInterceptor.MSG_AUTH_RESET);
                        return false;
                    } else {
                        // 权限检测
                        authResult = authorityService.checkUserAuthorityByMenuUrl(currentGroup,
                                (String[]) session.getAttribute(GlobalConfig.SESSION_KEY_USER_GROUP_ACTS), requestURI);
                    }
                } else { // 查找出来的用户组为空
                    authResult = false;
                }
            }


            sendLog("检查权限结果 " + authResult);
            if (authResult) {
                sendLog("有权限,继续访问");
                return true;
            }
        }

        sendLog("发送无权限错误码");
        httpServletResponse.sendError(HttpServletResponse.SC_FORBIDDEN);
        return false;
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
