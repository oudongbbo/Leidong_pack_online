package com.starjoys.tool.packonline.modules.andrpack.service;

import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.modules.andrpack.dao.PackPathDao;
import com.starjoys.tool.packonline.modules.andrpack.entity.PackPathEntity;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import com.starjoys.tool.packonline.utils.DateUtils;
import com.starjoys.tool.packonline.utils.FileUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.File;
import java.util.Date;
import java.util.List;

/**
 * 打包路径业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/18
 */

@Service
public class PackPathService extends BaseService {

    @Resource
    private PackPathDao packPathDao;

    /**
     * 添加打包路径
     *
     * @param user         用户
     * @param packPathText 打包文件保存路径
     * @return 添加是否成功
     */
    public boolean addPackPath(UserEntity user, String packPathText) {
        sendLog("调用添加打包路径方法 user:" + user + " packPathtext:" + packPathText);
        PackPathEntity packPathEntity = new PackPathEntity();
        packPathEntity.setUser(user);
        packPathEntity.setPackPathText(packPathText);
        return this.addPackPath(packPathEntity);

    }

    /**
     * 添加打包路径
     *
     * @param packPathEntity 打包路径对象
     * @return 添加是否成功
     */
    public boolean addPackPath(PackPathEntity packPathEntity) {
        sendLog("调用添加打包路径方法");
        int result = packPathDao.insert(packPathEntity);
        sendLog("打包路径插入结果 " + result);
        if (result == 1) { // 插入成功
            return true;
        }
        return false;
    }


    /**
     * 删除以前打包生成的包
     */
    public void clearPrePack() {
        sendLog("调用清除以前打包后生成的文件方法");

        List<PackPathEntity> packPathList = packPathDao.findListByStatus(BaseEntity.FLAG_STATUS_ACTIVE);
        sendLog("获取到的打包路径列表 " + packPathList);

        if (packPathList != null && packPathList.size() != 0) { // 打包列表不为空时清理

            for (int i = 0; i < packPathList.size(); i++) {
                PackPathEntity packPathEntity = packPathList.get(i);
                int diff = DateUtils.twoDayDiff(new Date(System.currentTimeMillis()),
                        packPathEntity.getPackPathCreateDate());
                sendLog("打包路径信息: " + packPathEntity + " 天数差距:" + diff);
                if (diff >= GlobalConfig.CLEAR_PRE_PACK_DAY_DIFF) { // 如果超过天数
                    // 删除对应目录， 并把标识设置为0 （已删除标识）
                    FileUtil.delDir(new File(packPathEntity.getPackPathText()));
                    packPathDao.delete(packPathEntity.getPackPathId());
                    sendLog("删除包 " + packPathEntity);
                }

            }
        }

    }

}
