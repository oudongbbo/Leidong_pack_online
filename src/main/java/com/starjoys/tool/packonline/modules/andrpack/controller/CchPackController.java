package com.starjoys.tool.packonline.modules.andrpack.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.starjoys.tool.packonline.bean.PackResultBean;
import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseController;
import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.common.config.WebPathConfig;
import com.starjoys.tool.packonline.modules.andrpack.service.CchPackService;
import com.starjoys.tool.packonline.modules.andrpack.service.PackPathService;
import com.starjoys.tool.packonline.modules.packmanager.controller.GameManagerController;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameParamEntity;
import com.starjoys.tool.packonline.modules.packmanager.service.GameParamManagerService;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserGroupEntity;
import com.starjoys.tool.packonline.modules.systemlog.service.PackLogService;
import com.starjoys.tool.packonline.utils.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 渠道打包控制器类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/9
 */

@Controller
@RequestMapping("/andrPack/cchPack")
@Scope("prototype")
public class CchPackController extends BaseController {

    @Resource
    private GameManagerController gameManagerController;

    @Resource
    private GameParamManagerService gameParamManagerService;

    @Resource
    private PackPathService packPathService;

    @Resource
    private CchPackService cchPackService;

    @Resource
    private PackLogService packLogService;

    @RequestMapping("")
    public String show(HttpServletRequest request, Model model) {
        sendLog("接受到渠道打包界面显示");
        setPageBasicData(request, model);
        return WebPathConfig.JSP_PATH_ANDROID_CCH_PACK;
    }

    @RequestMapping(value = "/submit", method = RequestMethod.POST)
    @ResponseBody
    public ResultBean submit(HttpServletRequest request, HttpSession session,
                             String gameId, String idsList) throws UnsupportedEncodingException {
        sendLog("接受到开始打包请求" + idsList);

        // 清除以前打包的数据
        packPathService.clearPrePack();

        // json转成数组
        List<String> paramIdList = JSON.parseArray(idsList, String.class);

        ResultBean<PackResultBean> resultBean = new ResultBean<>();
        boolean paramValidResult = true;

        sendLog("检测游戏Id列表");
        if (gameId == null || !StringUtils.isNotEmpty(gameId)) { // 检测游戏Id
            paramValidResult = false;
            setResultBeanError(resultBean, "游戏Id为空");
        }

        sendLog("检测参数Id列表");
        if (paramIdList == null || paramIdList.size() <= 0) { // 检测参数Id列表
            paramValidResult = false;
            setResultBeanError(resultBean, "参数Id为空");
        }

        if (paramValidResult) { // 参数验证成功

            // 获取用户信息
            UserEntity userEntity = (UserEntity) session.getAttribute(GlobalConfig.SESSION_KEY_USER);

            // 添加参数到服务器数据中
            sendLog("添加参数到服务器数据中");
            addParam(userEntity.getUsername(), paramIdList);

            // 开始渠道打包
            long startTimeMillis = System.currentTimeMillis();
            resultBean = cchPackService.submitPack(gameId, paramIdList, userEntity, startTimeMillis);

            // 打包结束, 移除服务器中的参数数据
            sendLog("打包结束, 移除服务器中的参数数据");
            removeParam(userEntity.getUsername());

            if (resultBean.getRows() != null)
                // 打包成功会把路径添加到打包路径表中
                sendLog("打包成功会把路径添加到打包路径表中");
                packPathService.addPackPath(userEntity,
                    resultBean.getRows().getLocalDownloadDirFile().getAbsolutePath());

            if (resultBean.getRows() != null) {
                // 把日志保存到本地
                packLogService.addPackLog(resultBean, request.getServletPath(),
                        userEntity, new Timestamp(startTimeMillis));
            }

        }

        sendLog("结果数据 " + resultBean);

        return resultBean;
    }

    @RequestMapping(value = "/checkRunning", method = RequestMethod.POST)
    @ResponseBody
    public ResultBean<String> checkRunning(String idsList, HttpSession session) {
        sendLog("接受检查运行打包请求 " + idsList);

        // json转成数组
        List<String> paramIdList = JSON.parseArray(idsList, String.class);

        sendLog("检测参数Id列表");
        if (paramIdList == null || paramIdList.size() <= 0) { // 检测参数Id列表
            return new ResultBean<>("", "打包参数列表不能为空", false);
        }

        // 获取用户信息
        UserEntity userEntity = (UserEntity) session.getAttribute(GlobalConfig.SESSION_KEY_USER);
        // 默认
        ResultBean<String> resultBean = new ResultBean<>("", "确认打包", true);
        Map<String, List<String>> paramMap= getCchPackRunningParamMap();
        sendLog("服务器打包运行map " + paramMap);
        if (paramMap != null) {
            if(paramMap.containsKey(userEntity.getUsername())) { // 同个用户不能同时多次打包
                sendLog("当前用户已经有任务在打包中" + userEntity.getUsername());
                setResultBeanError(resultBean, "当前用户已经有任务在打包中...");
            } else {
                // 检查重复
                resultBean = cchPackService.checkRunningPack(paramIdList, paramMap);
            }
        }

        return resultBean;
    }

    /**
     * 设置页面基础数据
     *
     * @param model 数据模型
     */
    private void setPageBasicData(HttpServletRequest request, Model model) {
        model.addAttribute("gameList", gameManagerController.findAllListWithAuth(request).getRows());

        List<GameParamEntity> gameParamList = gameParamManagerService.findAllData().getRows();

        UserGroupEntity userGroupEntity = (UserGroupEntity) request.getSession()
                .getAttribute(GlobalConfig.SESSION_KEY_USER_GROUP);
        int ownCompanyId = userGroupEntity.getCompany().getCompanyId();
        // 不是管理员权限的话 只能看到某一个公司的配置参数
        if (userGroupEntity.getGroupSuperManager() != BaseEntity.FLAG_BOOLEAN_TRUE) {
            for (int i = 0; i < gameParamList.size(); i++) {
                GameParamEntity entity = gameParamList.get(i);
                if (entity.getGame().getCompany().getCompanyId() != ownCompanyId) {
                    gameParamList.remove(i);
                    i--;
                }
            }
        }

        model.addAttribute("gameParamListJson",
                JSONObject.toJSONString(gameParamList));
    }

    /**
     * 添加当前准备打包的参数到服务器数据中
     *
     * @param username     用户名
     * @param paramIdList 参数列表
     */
    private void addParam(String username, List<String> paramIdList) {
        Map<String, List<String>> paramMap = getCchPackRunningParamMap();
        if (paramMap == null) {
            paramMap = new HashMap<>();
            getApplicationContext().setAttribute(GlobalConfig.APP_KEY_CCH_PACK_RUNNING_PARAM_MAP, paramMap);
        }
        paramMap.put(username, paramIdList);
    }

    /**
     * 移除对应参数
     *
     * @param username 用户名
     */
    private void removeParam(String username) {
        Map<String, List<String>> paramMap = getCchPackRunningParamMap();
        if (paramMap != null) {
            sendLog("删除服务器参数 " + username);
            paramMap.remove(username);
        }
    }


    /**
     * 获取渠道打包进行时的参数集合
     *
     * @return 集合
     */
    private Map<String, List<String>> getCchPackRunningParamMap() {
        Object object = getApplicationContext().getAttribute(GlobalConfig.APP_KEY_CCH_PACK_RUNNING_PARAM_MAP);
        if (object != null) {
            return (Map<String, List<String>>) object;
        } else {
            return null;
        }
    }

}
