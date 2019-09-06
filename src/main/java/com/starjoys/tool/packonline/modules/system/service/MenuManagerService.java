package com.starjoys.tool.packonline.modules.system.service;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.bean.ValidationResultBean;
import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.modules.system.dao.MenuDao;
import com.starjoys.tool.packonline.modules.system.dao.ModuleDao;
import com.starjoys.tool.packonline.modules.system.entity.MenuEntity;
import com.starjoys.tool.packonline.modules.system.entity.ModuleEntity;
import com.starjoys.tool.packonline.utils.ValidationUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 用户组管理业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/5
 */
@Service
public class MenuManagerService extends BaseService implements IBaseManagerService<MenuEntity> {

    @Resource
    private ModuleDao moduleDao;

    @Resource
    private MenuDao menuDao;


    @Transactional(readOnly = true)
    @Override
    public ResultBean<List<MenuEntity>> findAllData() {
        sendLog("调用查找所有数据");
        return new ResultBean<>(handleModuleAndMenu(false), "", true);
    }

    @Transactional(readOnly = true)
    public ResultBean<List<MenuEntity>> findDataByStatus() {
        sendLog("调用查询启用的菜单");
        return new ResultBean<>(handleModuleAndMenu(true), "", true);
    }

    /**
     * @param isJudgeStatus 是否判断状态
     * @return 菜单列表
     */
    private List<MenuEntity> handleModuleAndMenu(boolean isJudgeStatus) {
        List<MenuEntity> moduleMenuList = moduleToMenu(moduleDao.findAllList()); // 模块菜单列表
        List<MenuEntity> firstMenuList = menuDao.findTreeListByParentId(0); // 第一级菜单列表
        for (MenuEntity moduleMenu : moduleMenuList) {
            if (isJudgeStatus && moduleMenu.getStatus() == BaseEntity.FLAG_STATUS_DEL) {
                continue;
            }
            int moduleId = moduleMenu.getModuleId();
            moduleMenu.setChildren(new ArrayList<>());
            for (MenuEntity firstMenu : firstMenuList) {
                if (isJudgeStatus && firstMenu.getStatus() == BaseEntity.FLAG_STATUS_DEL) {
                    continue;
                }
                if (firstMenu.getModuleId() == moduleId) {
                    moduleMenu.getChildren().add(firstMenu);

                    List<MenuEntity> daoMenuList = menuDao.findTreeListByParentId(firstMenu.getMenuId());
                    List<MenuEntity> childMenuList = handleSecondMenuList(daoMenuList, isJudgeStatus);
                    firstMenu.setChildren(childMenuList);
                }
            }
        }

        if (isJudgeStatus) {
            // 把停用的模块排除掉
            List<MenuEntity> tempList = new ArrayList<>(moduleMenuList.size());
            for (MenuEntity menu : moduleMenuList) {
                if (menu.getStatus() == BaseEntity.FLAG_STATUS_ACTIVE) {
                    tempList.add(menu);
                }
            }
            moduleMenuList = tempList;
        }

        // 添加顶级菜单
        List<MenuEntity> finalMenuList = new ArrayList<>();
        MenuEntity topMenu = new MenuEntity();
        topMenu.setMenuId(0);
        topMenu.setId(0);
        topMenu.setText("顶级菜单");
        topMenu.setMenuName("顶级菜单");
        topMenu.setChildren(moduleMenuList);
        topMenu.setIsShow(-1);
        topMenu.setStatus(-1);
        finalMenuList.add(topMenu);
        return finalMenuList;
    }

    /**
     * 模块转为菜单
     *
     * @param moduleList 模块列表
     * @return 菜单列表
     */
    private List<MenuEntity> moduleToMenu(List<ModuleEntity> moduleList) {
        List<MenuEntity> moduleMenuList = new ArrayList<>();
        for (ModuleEntity module : moduleList) {
            MenuEntity menuEntity = new MenuEntity();
            menuEntity.setId(-module.getModuleId());
            menuEntity.setMenuId(-module.getModuleId());
            menuEntity.setModuleId(module.getModuleId());
            menuEntity.setText(module.getModuleName());
            menuEntity.setMenuName(module.getModuleName());
            menuEntity.setMenuUrl(module.getModuleUrl());
            menuEntity.setMenuSort(module.getModuleSort());
            menuEntity.setMenuIcon(module.getModuleIcon());
            menuEntity.setIconCls("icon-" + module.getModuleIcon());
            menuEntity.setMenuDesc(module.getModuleDesc());
            menuEntity.setStatus(module.getStatus());
            menuEntity.setIsShow(module.getIsShow());
            moduleMenuList.add(menuEntity);
        }
        return moduleMenuList;
    }

    /**
     * 关联第二级菜单
     *
     * @param lastMenuList  上一个菜单列表
     * @param isJudgeStatus 是否判断状态
     * @return 二级后面的菜单列表
     */
    private List<MenuEntity> handleSecondMenuList(List<MenuEntity> lastMenuList, boolean isJudgeStatus) {
        if (lastMenuList == null || lastMenuList.size() == 0) {
            return null;
        } else {
            for (MenuEntity menu : lastMenuList) {
                if (isJudgeStatus && menu.getStatus() == BaseEntity.FLAG_STATUS_DEL) {
                    continue;
                }
                List<MenuEntity> daoMenuList = menuDao.findTreeListByParentId(menu.getMenuId());
                List<MenuEntity> childMenuList = handleSecondMenuList(daoMenuList, isJudgeStatus);
                menu.setChildren(childMenuList);
            }

            // 把有子节点的放到最前
            for (int i = 0; i < lastMenuList.size(); i++) {
                MenuEntity menu = lastMenuList.get(i);
                if (menu.getChildren() != null && menu.getChildren().size() > 0) {
                    lastMenuList.remove(i);
                    lastMenuList.add(0, menu);
                    i--;
                }
            }
            return lastMenuList;
        }
    }

    @Override
    public ResultBean<List<MenuEntity>> findAllData(MenuEntity entity) {
        return null;
    }

    @Override
    public ResultBean<List<MenuEntity>> findDataByPage(MenuEntity entity) {
        return null;
    }

    @Transactional
    @Override
    public ResultBean<MenuEntity> addData(MenuEntity entity) {
        sendLog("调用添加数据方法 " + entity);
        ResultBean<MenuEntity> resultBean = new ResultBean<>();
        if (validateBaseData(resultBean, entity)) // 基础数据验证
            if (validateDaoData(resultBean, entity, true)) // 数据库数据验证
                handleAddDao(resultBean, entity);
        return resultBean;
    }

    @Transactional
    @Override
    public ResultBean<MenuEntity> updateData(MenuEntity entity) {
        sendLog("调用编辑数据方法 " + entity);
        ResultBean<MenuEntity> resultBean = new ResultBean<>();
        if (validateBaseData(resultBean, entity)) // 基础数据验证
            if (validateDaoData(resultBean, entity, false)) // 数据库数据验证
                handleUpdateDao(resultBean, entity);
        return resultBean;
    }

    /**
     * 验证基础数据
     *
     * @param resultBean 结果集
     * @param entity     菜单对象
     * @return 是否验证成功
     */
    private boolean validateBaseData(ResultBean<MenuEntity> resultBean, MenuEntity entity) {
        // 对数据对象验证
        ValidationResultBean validationResultBean = ValidationUtils.validateEntity(entity);
        sendLog("检验bean的基本数据结果 " + validationResultBean);
        if (validationResultBean.isHasErrors()) { // 存在错误
            setResultBeanError(resultBean, ValidationUtils.getFirstErrorMessage(validationResultBean));
            return false;
        }
        return true;
    }

    /**
     * 验证数据库数据
     *
     * @param resultBean 结果集
     * @param entity     菜单对象
     * @param isAdd      是否为添加操作
     * @return 是否验证成功
     */
    private boolean validateDaoData(ResultBean<MenuEntity> resultBean, MenuEntity entity, boolean isAdd) {
        // 对重复性以及上级菜单是否存在验证
        String paramMenuName = entity.getMenuName();
        String paramMenuUrl = entity.getMenuUrl();
        int parentMenuId = entity.getMenuParentId();
        int menuId = Math.abs(entity.getMenuId()); // 编辑的时候用到
        if (parentMenuId == 0) { // 选顶级菜单作为模块处理
            List<ModuleEntity> daoList;
            if (isAdd) { // 排除相同id
                daoList = moduleDao.findListByNameOrUrl(paramMenuName, paramMenuUrl);
            } else {
                daoList = moduleDao.findListByNameOrUrlWithoutId(paramMenuName, paramMenuUrl, menuId);
            }
            if (daoList.size() != 0) {
                setResultBeanError(resultBean, "菜单名称或菜单链接已存在");
                return false;
            }
        } else { // 除了顶级菜单以为全都作为菜单处理
            List<MenuEntity> daoList;
            if (isAdd) {
                daoList = menuDao.findListByNameOrUrl(paramMenuName, paramMenuUrl);
            } else { // 排除相同id
                daoList = menuDao.findListByNameOrUrlWithoutId(paramMenuName, paramMenuUrl, menuId);
            }
            if (daoList.size() != 0) {
                setResultBeanError(resultBean, "菜单名称或菜单链接已存在");
                return false;
            }

            // 上级菜单判断
            BaseEntity daoEntity;
            if (parentMenuId > 0) {
                daoEntity = menuDao.get(parentMenuId + "");
            } else {
                daoEntity = moduleDao.get(Math.abs(parentMenuId) + ""); // 模块id为负数的
            }
            if (daoEntity == null) {
                setResultBeanError(resultBean, "上级菜单不存在");
                return false;
            }
            if (daoEntity instanceof MenuEntity) { // 给子菜单设置和上级菜单一样的模块id
                entity.setModuleId(((MenuEntity) (daoEntity)).getModuleId());
            }
        }

        return true;
    }

    /**
     * 处理添加到数据库
     *
     * @param resultBean 结果集
     * @param entity     菜单对象
     */
    private void handleAddDao(ResultBean<MenuEntity> resultBean, MenuEntity entity) {
        int parentMenuId = entity.getMenuParentId();
        if (parentMenuId == 0) { // 插入模块
            moduleDao.insert(menuToModule(entity));
        } else { // 插入菜单
            if (parentMenuId < 0) { // 父级菜单
                entity.setMenuParentId(0);
                entity.setModuleId(Math.abs(parentMenuId));
            }
            menuDao.insert(entity);
        }

        setResultBean(resultBean, true, "添加成功");
    }

    /**
     * 处理更新到数据库
     *
     * @param resultBean 结果集
     * @param entity     菜单对象
     */
    private void handleUpdateDao(ResultBean<MenuEntity> resultBean, MenuEntity entity) {
        int menuId = entity.getMenuId();
        int parentId = entity.getMenuParentId();
        if (menuId < 0) { // 模块
            if (parentId != 0) {
                setResultBeanError(resultBean, "暂不支持模块移动");
                return;
            }
            if (moduleDao.get(Math.abs(menuId) + "") != null) { // 检查是否存在
                // 更新模块
                entity.setMenuId(Math.abs(menuId));
                moduleDao.update(menuToModule(entity));
            } else {
                setResultBeanError(resultBean, "找不到此模块");
            }
        } else { // 菜单
            MenuEntity daoEntity = menuDao.get(menuId + "");
            if (daoEntity == null) {
                setResultBeanError(resultBean, "找不到此菜单");
                return;
            }
//            if (daoEntity.getMenuParentId() == 0) { // 当前是二级菜单
//
//            } else { // 非二级菜单
//
//            }
//            if (daoEntity.getMenuParentId() != parentId) { // 意味着需要移动
//                if (daoEntity.getMenuParentId() == 0) {
//                    setResultBeanError(resultBean, "暂不支持二级菜单移动");
//                    return;
//                }
//                // 更新所有子菜单的moduleId
//                menuDao.updateAllModuleIdByParentId(daoEntity.getMenuId());
//            }
            // 更新当前菜单
            menuDao.update(entity);
        }

        setResultBean(resultBean, true, "编辑成功");
    }

    /**
     * 菜单转模块
     *
     * @param menu 菜单
     * @return 模块对象
     */
    private ModuleEntity menuToModule(MenuEntity menu) {
        ModuleEntity moduleEntity = new ModuleEntity();
        moduleEntity.setModuleId(menu.getMenuId());
        moduleEntity.setModuleName(menu.getMenuName());
        moduleEntity.setModuleUrl(menu.getMenuUrl());
        moduleEntity.setModuleIcon(menu.getMenuIcon());
        moduleEntity.setModuleSort(menu.getMenuSort());
        moduleEntity.setModuleDesc(menu.getMenuDesc());
        moduleEntity.setIsShow(menu.getIsShow());
        moduleEntity.setStatus(menu.getStatus());
        return moduleEntity;
    }

    @Override
    public ResultBean<MenuEntity> changeStatus(String id) {
        return null;
    }

    @Override
    public ResultBean<MenuEntity> getData(String id) {
        return null;
    }
}
