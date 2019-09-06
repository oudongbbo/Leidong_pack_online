package com.starjoys.tool.packonline.common.base;

import java.util.List;

/**
 * 基础Dao类
 *
 * @author Andy
 * @version 1.0
 * @create 2016/12/29
 */

public interface BaseDao<T> {

    /**
     * 获取单条数据
     *
     * @param id 标识
     * @return 对象
     */
    public T get(String id);

    /**
     * 条件查询数据列表
     *
     * @param entity 对象
     * @return 列表
     */
    public List<T> findList(T entity);

    /**
     * 查询所有数据列表
     *
     * @return 列表
     */
    public List<T> findAllList();

    /**
     * 查询所有数据列表带过滤的
     *
     * @return 列表
     */
    public List<T> findAllListWithFilter(T entity);

    /**
     * 分页查询列表
     *
     * @param entity 数据对象
     * @return 列表
     */
    public List<T> findListByPage(T entity);

    /**
     * 执行完findListByPage 再执行可获取总数量
     *
     * @return 总数
     */
    public int findCountByPage();

    /**
     * 插入数据
     *
     * @param entity 对象
     * @return 标识
     */
    public int insert(T entity);

    /**
     * 更新数据
     *
     * @param entity 对象
     * @return 标识
     */
    public int update(T entity);

    /**
     * 删除数据（一般为逻辑删除，更新字段为1）
     *
     * @param id 标识
     * @return 标识
     */
    public int delete(String id);


}
