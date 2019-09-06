package com.starjoys.tool.packonline.modules.packmanager.entity;

import com.starjoys.tool.packonline.common.base.BaseEntity;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

/**
 * 游戏参数对象类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/2/9
 */

public class GameParamEntity extends BaseEntity {

    /** 游戏参数ID **/
    private int gameParamId;

    /** 游戏参数记录对象 **/
    private GameParamRecordEntity record;

    /** 游戏对象 **/
    private GameEntity game;

    /** 渠道对象 **/
    private ChannelEntity cch;

    /** 游戏参数创建日期 **/
    private Timestamp gameParamCreateDate;

    /** 游戏参数图标 **/
    private int gameParamIcon;

    /** 启用状态 **/
    private int status;

    /** 游戏icon文件 **/
    private MultipartFile iconFile;

    public int getGameParamId() {
        return gameParamId;
    }

    public void setGameParamId(int gameParamId) {
        this.gameParamId = gameParamId;
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

    public Timestamp getGameParamCreateDate() {
        return gameParamCreateDate;
    }

    public void setGameParamCreateDate(Timestamp gameParamCreateDate) {
        this.gameParamCreateDate = gameParamCreateDate;
    }

    public int getGameParamIcon() {
        return gameParamIcon;
    }

    public void setGameParamIcon(int gameParamIcon) {
        this.gameParamIcon = gameParamIcon;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public GameParamRecordEntity getRecord() {
        return record;
    }

    public void setRecord(GameParamRecordEntity record) {
        this.record = record;
    }

    public MultipartFile getIconFile() {
        return iconFile;
    }

    public void setIconFile(MultipartFile iconFile) {
        this.iconFile = iconFile;
    }

    @Override
    public String toString() {
        return "GameParamEntity{" +
                "gameParamId=" + gameParamId +
                ", record=" + record +
                ", game=" + game +
                ", cch=" + cch +
                ", gameParamCreateDate=" + gameParamCreateDate +
                ", gameParamIcon=" + gameParamIcon +
                ", status=" + status +
                ", iconFile=" + iconFile +
                '}';
    }
}
