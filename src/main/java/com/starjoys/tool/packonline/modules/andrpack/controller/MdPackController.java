package com.starjoys.tool.packonline.modules.andrpack.controller;

import com.starjoys.tool.packonline.bean.PackResultBean;
import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseController;
import com.starjoys.tool.packonline.common.base.BasePackService;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.andrpack.service.MdPackService;
import com.starjoys.tool.packonline.modules.andrpack.service.PackPathService;
import com.starjoys.tool.packonline.modules.packmanager.controller.GameManagerController;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameEntity;
import com.starjoys.tool.packonline.modules.packrecord.entity.MdRecordEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserGroupEntity;
import com.starjoys.tool.packonline.modules.systemlog.service.PackLogService;
import com.starjoys.tool.packonline.utils.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 推广包打包控制器类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/9
 */

@Controller
@RequestMapping("/andrPack/mdPack")
public class MdPackController extends BaseController {

    @Resource
    private MdPackService mdPackService;

    @Resource
    private GameManagerController gameManagerController;

    @Resource
    private PackPathService packPathService;

    @Resource
    private PackLogService packLogService;

    @RequestMapping("")
    public String show(HttpServletRequest request, Model model) {
        sendLog("接受到广告渠道包界面显示");
        model.addAttribute("gameList", gameManagerController.findAllListWithAuth(request).getRows());
        model.addAttribute("fileSource", "0");
        return WebPathConfig.JSP_PATH_ANDROID_MD_PACK;
    }

    @RequestMapping(value = "/submit", method = RequestMethod.POST)
    public String submit(HttpServletRequest request, HttpSession session,
                         Model model, MdRecordEntity mdRecordEntity,
                         @RequestParam(value = "file") MultipartFile uploadFile,
                         @RequestParam(name = "fileSource") String fileSource,
                         @RequestParam(name = "game_Id") String game_Id) {
        sendLog("接受到开始打包请求 " + mdRecordEntity);

        // 清除以前打包的数据
        packPathService.clearPrePack();

        // 把游戏与当前用户添加到数据对象中
        GameEntity gameEntity = new GameEntity();
        if (StringUtils.isNotEmpty(game_Id)) {
            gameEntity.setId(Long.parseLong(game_Id));
        }
        gameEntity.setGameId("");
        mdRecordEntity.setGame(gameEntity);

        // 设置用户信息
        UserGroupEntity userGroupEntity = getCurrentUserGroup(request);
        UserEntity userEntity = (UserEntity) session.getAttribute(GlobalConfig.SESSION_KEY_USER);
        mdRecordEntity.setUser(userEntity);
        ResultBean<PackResultBean> resultBean = mdPackService.startPack(mdRecordEntity, uploadFile, fileSource,
                userGroupEntity);

        if (resultBean.isSuccess()) {
            // 打包成功会把路径添加到打包路径表中
            sendLog("打包成功会把路径添加到打包路径表中");
            packPathService.addPackPath(userEntity,
                    resultBean.getRows().getLocalDownloadDirFile().getAbsolutePath());
        }

        if (resultBean.getRows() != null) {
            // 把日志保存到本地
            packLogService.addPackLog(resultBean, request.getServletPath(),
                    userEntity, mdRecordEntity.getMdRecordStartDate());
        }

        sendLog("结果数据 " + resultBean);

        // 保持页面操作前所需数据
        model.addAttribute("mdRecordEntity", mdRecordEntity);
        model.addAttribute("file", uploadFile);
        model.addAttribute("gameList", gameManagerController.findAllListWithAuth(request).getRows());
        model.addAttribute("fileSource", fileSource);
        if (fileSource.equals(BasePackService.FILE_SOURCE_FROM_SERVER)) {
            model.addAttribute("selectGameId", mdRecordEntity.getGame().getId());
        }
        // 返回结果数据
        model.addAttribute("result", resultBean);
        return WebPathConfig.JSP_PATH_ANDROID_MD_PACK;
    }

}
