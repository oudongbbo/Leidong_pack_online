package com.starjoys.tool.packonline.modules.packrecord.controller;

import com.starjoys.tool.packonline.bean.HttpAttributeBean;
import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BaseManagerController;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.packmanager.controller.GameManagerController;
import com.starjoys.tool.packonline.modules.packmanager.service.ChannelManagerService;
import com.starjoys.tool.packonline.modules.packrecord.entity.ChannelFileEntity;
import com.starjoys.tool.packonline.modules.packrecord.service.CchPackRecordService;
import com.starjoys.tool.packonline.modules.system.controller.UserManagerController;
import com.starjoys.tool.packonline.modules.system.entity.UserGroupEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 渠道打包记录控制层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/2/27
 */

@Controller
@RequestMapping("/packRecord/cchPackRecord")
public class CchPackRecordController extends BaseManagerController<ChannelFileEntity> {

    @Resource
    private CchPackRecordService cchPackRecordService;

    @Resource
    private GameManagerController gameManagerController;

    @Resource
    private UserManagerController userManagerController;

    @Resource
    private ChannelManagerService channelManagerService;

    @Override
    protected IBaseManagerService<ChannelFileEntity> getBaseManagerService() {
        return cchPackRecordService;
    }

    @Override
    public String show(HttpServletRequest request, Model model) {
        addResponseAttr(model,
                new HttpAttributeBean("gameList", gameManagerController.findAllListWithAuth(request).getRows()),
                new HttpAttributeBean("cchList", channelManagerService.findAllData().getRows()),
                new HttpAttributeBean("userList", userManagerController.findAllListWithAuth(request).getRows()));
        return WebPathConfig.JSP_PATH_PACK_RECORD_CCH;
    }

    @Override
    public ResultBean<List<ChannelFileEntity>> list(HttpServletRequest request, ChannelFileEntity entity) {
        // 默认只给用户看到该公司的打包记录
        UserGroupEntity userGroupEntity = getCurrentUserGroup(request);
        if (userGroupEntity.getGroupSuperManager() != BaseEntity.FLAG_BOOLEAN_TRUE) {
            entity.setCurrentUserGroup(userGroupEntity);
        }
        return super.list(request, entity);
    }
}
