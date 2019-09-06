package com.starjoys.tool.packonline.common.base;

import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.utils.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 基础拦截器类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/2
 */
public abstract class BaseInterceptor extends BaseWebClazz implements HandlerInterceptor {

    public static final String MSG_AUTH_RESET = "authReset";

    public void goLogin(HttpServletResponse httpServletResponse, String msg) throws IOException {
        // 解决中文乱码
        httpServletResponse.setContentType("text/html");
//        httpServletResponse.setHeader("Content-type", "text/html;charset=UTF-8");
        httpServletResponse.setCharacterEncoding("UTF-8");
        //通过servlet的doget方法获取response对象，通过getWriter方法获取PrintWriter对象
        PrintWriter out = httpServletResponse.getWriter();
        out.println("<script>");//输出script标签
//            out.println("alert('请先登录!');");//js语句：输出alert语句
        //js语句：输出跳转登录页面语句
        if (StringUtils.isNotEmpty(msg)) {
//          String  msg = URLEncoder.encode(msg, "utf-8");
            sendLog("跳转登录的msg : " + msg);
            out.println("parent.window.location.href = '" + WebPathConfig.URL_PATH_LOGIN
                    + "?msg=" + msg + "';");
            out.println("parent.parent.window.location.href = '" + WebPathConfig.URL_PATH_LOGIN
                    + "?msg=" + msg + "';");
        } else {
            out.println("parent.window.location.href = '" + WebPathConfig.URL_PATH_LOGIN + "';");
            out.println("parent.parent.window.location.href = '" + WebPathConfig.URL_PATH_LOGIN + "';");
        }
        out.println("</script>");//输出script结尾标签
        // 跳转到登录界面
//            httpServletResponse.sendRedirect(WebPathConfig.URL_PATH_LOGIN);
        sendLog("未登录, 跳转登录界面");
    }

}
