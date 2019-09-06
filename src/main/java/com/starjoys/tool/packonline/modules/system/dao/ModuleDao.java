package com.starjoys.tool.packonline.modules.system.dao;

import com.starjoys.tool.packonline.common.base.BaseDao;
import com.starjoys.tool.packonline.common.base.MyBatisDao;
import com.starjoys.tool.packonline.modules.system.entity.ModuleEntity;

import java.util.List;

/**
 * 模块数据访问层接口类
 *
 * @author Andy
 * @version 1.0
 * @create 2016/12/29
 */

@MyBatisDao
public interface ModuleDao extends BaseDao<ModuleEntity> {


    /**
     * 通过模块名或模块链接查找列表
     *
     * @param moduleName 模块名称
     * @param moduleUrl  模块链接
     * @return 模块列表
     */
    public List<ModuleEntity> findListByNameOrUrl(String moduleName, String moduleUrl);


    /**
     * 通过模块名或模块链接并排除相同id查找列表
     *
     * @param moduleName 模块名称
     * @param moduleUrl  模块链接
     * @param moduleId   模块id
     * @return 模块列表
     */
    public List<ModuleEntity> findListByNameOrUrlWithoutId(String moduleName, String moduleUrl, int moduleId);


}
