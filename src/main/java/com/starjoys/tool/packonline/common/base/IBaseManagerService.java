package com.starjoys.tool.packonline.common.base;

import com.starjoys.tool.packonline.bean.ResultBean;

import java.util.List;

/**
 * 基础管理业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/4
 */

public interface IBaseManagerService<T> {

    /**
     * 查找出所有数据
     *
     * @return 数据列表
     */
    public ResultBean<List<T>> findAllData();

    /**
     * 查找出所有数据
     *
     * @param entity 数据对象
     * @return 数据列表
     */
    public ResultBean<List<T>> findAllData(T entity);

    /**
     * 根据分页查找出数据
     *
     * @param entity 数据对象
     * @return 数据列表
     */
    public ResultBean<List<T>> findDataByPage(T entity);

    /**
     * 添加数据
     *
     * @param entity 数据对象
     * @return 操作结果
     */
    public ResultBean<T> addData(T entity);

    /**
     * 删除数据
     *
     * @param id 标识
     * @return 操作结果
     */
    public ResultBean<T> changeStatus(String id);

    /**
     * 更新数据
     *
     * @param entity 数据对象
     * @return 操作结果
     */
    public ResultBean<T> updateData(T entity);

    /**
     * 获取对应数据
     * @param id 数据id
     * @return 结果集
     */
    public ResultBean<T> getData(String id);

}
