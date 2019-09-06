package com.starjoys.tool.packonline.common.base;

import com.starjoys.tool.packonline.bean.HttpAttributeBean;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserGroupEntity;
import org.springframework.ui.Model;
import org.springframework.web.context.ContextLoader;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

/**
 * 基础控制层类
 *
 * @author Andy
 * @version 1.0
 * @create 2016/12/29
 */

public abstract class BaseController extends BaseWebClazz {

    /**
     * 添加响应参数
     *
     * @param model 模型
     * @param attrs 不定参数
     */
    protected void addResponseAttr(Model model, HttpAttributeBean... attrs) {
        for (HttpAttributeBean attr : attrs) {
            model.addAttribute(attr.getKey(), attr.getValue());
        }
    }

    /**
     * 获取服务器上下文
     *
     * @return 服务器上下文
     */
    protected ServletContext getApplicationContext() {
        return ContextLoader.getCurrentWebApplicationContext().getServletContext();
    }

    /**
     * 获取当前用户信息对象
     *
     * @param request 请求
     * @return 用户信息对象
     */
    protected UserEntity getCurrentUser(HttpServletRequest request) {
        return (UserEntity) request.getSession().getAttribute(GlobalConfig.SESSION_KEY_USER);
    }

    /**
     * 获取当前用户组信息对象
     *
     * @param request 请求
     * @return 用户组信息对象
     */
    protected UserGroupEntity getCurrentUserGroup(HttpServletRequest request) {
        return (UserGroupEntity) request.getSession().getAttribute(GlobalConfig.SESSION_KEY_USER_GROUP);
    }

}
