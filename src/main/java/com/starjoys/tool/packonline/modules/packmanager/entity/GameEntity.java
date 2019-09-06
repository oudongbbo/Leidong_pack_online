package com.starjoys.tool.packonline.modules.packmanager.entity;

import com.starjoys.tool.packonline.common.base.BaseEntity;
import com.starjoys.tool.packonline.modules.system.entity.CompanyEntity;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

/**
 * 游戏对象类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/13
 */

public class GameEntity extends BaseEntity {

    /** 默认游戏类型 **/
    public static final int GAME_TYPE_DEFAULT = 0;

    /** 独代游戏类型 **/
    public static final int GAME_TYPE_DUDAI = 1;

    /** 联运游戏类型 **/
    public static final int GAME_TYPE_LIANYUN = 2;

    /** 默认游戏类型名 **/
    public static final String GAME_TYPE_NAME_DEFAULT = "default";

    /** 联运游戏类型名 **/
    public static final String GAME_TYPE_NAME_LIANYUN = "Lianyun";

    /** 独代游戏类型名 **/
    public static final String GAME_TYPE_NAME_DUDAI = "Dudai";

    /** 游戏自增id **/
    private long id;

    /** 公司 **/
    private CompanyEntity company;

    /** 游戏ID **/
    @NotBlank(message = "游戏id不能为空")
    private String gameId;

    /** 游戏名 **/
    @NotBlank(message = "游戏名不能为空")
    private String gameName;

    /** 游戏标识 **/
    @NotBlank(message = "游戏标识不能为空")
    private String gameShortName;

    /** 运营类型(0未知 1独代 2联运) **/
    @Range(message = "无法识别此运营类型", min = 1, max = 2)
    private int gameType;

    /** 游戏创建时间 **/
    private Timestamp gameCreateDate;

    /** 启用标识(0停用 1启用) **/
    private int status;

    /** 游戏CP文件 **/
    private MultipartFile gameCPFile;

    /** 游戏版本 **/
    private GameVersionEntity ver;

    /** 横竖屏 **/
    @NotBlank(message = "横竖屏不能为空")
    private String isLandScape;

    /** 是否定额 **/
    @NotBlank(message = "是否定额不能为空")
    private String isFinal;

    /** 替换R **/
    @NotBlank(message = "替换R文件不能为空")
    private String replaceR;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getGameId() {
        return gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public String getGameShortName() {
        return gameShortName;
    }

    public void setGameShortName(String gameShortName) {
        this.gameShortName = gameShortName;
    }

    public int getGameType() {
        return gameType;
    }

    public void setGameType(int gameType) {
        this.gameType = gameType;
    }

    public Timestamp getGameCreateDate() {
        return gameCreateDate;
    }

    public void setGameCreateDate(Timestamp gameCreateDate) {
        this.gameCreateDate = gameCreateDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public MultipartFile getGameCPFile() {
        return gameCPFile;
    }

    public void setGameCPFile(MultipartFile gameCPFile) {
        this.gameCPFile = gameCPFile;
    }

    public GameVersionEntity getVer() {
        return ver;
    }

    public void setVer(GameVersionEntity ver) {
        this.ver = ver;
    }

    public String getIsLandScape() {
        return isLandScape;
    }

    public void setIsLandScape(String isLandScape) {
        this.isLandScape = isLandScape;
    }

    public String getIsFinal() {
        return isFinal;
    }

    public void setIsFinal(String isFinal) {
        this.isFinal = isFinal;
    }

    public String getReplaceR() {
        return replaceR;
    }

    public void setReplaceR(String replaceR) {
        this.replaceR = replaceR;
    }

    public CompanyEntity getCompany() {
        return company;
    }

    public void setCompany(CompanyEntity company) {
        this.company = company;
    }


    @Override
    public String toString() {
        return "GameEntity{" +
                "id=" + id +
                ", company=" + company +
                ", gameId='" + gameId + '\'' +
                ", gameName='" + gameName + '\'' +
                ", gameShortName='" + gameShortName + '\'' +
                ", gameType=" + gameType +
                ", gameCreateDate=" + gameCreateDate +
                ", status=" + status +
                ", gameCPFile=" + gameCPFile +
                ", gameVersionInfo=" + ver +
                ", isLandScape='" + isLandScape + '\'' +
                ", isFinal='" + isFinal + '\'' +
                ", replaceR='" + replaceR + '\'' +
                "} " + super.toString();
    }
}
