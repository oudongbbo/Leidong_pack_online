package com.starjoys.tool.packonline.bean;

/**
 * 键值对信息类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/18
 */

public class KeyValueBean {

    /** 键 **/
    private String key;

    /** 值 **/
    private Object value;

    public KeyValueBean() {
    }

    public KeyValueBean(String key, Object value) {
        this.key = key;
        this.value = value;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public Object getValue() {
        return value;
    }

    public void setValue(Object value) {
        this.value = value;
    }

}
