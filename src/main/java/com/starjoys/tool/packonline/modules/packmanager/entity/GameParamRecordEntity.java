package com.starjoys.tool.packonline.modules.packmanager.entity;

import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;

import java.sql.Timestamp;

/**
 * 游戏参数更新记录对象
 *
 * @author Andy
 * @version 1.0
 * @create 2017/2/9
 */

public class GameParamRecordEntity extends BaseEntity {

    /** 游戏参数更新记录ID **/
    private int gpRecordId;

    /** 游戏参数ID **/
    private int gameParamId;

    /** 游戏参数更新记录数据 **/
    private String gpRecordData;

    /** 游戏参数更新记录日期 **/
    private Timestamp gpRecordUpDate;

    /** 游戏参数更新记录用户 **/
    private UserEntity user;

    /** 游戏参数更新记录详情 **/
    @NotBlank(message = "更新说明不能为空")
    private String gpRecordUpDesc;

    /** 是否最新 **/
    private int isNew;

    /** 是否启用 **/
    private int status;

    /** 游戏固定参数横竖屏 **/
    @Range(min = 0, max = 1, message = "横竖屏参数不符合规定")
    @NotBlank(message = "横竖屏参数不能为空")
    private String isLandScape;

    /** 游戏固定参数定额 **/
    @Range(min = 0, max = 1, message = "是否定额参数不符合规定")
    @NotBlank(message = "是否定额参数不能为空")
    private String isFinal;

    /** 游戏固定参数定额 **/
    @Range(min = 0, max = 1, message = "重建R文件参数不符合规定")
    @NotBlank(message = "重建R文件参数不能为空")
    private String replaceR;

    /** 游戏固定参数包名 **/
    @NotBlank(message = "包名不能为空")
    private String pname;

    public int getGpRecordId() {
        return gpRecordId;
    }

    public void setGpRecordId(int gpRecordId) {
        this.gpRecordId = gpRecordId;
    }

    public int getGameParamId() {
        return gameParamId;
    }

    public void setGameParamId(int gameParamId) {
        this.gameParamId = gameParamId;
    }

    public String getGpRecordData() {
        return gpRecordData;
    }

    public void setGpRecordData(String gpRecordData) {
        this.gpRecordData = gpRecordData;
    }

    public Timestamp getGpRecordUpDate() {
        return gpRecordUpDate;
    }

    public void setGpRecordUpDate(Timestamp gpRecordUpDate) {
        this.gpRecordUpDate = gpRecordUpDate;
    }

    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }

    public String getGpRecordUpDesc() {
        return gpRecordUpDesc;
    }

    public void setGpRecordUpDesc(String gpRecordUpDesc) {
        this.gpRecordUpDesc = gpRecordUpDesc;
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

    public String getIsLandScape() {
        return isLandScape;
    }

    public void setIsLandScape(String isLandScape) {
        this.isLandScape = isLandScape;
    }

    public String getIsFinal() {
        return isFinal;
    }

    public void setIsFinal(String isFinal) {
        this.isFinal = isFinal;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getReplaceR() {
        return replaceR;
    }

    public void setReplaceR(String replaceR) {
        this.replaceR = replaceR;
    }

    @Override
    public String toString() {
        return "GameParamRecordEntity{" +
                "gpRecordId=" + gpRecordId +
                ", gameParamId=" + gameParamId +
                ", gpRecordData='" + gpRecordData + '\'' +
                ", gpRecordUpDate=" + gpRecordUpDate +
                ", user=" + user +
                ", gpRecordUpDesc='" + gpRecordUpDesc + '\'' +
                ", isNew=" + isNew +
                ", status=" + status +
                ", isLandScape='" + isLandScape + '\'' +
                ", isFinal='" + isFinal + '\'' +
                ", replaceR='" + replaceR + '\'' +
                ", pname='" + pname + '\'' +
                '}';
    }
}
