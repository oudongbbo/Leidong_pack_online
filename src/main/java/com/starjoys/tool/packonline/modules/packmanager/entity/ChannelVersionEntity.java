package com.starjoys.tool.packonline.modules.packmanager.entity;

import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import org.hibernate.validator.constraints.NotBlank;

import java.sql.Timestamp;

/**
 * 渠道包版本对象类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/23
 */

public class ChannelVersionEntity extends BaseEntity {

    /** 渠道版本ID **/
    private String cchVerId;

    /** 渠道信息 **/
    private ChannelEntity cch;

    /** 渠道ID **/
    private long _cchId;

    /** 渠道版本名 **/
    @NotBlank(message = "渠道版本名不能为空")
    private String cchVerName;

    /** 渠道版本更新时间 **/
    private Timestamp cchVerUpDate;

    /** 渠道版本更新状态 **/
    private int cchVerUpStatus;

    /** 渠道版本更新详情 **/
    private String cchVerUpDesc;

    /** 渠道版本是否为最新 **/
    private int isNew;

    /** 启用标识 **/
    private int status;

    /** 渠道版本更新格式化时间 **/
    private String cchVerUpFDate;

    /** 渠道版本更新数据包文件路径 **/
    private String cchVerUpDataPath;

    /** 渠道版本更新用户 **/
    private UserEntity user;

    public String getCchVerId() {
        return cchVerId;
    }

    public void setCchVerId(String cchVerId) {
        this.cchVerId = cchVerId;
    }

    public ChannelEntity getCch() {
        return cch;
    }

    public void setCch(ChannelEntity cch) {
        this.cch = cch;
    }

    public String getCchVerName() {
        return cchVerName;
    }

    public void setCchVerName(String cchVerName) {
        this.cchVerName = cchVerName;
    }

    public Timestamp getCchVerUpDate() {
        return cchVerUpDate;
    }

    public void setCchVerUpDate(Timestamp cchVerUpDate) {
        this.cchVerUpDate = cchVerUpDate;
    }

    public int getCchVerUpStatus() {
        return cchVerUpStatus;
    }

    public void setCchVerUpStatus(int cchVerUpStatus) {
        this.cchVerUpStatus = cchVerUpStatus;
    }

    public String getCchVerUpDesc() {
        return cchVerUpDesc;
    }

    public void setCchVerUpDesc(String cchVerUpDesc) {
        this.cchVerUpDesc = cchVerUpDesc;
    }

    public int getIsNew() {
        return isNew;
    }

    public void setIsNew(int isNew) {
        this.isNew = isNew;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public long get_cchId() {
        return _cchId;
    }

    public void set_cchId(long _cchId) {
        this._cchId = _cchId;
    }

    public String getCchVerUpFDate() {
        return cchVerUpFDate;
    }

    public void setCchVerUpFDate(String cchVerUpFDate) {
        this.cchVerUpFDate = cchVerUpFDate;
    }

    public String getCchVerUpDataPath() {
        return cchVerUpDataPath;
    }

    public void setCchVerUpDataPath(String cchVerUpDataPath) {
        this.cchVerUpDataPath = cchVerUpDataPath;
    }

    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "ChannelVersionEntity{" +
                "cchVerId='" + cchVerId + '\'' +
                ", cch=" + cch +
                ", _cchId=" + _cchId +
                ", cchVerName='" + cchVerName + '\'' +
                ", cchVerUpDate=" + cchVerUpDate +
                ", cchVerUpStatus=" + cchVerUpStatus +
                ", cchVerUpDesc='" + cchVerUpDesc + '\'' +
                ", isNew=" + isNew +
                ", status=" + status +
                ", cchVerUpFDate='" + cchVerUpFDate + '\'' +
                ", cchVerUpDataPath='" + cchVerUpDataPath + '\'' +
                ", user=" + user +
                '}';
    }
}
