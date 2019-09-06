package com.starjoys.tool.packonline.modules.system.entity;

import com.starjoys.tool.packonline.common.base.BaseEntity;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

/**
 * 打包工具对象类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/5/4
 */

public class PackToolEntity extends BaseEntity {

    /** 打包工具ID **/
    private long packToolId;

    /** 打包工具名称 **/
    @NotBlank(message = "打包工具名不能为空")
    private String packToolName;

    /** 打包工具文件名 **/
    @NotBlank(message = "打包工具文件名不能为空")
    private String packToolFileName;

    /** 打包工具创建时间 **/
    private Timestamp packToolCreateDate;

    /** 状态 **/
    private int status;

    /** 打包工具记录对象 **/
    private PackToolRecordEntity record;

    /** 打包工具上传文件 **/
    private MultipartFile packToolUploadFile;

    public long getPackToolId() {
        return packToolId;
    }

    public void setPackToolId(long packToolId) {
        this.packToolId = packToolId;
    }

    public String getPackToolName() {
        return packToolName;
    }

    public void setPackToolName(String packToolName) {
        this.packToolName = packToolName;
    }

    public String getPackToolFileName() {
        return packToolFileName;
    }

    public void setPackToolFileName(String packToolFileName) {
        this.packToolFileName = packToolFileName;
    }

    public Timestamp getPackToolCreateDate() {
        return packToolCreateDate;
    }

    public void setPackToolCreateDate(Timestamp packToolCreateDate) {
        this.packToolCreateDate = packToolCreateDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public PackToolRecordEntity getRecord() {
        return record;
    }

    public void setRecord(PackToolRecordEntity record) {
        this.record = record;
    }

    public MultipartFile getPackToolUploadFile() {
        return packToolUploadFile;
    }

    public void setPackToolUploadFile(MultipartFile packToolUploadFile) {
        this.packToolUploadFile = packToolUploadFile;
    }

    @Override
    public String toString() {
        return "PackToolEntity{" +
                "packToolId=" + packToolId +
                ", packToolName='" + packToolName + '\'' +
                ", packToolFileName='" + packToolFileName + '\'' +
                ", packToolCreateDate=" + packToolCreateDate +
                ", status=" + status +
                ", record=" + record +
                ", packToolUploadFile=" + packToolUploadFile +
                "} " + super.toString();
    }
}
