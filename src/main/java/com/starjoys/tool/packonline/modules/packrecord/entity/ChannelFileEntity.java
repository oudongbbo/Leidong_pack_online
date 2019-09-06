package com.starjoys.tool.packonline.modules.packrecord.entity;

import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameParamEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserGroupEntity;

/**
 * 渠道打包文件数据对象类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/2/20
 */

public class ChannelFileEntity extends BaseEntity {

    /** 渠道打包文件Id **/
    private long cchFileId;

    /** 渠道打包记录数据对象 **/
    private ChannelRecordEntity cchRecord;

    /** 游戏参数数据对象 **/
    private GameParamEntity gameParam;

    /** 打包是否成功 **/
    private int cchFileSuccess;

    /** 渠道打包文件游戏参数数据 **/
    private String cchFileGPRecordData;

    public long getCchFileId() {
        return cchFileId;
    }

    public void setCchFileId(long cchFileId) {
        this.cchFileId = cchFileId;
    }

    /** 当前操作用户组 **/
    private UserGroupEntity currentUserGroup;

    public ChannelRecordEntity getCchRecord() {
        return cchRecord;
    }

    public void setCchRecord(ChannelRecordEntity cchRecord) {
        this.cchRecord = cchRecord;
    }

    public GameParamEntity getGameParam() {
        return gameParam;
    }

    public void setGameParam(GameParamEntity gameParam) {
        this.gameParam = gameParam;
    }

    public int getCchFileSuccess() {
        return cchFileSuccess;
    }

    public void setCchFileSuccess(int cchFileSuccess) {
        this.cchFileSuccess = cchFileSuccess;
    }

    public String getCchFileGPRecordData() {
        return cchFileGPRecordData;
    }

    public void setCchFileGPRecordData(String cchFileGPRecordData) {
        this.cchFileGPRecordData = cchFileGPRecordData;
    }

    public UserGroupEntity getCurrentUserGroup() {
        return currentUserGroup;
    }

    public void setCurrentUserGroup(UserGroupEntity currentUserGroup) {
        this.currentUserGroup = currentUserGroup;
    }

    @Override
    public String toString() {
        return "ChannelFileEntity{" +
                "cchFileId=" + cchFileId +
                ", cchRecord=" + cchRecord +
                ", gameParam=" + gameParam +
                ", cchFileSuccess=" + cchFileSuccess +
                ", cchFileGPRecordData='" + cchFileGPRecordData + '\'' +
                ", currentUserGroup=" + currentUserGroup +
                "} " + super.toString();
    }
}
