package com.starjoys.tool.packonline.modules.packmanager.entity;

import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import org.hibernate.validator.constraints.NotBlank;

import java.sql.Timestamp;

/**
 * 游戏版本对象类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/2/8
 */

public class GameVersionEntity extends BaseEntity {

    /** 游戏版本ID **/
    private long gameVerId;

    /** 游戏ID **/
    private long _gameId;

    /** 游戏版本号 **/
    private String gameVerNum;

    /** 游戏版本名 **/
    private String gameVerName;

    /** 游戏版本上传日期 **/
    private Timestamp gameVerUpDate;

    /** 游戏版本详情 **/
    @NotBlank(message = "游戏版本详情不能为空")
    private String gameVerUpDesc;

    /** 是否为最新 **/
    private int isNew;

    /** 是否启用 **/
    private int status;

    /** 游戏版本上传格式日期 **/
    private String gameVerUpFDate;

    /** 游戏版本上传的CP包路径 **/
    private String gameVerUpCPPath;

    /** 游戏版本上传的星趣包路径 **/
    private String gameVerUpSJoysPath;

    /** 游戏版本更新用户 **/
    private UserEntity user;

    public long getGameVerId() {
        return gameVerId;
    }

    public void setGameVerId(long gameVerId) {
        this.gameVerId = gameVerId;
    }

    public long get_gameId() {
        return _gameId;
    }

    public void set_gameId(long _gameId) {
        this._gameId = _gameId;
    }

    public String getGameVerNum() {
        return gameVerNum;
    }

    public void setGameVerNum(String gameVerNum) {
        this.gameVerNum = gameVerNum;
    }

    public String getGameVerName() {
        return gameVerName;
    }

    public void setGameVerName(String gameVerName) {
        this.gameVerName = gameVerName;
    }

    public Timestamp getGameVerUpDate() {
        return gameVerUpDate;
    }

    public void setGameVerUpDate(Timestamp gameVerUpDate) {
        this.gameVerUpDate = gameVerUpDate;
    }

    public String getGameVerUpDesc() {
        return gameVerUpDesc;
    }

    public void setGameVerUpDesc(String gameVerUpDesc) {
        this.gameVerUpDesc = gameVerUpDesc;
    }

    public int getIsNew() {
        return isNew;
    }

    public void setIsNew(int isNew) {
        this.isNew = isNew;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getGameVerUpFDate() {
        return gameVerUpFDate;
    }

    public void setGameVerUpFDate(String gameVerUpFDate) {
        this.gameVerUpFDate = gameVerUpFDate;
    }

    public String getGameVerUpCPPath() {
        return gameVerUpCPPath;
    }

    public void setGameVerUpCPPath(String gameVerUpCPPath) {
        this.gameVerUpCPPath = gameVerUpCPPath;
    }

    public String getGameVerUpSJoysPath() {
        return gameVerUpSJoysPath;
    }

    public void setGameVerUpSJoysPath(String gameVerUpSJoysPath) {
        this.gameVerUpSJoysPath = gameVerUpSJoysPath;
    }

    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }


    @Override
    public String toString() {
        return "GameVersionEntity{" +
                "gameVerId=" + gameVerId +
                ", _gameId=" + _gameId +
                ", gameVerNum='" + gameVerNum + '\'' +
                ", gameVerName='" + gameVerName + '\'' +
                ", gameVerUpDate=" + gameVerUpDate +
                ", gameVerUpDesc='" + gameVerUpDesc + '\'' +
                ", isNew=" + isNew +
                ", status=" + status +
                ", gameVerUpFDate='" + gameVerUpFDate + '\'' +
                ", gameVerUpCPPath='" + gameVerUpCPPath + '\'' +
                ", gameVerUpSJoysPath='" + gameVerUpSJoysPath + '\'' +
                ", user=" + user +
                '}';
    }
}
