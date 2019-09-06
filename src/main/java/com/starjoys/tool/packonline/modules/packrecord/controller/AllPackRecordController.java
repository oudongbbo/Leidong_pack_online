package com.starjoys.tool.packonline.modules.packrecord.controller;

import com.starjoys.tool.packonline.bean.HttpAttributeBean;
import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BaseManagerController;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.packmanager.controller.GameManagerController;
import com.starjoys.tool.packonline.modules.packrecord.entity.AllPackRecordEntity;
import com.starjoys.tool.packonline.modules.packrecord.service.AllPackRecordService;
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
 * 这里只记录，渠道打包  和  媒体打包的  打包记录，以供给强更功能使用
 * @author Andy
 * @version 1.0
 * @create 2017/2/27
 */

@Controller
@RequestMapping("/packRecord/allPackRecord")
public class AllPackRecordController extends BaseManagerController<AllPackRecordEntity> {

    @Resource
    private AllPackRecordService allPackRecordService;

    @Resource
    private GameManagerController gameManagerController;

    @Resource
    private UserManagerController userManagerController;

    @Override
    protected IBaseManagerService<AllPackRecordEntity> getBaseManagerService() {
        return allPackRecordService;
    }

    @Override
    public String show(HttpServletRequest request, Model model) {
        addResponseAttr(model,
                new HttpAttributeBean("gameList", gameManagerController.findAllListWithAuth(request).getRows()),
                new HttpAttributeBean("userList", userManagerController.findAllListWithAuth(request).getRows()));
        return WebPathConfig.JSP_PATH_PACK_RECORD_ALL;
    }

    @Override
    public ResultBean<List<AllPackRecordEntity>> list(HttpServletRequest request, AllPackRecordEntity entity) {
        // 默认只给用户看到该公司的打包记录
        UserGroupEntity userGroupEntity = getCurrentUserGroup(request);
        if (userGroupEntity.getGroupSuperManager() != BaseEntity.FLAG_BOOLEAN_TRUE) {
            entity.setCurrentUserGroup(userGroupEntity);
        }
        return super.list(request, entity);
    }
}
