package com.starjoys.tool.packonline.modules.packmanager.entity;

import com.starjoys.tool.packonline.common.base.BaseEntity;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.sql.Timestamp;

/**
 * 渠道对象类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/17
 */

public class ChannelEntity extends BaseEntity {

    /** 渠道的自增id **/
    private long id;

    /** 渠道ID **/
    @Length(min = 1, max = 11, message = "渠道ID不能超过11位")
    @NotBlank(message = "渠道ID不能为空")
    private String cchId;

    /** 渠道版本对象 **/
    private ChannelVersionEntity ver;

    /** 渠道名称 **/
    @NotBlank(message = "渠道名称不能为空")
    private String cchName;

    /** 渠道简写 **/
    @NotBlank(message = "渠道简写不能为空")
    private String cchShortName;

    /** 渠道所有参数 **/
    private String cchAllParam;

    /** 渠道必填参数 **/
    private String cchRequireParam;

    /** 渠道闪屏 **/
    private String cchSplash;

    /** 渠道角标 **/
    private String cchSubscript;

    /** 渠道创建时间 **/
    private Timestamp cchCreateDate;

    /** 渠道权重 **/
    @Range(message = "渠道权重超出范围", min = 1, max = 3)
    private int cchWeight;

    /** 启用标识 **/
    private int status;

    /** 渠道data文件 **/
    private MultipartFile cchDataFile;

    /** 渠道角标文件 **/
    private MultipartFile cchIconFile;

    /** 渠道左上角角标文件 **/
    private MultipartFile cchLTIconFile;

    /** 渠道右上角角标文件 **/
    private MultipartFile cchRTIconFile;

    /** 渠道左下角角标文件 **/
    private MultipartFile cchLBIconFile;

    /** 渠道右下角角标文件 **/
    private MultipartFile cchRBIconFile;

    /** 渠道插件文件 **/
    private MultipartFile cchPluginFile;

    /** 本地资源data备份文件 **/
    private File localResourceDataFile;

    /** 本地资源data的临时目录 **/
    private File localDataTempDirFile;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCchId() {
        return cchId;
    }

    public void setCchId(String cchId) {
        this.cchId = cchId;
    }

    public String getCchName() {
        return cchName;
    }

    public void setCchName(String cchName) {
        this.cchName = cchName;
    }

    public String getCchShortName() {
        return cchShortName;
    }

    public void setCchShortName(String cchShortName) {
        this.cchShortName = cchShortName;
    }

    public String getCchAllParam() {
        return cchAllParam;
    }

    public void setCchAllParam(String cchAllParam) {
        this.cchAllParam = cchAllParam;
    }

    public String getCchRequireParam() {
        return cchRequireParam;
    }

    public void setCchRequireParam(String cchRequireParam) {
        this.cchRequireParam = cchRequireParam;
    }

    public String getCchSplash() {
        return cchSplash;
    }

    public void setCchSplash(String cchSplash) {
        this.cchSplash = cchSplash;
    }

    public String getCchSubscript() {
        return cchSubscript;
    }

    public void setCchSubscript(String cchSubscript) {
        this.cchSubscript = cchSubscript;
    }

    public Timestamp getCchCreateDate() {
        return cchCreateDate;
    }

    public void setCchCreateDate(Timestamp cchCreateDate) {
        this.cchCreateDate = cchCreateDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public MultipartFile getCchDataFile() {
        return cchDataFile;
    }

    public void setCchDataFile(MultipartFile cchDataFile) {
        this.cchDataFile = cchDataFile;
    }

    public MultipartFile getCchIconFile() {
        return cchIconFile;
    }

    public void setCchIconFile(MultipartFile cchIconFile) {
        this.cchIconFile = cchIconFile;
    }

    public ChannelVersionEntity getVer() {
        return ver;
    }

    public void setVer(ChannelVersionEntity ver) {
        this.ver = ver;
    }

    public int getCchWeight() {
        return cchWeight;
    }

    public void setCchWeight(int cchWeight) {
        this.cchWeight = cchWeight;
    }

    public MultipartFile getCchPluginFile() {
        return cchPluginFile;
    }

    public void setCchPluginFile(MultipartFile cchPluginFile) {
        this.cchPluginFile = cchPluginFile;
    }

    public MultipartFile getCchLTIconFile() {
        return cchLTIconFile;
    }

    public void setCchLTIconFile(MultipartFile cchLTIconFile) {
        this.cchLTIconFile = cchLTIconFile;
    }

    public MultipartFile getCchRTIconFile() {
        return cchRTIconFile;
    }

    public void setCchRTIconFile(MultipartFile cchRTIconFile) {
        this.cchRTIconFile = cchRTIconFile;
    }

    public MultipartFile getCchLBIconFile() {
        return cchLBIconFile;
    }

    public void setCchLBIconFile(MultipartFile cchLBIconFile) {
        this.cchLBIconFile = cchLBIconFile;
    }

    public MultipartFile getCchRBIconFile() {
        return cchRBIconFile;
    }

    public void setCchRBIconFile(MultipartFile cchRBIconFile) {
        this.cchRBIconFile = cchRBIconFile;
    }

    public File getLocalResourceDataFile() {
        return localResourceDataFile;
    }

    public void setLocalResourceDataFile(File localResourceDataFile) {
        this.localResourceDataFile = localResourceDataFile;
    }

    public File getLocalDataTempDirFile() {
        return localDataTempDirFile;
    }

    public void setLocalDataTempDirFile(File localDataTempDirFile) {
        this.localDataTempDirFile = localDataTempDirFile;
    }

    @Override
    public String toString() {
        return "ChannelEntity{" +
                "id=" + id +
                ", cchId='" + cchId + '\'' +
                ", ver=" + ver +
                ", cchName='" + cchName + '\'' +
                ", cchShortName='" + cchShortName + '\'' +
                ", cchAllParam='" + cchAllParam + '\'' +
                ", cchRequireParam='" + cchRequireParam + '\'' +
                ", cchSplash='" + cchSplash + '\'' +
                ", cchSubscript='" + cchSubscript + '\'' +
                ", cchCreateDate=" + cchCreateDate +
                ", cchWeight=" + cchWeight +
                ", status=" + status +
                ", cchDataFile=" + cchDataFile +
                ", cchIconFile=" + cchIconFile +
                ", cchLTIconFile=" + cchLTIconFile +
                ", cchRTIconFile=" + cchRTIconFile +
                ", cchLBIconFile=" + cchLBIconFile +
                ", cchRBIconFile=" + cchRBIconFile +
                ", cchPluginFile=" + cchPluginFile +
                ", localResourceDataFile=" + localResourceDataFile +
                ", localDataTempDirFile=" + localDataTempDirFile +
                "} " + super.toString();
    }
}
