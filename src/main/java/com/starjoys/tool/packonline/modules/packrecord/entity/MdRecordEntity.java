package com.starjoys.tool.packonline.modules.packrecord.entity;

import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserGroupEntity;

import java.io.File;
import java.sql.Timestamp;

/**
 * 推广包打包记录对象类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/13
 */

public class MdRecordEntity extends BaseEntity {

    /** 推广包打包记录ID **/
    private long mdRecordId;

    /** 推广包打包的游戏数据 **/
    private GameEntity game;

    /** 推广包打包的用户数据 **/
    private UserEntity user;

    /** 推广包打包开始时间 **/
    private Timestamp mdRecordStartDate;

    /** 推广包打包结束时间 **/
    private Timestamp mdRecordEndDate;

    /** 推广包打包开始标识 **/
    private String mdRecordStart;

    /** 推广包打包结束标识 **/
    private String mdRecordEnd;

    /** 推广包打包数量 **/
    private int mdRecordNum;

    /** 推广包打包结果信息 **/
    private String mdRecordResultMsg;

    /** 推广包打包输出文件 **/
    private String mdRecordOutput;

    /** 推广包打包母包来源 **/
    private String mdRecordFileSource;

    /** 移动后的上传文件 **/
    private File transferInputFile;

    /** 当前操作用户 **/
    private UserGroupEntity currentUserGroup;

    public long getMdRecordId() {
        return mdRecordId;
    }

    public void setMdRecordId(long mdRecordId) {
        this.mdRecordId = mdRecordId;
    }

    public GameEntity getGame() {
        return game;
    }

    public void setGame(GameEntity game) {
        this.game = game;
    }

    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }

    public Timestamp getMdRecordStartDate() {
        return mdRecordStartDate;
    }

    public void setMdRecordStartDate(Timestamp mdRecordStartDate) {
        this.mdRecordStartDate = mdRecordStartDate;
    }

    public Timestamp getMdRecordEndDate() {
        return mdRecordEndDate;
    }

    public void setMdRecordEndDate(Timestamp mdRecordEndDate) {
        this.mdRecordEndDate = mdRecordEndDate;
    }

    public String getMdRecordStart() {
        return mdRecordStart;
    }

    public void setMdRecordStart(String mdRecordStart) {
        this.mdRecordStart = mdRecordStart;
    }

    public String getMdRecordEnd() {
        return mdRecordEnd;
    }

    public void setMdRecordEnd(String mdRecordEnd) {
        this.mdRecordEnd = mdRecordEnd;
    }

    public int getMdRecordNum() {
        return mdRecordNum;
    }

    public void setMdRecordNum(int mdRecordNum) {
        this.mdRecordNum = mdRecordNum;
    }

    public String getMdRecordResultMsg() {
        return mdRecordResultMsg;
    }

    public void setMdRecordResultMsg(String mdRecordResultMsg) {
        this.mdRecordResultMsg = mdRecordResultMsg;
    }

    public String getMdRecordOutput() {
        return mdRecordOutput;
    }

    public void setMdRecordOutput(String mdRecordOutput) {
        this.mdRecordOutput = mdRecordOutput;
    }

    public String getMdRecordFileSource() {
        return mdRecordFileSource;
    }

    public void setMdRecordFileSource(String mdRecordFileSource) {
        this.mdRecordFileSource = mdRecordFileSource;
    }

    public File getTransferInputFile() {
        return transferInputFile;
    }

    public void setTransferInputFile(File transferInputFile) {
        this.transferInputFile = transferInputFile;
    }

    public UserGroupEntity getCurrentUserGroup() {
        return currentUserGroup;
    }

    public void setCurrentUserGroup(UserGroupEntity currentUserGroup) {
        this.currentUserGroup = currentUserGroup;
    }

    @Override
    public String toString() {
        return "MdRecordEntity{" +
                "mdRecordId=" + mdRecordId +
                ", game=" + game +
                ", user=" + user +
                ", mdRecordStartDate=" + mdRecordStartDate +
                ", mdRecordEndDate=" + mdRecordEndDate +
                ", mdRecordStart='" + mdRecordStart + '\'' +
                ", mdRecordEnd='" + mdRecordEnd + '\'' +
                ", mdRecordNum=" + mdRecordNum +
                ", mdRecordResultMsg='" + mdRecordResultMsg + '\'' +
                ", mdRecordOutput='" + mdRecordOutput + '\'' +
                ", mdRecordFileSource='" + mdRecordFileSource + '\'' +
                ", transferInputFile=" + transferInputFile +
                ", currentUserGroup=" + currentUserGroup +
                "} " + super.toString();
    }
}
