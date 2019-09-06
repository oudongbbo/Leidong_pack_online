package com.starjoys.tool.packonline.modules.packrecord.controller;

import com.starjoys.tool.packonline.bean.HttpAttributeBean;
import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BaseManagerController;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.packmanager.controller.GameManagerController;
import com.starjoys.tool.packonline.modules.packrecord.entity.APKChangeEntity;
import com.starjoys.tool.packonline.modules.packrecord.service.CommonPackRecordService;
import com.starjoys.tool.packonline.modules.system.controller.UserManagerController;
import com.starjoys.tool.packonline.modules.system.entity.UserGroupEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 推广包打包记录控制层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/2/27
 */

@Controller
@RequestMapping("/packRecord/commonPackRecord")
public class CommonPackRecordController extends BaseManagerController<APKChangeEntity> {

    @Resource
    private CommonPackRecordService commonPackRecordService;

    @Resource
    private GameManagerController gameManagerController;

    @Resource
    private UserManagerController userManagerController;

    @Override
    protected IBaseManagerService<APKChangeEntity> getBaseManagerService() {
        return commonPackRecordService;
    }

    @Override
    public String show(HttpServletRequest request, Model model) {
        addResponseAttr(model,
                new HttpAttributeBean("gameList", gameManagerController.findAllListWithAuth(request).getRows()),
                new HttpAttributeBean("userList", userManagerController.findAllListWithAuth(request).getRows()));
        return WebPathConfig.JSP_PATH_PACK_RECORD_COMMON;
    }

    @Override
    public ResultBean<List<APKChangeEntity>> list(HttpServletRequest request, APKChangeEntity entity) {
        // 默认只给用户看到自己公司的打包记录
        UserGroupEntity userGroupEntity = getCurrentUserGroup(request);
        if (userGroupEntity.getGroupSuperManager() != BaseEntity.FLAG_BOOLEAN_TRUE) {
            entity.setCurrentUserGroup(userGroupEntity);
        }
        return super.list(request, entity);
    }
}
