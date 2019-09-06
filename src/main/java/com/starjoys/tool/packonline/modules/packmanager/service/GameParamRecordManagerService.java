package com.starjoys.tool.packonline.modules.packmanager.service;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.bean.ValidationResultBean;
import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.modules.packmanager.dao.GameParamDao;
import com.starjoys.tool.packonline.modules.packmanager.dao.GameParamRecordDao;
import com.starjoys.tool.packonline.modules.packmanager.entity.GameParamEntity;
import com.starjoys.tool.packonline.modules.packmanager.utils.GameParamUtils;
import com.starjoys.tool.packonline.utils.ValidationUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 游戏参数记录管理业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/2/10
 */

@Service
public class GameParamRecordManagerService extends BaseService implements IBaseManagerService<GameParamEntity> {

    @Resource
    private GameParamDao gameParamDao;

    @Resource
    private GameParamRecordDao gameParamRecordDao;

    @Override
    public ResultBean<List<GameParamEntity>> findAllData() {
        return null;
    }

    @Override
    public ResultBean<List<GameParamEntity>> findAllData(GameParamEntity entity) {
//        sendLog("调用查询所有数据方法 " + entity);
        ResultBean<List<GameParamEntity>> resultBean = new ResultBean<>();
        List<GameParamEntity> list = gameParamRecordDao.findList(entity);
        if (list != null) {
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i).getStatus() == BaseEntity.FLAG_STATUS_DEL) {
                    list.remove(i);
                    i--;
                }
            }
            // 读取配置文件
            GameParamUtils.readCfgForList(list);
        }
        setResultBean(resultBean, true, "获取成功", list);
//        sendLog("查找结果 " + resultBean);
        return resultBean;
    }

    @Override
    public ResultBean<List<GameParamEntity>> findDataByPage(GameParamEntity entity) {
        return findAllData(entity);
    }

    @Override
    public ResultBean<GameParamEntity> addData(GameParamEntity entity) {
        return null;
    }

    @Override
    public ResultBean<GameParamEntity> changeStatus(String id) {
        return null;
    }

    @Override
    public ResultBean<GameParamEntity> updateData(GameParamEntity entity) {
        sendLog("调用更新数据的方法 " + entity);
        ResultBean<GameParamEntity> resultBean = new ResultBean<>();
        if (validateData(resultBean, entity)) { // 通过验证
            // 操作数据库之前处理
            if (GameParamUtils.beforeHandler(entity)) {
                // 进行数据库编辑操作
                handlerUpdateDao(resultBean, entity); // 调用插入操作
            } else {
                setResultBeanError(resultBean, "本地配置文件保存失败");
            }
        }
        sendLog("添加数据的结果 " + resultBean);
        return resultBean;
    }

    /**
     * 验证基础数据
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     * @return 是否验证成功
     */
    private boolean validateData(ResultBean<GameParamEntity> resultBean, GameParamEntity entity) {
        sendLog("调用验证数据方法 resultBean: " + resultBean + " entity: " + entity);

        // 对数据对象验证
        ValidationResultBean validationResultBean = ValidationUtils.validateEntity(entity);
        sendLog("检验bean的基本数据结果 " + validationResultBean);
        if (validationResultBean.isHasErrors()) { // 存在错误
            setResultBeanError(resultBean, ValidationUtils.getFirstErrorMessage(validationResultBean));
            return false;
        }

        // 游戏参数记录信息校验
//        validationResultBean = ValidationUtils.validateEntity(entity.getRecord());
//        sendLog("检验bean的游戏参数记录数据结果 " + validationResultBean);
//        if (validationResultBean.isHasErrors()) {
//            setResultBeanError(resultBean, ValidationUtils.getFirstErrorMessage(validationResultBean));
//            return false;
//        }

        // 检查游戏参数是否存在
        sendLog("检查游戏参数是否存在");
        GameParamEntity entityDao = gameParamRecordDao.get(entity.getRecord().getGpRecordId() + "");
        if (entity.getRecord() == null || entityDao == null) {
            setResultBeanError(resultBean, "此游戏参数不存在");
            return false;
        }
        entity.setGame(entityDao.getGame());
        entity.setCch(entityDao.getCch());

        return true;
    }

    /**
     * 处理更新到数据库
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     */
    private void handlerUpdateDao(ResultBean<GameParamEntity> resultBean, GameParamEntity entity) {
        sendLog("调用处理真正编辑到数据库的方法 " + entity);

        // 游戏参数记录编辑
        int result = gameParamRecordDao.update(entity);
        sendLog("更新游戏参数记录信息结果 " + result);
        if (result == 1) {
            setResultBean(resultBean, true, "更新成功");
        } else {
            setResultBeanError(resultBean, "更新失败");
        }
    }

    @Override
    public ResultBean<GameParamEntity> getData(String id) {
        return null;
    }


    /**
     * 更新游戏参数渠道数据
     *
     * @param entity 数据对象
     * @return 结果集
     */
    public ResultBean<GameParamEntity> updateRecordData(GameParamEntity entity) {
        sendLog("调用更新游戏参数渠道数据的方法 " + entity);
        ResultBean<GameParamEntity> resultBean = new ResultBean<>();
        GameParamEntity entityDao = gameParamRecordDao.get(entity.getRecord().getGpRecordId() + "");
        sendLog("获取到的参数对象 " + entityDao);

        // 设置对象
        entity.setGame(entityDao.getGame());
        entity.setCch(entityDao.getCch());

        // 数据库处理
        if (GameParamUtils.beforeHandler(entity)) {
            resultBean.setRows(entity);
            if (gameParamRecordDao.updateRecordData(entity) == 1) {
                setResultBean(resultBean, true, "修改成功");
            } else {
                setResultBeanError(resultBean, "修改失败");
            }
        } else {
            setResultBeanError(resultBean, "本地配置文件保存失败或者参数出现非法字符");
        }

        sendLog("更新游戏参数渠道数据的结果 " + resultBean);
        return resultBean;
    }

}
