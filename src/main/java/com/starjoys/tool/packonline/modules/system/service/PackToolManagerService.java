package com.starjoys.tool.packonline.modules.system.service;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.bean.ValidationResultBean;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.common.config.ResPathConfig;
import com.starjoys.tool.packonline.modules.system.dao.PackToolDao;
import com.starjoys.tool.packonline.modules.system.dao.PackToolRecordDao;
import com.starjoys.tool.packonline.modules.system.entity.PackToolEntity;
import com.starjoys.tool.packonline.utils.DateUtils;
import com.starjoys.tool.packonline.utils.FileUtil;
import com.starjoys.tool.packonline.utils.ValidationUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.File;
import java.sql.Timestamp;
import java.util.List;

/**
 * 打包工具业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/5/4
 */

@Service
public class PackToolManagerService extends BaseService implements IBaseManagerService<PackToolEntity> {

    @Resource
    private PackToolDao packToolDao;

    @Resource
    private PackToolRecordDao packToolRecordDao;


    @Override
    public ResultBean<List<PackToolEntity>> findAllData() {
        return null;
    }

    @Override
    public ResultBean<List<PackToolEntity>> findAllData(PackToolEntity entity) {
        return null;
    }

    @Transactional(readOnly = true)
    @Override
    public ResultBean<List<PackToolEntity>> findDataByPage(PackToolEntity entity) {
        sendLog("分页数据查询 " + entity);
        ResultBean<List<PackToolEntity>> resultBean = new ResultBean<>();
        List<PackToolEntity> packToolList = packToolDao.findListByPage(entity);
        resultBean.setTotal(packToolDao.findCountByPage());
        setResultBean(resultBean, true, "成功获取所有数据", packToolList);
        return resultBean;
    }

    @Transactional
    @Override
    public ResultBean<PackToolEntity> addData(PackToolEntity entity) {
        ResultBean<PackToolEntity> resultBean = new ResultBean<>();
        if (validateBaseData(resultBean, entity, false)) { // 验证基础数据
            if (validateDaoData(resultBean, entity, true)) { // 验证数据库数据

                // 设置时间
                Timestamp currentDateTime = new Timestamp(System.currentTimeMillis());
                entity.setPackToolCreateDate(currentDateTime);
                entity.getRecord().setPtRecordUpDate(currentDateTime);

                if (handlerUploadFile(resultBean, entity)) { // 处理上传文件
                    handleAddDao(resultBean, entity); // 添加到数据库
                }
            }
        }
        return resultBean;
    }

    /**
     * 处理添加到数据库
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     */
    private void handleAddDao(ResultBean<PackToolEntity> resultBean, PackToolEntity entity) {

        // 插入打包工具
        packToolDao.insert(entity);

        // 插入打包工具记录
        packToolRecordDao.insert(entity);

        setResultBean(resultBean, true, "添加成功");
    }

    @Transactional
    @Override
    public ResultBean<PackToolEntity> updateData(PackToolEntity entity) {
        ResultBean<PackToolEntity> resultBean = new ResultBean<>();
        if (validateBaseData(resultBean, entity, false)) { // 验证基础数据
            if (validateDaoData(resultBean, entity, false)) { // 验证数据库数据

                // 设置时间
                Timestamp currentDateTime = new Timestamp(System.currentTimeMillis());
                entity.getRecord().setPtRecordUpDate(currentDateTime);

                if (handlerUploadFile(resultBean, entity)) { // 处理上传文件
                    handleUpdateDao(resultBean, entity); // 更新到数据库
                }
            }
        }
        return resultBean;
    }

    /**
     * 处理更新到数据库
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     */
    private void handleUpdateDao(ResultBean<PackToolEntity> resultBean, PackToolEntity entity) {

        // 更新打包工具
        packToolDao.update(entity);

        // 插入打包工具记录
        packToolRecordDao.insert(entity);

        setResultBean(resultBean, true, "更新成功");
    }


    /**
     * 修改数据 只修改标签数据, 不更新版本
     *
     * @param entity 对象
     * @return 结果集
     */
    public ResultBean<PackToolEntity> changeData(PackToolEntity entity) {
        sendLog("调用修改数据的方法 " + entity);

        ResultBean<PackToolEntity> resultBean = new ResultBean<>();
        if (validateBaseData(resultBean, entity, true)) { // 通过验证
            if (validateDaoData(resultBean, entity, false)) {
                // 修改打包工具
                packToolDao.update(entity);

                setResultBean(resultBean, true, "修改成功");
            }

        }
        sendLog("修改数据的结果 " + resultBean);
        return resultBean;

    }


    /**
     * 验证基础数据
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     * @return 是否验证成功
     */
    private boolean validateBaseData(ResultBean<PackToolEntity> resultBean, PackToolEntity entity, boolean isChange) {
        // 对数据对象验证
        ValidationResultBean validationResultBean = ValidationUtils.validateEntity(entity);
        sendLog("检验bean的基本数据结果 " + validationResultBean);
        if (validationResultBean.isHasErrors()) { // 存在错误
            setResultBeanError(resultBean, ValidationUtils.getFirstErrorMessage(validationResultBean));
            return false;
        }

        if (!isChange) { // 是更新和添加操作时执行以下

            if (entity.getRecord() == null) {
                setResultBeanError(resultBean, "更新说明不能为空");
                return false;
            }

            // 对打包记录对象验证
            validationResultBean = ValidationUtils.validateEntity(entity.getRecord());
            sendLog("检验bean的基本数据结果 " + validationResultBean);
            if (validationResultBean.isHasErrors()) { // 存在错误
                setResultBeanError(resultBean, ValidationUtils.getFirstErrorMessage(validationResultBean));
                return false;
            }

        }

        return true;
    }

    /**
     * 验证数据库数据
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     * @param isAdd      是否为添加操作
     * @return 是否验证成功
     */
    private boolean validateDaoData(ResultBean<PackToolEntity> resultBean, PackToolEntity entity, boolean isAdd) {

        if (!isAdd) {
            // 获取当前要修改的打包工具
            PackToolEntity daoEntity = packToolDao.get(entity.getPackToolId() + "");
            if (daoEntity == null) {
                setResultBeanError(resultBean, "找不到此打包工具");
                return false;
            }
        }

        // 判断名称和文件名是否已经存在
        PackToolEntity daoEntityByName = packToolDao.getByName(entity);
        PackToolEntity daoEntityByFileName = packToolDao.getByFileName(entity);
        if (isAdd) { // 添加操作
            if (daoEntityByName != null) {
                setResultBeanError(resultBean, "已存在此打包工具名");
                return false;
            }
            if (daoEntityByFileName != null) {
                setResultBeanError(resultBean, "已存在此打包工具文件名");
                return false;
            }
        } else { // 编辑操作
            if (daoEntityByName != null && daoEntityByName.getPackToolId() != entity.getPackToolId()) {
                setResultBeanError(resultBean, "已存在此打包工具名");
                return false;
            }
            if (daoEntityByFileName != null && daoEntityByFileName.getPackToolId() != entity.getPackToolId()) {
                setResultBeanError(resultBean, "已存在此打包工具文件名");
                return false;
            }
        }

        return true;
    }

    /**
     * 处理上传的文件
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     * @return 是否处理成功
     */
    private boolean handlerUploadFile(ResultBean<PackToolEntity> resultBean, PackToolEntity entity) {

        // 检查上传的文件
        String oldFileName = getFileName(entity.getPackToolUploadFile());
        sendLog("上传的文件名:" + oldFileName);
        if (oldFileName == null) {
            setResultBeanError(resultBean, "需要上传打包工具文件");
            return false;
        }
        if (!oldFileName.endsWith(".jar")) {
            setResultBeanError(resultBean, "只能上传jar文件");
            return false;
        }

        // 开始上传文件的准备
        long time = entity.getRecord().getPtRecordUpDate().getTime(); // 更新时间

        // 组装文件名
        String suffix = oldFileName.substring(oldFileName.lastIndexOf('.')); // 后缀名
        String newResFileName = entity.getPackToolFileName() + "_" + DateUtils.getDateStringFormat(time) + suffix; // 资源文件中的文件名
        String newPackFileName = entity.getPackToolFileName() + suffix; // 打包目录中的文件名

        // 组装路径
        String toolResRelPath = ResPathConfig.RELATIVE_PATH_RESOURCE_PACKTOOL + File.separator
                + entity.getPackToolFileName(); // 资源相对路径
        String toolResLocalPath = ResPathConfig.buildSystemLocalPath(
                ResPathConfig.RESOURCE_FRONT + File.separator + toolResRelPath); // 资源本地路径
        String toolPackLocalPath = ResPathConfig.buildSystemLocalPath(
                ResPathConfig.PACK_TOOLBOX_TOOLJAR);

        // 把文件转移到资源目录中
        File toolResFile = fileTransferTo(entity.getPackToolUploadFile(), toolResLocalPath, newResFileName);
        if (toolResFile == null) {
            setResultBeanError(resultBean, "文件转移到资源文件夹失败");
            return false;
        }
        // 保存资源文件到对象中
        entity.getRecord().setPtRecordUpPath(File.separator + toolResRelPath + File.separator + newResFileName);

        // 复制到打包目录中
        File toolPackLocalFile = new File(toolPackLocalPath, newPackFileName); // 打包目录里的打包文件
        FileUtil.delDir(toolPackLocalFile); // 删除原有的
        FileUtil.copyFile(toolResFile, toolPackLocalFile); // 把资源目录中的文件的复制到打包目录中

        return true;
    }


    @Override
    public ResultBean<PackToolEntity> changeStatus(String id) {
        return null;
    }

    @Override
    public ResultBean<PackToolEntity> getData(String id) {
        return null;
    }


}
