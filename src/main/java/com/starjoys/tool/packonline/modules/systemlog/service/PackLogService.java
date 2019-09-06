package com.starjoys.tool.packonline.modules.systemlog.service;

import com.starjoys.tool.packonline.bean.PackResultBean;
import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.common.config.ResPathConfig;
import com.starjoys.tool.packonline.modules.system.dao.MenuDao;
import com.starjoys.tool.packonline.modules.system.entity.MenuEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import com.starjoys.tool.packonline.modules.systemlog.dao.PackLogDao;
import com.starjoys.tool.packonline.modules.systemlog.entity.PackLogEntity;
import com.starjoys.tool.packonline.utils.DateUtils;
import com.starjoys.tool.packonline.utils.FileUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.File;
import java.sql.Timestamp;
import java.util.List;

/**
 * 打包日志业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/5/2
 */

@Service
public class PackLogService extends BaseService {

    @Resource
    private PackLogDao packLogDao;

    @Resource
    private MenuDao menuDao;

    /**
     * @param packResultBean 打包结果集
     * @param menuUrl        菜单链接
     * @param user           用户
     * @param startDateTime  创建时间
     */
    public void addPackLog(ResultBean<PackResultBean> packResultBean,
                           String menuUrl, UserEntity user, Timestamp startDateTime) {
        sendLog("添加打包日志逻辑");
        PackLogEntity packLogEntity = new PackLogEntity();

        // 查找对应菜单
        MenuEntity daoMenuEntity = menuDao.getByMenuUrl(menuUrl);
        if (daoMenuEntity == null) {
            sendLog("找不到此菜单");
            return;
        }
        packLogEntity.setMenu(daoMenuEntity);

        // 设置打包结果
        if (packResultBean.isSuccess()) {
            packLogEntity.setPackLogResult(BaseEntity.FLAG_BOOLEAN_TRUE);
        } else {
            packLogEntity.setPackLogResult(BaseEntity.FLAG_BOOLEAN_FALSE);
        }


        // 设置用户
        packLogEntity.setUs(user);

        // 设置时间
        packLogEntity.setPackLogDate(startDateTime);

        // 组装日志内容
        String logFileRePath = handlerLogText(packResultBean, packLogEntity);
        packLogEntity.setPackLogPath(File.separator + logFileRePath);

        // 插入到数据库
        packLogDao.insert(packLogEntity);
    }

    /**
     * 处理日志文本
     *
     * @param packResultBean 打包结果集
     * @param packLogEntity  打包日志对象
     * @return 返回相对路径
     */
    private String handlerLogText(ResultBean<PackResultBean> packResultBean, PackLogEntity packLogEntity) {
        // 拼接日志内容
        String wrap = "\n";
        StringBuilder builder = new StringBuilder();
        builder.append("打包功能：").append(packLogEntity.getMenu().getMenuName()).append(wrap).append(wrap);
        builder.append("时间：").append(packLogEntity.getPackLogDate().toString()).append(wrap);
        builder.append("打包者：").append(packLogEntity.getUs().getUsername()).append(wrap);
        String packResult = "失败";
        if (packResultBean.isSuccess()) {
            packResult = "成功";
        }
        builder.append("打包结果：").append(packResult).append(wrap);
        builder.append("打包结果提示：").append(packResultBean.getMessage()).append(wrap).append(wrap);
        if (packResultBean.getRows() != null) {
            builder.append("打包日志：").append(wrap).append(packResultBean.getRows().getPackLogs()).append(wrap);
        }
        String logText = builder.toString(); // 最终的日志内容
//        sendLog("日志内容: " + logText);

        // 拼接日志文件的相对路径
        String username = packLogEntity.getUs().getUsername(); // 用户名
        long dateTime = packLogEntity.getPackLogDate().getTime(); // 时间
        String simpleDateStr = DateUtils.getSimpleDateStringFormat(dateTime); // 格式化简单时间
        String dateStr = DateUtils.getDateStringFormat(dateTime); // 格式化复杂时间
        String fileName = "log_" + packLogEntity.getUs().getUsername() + "_" + dateStr + ".txt";
        String logFileRePath =
                ResPathConfig.RELATIVE_PATH_RESOURCE_PACK_LOG
                        + File.separator + simpleDateStr
                        + File.separator + fileName;
        // 拼接本地路径
        String logFileLocalPath = ResPathConfig.buildSystemLocalPath(
                ResPathConfig.RESOURCE_FRONT + File.separator + logFileRePath);
        File logFile = new File(logFileLocalPath);
        FileUtil.createDir(logFile.getParentFile());
        sendLog("日志的相对地址: " + logFileRePath + " 本地地址: " + logFileLocalPath);

        // 把日志写入本地文件中
        logText = logText.replaceAll("\n", "\r\n"); // 替换成win文本的换行符
        FileUtil.write(logFile.getAbsolutePath(), logText);

        // 返回相对路径
        return logFileRePath;
    }

    @Transactional(readOnly = true)
    public ResultBean<List<PackLogEntity>> findListByPage(PackLogEntity entity) {
//        sendLog("分页数据查询 " + entity);
        ResultBean<List<PackLogEntity>> resultBean = new ResultBean<>();
        List<PackLogEntity> packLogList = packLogDao.findListByPage(entity);
        resultBean.setTotal(packLogDao.findCountByPage());
        setResultBean(resultBean, true, "成功获取所有数据", packLogList);
        return resultBean;
    }

}
