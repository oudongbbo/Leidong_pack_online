package com.starjoys.tool.packonline.modules.index.service;

import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.modules.system.dao.MenuDao;
import com.starjoys.tool.packonline.modules.system.dao.UserGroupDao;
import com.starjoys.tool.packonline.modules.system.entity.MenuEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserGroupEntity;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 权限业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/3
 */

@Service
public class AuthorityService extends BaseService {

    @Resource
    private MenuDao menuDao;

    @Resource
    private UserGroupDao userGroupDao;


    /**
     * 通过菜单连接检查用户的权限
     *
     * @param userGroupEntity 用户组对象
     * @param menuUrl         当前访问的菜单连接
     * @return 是否有权限访问
     */
    public boolean checkUserAuthorityByMenuUrl(UserGroupEntity userGroupEntity, String[] groupActs, String menuUrl) {
        sendLog("通过菜单连接检查用户的权限 userEntity:" + userGroupEntity + " menuUrl:" + menuUrl);

        if (userGroupEntity.getGroupSuperManager() == BaseEntity.FLAG_BOOLEAN_TRUE) { // 超管拥有所有权限
            sendLog("我是超管, 我最叼!!");
            return true;
        }

        if (groupActs == null || groupActs.length <= 0 || menuUrl == null) {
            sendLog("菜单链接或者操作为空");
            return false;
        }

        if (menuUrl.endsWith("changeMyPsw")) { // 修改自己的密码, 不用检测权限
            sendLog("修改自己的密码, 跳过权限");
            return true;
        }

//        String groupMenusStr = userGroupEntity.getGroupMenus();
//        if (groupMenusStr == null) {
//            return false;
//        }
//        sendLog("把权限菜单字符串拆开成数组 " + groupMenusStr);
//        String[] groupMenusArray = groupMenusStr.split(",");

//        sendLog("通过菜单连接获取菜单对象");
        MenuEntity menuEntity = menuDao.getByMenuUrl(menuUrl);
//        sendLog("获取到的菜单对象 " + menuEntity);


        // 二级菜单不检测
        if (menuEntity != null && menuEntity.getMenuParentId() == 0) {
            return true;
        }

        if (menuEntity != null && menuEntity.getStatus() == BaseEntity.FLAG_STATUS_ACTIVE) { //
//            sendLog("从用户组权限菜单中遍历当前访问的菜单");
            for (String userGroupMenuId : groupActs) { // 从用户组权限菜单中遍历当前访问的菜单
                if (menuEntity.getMenuId() == Integer.parseInt(userGroupMenuId)) { // 从用户组权限菜单找到当前访问的菜单
                    // 当前用户有权限访问
                    return true;
                }
            }
        }

        // 在用户组权限菜单中找不到对应权限
        return false;
    }


    /**
     * 获取对应用户组
     *
     * @param userGroupId 用户组标识
     * @return 用户组对象
     */
    public UserGroupEntity getUserGroup(String userGroupId) {
//        sendLog("获取对应的用户组 userGroupId:" + userGroupId);
        UserGroupEntity userGroupEntity = userGroupDao.get(userGroupId);
//        sendLog("对应的用户组信息 " + userGroupEntity);
        return userGroupEntity;
    }

}
