package com.starjoys.tool.packonline.bean;

/**
 * http参数数据类
 *
 * @author Andy
 * @version 1.0
 * @create 2016/12/30
 */

public class HttpAttributeBean {

    /** 键 **/
    private String key;

    /** 值 **/
    private Object value;

    public HttpAttributeBean() {
    }

    public HttpAttributeBean(String key, Object value) {
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
