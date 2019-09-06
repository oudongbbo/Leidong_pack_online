package com.starjoys.tool.packonline.modules.system.entity;

import com.starjoys.tool.packonline.common.base.TreeEntity;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;

/**
 * 菜单数据对象类
 * Created by Andy on 2016/12/29.
 */
public class MenuEntity extends TreeEntity<MenuEntity, String> {

    /** 菜单标识 **/
    private int menuId;

    /** 菜单名 **/
    @NotBlank(message = "菜单名不能为空")
    private String menuName;

    /** 父菜单标识 **/
    private int menuParentId;

    /** 菜单网址 **/
    @NotBlank(message = "菜单链接不能为空")
    private String menuUrl;

    /** 菜单说明 **/
    private String menuDesc;

    /** 菜单排序 **/
    @Range(min = 1, message = "菜单排序必须大于0")
    private int menuSort;

    /** 菜单图标 **/
    private String menuIcon;

    /** 模块标识 **/
    private int moduleId;

    /** 状态 **/
    @Range(min = 0, max = 1, message = "状态超出范围")
    private int status;

    /** 导航菜单 **/
    @Range(min = 0, max = 1, message = "导航菜单是否展示超出范围")
    private int isShow;

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public int getMenuParentId() {
        return menuParentId;
    }

    public void setMenuParentId(int menuParentId) {
        this.menuParentId = menuParentId;
    }

    public String getMenuUrl() {
        return menuUrl;
    }

    public void setMenuUrl(String menuUrl) {
        this.menuUrl = menuUrl;
    }

    public String getMenuDesc() {
        return menuDesc;
    }

    public void setMenuDesc(String menuDesc) {
        this.menuDesc = menuDesc;
    }

    public int getMenuSort() {
        return menuSort;
    }

    public void setMenuSort(int menuSort) {
        this.menuSort = menuSort;
    }

    public String getMenuIcon() {
        return menuIcon;
    }

    public void setMenuIcon(String menuIcon) {
        this.menuIcon = menuIcon;
    }

    public int getModuleId() {
        return moduleId;
    }

    public void setModuleId(int moduleId) {
        this.moduleId = moduleId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getIsShow() {
        return isShow;
    }

    public void setIsShow(int isShow) {
        this.isShow = isShow;
    }

    @Override
    public String toString() {
        return "MenuEntity{" +
                "menuId=" + menuId +
                ", menuName='" + menuName + '\'' +
                ", menuParentId=" + menuParentId +
                ", menuUrl='" + menuUrl + '\'' +
                ", menuDesc='" + menuDesc + '\'' +
                ", menuSort=" + menuSort +
                ", menuIcon='" + menuIcon + '\'' +
                ", moduleId=" + moduleId +
                ", status=" + status +
                ", isShow=" + isShow +
                "} " + super.toString();
    }
}
