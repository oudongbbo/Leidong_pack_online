package com.starjoys.tool.packonline.modules.index.controller;

import com.starjoys.tool.packonline.bean.MenuBean;
import com.starjoys.tool.packonline.common.base.BaseController;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.index.service.IndexService;
import com.starjoys.tool.packonline.modules.system.entity.UserGroupEntity;
import com.starjoys.tool.packonline.utils.Apktools;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 首页控制层类
 *
 * @author Andy
 * @version 1.0
 * @create 2016/12/29
 */

@Controller
@RequestMapping("/index")
public class IndexController extends BaseController {

    @Resource
    private IndexService indexService;

    /**
     * 管理平台首页
     *
     * @param request 请求
     * @param model   模型
     * @return 显示
     */
    @RequestMapping("")
    public String index(HttpServletRequest request, Model model, HttpSession session) {

        Apktools.getApkInfo("E:\\\\Factory\\\\ApkTools\\\\sjoys_100152_20170427175517_zipalign.apk");

        sendLog("获取会话中的用户组数据");
        Object sessionObj = session.getAttribute(GlobalConfig.SESSION_KEY_USER_GROUP);
        if (sessionObj != null) {
            UserGroupEntity userGroupEntity = (UserGroupEntity) sessionObj;
            List<MenuBean> menuBeanList = indexService.findUserMenuList(userGroupEntity);
            model.addAttribute("menuList", menuBeanList);
        }

        sendLog("跳转到首页");
        return WebPathConfig.JSP_PATH_INDEX;
    }

}
