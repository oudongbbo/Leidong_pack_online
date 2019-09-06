package com.starjoys.tool.packonline.modules.system.entity;

import com.starjoys.tool.packonline.common.base.BaseEntity;

/**
 * 模块数据对象类
 *
 * @author Andy
 * @version 1.0
 * @create 2016/12/29
 */

public class ModuleEntity extends BaseEntity {

    /** 模块标识 **/
    private int moduleId;

    /** 模块名 **/
    private String moduleName;

    /** 模块网址 **/
    private String moduleUrl;

    /** 模块说明 **/
    private String moduleDesc;

    /** 模块排序 **/
    private int moduleSort;

    /** 模块图标 **/
    private String moduleIcon;

    /** 模块状态 **/
    private int status;

    /** 模块展示 **/
    private int isShow;

    public int getModuleId() {
        return moduleId;
    }

    public void setModuleId(int moduleId) {
        this.moduleId = moduleId;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public String getModuleUrl() {
        return moduleUrl;
    }

    public void setModuleUrl(String moduleUrl) {
        this.moduleUrl = moduleUrl;
    }

    public String getModuleDesc() {
        return moduleDesc;
    }

    public void setModuleDesc(String moduleDesc) {
        this.moduleDesc = moduleDesc;
    }

    public int getModuleSort() {
        return moduleSort;
    }

    public void setModuleSort(int moduleSort) {
        this.moduleSort = moduleSort;
    }

    public String getModuleIcon() {
        return moduleIcon;
    }

    public void setModuleIcon(String moduleIcon) {
        this.moduleIcon = moduleIcon;
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
        return "ModuleEntity{" +
                "moduleId=" + moduleId +
                ", moduleName='" + moduleName + '\'' +
                ", moduleUrl='" + moduleUrl + '\'' +
                ", moduleDesc='" + moduleDesc + '\'' +
                ", moduleSort=" + moduleSort +
                ", moduleIcon='" + moduleIcon + '\'' +
                ", status=" + status +
                ", isShow=" + isShow +
                "} " + super.toString();
    }
}
