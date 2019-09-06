package com.starjoys.tool.packonline.modules.packrecord.entity;

import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserGroupEntity;

import java.io.File;
import java.sql.Timestamp;

/**
 * APK基本功能修改对象类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/22
 */

public class APKChangeEntity extends BaseEntity {

    /** apk修改ID **/
    private int apkChangeId;

    /** 游戏 **/
    private GameEntity game;

    /** 用户 **/
    private UserEntity user;

    /** apk是否修改了图标 **/
    private int apkChangeIcon;

    /** apk修改名称 **/
    private String apkChangeName;

    /** apk修改包名 **/
    private String apkChangePackage;

    /** apk修改版本号 **/
    private String apkChangeVersionNo;

    /** apk修改版本名 **/
    private String apkChangeVersionName;

    /** 是否重新签名 **/
    private int apkChangeSign;

    /** apk修改开始时间 **/
    private Timestamp apkChangeStartDate;

    /** apk修改结束时间 **/
    private Timestamp apkChangeEndDate;

    /** apk修改结果信息 **/
    private String apkChangeResultMsg;

    /** 其他参数CP母包文件名 **/
    private File otherParamCPFile;

    /** 其他参数图标文件名 **/
    private File otherParamIconFile;

    /** apk修改游戏id **/
    private String apkChangeGameId;

    /** apk修改渠道id **/
    private String apkChangeCchId;

    /** apk修改推广包id **/
    private String apkChangeMdId;

    /** apk修改输出文件 **/
    private String apkChangeOutput;

    /** apk修改输入文件 **/
    private String apkChangeInput;

    /** apk修改母包来源 **/
    private String apkChangeFileSource;

    /** 当前操作用户组 **/
    private UserGroupEntity currentUserGroup;

    public int getApkChangeId() {
        return apkChangeId;
    }

    public void setApkChangeId(int apkChangeId) {
        this.apkChangeId = apkChangeId;
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

    public int getApkChangeIcon() {
        return apkChangeIcon;
    }

    public void setApkChangeIcon(int apkChangeIcon) {
        this.apkChangeIcon = apkChangeIcon;
    }

    public String getApkChangeName() {
        return apkChangeName;
    }

    public void setApkChangeName(String apkChangeName) {
        this.apkChangeName = apkChangeName;
    }

    public String getApkChangePackage() {
        return apkChangePackage;
    }

    public void setApkChangePackage(String apkChangePackage) {
        this.apkChangePackage = apkChangePackage;
    }

    public String getApkChangeVersionNo() {
        return apkChangeVersionNo;
    }

    public void setApkChangeVersionNo(String apkChangeVersionNo) {
        this.apkChangeVersionNo = apkChangeVersionNo;
    }

    public String getApkChangeVersionName() {
        return apkChangeVersionName;
    }

    public void setApkChangeVersionName(String apkChangeVersionName) {
        this.apkChangeVersionName = apkChangeVersionName;
    }

    public int getApkChangeSign() {
        return apkChangeSign;
    }

    public void setApkChangeSign(int apkChangeSign) {
        this.apkChangeSign = apkChangeSign;
    }

    public Timestamp getApkChangeStartDate() {
        return apkChangeStartDate;
    }

    public void setApkChangeStartDate(Timestamp apkChangeStartDate) {
        this.apkChangeStartDate = apkChangeStartDate;
    }

    public Timestamp getApkChangeEndDate() {
        return apkChangeEndDate;
    }

    public void setApkChangeEndDate(Timestamp apkChangeEndDate) {
        this.apkChangeEndDate = apkChangeEndDate;
    }

    public File getOtherParamCPFile() {
        return otherParamCPFile;
    }

    public void setOtherParamCPFile(File otherParamCPFile) {
        this.otherParamCPFile = otherParamCPFile;
    }

    public File getOtherParamIconFile() {
        return otherParamIconFile;
    }

    public void setOtherParamIconFile(File otherParamIconFile) {
        this.otherParamIconFile = otherParamIconFile;
    }

    public String getApkChangeResultMsg() {
        return apkChangeResultMsg;
    }

    public void setApkChangeResultMsg(String apkChangeResultMsg) {
        this.apkChangeResultMsg = apkChangeResultMsg;
    }

    public String getApkChangeGameId() {
        return apkChangeGameId;
    }

    public void setApkChangeGameId(String apkChangeGameId) {
        this.apkChangeGameId = apkChangeGameId;
    }

    public String getApkChangeCchId() {
        return apkChangeCchId;
    }

    public void setApkChangeCchId(String apkChangeCchId) {
        this.apkChangeCchId = apkChangeCchId;
    }

    public String getApkChangeMdId() {
        return apkChangeMdId;
    }

    public void setApkChangeMdId(String apkChangeMdId) {
        this.apkChangeMdId = apkChangeMdId;
    }

    public String getApkChangeOutput() {
        return apkChangeOutput;
    }

    public void setApkChangeOutput(String apkChangeOutput) {
        this.apkChangeOutput = apkChangeOutput;
    }

    public String getApkChangeFileSource() {
        return apkChangeFileSource;
    }

    public void setApkChangeFileSource(String apkChangeFileSource) {
        this.apkChangeFileSource = apkChangeFileSource;
    }

    public String getApkChangeInput() {
        return apkChangeInput;
    }

    public void setApkChangeInput(String apkChangeInput) {
        this.apkChangeInput = apkChangeInput;
    }

    public UserGroupEntity getCurrentUserGroup() {
        return currentUserGroup;
    }

    public void setCurrentUserGroup(UserGroupEntity currentUserGroup) {
        this.currentUserGroup = currentUserGroup;
    }

    @Override
    public String toString() {
        return "APKChangeEntity{" +
                "apkChangeId=" + apkChangeId +
                ", game=" + game +
                ", user=" + user +
                ", apkChangeIcon=" + apkChangeIcon +
                ", apkChangeName='" + apkChangeName + '\'' +
                ", apkChangePackage='" + apkChangePackage + '\'' +
                ", apkChangeVersionNo='" + apkChangeVersionNo + '\'' +
                ", apkChangeVersionName='" + apkChangeVersionName + '\'' +
                ", apkChangeSign=" + apkChangeSign +
                ", apkChangeStartDate=" + apkChangeStartDate +
                ", apkChangeEndDate=" + apkChangeEndDate +
                ", apkChangeResultMsg='" + apkChangeResultMsg + '\'' +
                ", otherParamCPFile=" + otherParamCPFile +
                ", otherParamIconFile=" + otherParamIconFile +
                ", apkChangeGameId='" + apkChangeGameId + '\'' +
                ", apkChangeCchId='" + apkChangeCchId + '\'' +
                ", apkChangeMdId='" + apkChangeMdId + '\'' +
                ", apkChangeOutput='" + apkChangeOutput + '\'' +
                ", apkChangeInput='" + apkChangeInput + '\'' +
                ", apkChangeFileSource='" + apkChangeFileSource + '\'' +
                ", currentUserGroup=" + currentUserGroup +
                "} " + super.toString();
    }
}
