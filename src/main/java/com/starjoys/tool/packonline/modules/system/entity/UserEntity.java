package com.starjoys.tool.packonline.modules.system.entity;

import com.starjoys.tool.packonline.common.base.BaseEntity;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;

/**
 * 用户数据对象类
 *
 * @author Andy
 * @version 1.0
 * @create 2016/12/30
 */

public class UserEntity extends BaseEntity {

    /** 用户标识 **/
    private int userId;

    /** 用户名 **/
    @Length(min = 1, max = 16, message = "用户名长度只能为2~16")
    @NotBlank(message = "用户名不能为空")
    private String username;

    /** 密码 **/
    @Length(min = 1, max = 16, message = "密码长度只能为6~16")
    @NotBlank(message = "密码不能为空")
    private String password;

    /** 真是姓名 **/
    @Length(min = 1, max = 32, message = "姓名长度只能为1~32")
    @NotBlank(message = "姓名不能为空")
    private String realname;

    /** 手机号码 **/
    @Length(max = 11, message = "手机号码不能超过11位")
    private String mobile;

    /** 邮箱 **/
    @Email(message = "邮箱格式不正确")
    private String email;

    /** 用户说明 **/
    private String userDesc;

    /** 创建用户时间 **/
    private String createTime;

    /** 状态 **/
    @Range(min = 0, max = 1, message = "状态码只能是0和1")
    private int status;

    /** 用户组标识 **/
    private int userGroupId;

    /** 用户组名称 **/
    private String userGroupName;

    private String oldPassword;

    private String confirmPassword;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserDesc() {
        return userDesc;
    }

    public void setUserDesc(String userDesc) {
        this.userDesc = userDesc;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public int getUserGroupId() {
        return userGroupId;
    }

    public void setUserGroupId(int userGroupId) {
        this.userGroupId = userGroupId;
    }

    public String getUserGroupName() {
        return userGroupName;
    }

    public void setUserGroupName(String userGroupName) {
        this.userGroupName = userGroupName;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    @Override
    public String toString() {
        return "UserEntity{" +
                "userId=" + userId +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", realname='" + realname + '\'' +
                ", mobile='" + mobile + '\'' +
                ", email='" + email + '\'' +
                ", userDesc='" + userDesc + '\'' +
                ", createTime='" + createTime + '\'' +
                ", status=" + status +
                ", userGroupId=" + userGroupId +
                ", userGroupName='" + userGroupName + '\'' +
                ", oldPassword='" + oldPassword + '\'' +
                ", confirmPassword='" + confirmPassword + '\'' +
                "} " + super.toString();
    }
}
