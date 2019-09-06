package com.starjoys.tool.packonline.modules.packmanager.controller;

import com.alibaba.fastjson.JSON;
import com.starjoys.tool.packonline.bean.HttpAttributeBean;
import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BaseManagerController;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.packmanager.entity.ChannelEntity;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameEntity;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameParamEntity;
import com.starjoys.tool.packonline.modules.packmanager.service.ChannelManagerService;
import com.starjoys.tool.packonline.modules.packmanager.service.GameParamManagerService;
import com.starjoys.tool.packonline.modules.packmanager.utils.GameParamUtils;
import com.starjoys.tool.packonline.modules.system.entity.CompanyEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserGroupEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 游戏管理控制层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/23
 */

@Controller
@RequestMapping("/packManager/gameParam")
public class GameParamManagerController extends BaseManagerController<GameParamEntity> {

    @Resource
    private GameParamManagerService gameParamManagerService;

    @Resource
    private GameManagerController gameManagerController;

    @Resource
    private ChannelManagerService channelManagerService;

    @Override
    protected IBaseManagerService<GameParamEntity> getBaseManagerService() {
        return gameParamManagerService;
    }

    @Override
    public String show(HttpServletRequest request, Model model) {
        List<GameEntity> gameList = gameManagerController.findAllListWithAuth(request).getRows(); // 获取游戏列表
        List<ChannelEntity> cchList = channelManagerService.findAllData().getRows(); // 获取渠道列表
        String gameListJson = JSON.toJSONString(gameList); // 转成json, 方便js处理
        String cchListJson = JSON.toJSONString(cchList);
        addResponseAttr(model, new HttpAttributeBean("gameList", gameList), new HttpAttributeBean("cchList", cchList),
                new HttpAttributeBean("gameListJson", gameListJson), new HttpAttributeBean("cchListJson", cchListJson));
        return WebPathConfig.JSP_PATH_GAME_PARAM_MANAGER;
    }

    @Override
    public ResultBean<List<GameParamEntity>> list(HttpServletRequest request, GameParamEntity entity) {

        // 设置当前的用户的公司id
        makeAuth(request, entity);
        return super.list(request, entity);
    }

    @Override
    public ResultBean<GameParamEntity> add(HttpServletRequest request, GameParamEntity entity) {
        if (GameParamUtils.handlerParamData(request, entity)) {
            // 设置当前的用户的公司id
            makeAuth(request, entity);
            return super.add(request, entity);
        } else {
            return new ResultBean<>(null, "参数出现非法字符", false);
        }
    }

    @Override
    public ResultBean<GameParamEntity> edit(HttpServletRequest request, GameParamEntity entity) {
        if (GameParamUtils.handlerParamData(request, entity)) {
            // 设置当前的用户的公司id
            makeAuth(request, entity);
            return super.edit(request, entity);
        } else {
            return new ResultBean<>(null, "参数出现非法字符", false);
        }
    }

    @Override
    public ResultBean<GameParamEntity> status(HttpServletRequest request, @RequestParam("id") String id) {
        GameParamEntity gameParamEntity = new GameParamEntity();
        makeAuth(request, gameParamEntity);
        return gameParamManagerService.changeStatus(id, gameParamEntity.getGame().getCompany().getCompanyId());
    }

    /**
     * 设置游戏数据权限
     *
     * @param request 请求
     * @param entity      游戏数据对象
     */
    private void makeAuth(HttpServletRequest request, GameParamEntity entity) {
        if (entity.getGame() == null) {
            entity.setGame(new GameEntity());
        }

        if (entity.getGame().getCompany() == null) {
            entity.getGame().setCompany(new CompanyEntity());
        }

        UserGroupEntity userGroupEntity = (UserGroupEntity)
                request.getSession().getAttribute(GlobalConfig.SESSION_KEY_USER_GROUP);
        if (userGroupEntity.getGroupSuperManager() == BaseEntity.FLAG_BOOLEAN_TRUE) { // 超级管理员用-1表示可以看到所以数据
            entity.getGame().getCompany().setCompanyId(GlobalConfig.COMPANY_ID_FOR_SUPER_MANAGER);
        } else {
            entity.getGame().getCompany().setCompanyId(userGroupEntity.getCompany().getCompanyId()); // 设置当前添加人的公司id
        }
    }


}
