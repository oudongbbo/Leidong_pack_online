package com.starjoys.tool.packonline.bean;

/**
 * 结果数据类
 *
 * @author Andy
 * @version 1.0
 * @create 2016/12/30
 */

public class ResultBean<T> {

    /** 结果对象 **/
    private T rows;

    /** 结果提示信息 **/
    private String message;

    /** 是否成功 **/
    private boolean success;

    /** 数据总数 **/
    private int total;

    public ResultBean() {
    }

    public ResultBean(T rows, String message, boolean success) {
        this.rows = rows;
        this.message = message;
        this.success = success;
    }

    public T getRows() {
        return rows;
    }

    public void setRows(T rows) {
        this.rows = rows;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "ResultBean{" +
                "rows=" + rows +
                ", message='" + message + '\'' +
                ", success=" + success +
                ", total=" + total +
                '}';
    }
}
