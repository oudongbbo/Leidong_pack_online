package com.starjoys.tool.packonline.modules.index.service;

import com.starjoys.tool.packonline.bean.MenuBean;
import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.modules.system.dao.MenuDao;
import com.starjoys.tool.packonline.modules.system.dao.ModuleDao;
import com.starjoys.tool.packonline.modules.system.entity.MenuEntity;
import com.starjoys.tool.packonline.modules.system.entity.ModuleEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserGroupEntity;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 首页业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2016/12/29
 */

@Service
public class IndexService extends BaseService {

    @Resource
    private MenuDao menuDao;

    @Resource
    private ModuleDao moduleDao;


    /**
     * 查找对应用户的菜单列表
     *
     * @param userGroupEntity 用户组对象
     * @return 菜单包装类列表
     */
    public List<MenuBean> findUserMenuList(UserGroupEntity userGroupEntity) {

//        sendLog("开始查询对应用户的菜单列表");

        List<ModuleEntity> moduleEntityList = findAllModuleList();
        if (moduleEntityList != null) {

//            sendLog("把用户组的权限菜单转换成列表");
            List<MenuEntity> menuEntityList = null;

            String groupMenusStr = null;
            if (GlobalConfig.IS_OWN_COMPANY_PUBLISH) {
                groupMenusStr = userGroupEntity.getGroupMenus();
            } else {
                groupMenusStr = "10,45"; // 其他公司部署的话, 只开放推广包打包功能
            }
            if (groupMenusStr != null) {
//                sendLog("把权限菜单字符串拆开成数组 " + groupMenusStr);
                String[] groupMenusArray = groupMenusStr.split(",");
                Map<String, Object> paramMap = new HashedMap();
                paramMap.put("ids", groupMenusArray);
                paramMap.put("isChild", false);
                if (userGroupEntity.getGroupSuperManager() == BaseEntity.FLAG_BOOLEAN_TRUE && GlobalConfig.IS_OWN_COMPANY_PUBLISH) { // 超级管理员可以看到所有菜单
                    menuEntityList = menuDao.findAllList();
                } else {
                    menuEntityList = menuDao.findChildOrParentListByIds(paramMap);
                }
            }

            List<MenuBean> menuBeanList = new ArrayList<>(); // 菜单包装类列表
            for (int i = 0; i < moduleEntityList.size(); i++) { // 循环把权限转化成菜单包装类列表
//                sendLog("循环把权限转化成菜单包装类列表");
//                sendLog("创建菜单包装类");
                MenuBean menuBean = new MenuBean(); // 菜单包装类
                ModuleEntity moduleEntity = moduleEntityList.get(i);
//                sendLog("把对应模块添加到菜单包装类 " + moduleEntity);
                menuBean.setModuleEntity(moduleEntity);

                if (menuEntityList != null) {
                    List<MenuEntity> userMenuList = null; // 用户菜单列表
                    for (int j = 0; j < menuEntityList.size(); j++) {
                        MenuEntity menuEntity = menuEntityList.get(j);
                        if (moduleEntity.getModuleId() == menuEntity.getModuleId()) { // 是当前模块的菜单
                            if (userMenuList == null) { // 为空就创建
//                                sendLog("创建用户菜单列表");
                                userMenuList = new ArrayList<>();
                            }
//                            sendLog("把对应模块的菜单添加到菜单列表 " + menuEntity);
                            userMenuList.add(menuEntity);
                        }
                        if (userMenuList != null && userMenuList.size() != 0) {
//                            sendLog("把用户菜单列表添加到菜单包装类");
                            menuBean.setMenuEntityList(userMenuList);
                        }
                    }
                }

//                sendLog("把对应模块的菜单添加到菜单列表 " + menuBean);
                menuBeanList.add(menuBean);
            }

            // 去除空的模块菜单
            for (int i = 0; i < menuBeanList.size(); i++) {
                if (menuBeanList.get(i).getMenuEntityList() == null || menuBeanList.get(i).getMenuEntityList().size()
                        == 0) {
                    menuBeanList.remove(i);
                    i--;
                }
            }

//            sendLog("返回菜单列表 " + menuBeanList);
            return menuBeanList;
        }

        // 返回空为失败
        return null;
    }

    /**
     * 查询所有菜单
     *
     * @return 菜单列表
     */
    public List<MenuEntity> findAllMenuList() {
//        sendLog("获取所有菜单列表");
        return menuDao.findAllList();
    }

    /**
     * 查询所有模块
     *
     * @return 模块列表
     */
    public List<ModuleEntity> findAllModuleList() {
//        sendLog("获取所有模块列表");
        return moduleDao.findAllList();
    }

}
