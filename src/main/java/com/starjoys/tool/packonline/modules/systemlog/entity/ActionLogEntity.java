package com.starjoys.tool.packonline.modules.systemlog.entity;

import com.starjoys.tool.packonline.common.base.BaseEntity;

import java.sql.Timestamp;

/**
 * 操作日志数据对象类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/3/27
 */

public class ActionLogEntity extends BaseEntity {

    /** 操作Id **/
    private long actionId;

    /** 操作名称 **/
    private String actionName;

    /** 操作者 **/
    private String actionUser;

    /** 操作链接 **/
    private String actionUrl;

    /** 操作时间 **/
    private Timestamp actionDate;

    /** 操作参数 **/
    private String actionParam;

    /** 操作结果 **/
    private String actionResult;

    public long getActionId() {
        return actionId;
    }

    public void setActionId(long actionId) {
        this.actionId = actionId;
    }

    public String getActionName() {
        return actionName;
    }

    public void setActionName(String actionName) {
        this.actionName = actionName;
    }

    public String getActionUser() {
        return actionUser;
    }

    public void setActionUser(String actionUser) {
        this.actionUser = actionUser;
    }

    public String getActionUrl() {
        return actionUrl;
    }

    public void setActionUrl(String actionUrl) {
        this.actionUrl = actionUrl;
    }

    public Timestamp getActionDate() {
        return actionDate;
    }

    public void setActionDate(Timestamp actionDate) {
        this.actionDate = actionDate;
    }

    public String getActionParam() {
        return actionParam;
    }

    public void setActionParam(String actionParam) {
        this.actionParam = actionParam;
    }

    public String getActionResult() {
        return actionResult;
    }

    public void setActionResult(String actionResult) {
        this.actionResult = actionResult;
    }

    @Override
    public String toString() {
        return "ActionLogEntity{" +
                "actionId=" + actionId +
                ", actionName='" + actionName + '\'' +
                ", actionUser='" + actionUser + '\'' +
                ", actionUrl='" + actionUrl + '\'' +
                ", actionDate=" + actionDate +
                ", actionParam='" + actionParam + '\'' +
                ", actionResult='" + actionResult + '\'' +
                "} " + super.toString();
    }
}
