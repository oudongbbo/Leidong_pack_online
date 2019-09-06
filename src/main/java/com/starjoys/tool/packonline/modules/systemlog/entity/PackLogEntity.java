package com.starjoys.tool.packonline.modules.systemlog.entity;

import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.modules.system.entity.MenuEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;

import java.sql.Timestamp;

/**
 * 打包日志数据对象类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/5/2
 */

public class PackLogEntity extends BaseEntity {

    /** 打包日志Id **/
    private long packLogId;

    /** 打包菜单 **/
    private MenuEntity menu;

    /** 打包者 **/
    private UserEntity us;

    /** 打包日志路径 **/
    private String packLogPath;

    /** 打包日志时间 **/
    private Timestamp packLogDate;

    /** 打包日志打包结果 **/
    private int packLogResult;

    /** 状态 **/
    private int status;

    public long getPackLogId() {
        return packLogId;
    }

    public void setPackLogId(long packLogId) {
        this.packLogId = packLogId;
    }

    public MenuEntity getMenu() {
        return menu;
    }

    public void setMenu(MenuEntity menu) {
        this.menu = menu;
    }

    public UserEntity getUs() {
        return us;
    }

    public void setUs(UserEntity us) {
        this.us = us;
    }

    public String getPackLogPath() {
        return packLogPath;
    }

    public void setPackLogPath(String packLogPath) {
        this.packLogPath = packLogPath;
    }

    public Timestamp getPackLogDate() {
        return packLogDate;
    }

    public void setPackLogDate(Timestamp packLogDate) {
        this.packLogDate = packLogDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getPackLogResult() {
        return packLogResult;
    }

    public void setPackLogResult(int packLogResult) {
        this.packLogResult = packLogResult;
    }

    @Override
    public String toString() {
        return "PackLogEntity{" +
                "packLogId=" + packLogId +
                ", menu=" + menu +
                ", us=" + us +
                ", packLogPath='" + packLogPath + '\'' +
                ", packLogDate=" + packLogDate +
                ", packLogResult=" + packLogResult +
                ", status=" + status +
                "} " + super.toString();
    }
}
