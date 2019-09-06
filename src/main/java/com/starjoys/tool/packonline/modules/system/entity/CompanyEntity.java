package com.starjoys.tool.packonline.modules.system.entity;

import com.starjoys.tool.packonline.common.base.BaseEntity;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;

import java.sql.Timestamp;

/**
 * 公司对象类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/4/12
 */

public class CompanyEntity extends BaseEntity {

    /** 公司id **/
    private int companyId;

    /** 公司名称 **/
    @NotBlank(message = "公司名不能空")
    private String companyName;

    /** 公司详情 **/
    private String companyDesc;

    /** 公司创建时间 **/
    private Timestamp companyCreateDate;

    /** 当前状态 **/
    @Range(min = 0, max = 1, message = "状态不在范围")
    private int status;

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyDesc() {
        return companyDesc;
    }

    public void setCompanyDesc(String companyDesc) {
        this.companyDesc = companyDesc;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Timestamp getCompanyCreateDate() {
        return companyCreateDate;
    }

    public void setCompanyCreateDate(Timestamp companyCreateDate) {
        this.companyCreateDate = companyCreateDate;
    }

    @Override
    public String toString() {
        return "CompanyEntity{" +
                "companyId=" + companyId +
                ", companyName='" + companyName + '\'' +
                ", companyDesc='" + companyDesc + '\'' +
                ", companyCreateDate=" + companyCreateDate +
                ", status=" + status +
                "} " + super.toString();
    }
}
