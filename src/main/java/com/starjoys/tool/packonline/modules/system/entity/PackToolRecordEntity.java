package com.starjoys.tool.packonline.modules.system.entity;

import com.starjoys.tool.packonline.common.base.BaseEntity;
import org.hibernate.validator.constraints.NotBlank;

import java.sql.Timestamp;

/**
 * 打包工具记录对象类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/5/4
 */

public class PackToolRecordEntity extends BaseEntity {

    /** 打包工具记录ID **/
    private long ptRecordId;

    /** 打包工具ID **/
    private long packToolId;

    /** 打包工具记录文件上传路径 **/
    private String ptRecordUpPath;

    /** 打包工具记录更新日期 **/
    private Timestamp ptRecordUpDate;

    /** 状态 **/
    private int status;

    /** 用户 **/
    private UserEntity us;

    /** 打包工具记录更新说明 **/
    @NotBlank(message = "更新说明不能为空")
    private String ptRecordUpDesc;

    public long getPtRecordId() {
        return ptRecordId;
    }

    public void setPtRecordId(long ptRecordId) {
        this.ptRecordId = ptRecordId;
    }

    public long getPackToolId() {
        return packToolId;
    }

    public void setPackToolId(long packToolId) {
        this.packToolId = packToolId;
    }

    public String getPtRecordUpPath() {
        return ptRecordUpPath;
    }

    public void setPtRecordUpPath(String ptRecordUpPath) {
        this.ptRecordUpPath = ptRecordUpPath;
    }

    public Timestamp getPtRecordUpDate() {
        return ptRecordUpDate;
    }

    public void setPtRecordUpDate(Timestamp ptRecordUpDate) {
        this.ptRecordUpDate = ptRecordUpDate;
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

    public String getPtRecordUpDesc() {
        return ptRecordUpDesc;
    }

    public void setPtRecordUpDesc(String ptRecordUpDesc) {
        this.ptRecordUpDesc = ptRecordUpDesc;
    }

    @Override
    public String toString() {
        return "PackToolRecordEntity{" +
                "ptRecordId=" + ptRecordId +
                ", packToolId=" + packToolId +
                ", ptRecordUpPath='" + ptRecordUpPath + '\'' +
                ", ptRecordUpDate=" + ptRecordUpDate +
                ", status=" + status +
                ", us=" + us +
                ", ptRecordUpDesc='" + ptRecordUpDesc + '\'' +
                "} " + super.toString();
    }
}
