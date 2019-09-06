package com.starjoys.tool.packonline.modules.packrecord.entity;

import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.modules.packmanager.entity.ChannelEntity;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserGroupEntity;

import java.io.File;
import java.sql.Timestamp;

/**
 * 推广包打包记录对象类
 *
 */

public class AllPackRecordEntity extends BaseEntity {


    /**
     * 用户数据
     **/
    private UserEntity user;

    /**
     * 游戏数据
     **/
    private GameEntity game;

    /**
     * 渠道数据
     **/
    private ChannelEntity channel;

    private UserGroupEntity currentUserGroup;

    private String recordId;

    private String mid;

    private Timestamp createTime;

    private Timestamp updateTime;

    private String downloadUrl;

    private int state;

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

    public ChannelEntity getChannel() {
        return channel;
    }

    public void setChannel(ChannelEntity channel) {
        this.channel = channel;
    }

    public String getRecordId() {
        return recordId;
    }

    public void setRecordId(String recordId) {
        this.recordId = recordId;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    public String getDownloadUrl() {
        return downloadUrl;
    }

    public void setDownloadUrl(String downloadUrl) {
        this.downloadUrl = downloadUrl;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public UserGroupEntity getCurrentUserGroup() {
        return currentUserGroup;
    }

    public void setCurrentUserGroup(UserGroupEntity currentUserGroup) {
        this.currentUserGroup = currentUserGroup;
    }

    @Override
    public String toString() {
        return
//                "MdRecordEntity{" +
//                "mdRecordId=" + mdRecordId +
//                ", game=" + game +
//                ", user=" + user +
//                ", mdRecordStartDate=" + mdRecordStartDate +
//                ", mdRecordEndDate=" + mdRecordEndDate +
//                ", mdRecordStart='" + mdRecordStart + '\'' +
//                ", mdRecordEnd='" + mdRecordEnd + '\'' +
//                ", mdRecordNum=" + mdRecordNum +
//                ", mdRecordResultMsg='" + mdRecordResultMsg + '\'' +
//                ", mdRecordOutput='" + mdRecordOutput + '\'' +
//                ", mdRecordFileSource='" + mdRecordFileSource + '\'' +
//                ", transferInputFile=" + transferInputFile +
//                ", currentUserGroup=" + currentUserGroup +
//                "} " +
                super.toString();
    }
}
