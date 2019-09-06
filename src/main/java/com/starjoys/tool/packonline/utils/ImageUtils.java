package com.starjoys.tool.packonline.utils;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

/**
 * 图片工具
 *
 * @author Andy
 * @version 1.0
 * @create 2017/3/14
 */

public class ImageUtils {


    /**
     * 是否符合宽高
     *
     * @param imageFile 图片文件
     * @param width     限制宽度
     * @param height    限制高度
     * @return 是否符合
     */
    public static boolean isFitDimension(File imageFile, int width, int height) {
        boolean result = false;
        try {
            BufferedImage bufferedImage = ImageIO.read(imageFile);
            if (width != -1) {
                result = (bufferedImage.getWidth() == width);
            }
            if (height != -1) {
                result = (bufferedImage.getHeight() == height);
            }
        } catch (IOException e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    /**
     * 是否符合宽高
     *
     * @param imageFile 图片文件
     * @param size      宽高相同
     * @return
     */
    public static boolean isFitDimension(File imageFile, int size) {
        return isFitDimension(imageFile, size, size);
    }

    /**
     * 是否符合宽度
     *
     * @param imageFile 图片文件
     * @param width     限制宽度
     * @return
     */
    public static boolean isFitWidth(File imageFile, int width) {
        return isFitDimension(imageFile, width, -1);
    }

    /**
     * 是否符合高度
     *
     * @param imageFile 图片文件
     * @param height    限制高度
     * @return
     */
    public static boolean isFitHeight(File imageFile, int height) {
        return isFitDimension(imageFile, -1, height);
    }

    /**
     * 读取图片宽度
     *
     * @param imageFile 图片文件
     * @return 宽度
     */
    public static int readImageWidth(File imageFile) {
        try {
            BufferedImage bufferedImage = ImageIO.read(imageFile);
            return bufferedImage.getWidth();
        } catch (IOException e) {
            e.printStackTrace();
            return -1;
        }
    }

    /**
     * 读取图片高度
     *
     * @param imageFile 图片文件
     * @return 高度
     */
    public static int readImageHeight(File imageFile) {
        try {
            BufferedImage bufferedImage = ImageIO.read(imageFile);
            return bufferedImage.getHeight();
        } catch (IOException e) {
            e.printStackTrace();
            return -1;
        }
    }

}
