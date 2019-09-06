package com.starjoys.tool.packonline.modules.system.service;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.bean.ValidationResultBean;
import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.modules.system.dao.CompanyDao;
import com.starjoys.tool.packonline.modules.system.dao.MenuDao;
import com.starjoys.tool.packonline.modules.system.dao.UserGroupDao;
import com.starjoys.tool.packonline.modules.system.entity.CompanyEntity;
import com.starjoys.tool.packonline.modules.system.entity.MenuEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserGroupEntity;
import com.starjoys.tool.packonline.utils.StringUtils;
import com.starjoys.tool.packonline.utils.ValidationUtils;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 用户组管理业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/5
 */
@Service
public class UserGroupManagerService extends BaseService implements IBaseManagerService<UserGroupEntity> {

    @Resource
    private UserGroupDao userGroupDao;

    @Resource
    private MenuDao menuDao;

    @Resource
    private CompanyDao companyDao;

    @Override
    public ResultBean<List<UserGroupEntity>> findAllData() {
        sendLog("查询所有用户组数据");
        ResultBean<List<UserGroupEntity>> resultBean = new ResultBean<>();
        List<UserGroupEntity> list = userGroupDao.findAllList();
//        sendLog("查询结果 " + list);
        if (list != null) { // 列表不为空
            sendLog("查询成功!");
            resultBean.setRows(list);
            resultBean.setSuccess(true);
            resultBean.setMessage("查询成功!");
        } else { // 列表为空
            sendLog("查询出错!");
            resultBean.setSuccess(false);
            resultBean.setMessage("查询出错!");
        }
//        sendLog("返回查询结果 " + resultBean);
        return resultBean;
    }

    @Override
    public ResultBean<List<UserGroupEntity>> findAllData(UserGroupEntity entity) {
        return null;
    }

    @Transactional(readOnly = true)
    @Override
    public ResultBean<List<UserGroupEntity>> findDataByPage(UserGroupEntity entity) {
//        sendLog("分页数据查询 " + entity);
        ResultBean<List<UserGroupEntity>> resultBean = new ResultBean<>();
        List<UserGroupEntity> groupList = userGroupDao.findListByPage(entity);
        resultBean.setTotal(userGroupDao.findCountByPage());
        setResultBean(resultBean, true, "成功获取所有数据", groupList);
        return resultBean;
    }

    @Transactional
    @Override
    public ResultBean<UserGroupEntity> addData(UserGroupEntity entity) {
        ResultBean<UserGroupEntity> resultBean = new ResultBean<>();
        if (validateBaseData(resultBean, entity))
            if (validateDaoData(resultBean, entity, true))
                handleAddDao(resultBean, entity);
        return resultBean;
    }

    /**
     * 验证基础数据
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     * @return 是否验证成功
     */
    private boolean validateBaseData(ResultBean<UserGroupEntity> resultBean, UserGroupEntity entity) {
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
     * @param entity     数据对象
     * @param isAdd      是否为添加操作
     * @return 是否验证成功
     */
    private boolean validateDaoData(ResultBean<UserGroupEntity> resultBean, UserGroupEntity entity, boolean isAdd) {

        if (entity.getCompany() == null) {
            setResultBeanError(resultBean, "所属公司不能为空");
            return false;
        }

        CompanyEntity daoCompanyEntity = companyDao.get(entity.getCompany().getCompanyId() + "");
        if (daoCompanyEntity == null || daoCompanyEntity.getStatus() == BaseEntity.FLAG_STATUS_DEL) {
            setResultBeanError(resultBean, "找不到此公司");
            return false;
        }

        // 检查是否存在
        if (!isAdd) {
            UserGroupEntity daoEntity = userGroupDao.get(entity.getGroupId() + "");
            if (daoEntity == null) {
                setResultBeanError(resultBean, "找不到此用户组");
                return false;
            }
        }

        List<UserGroupEntity> daoList = userGroupDao.findList(entity);
        if (daoList.size() > 0) {
            if (isAdd || daoList.get(0).getGroupId() != entity.getGroupId()) {
                setResultBeanError(resultBean, "此用户组名称已存在");
                return false;
            }
        }
        return true;
    }

    /**
     * 处理添加到数据库
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     */
    private void handleAddDao(ResultBean<UserGroupEntity> resultBean, UserGroupEntity entity) {
        sendLog("menu: " + entity.getGroupMenus());

        // 处理菜单和权限
        handleMenusAndActs(entity);

        // 插入用户组
        userGroupDao.insert(entity);

        setResultBean(resultBean, true, "添加成功");
    }

    /**
     * 处理菜单和权限
     *
     * @param entity 数据对象
     */
    private void handleMenusAndActs(UserGroupEntity entity) {
        String groupMenus = entity.getGroupMenus();
        sendLog("提交的菜单权限 " + groupMenus);
        if (StringUtils.isNotEmpty(groupMenus)) {
            String[] groupMenuIds = groupMenus.split(",");
            // 父级菜单
            List<Integer> parentIdStrList = menuDao.findParentIdListByIdsWithoutParent(groupMenuIds);
            sendLog("父级菜单" + parentIdStrList);
            groupMenus = getMenuIdsByStr(parentIdStrList);
            sendLog("处理后的 " + groupMenus);

            // 子级菜单
            Map<String, Object> paramMap = new HashedMap();
            paramMap.put("ids", groupMenuIds);
            paramMap.put("isChild", true);
            List<MenuEntity> childMenuList = menuDao.findChildOrParentListByIds(paramMap);
            sendLog("子级菜单" + childMenuList);
            String groupActs = getMenuIds(childMenuList);

            entity.setGroupMenus(groupMenus); // 菜单
            entity.setGroupActs(groupActs); // 操作权限
        }
    }

    /**
     * 获取菜单id列表字符串
     *
     * @param menuList 菜单列表
     * @return 菜单列表字符串
     */
    private String getMenuIds(List<MenuEntity> menuList) {
        String menuIds = "";
        int i = 0;
        for (MenuEntity menu : menuList) {
            if (menu.getStatus() == BaseEntity.FLAG_STATUS_ACTIVE) {
                if (i != 0) {
                    menuIds = menuIds + ",";
                }
                menuIds = menuIds + menu.getMenuId();
                i++;
            }
        }
        return menuIds;
    }

    /**
     * 获取菜单id列表字符串
     *
     * @param menuList 菜单字符串列表
     * @return 菜单列表字符串
     */
    private String getMenuIdsByStr(List<Integer> menuList) {
        String menuIds = "";
        for (int i = 0; i < menuList.size(); i++) {
            if (menuList.get(i) != 0) {
                if (i != 0) {
                    menuIds = menuIds + ",";
                }
                menuIds = menuIds + menuList.get(i);
            }
        }
        return menuIds;
    }


    @Override
    public ResultBean<UserGroupEntity> changeStatus(String id) {
        return null;
    }

    @Transactional
    @Override
    public ResultBean<UserGroupEntity> updateData(UserGroupEntity entity) {
        ResultBean<UserGroupEntity> resultBean = new ResultBean<>();
        if (validateBaseData(resultBean, entity))
            if (validateDaoData(resultBean, entity, false))
                handleUpdateDao(resultBean, entity);
        return resultBean;
    }

    /**
     * 处理更新到数据库
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     */
    private void handleUpdateDao(ResultBean<UserGroupEntity> resultBean, UserGroupEntity entity) {

        // 更新用户组
        userGroupDao.update(entity);

        setResultBean(resultBean, true, "更新成功");
    }

    @Override
    public ResultBean<UserGroupEntity> getData(String id) {
        return null;
    }

    @Transactional
    public ResultBean<UserGroupEntity> updateAuth(UserGroupEntity entity) {
        ResultBean<UserGroupEntity> resultBean = new ResultBean<>();
        UserGroupEntity daoEntity = userGroupDao.get(entity.getGroupId() + "");
        if (daoEntity != null) {
            entity.setCompany(daoEntity.getCompany());

            handleAuthUpdateDao(resultBean, entity);
        } else {
            setResultBeanError(resultBean, "找不到此用户组");
        }

        return resultBean;
    }

    /**
     * 处理更新权限到数据库
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     */
    private void handleAuthUpdateDao(ResultBean<UserGroupEntity> resultBean, UserGroupEntity entity) {
        // 处理菜单和操作权限
        handleMenusAndActs(entity);

        // 更新权限用户组
        userGroupDao.updateAuth(entity);

        setResultBean(resultBean, true, "添加成功");
    }

}
