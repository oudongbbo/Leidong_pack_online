package com.starjoys.tool.packonline.bean;

import com.starjoys.tool.packonline.modules.system.entity.MenuEntity;
import com.starjoys.tool.packonline.modules.system.entity.ModuleEntity;
import com.starjoys.tool.packonline.modules.system.entity.MenuEntity;

import java.util.List;

/**
 * 菜单数据包装类
 *
 * @author Andy
 * @version 1.0
 * @create 2016/12/30
 */

public class MenuBean {

    /** 模块数据对象 **/
    private ModuleEntity moduleEntity;

    /** 菜单数据对象列表 **/
    private List<MenuEntity> menuEntityList;

    public MenuBean() {
    }

    public MenuBean(ModuleEntity moduleEntity, List<MenuEntity> menuEntityList) {
        this.moduleEntity = moduleEntity;
        this.menuEntityList = menuEntityList;
    }

    public ModuleEntity getModuleEntity() {
        return moduleEntity;
    }

    public void setModuleEntity(ModuleEntity moduleEntity) {
        this.moduleEntity = moduleEntity;
    }

    public List<MenuEntity> getMenuEntityList() {
        return menuEntityList;
    }

    public void setMenuEntityList(List<MenuEntity> menuEntityList) {
        this.menuEntityList = menuEntityList;
    }

    @Override
    public String toString() {
        return "MenuBean{" +
                "moduleEntity=" + moduleEntity +
                ", menuEntityList=" + menuEntityList +
                '}';
    }
}
