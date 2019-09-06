package com.starjoys.tool.packonline.modules.sdk.entity;

import com.starjoys.tool.packonline.common.base.BaseEntity;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

/**
 * sdk ios对象类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/5/18
 */

public class SdkIOSEntity extends BaseEntity {

    /** sdk唯一标识 **/
    private String sdkId;

    /** sdk版本 **/
    private SdkVersionEntity ver;

    /** sdk名称 **/
    private String sdkName;

    /** sdk渠道id **/
    private String sdkCchId;

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

    public String getSdkName() {
        return sdkName;
    }

    public void setSdkName(String sdkName) {
        this.sdkName = sdkName;
    }

    public String getSdkCchId() {
        return sdkCchId;
    }

    public void setSdkCchId(String sdkCchId) {
        this.sdkCchId = sdkCchId;
    }


    @Override
    public String toString() {
        return "SdkIOSEntity{" +
                "sdkId='" + sdkId + '\'' +
                ", ver=" + ver +
                ", sdkName='" + sdkName + '\'' +
                ", sdkCchId='" + sdkCchId + '\'' +
                ", sdkCreateDate=" + sdkCreateDate +
                ", status=" + status +
                ", isOversea=" + isOversea +
                ", sdkUploadFile=" + sdkUploadFile +
                "} " + super.toString();
    }
}
