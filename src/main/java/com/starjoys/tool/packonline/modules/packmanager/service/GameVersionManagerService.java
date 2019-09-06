package com.starjoys.tool.packonline.modules.packmanager.service;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.modules.packmanager.dao.GameVersionDao;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameEntity;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 游戏版本管理业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/2/6
 */

@Service
public class GameVersionManagerService extends BaseService implements IBaseManagerService<GameEntity> {

    @Resource
    private GameVersionDao gameVersionDao;

    @Override
    public ResultBean<List<GameEntity>> findAllData() {
        return null;
    }

    @Override
    public ResultBean<List<GameEntity>> findAllData(GameEntity entity) {
//        sendLog("调用查询所有数据方法 " + entity);
        ResultBean<List<GameEntity>> resultBean = new ResultBean<>();
        List<GameEntity> list = gameVersionDao.findList(entity);
        if (list != null) {
            sendLog("遍历");
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i).getStatus() == BaseEntity.FLAG_STATUS_DEL) {
                    list.remove(i);
                    i--;
                }
            }
        }
        setResultBean(resultBean, true, "获取成功", list);
//        sendLog("查找结果 " + resultBean);
        return resultBean;
    }

    @Override
    public ResultBean<List<GameEntity>> findDataByPage(GameEntity entity) {
        return findAllData(entity);
    }

    @Override
    public ResultBean<GameEntity> addData(GameEntity entity) {
        return null;
    }

    @Override
    public ResultBean<GameEntity> changeStatus(String id) {
        return null;
    }

    @Override
    public ResultBean<GameEntity> updateData(GameEntity entity) {
        return null;
    }

    @Override
    public ResultBean<GameEntity> getData(String id) {
        return null;
    }
}
