package com.starjoys.tool.packonline.modules.sdk.entity;

import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import java.sql.Timestamp;

/**
 * sdk版本 ios对象类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/5/18
 */

public class SdkVersionIOSEntity extends BaseEntity {

    /** sdk版本id **/
    private String sdkVerId;

    /** sdk唯一标识 **/
    private String sdkId;

    /** 用户信息 **/
    private UserEntity us;

    /** sdk版本名 **/
    @Length(max = 100, message = "sdk名称长度必须为1-100个")
    @NotBlank(message = "sdk版本名不能为空")
    private String sdkVerName;

    /** sdk版本更新时间 **/
    private Timestamp sdkVerUpDate;

    /** sdk更新说明 **/
    @NotBlank(message = "sdk更新说明不能为空")
    private String sdkVerUpDesc;

    /** sdk版本上传路径 **/
    private String sdkVerUpPath;

    /** 是否最新 **/
    private int isNew;

    /** 当前状态 **/
    private int status;

    public String getSdkVerId() {
        return sdkVerId;
    }

    public void setSdkVerId(String sdkVerId) {
        this.sdkVerId = sdkVerId;
    }

    public String getSdkId() {
        return sdkId;
    }

    public void setSdkId(String sdkId) {
        this.sdkId = sdkId;
    }

    public String getSdkVerName() {
        return sdkVerName;
    }

    public void setSdkVerName(String sdkVerName) {
        this.sdkVerName = sdkVerName;
    }

    public Timestamp getSdkVerUpDate() {
        return sdkVerUpDate;
    }

    public void setSdkVerUpDate(Timestamp sdkVerUpDate) {
        this.sdkVerUpDate = sdkVerUpDate;
    }

    public String getSdkVerUpDesc() {
        return sdkVerUpDesc;
    }

    public void setSdkVerUpDesc(String sdkVerUpDesc) {
        this.sdkVerUpDesc = sdkVerUpDesc;
    }

    public String getSdkVerUpPath() {
        return sdkVerUpPath;
    }

    public void setSdkVerUpPath(String sdkVerUpPath) {
        this.sdkVerUpPath = sdkVerUpPath;
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

    public UserEntity getUs() {
        return us;
    }

    public void setUs(UserEntity us) {
        this.us = us;
    }

    @Override
    public String toString() {
        return "SdkVersionEntity{" +
                "sdkVerId='" + sdkVerId + '\'' +
                ", sdkId='" + sdkId + '\'' +
                ", us=" + us +
                ", sdkVerName='" + sdkVerName + '\'' +
                ", sdkVerUpDate=" + sdkVerUpDate +
                ", sdkVerUpDesc='" + sdkVerUpDesc + '\'' +
                ", sdkVerUpPath='" + sdkVerUpPath + '\'' +
                ", isNew='" + isNew + '\'' +
                ", status='" + status + '\'' +
                "} " + super.toString();
    }
}
