package com.starjoys.tool.packonline.modules.toolboxrecord.entity;

import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.modules.packmanager.entity.ChannelEntity;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

/**
 * 图标合并记录数据对象类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/3/14
 */

public class IconMergeRecordEntity extends BaseEntity {

    /** 图标合并记录id **/
    private long icMergeRecordId;

    /** 游戏 **/
    private GameEntity game;

    /** 渠道 **/
    private ChannelEntity cch;

    /** 用户 **/
    private UserEntity us;

    /** 图标合并记录角标方向 **/
    private String icMergeRecordDirection;

    /** 图标合并记录开始时间 **/
    private Timestamp icMergeRecordStartDate;

    /** 图标合并记录结束时间 **/
    private Timestamp icMergeRecordEndDate;

    /** 图标合并记录结果信息 **/
    private String icMergeRecordMsgResult;

    /** 图标合并记录输出目录 **/
    private String icMergeRecordOutput;

    /** 图标合并后的宽高 **/
    private int zoomSize;

    /** 图标文件 **/
    private MultipartFile iconFile;

    /** 搜索参数合并类型 **/
    private String sMergeType;

    public long getIcMergeRecordId() {
        return icMergeRecordId;
    }

    public void setIcMergeRecordId(long icMergeRecordId) {
        this.icMergeRecordId = icMergeRecordId;
    }

    public GameEntity getGame() {
        return game;
    }

    public void setGame(GameEntity game) {
        this.game = game;
    }

    public ChannelEntity getCch() {
        return cch;
    }

    public void setCch(ChannelEntity cch) {
        this.cch = cch;
    }

    public UserEntity getUs() {
        return us;
    }

    public void setUs(UserEntity us) {
        this.us = us;
    }

    public String getIcMergeRecordDirection() {
        return icMergeRecordDirection;
    }

    public void setIcMergeRecordDirection(String icMergeRecordDirection) {
        this.icMergeRecordDirection = icMergeRecordDirection;
    }

    public Timestamp getIcMergeRecordStartDate() {
        return icMergeRecordStartDate;
    }

    public void setIcMergeRecordStartDate(Timestamp icMergeRecordStartDate) {
        this.icMergeRecordStartDate = icMergeRecordStartDate;
    }

    public Timestamp getIcMergeRecordEndDate() {
        return icMergeRecordEndDate;
    }

    public void setIcMergeRecordEndDate(Timestamp icMergeRecordEndDate) {
        this.icMergeRecordEndDate = icMergeRecordEndDate;
    }

    public String getIcMergeRecordMsgResult() {
        return icMergeRecordMsgResult;
    }

    public void setIcMergeRecordMsgResult(String icMergeRecordMsgResult) {
        this.icMergeRecordMsgResult = icMergeRecordMsgResult;
    }

    public String getIcMergeRecordOutput() {
        return icMergeRecordOutput;
    }

    public void setIcMergeRecordOutput(String icMergeRecordOutput) {
        this.icMergeRecordOutput = icMergeRecordOutput;
    }

    public MultipartFile getIconFile() {
        return iconFile;
    }

    public void setIconFile(MultipartFile iconFile) {
        this.iconFile = iconFile;
    }

    public int getZoomSize() {
        return zoomSize;
    }

    public void setZoomSize(int zoomSize) {
        this.zoomSize = zoomSize;
    }

    public String getsMergeType() {
        return sMergeType;
    }

    public void setsMergeType(String sMergeType) {
        this.sMergeType = sMergeType;
    }

    @Override
    public String toString() {
        return "IconMergeRecordEntity{" +
                "icMergeRecordId=" + icMergeRecordId +
                ", game=" + game +
                ", cch=" + cch +
                ", us=" + us +
                ", icMergeRecordDirection='" + icMergeRecordDirection + '\'' +
                ", icMergeRecordStartDate=" + icMergeRecordStartDate +
                ", icMergeRecordEndDate=" + icMergeRecordEndDate +
                ", icMergeRecordMsgResult='" + icMergeRecordMsgResult + '\'' +
                ", icMergeRecordOutput='" + icMergeRecordOutput + '\'' +
                ", zoomSize=" + zoomSize +
                ", iconFile=" + iconFile +
                ", sMergeType='" + sMergeType + '\'' +
                '}';
    }
}
