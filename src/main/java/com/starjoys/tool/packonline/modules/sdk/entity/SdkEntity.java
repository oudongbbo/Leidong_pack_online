package com.starjoys.tool.packonline.modules.sdk.entity;

import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.modules.packmanager.entity.ChannelEntity;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

/**
 * sdk对象类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/5/8
 */

public class SdkEntity extends BaseEntity {

    /** sdk唯一标识 **/
    private String sdkId;

    /** sdk版本 **/
    private SdkVersionEntity ver;

    private ChannelEntity cch;

    /** sdk所属系统(1代表安卓, 2代表iOS) **/
    private String sdkSystem;

    /** sdk创建时间 **/
    private Timestamp sdkCreateDate;

    /** 当前状态 **/
    private int status;

    /** 是否为海外 **/
    private boolean isOversea;

    private MultipartFile sdkUploadFile;

    public String getSdkId() {
        return sdkId;
    }

    public void setSdkId(String sdkId) {
        this.sdkId = sdkId;
    }

    public SdkVersionEntity getVer() {
        return ver;
    }

    public void setVer(SdkVersionEntity ver) {
        this.ver = ver;
    }

    public String getSdkSystem() {
        return sdkSystem;
    }

    public void setSdkSystem(String sdkSystem) {
        this.sdkSystem = sdkSystem;
    }

    public Timestamp getSdkCreateDate() {
        return sdkCreateDate;
    }

    public void setSdkCreateDate(Timestamp sdkCreateDate) {
        this.sdkCreateDate = sdkCreateDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public MultipartFile getSdkUploadFile() {
        return sdkUploadFile;
    }

    public void setSdkUploadFile(MultipartFile sdkUploadFile) {
        this.sdkUploadFile = sdkUploadFile;
    }

    public boolean isOversea() {
        return isOversea;
    }

    public void setOversea(boolean oversea) {
        isOversea = oversea;
    }

    public ChannelEntity getCch() {
        return cch;
    }

    public void setCch(ChannelEntity cch) {
        this.cch = cch;
    }

    @Override
    public String toString() {
        return "SdkEntity{" +
                "sdkId='" + sdkId + '\'' +
                ", ver=" + ver +
                ", cch=" + cch +
                ", sdkSystem='" + sdkSystem + '\'' +
                ", sdkCreateDate=" + sdkCreateDate +
                ", status=" + status +
                ", isOversea=" + isOversea +
                ", sdkUploadFile=" + sdkUploadFile +
                "} " + super.toString();
    }
}
