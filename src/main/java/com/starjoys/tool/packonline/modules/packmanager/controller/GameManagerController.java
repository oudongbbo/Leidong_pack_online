package com.starjoys.tool.packonline.modules.packmanager.controller;

import com.starjoys.tool.packonline.bean.HttpAttributeBean;
import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BaseManagerController;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameEntity;
import com.starjoys.tool.packonline.modules.packmanager.service.GameManagerService;
import com.starjoys.tool.packonline.modules.system.entity.CompanyEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserGroupEntity;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

@Scope("prototype")
@Controller
@RequestMapping("/packManager/game")
public class GameManagerController extends BaseManagerController<GameEntity> {

    @Resource
    private GameManagerService gameManagerService;

    @Override
    protected IBaseManagerService<GameEntity> getBaseManagerService() {
        return gameManagerService;
    }

    @Override
    public String show(HttpServletRequest request, Model model) {
        addResponseAttr(model,
                new HttpAttributeBean("gameList", findAllListWithAuth(request).getRows()));
        return WebPathConfig.JSP_PATH_GAME_MANAGER;
    }

    @Override
    public ResultBean<List<GameEntity>> list(HttpServletRequest request, GameEntity entity) {
        makeAuth(request, entity, false);
        return super.list(request, entity);
    }

    @Override
    public ResultBean<GameEntity> add(HttpServletRequest request, GameEntity entity) {
        sendLog("添加数据user " + entity);
        UserEntity userEntity = (UserEntity) request.getSession().getAttribute(GlobalConfig.SESSION_KEY_USER);
        entity.getVer().setUser(userEntity);

        makeAuth(request, entity, true);
        return gameManagerService.addData(entity, userEntity);
    }

    @Override
    public ResultBean<GameEntity> edit(HttpServletRequest request, GameEntity entity) {
        sendLog("更新数据user " + entity);
        UserEntity userEntity = (UserEntity) request.getSession().getAttribute(GlobalConfig.SESSION_KEY_USER);
        entity.getVer().setUser(userEntity);

        makeAuth(request, entity, false);
        return gameManagerService.updateData(entity, userEntity);
    }

    @RequestMapping("/change")
    @ResponseBody
    public ResultBean<GameEntity> change(HttpServletRequest request, GameEntity entity) {
        sendLog("修改数据 " + entity);

        makeAuth(request, entity, false);
        return gameManagerService.changeData(entity);
    }

    @Override
    public ResultBean<GameEntity> status(HttpServletRequest request, @RequestParam("id") String id) {
        GameEntity entity = new GameEntity();
        makeAuth(request, entity, false);
        return gameManagerService.changeStatus(id, entity.getCompany().getCompanyId());
    }

    /**
     * 设置游戏数据权限
     *
     * @param request 请求
     * @param entity  游戏数据对象
     */
    private void makeAuth(HttpServletRequest request, GameEntity entity, boolean isAdd) {
        UserGroupEntity userGroupEntity = (UserGroupEntity)
                request.getSession().getAttribute(GlobalConfig.SESSION_KEY_USER_GROUP);
        entity.setCompany(new CompanyEntity());
        if (!isAdd && userGroupEntity.getGroupSuperManager() == BaseEntity.FLAG_BOOLEAN_TRUE) { // 超级管理员用-1表示可以看到所以数据
            entity.getCompany().setCompanyId(GlobalConfig.COMPANY_ID_FOR_SUPER_MANAGER);
        } else {
            entity.getCompany().setCompanyId(userGroupEntity.getCompany().getCompanyId()); // 设置当前添加人的公司id
        }
    }

    /**
     * 带权限进行查找所有游戏
     *
     * @param request 请求
     * @return 结果
     */
    public ResultBean<List<GameEntity>> findAllListWithAuth(HttpServletRequest request) {
        GameEntity gameEntity = new GameEntity();
        gameEntity.setStatus(BaseEntity.FLAG_STATUS_ACTIVE);
        makeAuth(request, gameEntity, false);
        return gameManagerService.findAllData(gameEntity);
    }

}
