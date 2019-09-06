package com.starjoys.tool.packonline.utils;

/**
 * 压缩文件工具
 *
 * @author Andy
 * @version 1.0
 * @create 2017/2/7
 */

public class ZipUtils {

    /**
     * 解压缩文件
     * @param apk
     * @param rarsource
     * @param direct
     * @return
     */
    public static boolean unRar(String apk, String rarsource, String direct) {
        String cmd;

        if (SystemUtils.isWindowsOS()) {
            cmd = "C:\\\\WinRAR\\\\WinRAR.exe" + " e " + apk
                    + " " + rarsource + " " + direct;
        } else {
            cmd = "unzip -C -j " + apk + " " + rarsource + " -d " + direct;
        }
        try {
            Process proc = Runtime.getRuntime().exec(cmd);
            System.out.println("");
            LogUtil.printStream(proc);
            if (proc.waitFor() != 0) {
                if (proc.exitValue() == 0) {
                    return false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    /**
     * 解压缩文件
     * @param zip
     * @param direct
     * @return
     */
    public static boolean unRar(String zip, String direct) {
        String cmd;

        if (SystemUtils.isWindowsOS()) {
            cmd = "C:\\\\WinRAR\\\\WinRAR.exe" + " x " + zip + " " + direct;
        } else {
            cmd = "unzip -o " + zip + " -d " + direct;
        }

        try {
            Process proc = Runtime.getRuntime().exec(cmd);
            LogUtil.printStream(proc);
            if (proc.waitFor() != 0) {
                if (proc.exitValue() == 0) {
                    return false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }


}
