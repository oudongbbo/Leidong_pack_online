package com.starjoys.tool.packonline.modules.packmanager.controller;

import com.starjoys.tool.packonline.common.base.BaseManagerController;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameEntity;
import com.starjoys.tool.packonline.modules.packmanager.service.GameVersionManagerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 游戏版本管理控制层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/23
 */

@Controller
@RequestMapping("/packManager/gameVersion")
public class GameVersionManagerController extends BaseManagerController<GameEntity> {

    @Resource
    private GameVersionManagerService gameVersionManagerService;

    @Override
    protected IBaseManagerService<GameEntity> getBaseManagerService() {
        return gameVersionManagerService;
    }

    @Override
    public String show(HttpServletRequest request, Model model) {
        return WebPathConfig.JSP_PATH_GAME_VERSION_MANAGER;
    }
}
