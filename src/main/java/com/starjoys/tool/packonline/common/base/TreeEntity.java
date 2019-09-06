package com.starjoys.tool.packonline.common.base;

import java.util.List;

/**
 * 树形数据对象类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/3/21
 */

public class TreeEntity<C, A> extends BaseEntity {

    /** 绑定到节点的标识值 **/
    private int id;

    /** 要显示的文本 **/
    private String text;

    /** 用来显示图标的 css class **/
    private String iconCls;

    /** 节点是否被选中 **/
    private boolean checked;

    /** 节点状态，'open' 或 'closed' **/
    private String state;

    /** 绑定到节点的自定义属性 **/
    private A attributes;

    /** 孩子节点 **/
    private List<C> children;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public A getAttributes() {
        return attributes;
    }

    public void setAttributes(A attributes) {
        this.attributes = attributes;
    }

    public List<C> getChildren() {
        return children;
    }

    public void setChildren(List<C> children) {
        this.children = children;
    }

    @Override
    public String toString() {
        return "TreeEntity{" +
                "id=" + id +
                ", text='" + text + '\'' +
                ", iconCls='" + iconCls + '\'' +
                ", checked=" + checked +
                ", state='" + state + '\'' +
                ", attributes=" + attributes +
                ", children=" + children +
                '}';
    }
}
