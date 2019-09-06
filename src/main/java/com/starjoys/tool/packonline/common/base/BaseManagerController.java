package com.starjoys.tool.packonline.common.base;

import com.starjoys.tool.packonline.bean.ResultBean;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 基础管理控制层类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/3
 */

public abstract class BaseManagerController<T> extends BaseController {

    /**
     * 设置基础服务
     * @return
     */
    protected abstract IBaseManagerService<T> getBaseManagerService();

    /**
     * 显示管理界面
     *
     * @param request 请求
     * @param model   模型
     * @return 跳转页面名
     */
    @RequestMapping("")
    public abstract String show(HttpServletRequest request, Model model);

    /**
     * 读取所有数据
     *
     * @return 返回数据列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public ResultBean<List<T>> list(HttpServletRequest request, T entity) {
        sendLog("读取列表" + request.getParameterMap().size() + " :: " + entity);
        sendLog("读取列表" + request.getQueryString());
        sendLog("读取列表" + request.getRequestURI());
        // 没有参数传递会调用无参数方法, 有参数调用会调用有参数的方法
        if (request.getParameterMap().size() == 0) {
            return getBaseManagerService().findAllData();
        } else {
            return getBaseManagerService().findDataByPage(entity);
        }
    }

    /**
     * 添加数据
     *
     * @param entity 数据对象
     * @return 处理结果
     */
    @RequestMapping("/add")
    @ResponseBody
    public ResultBean<T> add(HttpServletRequest request, T entity) {
        sendLog("添加数据 " + entity);
        return getBaseManagerService().addData(entity);
    }

    /**
     * 更新数据
     *
     * @param entity 更改后的数据
     * @return 处理结果
     */
    @RequestMapping("/edit")
    @ResponseBody
    public ResultBean<T> edit(HttpServletRequest request, T entity) {
        sendLog("修改数据 " + entity);
        return getBaseManagerService().updateData(entity);
    }

    /**
     * 删除数据
     *
     * @param id 要删除数据的标识
     * @return 处理结果
     */
    @RequestMapping("/status")
    @ResponseBody
    public ResultBean<T> status(HttpServletRequest request, @RequestParam("id") String id) {
        sendLog("改变状态 " + id);
        return getBaseManagerService().changeStatus(id);
    }

}
