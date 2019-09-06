package com.starjoys.tool.packonline.common.base;

/**
 * 基础数据对象类
 *
 * @author Andy
 * @version 1.0
 * @create 2016/12/29
 */

public abstract class BaseEntity {

    /** 处于关闭状态 **/
    public static int FLAG_STATUS_DEL = 0;

    /** 处于活动状态 **/
    public static int FLAG_STATUS_ACTIVE = 1;

    /** 否 **/
    public static int FLAG_BOOLEAN_FALSE = 0;

    /** 是 **/
    public static int FLAG_BOOLEAN_TRUE = 1;

    /** 对应easyui的当前页数 **/
    private int page;

    /** 对应easyui的每页数量 **/
    private int rows;

    /** 换算后的当前页的开始标识 **/
    private int pageStart;

    /** 换算后的当前页的结束标识 **/
    private int pageEnd;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getPageStart() {
        return (page - 1) * rows;
    }

    public void setPageStart(int pageStart) {
        this.pageStart = pageStart;
    }

    public int getPageEnd() {
        return page * rows - 1;
    }

    public void setPageEnd(int pageEnd) {
        this.pageEnd = pageEnd;
    }

    @Override
    public String toString() {
        return "BaseEntity{" +
                "page=" + page +
                ", rows=" + rows +
                ", pageStart=" + pageStart +
                ", pageEnd=" + pageEnd +
                '}';
    }
}
