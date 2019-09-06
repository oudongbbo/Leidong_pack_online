package com.starjoys.tool.packonline.modules.system.controller;

import com.starjoys.tool.packonline.bean.HttpAttributeBean;
import com.starjoys.tool.packonline.common.base.BaseManagerController;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.system.entity.CompanyEntity;
import com.starjoys.tool.packonline.modules.system.service.CompanyManagerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 公司管理控制层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/4/13
 */

@Controller
@RequestMapping("/system/companyManager")
public class CompanyManagerController extends BaseManagerController<CompanyEntity> {

    @Resource
    private CompanyManagerService companyManagerService;

    @Override
    protected IBaseManagerService<CompanyEntity> getBaseManagerService() {
        return companyManagerService;
    }

    @Override
    public String show(HttpServletRequest request, Model model) {
        sendLog("我是公司");
        addResponseAttr(model, new HttpAttributeBean("companyList", companyManagerService.findAllData().getRows()));
        return WebPathConfig.JSP_PATH_SYSTEM_COMPANY_MANAGER;
    }
}
