package com.starjoys.tool.packonline.utils;


import com.maya.base.utils.RarUtil;

import java.io.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class Apktools {

    /**
     * 获取sjoy游戏gid
     *
     * @param apkPath apk地址
     * @return gid
     */
    public static String getGameSdkGid(String apkPath) {

        System.out.println("获取Apk的gameID");
        Map<String, String> infoMap = getGameSdkConfigInfo(apkPath);
        if (infoMap == null) {
            return null;
        } else {
            return infoMap.get(APP_ID);
        }
    }

    public static String getGameSdkMid(String apkPath) {
        System.out.println("获取Apk的MID");
        Map<String, String> infoMap = getGameSdkConfigInfo(apkPath);
        if (infoMap == null) {
            return null;
        } else {
            return infoMap.get(MD_ID);
        }
    }

    public static final String MD_ID = "mid";
    public static final String APP_ID = "gid";

    private static Map<String, String> getGameSdkConfigInfo(String apkPath) {
        File apk = new File(apkPath);
        if (!apk.exists()) {
            System.out.println("apk不存在");
            return null;
        }

        String apkName = apk.getName();
        String apkPreName = apkName.substring(0, apkName.lastIndexOf("."));
        String apkParentPath = apk.getParentFile().getAbsolutePath();

        Map<String, String> infoMap = new HashMap<>();
        String gid = "";
        String mid = "";
        String gidParentPath = apkParentPath + File.separator + apkPreName + File.separator;

        File gidParentFile = new File(gidParentPath);
        if (!gidParentFile.exists()) {
            gidParentFile.mkdirs();
        }

        if (RarUtil.unRar(apkPath, "assets" + File.separator + "LeidongGame.ini", gidParentPath)) {

            String gidPath = gidParentPath + File.separator + "LeidongGame.ini";
            Properties sdkConfig = new Properties();
            FileInputStream fis = null;
            try {

                fis = new FileInputStream(gidPath);
                BufferedReader bf = new BufferedReader(new InputStreamReader(fis));
                sdkConfig.load(bf);

                gid = sdkConfig.getProperty(APP_ID);
                System.out.println("获取到的gid=" + gid);

                mid = sdkConfig.getProperty(MD_ID);
                System.out.println("获取到的mid=" + mid);

                infoMap.put(APP_ID, gid);
                infoMap.put(MD_ID, mid);

                if (gidParentFile.exists()) {
                    System.out.println("GID临时父目录" + gidParentFile.getAbsolutePath());
                    FileUtil.delDir(gidParentFile);
                }
            } catch (FileNotFoundException e) {
                e.printStackTrace();
                return infoMap;
            } catch (IOException e) {
                e.printStackTrace();
                return infoMap;
            } finally {
                // 关闭流
                if (fis != null) {
                    try {
                        fis.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return infoMap;

    }

    /** 版本名 **/
    public static final String APK_VERSION_NAME = "versionName";

    /** 版本号 **/
    public static final String APK_VERSION_CODE = "versionCode";

    /** 包名 **/
    public static final String APK_PACKAGE = "package";

    /** map中的应用名 **/
    public static final String APK_NAME = "appName";

    /** cmd中的应用名 **/
    public static final String APK_APPLICATION_LABEL = "application: label";

    /**
     * 获取apk信息
     *
     * @param apkPath apk路径
     * @return apk信息
     */
    public static Map<String, String> getApkInfo(String apkPath) {

        System.out.println("-----------------getApkInfo---------------------");

        Map<String, String> apkMap = new HashMap<>();

        String line;

        StringBuilder buffer = new StringBuilder();
        buffer.setLength(0);

        buffer.append("aapt d badging ").append(apkPath);

        try {
            Process process = Runtime.getRuntime().exec(buffer.toString());

            InputStreamReader isr = new InputStreamReader(process.getInputStream());
            BufferedReader br = new BufferedReader(isr);

            //格式: package: name='com.junhai.lzqy4.starjoys' versionCode='3' versionName='1.0.3'
            while ((line = br.readLine()) != null) {

                //如果有package，则可以获取版本信息
                if (line.contains(APK_PACKAGE)) {

                    // 包名
                    Pattern p = Pattern.compile("name='(.*?)'");
                    Matcher match = p.matcher(line);
                    if (match.find()) {
                        String packageName = match.group(1);
                        if (packageName != null && !"".equals(packageName)) {
                            //不为空，才添加
                            apkMap.put(APK_PACKAGE, packageName);
                        }
                        System.out.println("-->packageName:" + packageName + " <--");
                    }

                    // 版本号
                    p = Pattern.compile("versionCode='(.*?)'");
                    match = p.matcher(line);
                    if (match.find()) {
                        String versionCode = match.group(1);
                        if (versionCode != null && !"".equals(versionCode)) {
                            //不为空，才添加
                            apkMap.put(APK_VERSION_CODE, versionCode);
                        }
                        System.out.println("-->versionCode:" + versionCode + " <--");
                    }

                    // 版本名
                    p = Pattern.compile("versionName='(.*?)'");
                    match = p.matcher(line);
                    if (match.find()) {
                        String versionName = match.group(1);
                        if (versionName != null && !"".equals(versionName)) {
                            //不为空，才添加
                            apkMap.put(APK_VERSION_NAME, versionName);
                        }
                        System.out.println("-->versionName:" + versionName + " <--");
                    }

//                    break;
                } else if (line.contains(APK_APPLICATION_LABEL)) { // 获取app名称

                    Pattern p = Pattern.compile("label='(.*?)'");
                    Matcher match = p.matcher(line);
                    if (match.find()) {
                        String appName = match.group(1);
                        if (appName != null && !"".equals(appName)) {
                            // 把字符串都转成utf8
                            String encode = EncodingUtils.getEncode(appName);
                            String utf8Str = EncodingUtils.encodes[0];
                            if (encode != null) {
                                if (!encode.equals(utf8Str)) { // 不是utf8时会转成utf8
                                    appName = EncodingUtils.transcoding(appName, utf8Str);
                                }
                            }
                            //不为空，才添加
                            apkMap.put(APK_NAME, appName);
                        }
                        System.out.println("-->appName:" + appName + " <--");
                    }

                    break;
                }

            }
            isr.close();
            br.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        if (apkMap.size() == 0) {
            System.out.println("-->getApkInfo：失败<--");
        } else {
            System.out.println("-->getApkInfo=" + apkMap.size());
        }

        return apkMap;

    }


    /**
     * 获取应用名
     *
     * @param apkPath apk路径
     * @return 应用名
     */
    public static String getAppName(String apkPath) {
        // 读取游戏名
        Map<String, String> apkInfo = Apktools.getApkInfo(apkPath);
        if (apkInfo != null) {
            String gameName = apkInfo.get(Apktools.APK_NAME);
            if (gameName != null) {
                return gameName;
            }
        }
        return null;
    }


}
