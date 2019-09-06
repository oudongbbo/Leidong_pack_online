package com.starjoys.tool.packonline.modules.packrecord.entity;

import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;

import java.sql.Timestamp;

/**
 * 渠道打包记录数据对象
 *
 * @author Andy
 * @version 1.0
 * @create 2017/2/20
 */

public class ChannelRecordEntity extends BaseEntity {

    /** 渠道打包记录ID **/
    private String cchRecordId;

    /** 渠道打包记录用户 **/
    private UserEntity user;

    /** 渠道打包记录开始日期 **/
    private Timestamp cchRecordStartDate;

    /** 渠道打包记录结束日期 **/
    private Timestamp cchRecordEndDate;

    /** 渠道打包记录打包数量 **/
    private int cchRecordNum;

    /** 渠道打包记录结果信息 **/
    private String cchRecordResultMsg;

    /** 渠道打包记录输出文件 **/
    private String cchRecordOutput;

    public String getCchRecordId() {
        return cchRecordId;
    }

    public void setCchRecordId(String cchRecordId) {
        this.cchRecordId = cchRecordId;
    }

    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }

    public Timestamp getCchRecordStartDate() {
        return cchRecordStartDate;
    }

    public void setCchRecordStartDate(Timestamp cchRecordStartDate) {
        this.cchRecordStartDate = cchRecordStartDate;
    }

    public Timestamp getCchRecordEndDate() {
        return cchRecordEndDate;
    }

    public void setCchRecordEndDate(Timestamp cchRecordEndDate) {
        this.cchRecordEndDate = cchRecordEndDate;
    }

    public int getCchRecordNum() {
        return cchRecordNum;
    }

    public void setCchRecordNum(int cchRecordNum) {
        this.cchRecordNum = cchRecordNum;
    }

    public String getCchRecordResultMsg() {
        return cchRecordResultMsg;
    }

    public void setCchRecordResultMsg(String cchRecordResultMsg) {
        this.cchRecordResultMsg = cchRecordResultMsg;
    }

    public String getCchRecordOutput() {
        return cchRecordOutput;
    }

    public void setCchRecordOutput(String cchRecordOutput) {
        this.cchRecordOutput = cchRecordOutput;
    }


    @Override
    public String toString() {
        return "ChannelRecordEntity{" +
                "cchRecordId='" + cchRecordId + '\'' +
                ", user=" + user +
                ", cchRecordStartDate=" + cchRecordStartDate +
                ", cchRecordEndDate=" + cchRecordEndDate +
                ", cchRecordNum=" + cchRecordNum +
                ", cchRecordResultMsg='" + cchRecordResultMsg + '\'' +
                ", cchRecordOutput='" + cchRecordOutput + '\'' +
                '}';
    }
}
