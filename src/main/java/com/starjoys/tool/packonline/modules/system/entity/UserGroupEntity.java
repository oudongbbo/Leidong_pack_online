package com.starjoys.tool.packonline.modules.system.entity;

import com.starjoys.tool.packonline.common.base.BaseEntity;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import java.sql.Timestamp;

/**
 * 用户组数据对象类
 *
 * @author Andy
 * @version 1.0
 * @create 2016/12/30
 */

public class UserGroupEntity extends BaseEntity {

    /** 用户组标识 **/
    private int groupId;

    /** 公司对象 **/
    private CompanyEntity company;

    /** 用户组名 **/
    @Length(min = 1, max = 100, message = "用户组名称字数超出范围")
    @NotBlank(message = "用户组名称不能为空")
    private String groupName;

    /** 用户组菜单权限 **/
    private String groupMenus;

    /** 用户组操作权限 **/
    private String groupActs;

    /** 用户组说明 **/
    @Length(max = 200, message = "用户组描述字数超出范围")
    private String groupDesc;

    /** 用户组主人标识 **/
    private int groupOwnId;

    /** 用户组创建时间 **/
    private Timestamp groupCreateDate;

    /** 用户是否为超管 **/
    private int groupSuperManager;

    /** 状态 **/
    private int status;

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getGroupMenus() {
        return groupMenus;
    }

    public void setGroupMenus(String groupMenus) {
        this.groupMenus = groupMenus;
    }

    public String getGroupActs() {
        return groupActs;
    }

    public void setGroupActs(String groupActs) {
        this.groupActs = groupActs;
    }

    public String getGroupDesc() {
        return groupDesc;
    }

    public void setGroupDesc(String groupDesc) {
        this.groupDesc = groupDesc;
    }

    public int getGroupOwnId() {
        return groupOwnId;
    }

    public void setGroupOwnId(int groupOwnId) {
        this.groupOwnId = groupOwnId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Timestamp getGroupCreateDate() {
        return groupCreateDate;
    }

    public void setGroupCreateDate(Timestamp groupCreateDate) {
        this.groupCreateDate = groupCreateDate;
    }

    public int getGroupSuperManager() {
        return groupSuperManager;
    }

    public void setGroupSuperManager(int groupSuperManager) {
        this.groupSuperManager = groupSuperManager;
    }

    public CompanyEntity getCompany() {
        return company;
    }

    public void setCompany(CompanyEntity company) {
        this.company = company;
    }


    @Override
    public String toString() {
        return "UserGroupEntity{" +
                "groupId=" + groupId +
                ", company=" + company +
                ", groupName='" + groupName + '\'' +
                ", groupMenus='" + groupMenus + '\'' +
                ", groupActs='" + groupActs + '\'' +
                ", groupDesc='" + groupDesc + '\'' +
                ", groupOwnId=" + groupOwnId +
                ", groupCreateDate=" + groupCreateDate +
                ", groupSuperManager=" + groupSuperManager +
                ", status=" + status +
                "} " + super.toString();
    }
}
