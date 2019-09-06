package com.starjoys.tool.packonline.modules.packmanager.service;

import com.starjoys.tool.packonline.bean.ResultBean;
import com.starjoys.tool.packonline.bean.ValidationResultBean;
import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.common.base.BaseService;
import com.starjoys.tool.packonline.common.base.IBaseManagerService;
import com.starjoys.tool.packonline.common.config.GlobalConfig;
import com.starjoys.tool.packonline.common.config.ResPathConfig;
import com.starjoys.tool.packonline.modules.andrpack.service.CchPackService;
import com.starjoys.tool.packonline.modules.packmanager.dao.GameDao;
import com.starjoys.tool.packonline.modules.packmanager.dao.GameVersionDao;
import com.starjoys.tool.packonline.modules.packmanager.entity.*;
import com.starjoys.tool.packonline.modules.packmanager.utils.GameParamUtils;
import com.starjoys.tool.packonline.modules.system.entity.UserEntity;
import com.starjoys.tool.packonline.utils.*;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.File;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

/**
 * 游戏管理业务逻辑类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/16
 */

@Scope("prototype")
@Service
public class GameManagerService extends BaseService implements IBaseManagerService<GameEntity> {

    public static int UNKNOWN_COMMAND_TYPE = 0;
    public static int ADD_COMMAND_TYPE = 1;
    public static int UPDATE_COMMAND_TYPE = 2;
    public static int CHANGE_COMMAND_TYPE = 3;

    @Resource
    private GameDao gameDao;

    @Resource
    private GameVersionDao gameVersionDao;

    @Resource
    private CchPackService cchPackService;

    /** 转移到input文件夹中的数据文件 **/
    private File mInputDataFile;

    /** 从文件中解析出的游戏id **/
    private String mGameIdFromFile;

    /** 当前用户 **/
    private UserEntity mUser;

    @Override
    public ResultBean<List<GameEntity>> findAllData() {
        ResultBean<List<GameEntity>> resultBean = new ResultBean<>();
        List<GameEntity> gameEntityList = gameDao.findAllList();
        for (int i = 0; i < gameEntityList.size(); i++) {
            if (gameEntityList.get(i).getStatus() == BaseEntity.FLAG_STATUS_DEL) {
                gameEntityList.remove(i);
                i--;
            } else {
                GameParamUtils.readParamToEntity(getFeimiaoGameParam(gameEntityList.get(i)));
            }
        }
//        sendLog("获取的游戏列表数据 " + gameEntityList);
        setResultBean(resultBean, true, "成功获取所有数据", gameEntityList);
        return resultBean;
    }

    @Override
    public ResultBean<List<GameEntity>> findAllData(GameEntity entity) {
        ResultBean<List<GameEntity>> resultBean = new ResultBean<>();
        List<GameEntity> gameEntityList = gameDao.findAllListWithFilter(entity);
//        int ownCompanyId = entity.getCompanyId();
        for (int i = 0; i < gameEntityList.size(); i++) {
            GameEntity daoEntity = gameEntityList.get(i);
//            if (daoEntity.getStatus() == BaseEntity.FLAG_STATUS_DEL
//                    || (ownCompanyId != GlobalConfig.COMPANY_ID_FOR_SUPER_MANAGER
//                         && ownCompanyId != daoEntity.getCompanyId()) ) {
//                gameEntityList.remove(i);
//            } else {
//
//            }
            GameParamUtils.readParamToEntity(getFeimiaoGameParam(daoEntity));
        }
//        sendLog("获取的游戏列表数据 " + gameEntityList);
        setResultBean(resultBean, true, "成功获取所有数据", gameEntityList);
        return resultBean;
    }

    @Transactional(readOnly = true)
    @Override
    public ResultBean<List<GameEntity>> findDataByPage(GameEntity entity) {
//        sendLog("分页数据查询 " + entity);
        ResultBean<List<GameEntity>> resultBean = new ResultBean<>();
        List<GameEntity> gameList = gameDao.findListByPage(entity);
        resultBean.setTotal(gameDao.findCountByPage());
        for (int i = 0; i < gameList.size(); i++) {
            GameParamUtils.readParamToEntity(getFeimiaoGameParam(gameList.get(i)));
        }
        setResultBean(resultBean, true, "成功获取所有数据", gameList);
        return resultBean;
    }

    @Override
    public ResultBean<GameEntity> addData(GameEntity entity) {
        return null;
    }

    @Transactional
    public ResultBean<GameEntity> addData(GameEntity entity, UserEntity userEntity) {
        sendLog("调用添加数据的方法 " + entity);
        mUser = userEntity;

        ResultBean<GameEntity> resultBean = new ResultBean<>();
        if (validateData(resultBean, entity)) { // 通过验证

            if (readGameId(resultBean, entity)) { // 从文件中读取游戏Id

                if (validateDataExist(resultBean, entity, ADD_COMMAND_TYPE)) { // 0代表已经存在并且未删除
                    // 设置创建时间
                    Timestamp currentTime = new Timestamp(System.currentTimeMillis());
                    entity.setGameCreateDate(currentTime);
                    entity.getVer().setGameVerUpDate(currentTime);

                    // 处理上传文件
                    if (handlerUploadFile(resultBean, entity)) { // 处理成功
                        handlerAddDao(resultBean, entity); // 调用插入操作
                    }

                    // 处理失败,删除刚上传的cp sjoys包
                    if (!resultBean.isSuccess()) {
                        // 删除此游戏临时的CP SJoys包
                        removeCPSJoysFile(entity);
                    }

                }

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
    private boolean validateData(ResultBean<GameEntity> resultBean, GameEntity entity) {
        sendLog("调用验证数据方法 resultBean: " + resultBean + " entity: " + entity);

        // 对数据对象验证
        ValidationResultBean validationResultBean = ValidationUtils.validateEntity(entity);
        sendLog("检验bean的基本数据结果 " + validationResultBean);
        if (validationResultBean.isHasErrors()) { // 存在错误
            setResultBeanError(resultBean, ValidationUtils.getFirstErrorMessage(validationResultBean));
            return false;
        }

        // 游戏版本信息校验
        validationResultBean = ValidationUtils.validateEntity(entity.getVer());
        if (validationResultBean.isHasErrors()) {
            setResultBeanError(resultBean, ValidationUtils.getFirstErrorMessage(validationResultBean));
            return false;
        }

        // 对上传的文件进行验证
        String dataFileName = getFileName(entity.getGameCPFile());
        sendLog("获取到的CP文件名 " + dataFileName);
        if (dataFileName == null) {
            setResultBeanError(resultBean, "游戏CP包必须上传");
            return false;
        }

        if (!dataFileName.endsWith(".apk")) {
            setResultBeanError(resultBean, "只支持apk上传");
            return false;
        }

        return true;
    }

    /**
     * 把上传的文件转移到input文件夹中, 并从中读取游戏Id
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     * @return 是否成功
     */
    private boolean readGameId(ResultBean<GameEntity> resultBean, GameEntity entity) {
        //  先移动到input中
        mInputDataFile = fileTransferTo(entity.getGameCPFile(), System.currentTimeMillis() + "_"
                + entity.getGameCPFile().getOriginalFilename());
        sendLog("移动上传的游戏CP文件到input文件夹中 " + mInputDataFile);
        if (mInputDataFile == null) {
            setResultBeanError(resultBean, "游戏CP数据转移失败");
            return false;
        }

        // 解析apk gameId
        mGameIdFromFile = Apktools.getGameSdkGid(mInputDataFile.getAbsolutePath());
        sendLog("获取游戏Id " + mGameIdFromFile);
        if (!StringUtils.isNotEmpty(mGameIdFromFile)) {
            setResultBeanError(resultBean, "游戏解析失败,获取不了游戏Id");
            return false;
        }

        // 对比现有的gameId
        if (!mGameIdFromFile.equals(entity.getGameId())) {
            setResultBeanError(resultBean, "游戏id与游戏包中游戏id不相同");
            return false;
        }

        return true;
    }

    /**
     * 验证数据是否存在
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     * @return 结果
     */
    private boolean validateDataExist(ResultBean<GameEntity> resultBean, GameEntity entity, int commandType) {
        sendLog("调用数据是否存在方法 " + entity);

        long _gameId = entity.getId(); // 游戏id

        if (commandType != ADD_COMMAND_TYPE && _gameId <= 0) { // 修改游戏信息不能缺少游戏id
            setResultBeanError(resultBean, "缺少游戏id参数");
            return false;
        }

        // 通过gid获取
        GameEntity daoEntityByGameId;
        if (mGameIdFromFile != null) {
            daoEntityByGameId = gameDao.getByGameId(mGameIdFromFile);
        } else {
            daoEntityByGameId = gameDao.getByGameId(entity.getGameId());
        }
        sendLog("通过gid获取到的数据 " + daoEntityByGameId);

        // 通过游戏标识获取
        GameEntity daoEntityByShortName = gameDao.getByGameShortName(entity.getGameShortName());
        sendLog("通过游戏标识获取到的数据 " + daoEntityByShortName);

        if (commandType == ADD_COMMAND_TYPE) {
            if (daoEntityByGameId != null) { // 判断gid是否存在
                setResultBeanError(resultBean, "当前所要添加的游戏已存在");
                return false;
            }

            if (daoEntityByShortName != null) { // 判断游戏标识是否存在
                setResultBeanError(resultBean, "当前所要添加游戏的游戏标识已存在");
                return false;
            }

        } else {
            // 通过游戏id获取
            GameEntity daoEntity = gameDao.get(_gameId + "");
            sendLog("通过游戏id获取到的数据 " + daoEntity);

            if (daoEntity == null || daoEntity.getStatus() == BaseEntity.FLAG_STATUS_DEL) { // 判断游戏id是否存在
                setResultBeanError(resultBean, "当前所要修改的游戏不存在");
                return false;
            }

            if (daoEntityByGameId != null && daoEntityByGameId.getId() != _gameId) { // 判断gid是否存在,并且不是游戏本身
                setResultBeanError(resultBean, "当前所要修改游戏的游戏ID已存在");
                return false;
            }

            if (daoEntityByShortName != null && daoEntityByShortName.getId() != _gameId) { // 判断游戏标识是否存在
                setResultBeanError(resultBean, "当前所要修改游戏的游戏标识已存在");
                return false;
            }
        }

        // 最后进行媒体id 的判断
        if (commandType == ADD_COMMAND_TYPE) {
            return readGameMid(resultBean, entity);
        } else if (commandType == UPDATE_COMMAND_TYPE){
            return readGameMid(resultBean, daoEntityByGameId);
        } else if (commandType == CHANGE_COMMAND_TYPE){
            return true;
        } else {
            return false;
        }

    }

    /**
     * 读取游戏的mid 媒体id  并进行判断
     *
     * @param resultBean 结果集
     * @param entity     信息类
     * @return 结果
     */
    private boolean readGameMid(ResultBean<GameEntity> resultBean, GameEntity entity) {

        // 获取游戏的mid 媒体id
        String mGameMidFromFile = Apktools.getGameSdkMid(mInputDataFile.getAbsolutePath());
        if (!StringUtils.isNotEmpty(mGameMidFromFile)) {
            setResultBeanError(resultBean, "游戏解析失败，获取不了媒体Id");
            return false;
        }

        // 这些游戏的限制媒体id跳过
        //黑暗与荣耀[100038], 苍之纪元[100198], 永恒仙域[100197], 有仙气[100174], 黑暗与荣耀（应用宝）[100231]
        if (mGameIdFromFile.equals("100038") || mGameIdFromFile.equals("100198")
                || mGameIdFromFile.equals("100197") || mGameIdFromFile.equals("100174")
                || mGameIdFromFile.equals("100231")) {
            return true;
        }

        // 限制媒体id, 防止填写错误
        if (entity.getCompany().getCompanyId() == 1 ||
                entity.getCompany().getCompanyId() == GlobalConfig.COMPANY_ID_FOR_SUPER_MANAGER) { // 星趣1万
            if (!mGameMidFromFile.equals("10000")) {
                setResultBeanError(resultBean, "星趣官网包的媒体Id必须为10000");
                return false;
            }
        } else if (entity.getCompany().getCompanyId() == 2) { // 天拓20万
            if (!mGameMidFromFile.equals("200000")) {
                setResultBeanError(resultBean, "天拓官网包的媒体Id必须为200000");
                return false;
            }
        } else {
            setResultBeanError(resultBean, "无法识别此帐号的公司id，请找技术人员配置");
            return false;
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
    private boolean handlerUploadFile(ResultBean<GameEntity> resultBean, GameEntity entity) {

        sendLog("调用处理上传文件方法 resultBean: " + resultBean );
        sendLog("调用处理上传文件方法 entity: " + entity.toString());

        // 把cp包转移到特定cp目录中
        String dateString = DateUtils.getDateStringFormat(entity.getVer().getGameVerUpDate().getTime()); // 更新时间文件夹名
        entity.getVer().setGameVerUpFDate(dateString); // 把格式化后的时间放入数据对象中

        // CP文件的保存地址
        String apkCpSaveParentPath = ResPathConfig.getGameApkLocalParentPath(entity, true); // 组装解压路径字符串
        sendLog("组装游戏CP的保存路径 " + apkCpSaveParentPath);

        File apkCpSaveParentFile = new File(apkCpSaveParentPath); // 组装文件解压的路径
        if (!apkCpSaveParentFile.exists()) {
            apkCpSaveParentFile.mkdirs();
        }
        // 移动文件
        String apkCpName = ResPathConfig.getGameApkName(entity, true); // cp的新文件名

        File apkCpFile = new File(apkCpSaveParentFile.getAbsolutePath() + File.separator + apkCpName);

        sendLog("移动上传的文件到cp目录：");
        sendLog("From：" + mInputDataFile);
        sendLog("To：" + apkCpFile);

        if (!mInputDataFile.renameTo(apkCpFile)) {
            setResultBeanError(resultBean, "游戏cp移动到cp目录失败");
            return false;
        }

        // 保存cp包路径
        String cpResSavePath = ResPathConfig.getGameApkLocalParentPath(ResPathConfig.RELATIVE_PATH_RESOURCE_GAME_CP, entity, true); // 资源路径

        String cpPath = File.separator + cpResSavePath + File.separator + apkCpFile.getName();
        if (SystemUtils.isWindowsOS()) { // win右斜线json很容易出问题
            cpPath = cpPath.replaceAll("\\\\", "/");
        }
        entity.getVer().setGameVerUpCPPath(cpPath);


        // 解析apk 获取版本号 版本名
        Map<String, String> apkMap = Apktools.getApkInfo(apkCpFile.getAbsolutePath());
        sendLog("解析apk 获取版本号 版本名 " + apkMap);
        if (apkMap == null) {
            setResultBeanError(resultBean, "游戏解析失败,获取不了版本信息");
            return false;
        }
        entity.getVer().setGameVerName(apkMap.get(ApkReadUtils.APK_VERSION_NAME)); // 版本名
        entity.getVer().setGameVerNum(apkMap.get(ApkReadUtils.APK_VERSION_CODE)); // 版本号


        // 添加新游戏sdk的cfg配置文件, 要先保存新的配置文件才能cp打包
        sendLog("添加新游戏sdk的cfg配置文件");
        if (!GameParamUtils.beforeHandler(getFeimiaoGameParam(entity))) {
            setResultBeanError(resultBean, "此游戏对应的sdk配置文件保存失败");
            return false;
        }

        // CP打包，升级SDK
        sendLog("即将打包的游戏属性："+entity.toString());

        ResultBean cpPackResult = cchPackService.submitCPPack(entity, mUser);

        sendLog("CP母包自升级 " + cpPackResult);

        if (!cpPackResult.isSuccess()) {
            setResultBeanError(resultBean, cpPackResult.getMessage());
            return false;
        }

        return true;
    }

    /**
     * 获取sdk的游戏参数对象类
     *
     * @param entity 游戏数据对象
     * @return 转换
     */
    private GameParamEntity getFeimiaoGameParam(GameEntity entity) {
        GameParamEntity gameParamEntity = new GameParamEntity(); // 游戏参数
        ChannelEntity channelEntity = new ChannelEntity(); // 渠道
        channelEntity.setCchShortName("leidong");
        GameParamRecordEntity gameParamRecordEntity = new GameParamRecordEntity(); // 游戏参数记录
        gameParamRecordEntity.setIsLandScape(entity.getIsLandScape());
        gameParamRecordEntity.setIsFinal(entity.getIsFinal());
        gameParamRecordEntity.setReplaceR(entity.getReplaceR());
        gameParamEntity.setGame(entity);
        gameParamEntity.setCch(channelEntity);
        gameParamEntity.setRecord(gameParamRecordEntity);
        return gameParamEntity;
    }

    /**
     * 处理添加到数据库
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     */
    private void handlerAddDao(ResultBean<GameEntity> resultBean, GameEntity entity) {
        sendLog("调用处理真正添加到数据库的方法");

        int result = -1;
//        if (existResult == 2) { // 插入
        sendLog("插入游戏表");
        if (gameDao.insert(entity) == 1) { // 先插入到游戏表中
            sendLog("插入游戏版本表");
            result = gameVersionDao.insert(entity); // 插入到游戏版本表中
        }
//        } else if (existResult == 1) { // 原先的游戏更新后当成新的
//            entity.setStatus(BaseEntity.FLAG_STATUS_ACTIVE); // 把原本的游戏重新设置为启用的
//            sendLog("原先的游戏更新后当成新的 " + entity);
//            if (gameDao.update(entity) == 1) {
//                sendLog("插入游戏版本表");
//                result = gameVersionDao.insert(entity); // 插入到游戏版本表中
//            }
//        }

        if (result == 1) {
            setResultBean(resultBean, true, "数据添加成功");
        } else {
            setResultBeanError(resultBean, "数据添加到数据库失败，请检查数据库设置");
        }
    }

    @Transactional
    public ResultBean<GameEntity> changeStatus(String id, int companyId) {
        sendLog("调用修改状态方法 " + id);
        ResultBean<GameEntity> resultBean = new ResultBean<>();

        GameEntity entity = new GameEntity();
        entity.setId(Integer.parseInt(id));
        if (checkCompanyId(resultBean, entity, companyId)) { // 检查权限
            if (handlerChangeStatus(resultBean, id)) { // 处理修改状态后的文件
                gameVersionDao.delete(id);
                gameDao.delete(id);
                resultBean.setSuccess(true);
            }
        }

        return resultBean;
    }

    /**
     * 处理改变状态后的本地文件
     *
     * @param resultBean 结果集
     * @param id         游戏id
     * @return 是否成功
     */
    private boolean handlerChangeStatus(ResultBean<GameEntity> resultBean, String id) {
        GameEntity daoEntity = gameDao.getWithVer(id);
        if (daoEntity == null || daoEntity.getVer() == null) {
            setResultBeanError(resultBean, "找不到要删除的游戏");
            return false;
        }

        //---------------------------转移资源文件中的cp包和sjoy包----------------------------------
        // 当前的路径拼接
        File cpLocalFile = getLocalResFile(daoEntity.getVer().getGameVerUpCPPath()); // cp本地路径
        File sjoyLocalFile = getLocalResFile(daoEntity.getVer().getGameVerUpSJoysPath()); // sjoy本地路径
        if (!cpLocalFile.exists()) {
            setResultBeanError(resultBean, "当前游戏的cp文件夹不存在");
            return false;
        }
        if (!sjoyLocalFile.exists()) {
            setResultBeanError(resultBean, "当前游戏的sjoy文件夹不存在");
            return false;
        }
        String cpLocalShortNamePath = cpLocalFile.getParentFile().getParentFile().getAbsolutePath(); // cp游戏名缩写所在路径
        String sjoyLocalShortNamePath = sjoyLocalFile.getParentFile().getParentFile().getAbsolutePath(); // cp游戏名缩写所在路径

        // 删除后的路径拼接
        String dateStr = DateUtils.getDateStringFormat(daoEntity.getGameCreateDate().getTime());
        String delDirName = daoEntity.getGameShortName() + "_" + dateStr; // 在游戏名缩写的文件夹后面加时间
        String cpDelLocalPath = ResPathConfig.buildSystemLocalPath(
                ResPathConfig.RESOURCE_GAME_CP
                        + File.separator + DELETE_BACKUP_DIR
                        + File.separator + delDirName); // 删除后cp所放的本地路径, cp路径/delete_backup/缩写_时间/
        String sjoyDelLocalPath = ResPathConfig.buildSystemLocalPath(
                ResPathConfig.RESOURCE_GAME_SDK
                        + File.separator + DELETE_BACKUP_DIR
                        + File.separator + delDirName);  // 删除后sjoy包所放的本地路径, sjoy路径/delete_backup/缩写_时间/

        File cpDelLocalPathFile = new File(cpDelLocalPath);
        File sjoyDelLocalPathFile = new File(sjoyDelLocalPath);

        // 创建删除后所存放的目录
        FileUtil.createDir(cpDelLocalPathFile);
        FileUtil.createDir(sjoyDelLocalPathFile);

        // 把当前路径的文件复制到删除路径中
        FileUtil.copyDirectiory(cpLocalShortNamePath, cpDelLocalPathFile.getAbsolutePath(), true);
        FileUtil.copyDirectiory(sjoyLocalShortNamePath, sjoyDelLocalPathFile.getAbsolutePath(), true);

        // 删除当前cp和sjoy所存放的文件夹
        FileUtil.delDir(new File(cpLocalShortNamePath));
        FileUtil.delDir(new File(sjoyLocalShortNamePath));


        //-------------------------------转移打包目录中的config文件准备-------------------------
        // 获取cfg文件所在文件夹
        File cfgPathFile = GameParamUtils.getParamCfgPathFile(daoEntity);
        if (cfgPathFile != null && cfgPathFile.exists()) {

            File cfgFirstPathFile = GameParamUtils.getParamCfgFirstPathFile(daoEntity);

            // 判断当前的游戏类型, 并拼接好文件夹名
            if (daoEntity.getGameType() == GameEntity.GAME_TYPE_DUDAI) {
                delDirName = daoEntity.getGameShortName() + "_" + dateStr; // 在游戏名缩写的文件夹后面加时间
            } else if (daoEntity.getGameType() == GameEntity.GAME_TYPE_LIANYUN) {
                delDirName = daoEntity.getGameId() + "_" + dateStr; // 在游戏id的文件夹后面加时间
            }
            // 组装删除备份路径
            File pathFile = GameParamUtils.getParamCfgGameTypePathFile(daoEntity);
            if (cfgFirstPathFile != null && pathFile != null) {
                String cfgFrontPath = pathFile.getAbsolutePath();
                String deleteBackupPath = cfgFrontPath
                        + File.separator + DELETE_BACKUP_DIR
                        + File.separator + delDirName; // 组装删除备份路径, config路径/DUDAI(或LIANYUN)/delete_backup/缩写_时间

                // 创建删除备份路径
                File deleteBackupPathFile = new File(deleteBackupPath);
                FileUtil.createDir(deleteBackupPathFile);

                // 转移
                FileUtil.copyDirectiory(cfgFirstPathFile.getAbsolutePath(), deleteBackupPath, true);

                // 删除原来的目录
                FileUtil.delDir(cfgFirstPathFile);
            }
        }

        return true;
    }

    @Override
    public ResultBean<GameEntity> changeStatus(String id) {
        return null;
    }

    @Override
    public ResultBean<GameEntity> updateData(GameEntity entity) {
        return null;
    }

    /**
     * 删除本地文件
     *
     * @param resultBean 结果集
     * @param id         id
     * @return 处理结果
     */
    private boolean removeLocalFile(ResultBean<GameEntity> resultBean, String id) {
        sendLog("调用删除本地文件方法 " + id);

        // 获取对象数据
        GameEntity entity = gameDao.get(id);
        sendLog("获取到的对象 " + entity);
        if (entity == null || entity.getStatus() == BaseEntity.FLAG_STATUS_DEL) {
            setResultBeanError(resultBean, "此游戏不存在");
            return false;
        }

        // 删除此游戏CP sdk包的所有版本
        removeCPSJoysFile(entity);

        return true;
    }

    @Transactional
    public ResultBean<GameEntity> updateData(GameEntity entity, UserEntity userEntity) {
        sendLog("调用编辑数据的方法 " + entity);
        mUser = userEntity;

        ResultBean<GameEntity> resultBean = new ResultBean<>();
        if (validateData(resultBean, entity)) { // 通过验证

            if (readGameId(resultBean, entity)) { // 从文件中读取游戏Id

//                if (entity.getGameId().equals(mGameIdFromFile)) { // 检测上传的游戏是否符合更新的游戏

                if (validateDataExist(resultBean, entity, UPDATE_COMMAND_TYPE)) {  // 不存在此游戏

                    if (checkCompanyId(resultBean, entity, entity.getCompany().getCompanyId())) {  // 检查游戏所属公司是否与操作者符合

                        // 设置更新时间
                        Timestamp currentTime = new Timestamp(System.currentTimeMillis());
                        entity.getVer().setGameVerUpDate(currentTime);
                        // 处理上传文件
                        if (handlerUploadFile(resultBean, entity)) { // 处理成功

                            handlerMoveFile(resultBean, entity); // 处理需要移动文件的操作

                            handlerUpdateDao(resultBean, entity); // 调用更新操作
                        }

                        // 处理失败,删除刚上传的cp sdk包
                        if (!resultBean.isSuccess()) {
                            // 删除此游戏临时的CP sdk包
                            removeCPSJoysFile(entity);
                        }
                    }

                }

//                } else {
//                    sendLog("上传的游戏CP与此更新游戏不对应");
//                    setResultBeanError(resultBean, "上传的游戏CP与此更新游戏不对应");
//                }

            }
        }
        sendLog("编辑数据的结果 " + resultBean);
        return resultBean;
    }

    /**
     * 处理更新到数据库
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     */
    private void handlerUpdateDao(ResultBean<GameEntity> resultBean, GameEntity entity) {
        sendLog("调用处理真正编辑到数据库的方法 " + entity);

        // 把所有当前渠道都设置为不是最新
        GameEntity updateIsNewEntity = new GameEntity();
        updateIsNewEntity.setVer(new GameVersionEntity());
        updateIsNewEntity.getVer().setIsNew(BaseEntity.FLAG_BOOLEAN_FALSE); // 设置不是最新
        updateIsNewEntity.setId(entity.getId());
        int isNewResult = gameVersionDao.updateIsNew(updateIsNewEntity); // 更新为不是最新操作
        sendLog("所有当前游戏设置为不是最新 " + updateIsNewEntity + " result:" + isNewResult);

        // 把数据插入渠道版本中
        int versionResult = gameVersionDao.insert(entity); // 游戏版本插入操作
        sendLog("插入游戏版本结果 " + versionResult);
        if (versionResult == 1) {
            entity.setStatus(BaseEntity.FLAG_STATUS_ACTIVE); // 游戏设置为启用的
            int result = gameDao.update(entity); // 游戏更新操作
            sendLog("更新游戏信息结果 " + result);

            if (result == 1) {
                setResultBean(resultBean, true, "更新成功");
            } else {
                setResultBeanError(resultBean, "更新失败");
            }
        }
    }

    @Override
    public ResultBean<GameEntity> getData(String id) {
        ResultBean<GameEntity> resultBean = new ResultBean<>();
        if (id != null && StringUtils.isNotEmpty(id)) {
            GameEntity gameEntity = gameDao.get(id);
            if (gameEntity != null) {
                setResultBean(resultBean, true, "获取数据成功", gameEntity);
            } else {
                setResultBean(resultBean, false, "找不到此游戏");
            }
        } else {
            setResultBean(resultBean, false, "游戏ID不能为空");
        }
        return resultBean;
    }


    /**
     * 删除cp和星趣包
     *
     * @param entity 游戏对象类
     */
    public void removeCPSJoysFile(GameEntity entity) {
//        // 删除input中的临时文件
//        FileUtil.delDir(mInputDataFile);
//        sendLog("删除临时文件 " + mInputDataFile.getAbsolutePath());
//
//        // 删除cp, 如果没有游戏版本类中没有时间, 则删除父目录
//        File localFile = new File(ResPathConfig.getGameApkLocalParentPath(entity, true));
//        FileUtil.delDir(localFile);
//        sendLog("进行删除CP操作 " + localFile.getAbsolutePath());
//
//        // 删除星趣包, 如果没有游戏版本类中没有时间, 则删除父目录
//        localFile = new File(ResPathConfig.getGameApkLocalParentPath(entity, false));
//        FileUtil.delDir(localFile);
//        sendLog("进行删除SJOY操作 " + localFile.getAbsolutePath());
    }

    /**
     * 修改数据 只修改标签数据, 不更新版本
     *
     * @param entity 对象
     * @return 结果集
     */
    public ResultBean<GameEntity> changeData(GameEntity entity) {
        sendLog("调用修改数据的方法 " + entity);

        ResultBean<GameEntity> resultBean = new ResultBean<>();
        if (validateChangeData(resultBean, entity)) { // 通过验证

            if (validateDataExist(resultBean, entity, CHANGE_COMMAND_TYPE)) {  // 不存在此游戏

                if (checkCompanyId(resultBean, entity, entity.getCompany().getCompanyId())) { // 检查所属公司

                    handlerMoveFile(resultBean, entity); // 处理需要移动文件的操作

                    int result = gameDao.update(entity); // 游戏更新操作
                    sendLog("修改游戏信息结果 " + result);

                    if (result == 1) {
                        setResultBean(resultBean, true, "修改成功");
                    } else {
                        setResultBeanError(resultBean, "修改失败");
                    }

                }

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
    private boolean validateChangeData(ResultBean<GameEntity> resultBean, GameEntity entity) {
        sendLog("调用验证修改数据方法 resultBean: " + resultBean + " entity: " + entity);

        // 对数据对象验证
        ValidationResultBean validationResultBean = ValidationUtils.validateProperty(entity, new String[]{
                "gameId", "gameName", "gameShortName", "gameType"
        });
        sendLog("检验bean的基本数据结果 " + validationResultBean);
        if (validationResultBean.isHasErrors()) { // 存在错误
            setResultBeanError(resultBean, ValidationUtils.getFirstErrorMessage(validationResultBean));
            return false;
        }

        return true;
    }

    /**
     * 检查公司id
     *
     * @param resultBean 结果集
     * @param entity     数据对象
     * @return 检查结果
     */
    private boolean checkCompanyId(ResultBean<GameEntity> resultBean, GameEntity entity, int companyId) {

        if (companyId != GlobalConfig.COMPANY_ID_FOR_SUPER_MANAGER) { // 超级管理员直接跳过
            GameEntity daoEntity = gameDao.get(entity.getId() + "");
            if (daoEntity.getStatus() == BaseEntity.FLAG_STATUS_DEL
                    || daoEntity.getCompany().getCompanyId() != companyId) {
                setResultBeanError(resultBean, "无权限");
                return false;
            }
        }

        return true;
    }


    /**
     * 处理文件的移动
     *
     * @param resultBean 结果集
     * @param entity     对象
     * @return 是否成功
     */
    private boolean handlerMoveFile(ResultBean<GameEntity> resultBean, GameEntity entity) {
        GameEntity daoEntity = gameDao.getWithVer(entity.getId() + "");
        if (entity.getVer() == null) {
            entity.setVer(daoEntity.getVer());
        }

        // 判断修改项
        boolean isChangeGameShortName = !daoEntity.getGameShortName().equals(entity.getGameShortName());
        boolean isChangeGameType = daoEntity.getGameType() != entity.getGameType();

        // 修改游戏id, 游戏缩写, 游戏类型
        if (isChangeGameShortName || isChangeGameType) {

            // 修改游戏id, 游戏缩写, 游戏类型, 都需要把cfg文件都转移到对应新的目录中
            movePackCfgFile(resultBean, entity, daoEntity);
        }

        // 把cp和sjoy的资源文件名修改以及目录修改
        if (isChangeGameShortName) {
            moveResFile(entity, daoEntity);
        }

        return true;
    }


    /**
     * 把cfg文件都转移到对应新的目录中
     *
     * @param entity    当前修改的对象
     * @param daoEntity 从数据库查找出来的对象
     */
    private void movePackCfgFile(ResultBean<GameEntity> resultBean,
                                 GameEntity entity, GameEntity daoEntity) {
        File daoCfgPathFile = GameParamUtils.getParamCfgPathFile(daoEntity); // 获取当前的路径
        File changeCfgPathFile = GameParamUtils.getParamCfgPathFile(entity); // 修改后的路径
        if (daoCfgPathFile != null && daoCfgPathFile.exists() && changeCfgPathFile != null) {
            // 创建
            FileUtil.createDir(changeCfgPathFile);

            // 复制到新的目录中
            FileUtil.copyDirectiory(daoCfgPathFile.getAbsolutePath(),
                    changeCfgPathFile.getAbsolutePath(), true);

            // 删除
            if (daoEntity.getGameType() == GameEntity.GAME_TYPE_DUDAI) {
                FileUtil.delDir(daoCfgPathFile.getParentFile());
            } else {
                FileUtil.delDir(daoCfgPathFile);
            }
        }
    }

    /**
     * 把cp和sjoy的资源文件名修改以及目录修改
     *
     * @param entity    对象
     * @param daoEntity 数据库对象
     */
    public void moveResFile(GameEntity entity, GameEntity daoEntity) {
        // 获取当前游戏所有版本列表
        List<GameEntity> daoGameVersionList = gameVersionDao.findList(daoEntity);
        for (GameEntity daoGameVerEntity : daoGameVersionList) {

            // 跳过删除的
            if (daoGameVerEntity.getStatus() == BaseEntity.FLAG_STATUS_DEL) {
                continue;
            }

            daoGameVerEntity.setGameShortName(entity.getGameShortName()); // 修改缩写

            // 拼接好cp和sdk本地文件
            File cpLocalFile = getLocalResFile(daoGameVerEntity.getVer().getGameVerUpCPPath()); // cp本地路径
            File sdkLocalFile = getLocalResFile(daoGameVerEntity.getVer().getGameVerUpSJoysPath()); // sjoy本地路径
            if (!cpLocalFile.exists() || !sdkLocalFile.exists()) {
                continue;
            }

            // 重命名
//            if (isChangeGameId) {
//                // 进行重命名文件操作
//                FileUtil.renameFile(cpLocalFile.getParent(), cpLocalFile.getName(), newCpApkName);
//                FileUtil.renameFile(sjoysLocalFile.getParent(), sjoysLocalFile.getName(), newSjoysApkName);
//
//                // 重命名后的文件
//                cpLocalFile = new File(cpLocalFile.getParent(), newCpApkName);
//                sjoysLocalFile = new File(sjoysLocalFile.getParent(), newSjoysApkName);
//            }

            // 组装相对路径文件路径
            String cpRelFilePath = ResPathConfig.getGameApkLocalParentPath(
                    ResPathConfig.RELATIVE_PATH_RESOURCE_GAME_CP,
                    daoGameVerEntity, true) + File.separator + cpLocalFile.getName();
            String sjoysRelFilePath = ResPathConfig.getGameApkLocalParentPath(
                    ResPathConfig.RELATIVE_PATH_RESOURCE_GAME_SDK,
                    daoGameVerEntity, false) + File.separator + sdkLocalFile.getName();

            // 移动资源文件
            // 将要移动过去的新目录文件
            File newCpLocalFile = getLocalResFile(cpRelFilePath); // cp本地
            File newSjoysLocalFile = getLocalResFile(sjoysRelFilePath); // sjoys本地

            // 创建新的目录
            FileUtil.createDir(newCpLocalFile.getParentFile());
            FileUtil.createDir(newSjoysLocalFile.getParentFile());

            // 复制文件到新的目录文件
            FileUtil.copyFile(cpLocalFile, newCpLocalFile);
            FileUtil.copyFile(sdkLocalFile, newSjoysLocalFile);

            // 删除旧文件
            FileUtil.delDir(cpLocalFile.getParentFile().getParentFile());
            FileUtil.delDir(sdkLocalFile.getParentFile().getParentFile());

            // 设置新的cp和sjoy包路径
            daoGameVerEntity.getVer().setGameVerUpCPPath(File.separator + cpRelFilePath);
            daoGameVerEntity.getVer().setGameVerUpSJoysPath(File.separator + sjoysRelFilePath);

            // 更新路径
            gameVersionDao.updatePath(daoGameVerEntity);

        }
    }


}
