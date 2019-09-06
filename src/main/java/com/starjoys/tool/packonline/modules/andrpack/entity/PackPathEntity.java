package com.starjoys.tool.packonline.modules.andrpack.entity;

import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;

import java.sql.Timestamp;


/**
 * 打包路径对象类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/18
 */

public class PackPathEntity extends BaseEntity {

    /** 打包路径ID **/
    private String packPathId;

    /** 用户 **/
    private UserEntity user;

    /** 打包路径文本 **/
    private String packPathText;

    /** 打包路径创建时间 **/
    private Timestamp packPathCreateDate;

    /** 删除标识 **/
    private int status;

    public String getPackPathId() {
        return packPathId;
    }

    public void setPackPathId(String packPathId) {
        this.packPathId = packPathId;
    }

    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }

    public String getPackPathText() {
        return packPathText;
    }

    public void setPackPathText(String packPathText) {
        this.packPathText = packPathText;
    }

    public Timestamp getPackPathCreateDate() {
        return packPathCreateDate;
    }

    public void setPackPathCreateDate(Timestamp packPathCreateDate) {
        this.packPathCreateDate = packPathCreateDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "PackPathEntity{" +
                "packPathId='" + packPathId + '\'' +
                ", user=" + user +
                ", packPathText='" + packPathText + '\'' +
                ", packPathCreateDate=" + packPathCreateDate +
                ", status=" + status +
                '}';
    }
}
