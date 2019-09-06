package com.starjoys.tool.packonline.bean;

/**
 * 控制台行护具类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/16
 */

public class ConsoleLineBean {

    /** 控制台行前缀 **/
    private String prefix;

    /** 控制台行方法 **/
    private String method;

    /** 控制台行信息 **/
    private String message;

    public ConsoleLineBean() {
    }

    public ConsoleLineBean(String prefix, String method, String message) {
        this.prefix = prefix;
        this.method = method;
        this.message = message;
    }

    public String getPrefix() {
        return prefix;
    }

    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return "ConsoleLineBean{" +
                "prefix='" + prefix + '\'' +
                ", method='" + method + '\'' +
                ", message='" + message + '\'' +
                '}';
    }
}
