package com.starjoys.tool.packonline.bean;

import com.starjoys.tool.packonline.common.config.ResPathConfig;

import java.io.File;
import java.util.List;

/**
 * 打包结果信息类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/18
 */

public class PackResultBean {

    /** 本地下载目录 **/
    private File localDownloadDirFile;

    /** 虚拟路径下载目录 **/
    private String virtualDownloadDir;

    /** 相对下载目录 **/
    private String relativeDownloadDir;

    /** 打包日志 **/
    private String packLogs;

    /** 单个文件下载路径列表 **/
    private List<KeyValueBean> filePathList;

    /** 压缩文件下载路径 **/
    private String zipFilePath;

    /** 单个apk下载路径 **/
    private String singleApkFilePath;

    public PackResultBean() {
    }

    /**
     * 传入相对的保存路径, 会自动生成并保存对应的虚拟路径以及本地下载目录
     *
     * @param relativeSavePath 相对保存路径
     */
    public PackResultBean(String relativeSavePath) {
        relativeDownloadDir = relativeSavePath;
        localDownloadDirFile = new File(
                ResPathConfig.buildSystemLocalPath(ResPathConfig.RESOURCE_FRONT) + File.separator
                        + relativeSavePath);
        virtualDownloadDir = ResPathConfig.VIRTUAL_PATH_RESOURCE_FRONT + File.separator + relativeSavePath;
    }

    public File getLocalDownloadDirFile() {
        return localDownloadDirFile;
    }

    public void setLocalDownloadDirFile(File localDownloadDirFile) {
        this.localDownloadDirFile = localDownloadDirFile;
    }

    public String getVirtualDownloadDir() {
        return virtualDownloadDir;
    }

    public void setVirtualDownloadDir(String virtualDownloadDir) {
        this.virtualDownloadDir = virtualDownloadDir;
    }

    public String getRelativeDownloadDir() {
        return relativeDownloadDir;
    }

    public void setRelativeDownloadDir(String relativeDownloadDir) {
        this.relativeDownloadDir = relativeDownloadDir;
    }

    public String getPackLogs() {
        return packLogs;
    }

    public void setPackLogs(String packLogs) {
        this.packLogs = packLogs;
    }

    public List<KeyValueBean> getFilePathList() {
        return filePathList;
    }

    public void setFilePathList(List<KeyValueBean> filePathList) {
        this.filePathList = filePathList;
    }

    public String getZipFilePath() {
        return zipFilePath;
    }

    public void setZipFilePath(String zipFilePath) {
        this.zipFilePath = zipFilePath;
    }

    public String getSingleApkFilePath() {
        return singleApkFilePath;
    }

    public void setSingleApkFilePath(String singleApkFilePath) {
        this.singleApkFilePath = singleApkFilePath;
    }

    @Override
    public String toString() {
        return "PackResultBean{" +
                "localDownloadDirFile=" + localDownloadDirFile +
                ", virtualDownloadDir='" + virtualDownloadDir + '\'' +
                ", relativeDownloadDir='" + relativeDownloadDir + '\'' +
                ", packLogs='" + packLogs + '\'' +
                ", filePathList=" + filePathList +
                ", zipFilePath='" + zipFilePath + '\'' +
                ", singleApkFilePath='" + singleApkFilePath + '\'' +
                '}';
    }
}
