package com.starjoys.tool.packonline.modules.systemlog.service;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.modules.system.dao.MenuDao;
import com.starjoys.tool.packonline.modules.system.entity.MenuEntity;
import com.starjoys.tool.packonline.modules.systemlog.dao.ActionLogDao;
import com.starjoys.tool.packonline.modules.systemlog.entity.ActionLogEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * 行为日志业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/3/20
 */

@Service
public class ActionLogService extends BaseService {

    @Resource
    private MenuDao menuDao;

    @Resource
    private ActionLogDao actionLogDao;

    /**
     * 处理行为
     *
     * @param requestUrl      请求网址
     * @param requestParamMap 请求参数集合
     */
    public void handleAction(String requestUrl, Map<String, String[]> requestParamMap, String username) {
        MenuEntity menuEntity = menuDao.getByMenuUrl(requestUrl);

        if (menuEntity != null) {

            // 排除访问父菜单行为
            if (menuDao.findTreeListByParentId(menuEntity.getMenuId()).size() != 0) {
                return;
            }

            // 排除访问列表行为
            if (requestUrl.endsWith("list")) {
                return;
            }

            // 设置菜单信息
            ActionLogEntity entity = new ActionLogEntity();
            entity.setActionName(menuEntity.getMenuName());
            entity.setActionUrl(requestUrl);
            entity.setActionUser(username);
            sendLog("设置菜单信息 " + entity.getActionName());

            // 设置参数
            StringBuilder stringBuilder = new StringBuilder();
            Iterator<String> it = requestParamMap.keySet().iterator();
            while (it.hasNext()) {
                if (!stringBuilder.toString().equals("")) {
                    stringBuilder.append("&");
                }
                String key = it.next();
                String value = requestParamMap.get(key)[0];
                stringBuilder.append(key).append("=").append(value);
            }
            entity.setActionParam(stringBuilder.toString());
            sendLog("设置参数 " + entity.getActionParam());

            // 插入
            actionLogDao.insert(entity);

        }

    }

    @Transactional(readOnly = true)
    public ResultBean<List<ActionLogEntity>> findListByPage(ActionLogEntity entity) {
//        sendLog("分页数据查询 " + entity);
        ResultBean<List<ActionLogEntity>> resultBean = new ResultBean<>();
        List<ActionLogEntity> actionLogList = actionLogDao.findListByPage(entity);
        resultBean.setTotal(actionLogDao.findCountByPage());
        setResultBean(resultBean, true, "成功获取所有数据", actionLogList);
        return resultBean;
    }

}
