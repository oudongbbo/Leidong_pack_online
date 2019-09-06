package com.starjoys.tool.packonline.modules.andrpack.controller;

import com.starjoys.tool.packonline.bean.PackResultBean;
import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseController;
import com.starjoys.tool.packonline.common.base.BasePackService;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.andrpack.service.APKChangeService;
import com.starjoys.tool.packonline.modules.andrpack.service.PackPathService;
import com.starjoys.tool.packonline.modules.packmanager.controller.GameManagerController;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameEntity;
import com.starjoys.tool.packonline.modules.packrecord.entity.APKChangeEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import com.starjoys.tool.packonline.modules.systemlog.service.PackLogService;
import com.starjoys.tool.packonline.utils.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * APK基本功能打包控制层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/22
 */

@Controller
@RequestMapping("/andrPack/apkChange")
public class APKChangeController extends BaseController {

    @Resource
    private APKChangeService apkChangeService;

    @Resource
    private GameManagerController gameManagerController;

    @Resource
    private PackPathService packPathService;

    @Resource
    private PackLogService packLogService;

    @RequestMapping("")
    public String show(HttpServletRequest request, Model model) {
        sendLog("接受到APK基本功能打包界面显示请求");
        model.addAttribute("gameList", gameManagerController.findAllListWithAuth(request).getRows());
        model.addAttribute("fileSource", "0");
        return WebPathConfig.JSP_PATH_ANDROID_APK_PACK;
    }


    @RequestMapping("/submit")
    public String submit(HttpServletRequest request, HttpSession session, Model model,
                         APKChangeEntity apkChangeEntity,
                         @RequestParam(name = "localInputFile") MultipartFile localInputFile,
                         @RequestParam(name = "iconInputFile") MultipartFile iconInputFile,
                         @RequestParam(name = "fileSource") String fileSource,
                         @RequestParam(name = "game_Id") String game_Id) {
        sendLog("接受到APK基本功能开始打包请求 ");

        // 清除以前打包的数据
        packPathService.clearPrePack();

        // 把游戏与当前用户添加到apk修改数据中
        GameEntity gameEntity = new GameEntity();
        if (StringUtils.isNotEmpty(game_Id)) {
            gameEntity.setId(Long.parseLong(game_Id));
        }
        gameEntity.setGameId("");
        apkChangeEntity.setGame(gameEntity);

        UserEntity userEntity = (UserEntity) session.getAttribute(GlobalConfig.SESSION_KEY_USER);
        apkChangeEntity.setUser(userEntity);

        // 设置母包来源
        apkChangeEntity.setApkChangeFileSource(fileSource);

        // 提交打包数据, 进行打包
        ResultBean<PackResultBean> resultBean =
                apkChangeService.submitPack(apkChangeEntity, localInputFile, iconInputFile);
        sendLog("结果集 " + resultBean);

        if (resultBean.isSuccess()) {
            // 打包成功会把路径添加到打包路径表中
            sendLog("打包成功会把路径添加到打包路径表中");
            packPathService.addPackPath(userEntity,
                    resultBean.getRows().getLocalDownloadDirFile().getAbsolutePath());
        }

        if (resultBean.getRows() != null) {
            // 把日志保存到本地
            packLogService.addPackLog(resultBean, request.getServletPath(),
                    userEntity, apkChangeEntity.getApkChangeStartDate());
        }

        // 返回结果
        model.addAttribute("result", resultBean);
        model.addAttribute("apkChangeEntity", apkChangeEntity);
        model.addAttribute("localInputFile", localInputFile);
        model.addAttribute("iconInputFile", iconInputFile);
        model.addAttribute("fileSource", fileSource);
        model.addAttribute("gameList", gameManagerController.findAllListWithAuth(request).getRows());
        if (fileSource.equals(BasePackService.FILE_SOURCE_FROM_SERVER)) {
            model.addAttribute("selectGameId", apkChangeEntity.getGame().getId());
        }
        return WebPathConfig.JSP_PATH_ANDROID_APK_PACK;
    }

}
