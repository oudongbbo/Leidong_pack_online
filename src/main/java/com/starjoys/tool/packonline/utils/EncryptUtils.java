package com.starjoys.tool.packonline.utils;

import org.springframework.util.Base64Utils;

import java.math.BigInteger;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 加密解密工具类
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/20
 */

public class EncryptUtils {

    /**
     * 对字符串md5加密
     *
     * @param oriStr 加密前的字符串
     * @return md5加密后的字符串
     */
    public static String getMD5(String oriStr) throws NoSuchAlgorithmException {
        // 生成一个MD5加密计算摘要
        MessageDigest md = MessageDigest.getInstance("MD5");
        // 计算md5函数
        md.update(oriStr.getBytes());
        // digest()最后确定返回md5 hash值，返回值为8为字符串。因为md5 hash值是16位的hex值，实际上就是8位的字符
        // BigInteger函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式的hash值
        return new BigInteger(1, md.digest()).toString(16);
    }

    private static final String key0 = "FECOI()*&<MNCXZPKL";
    private static final Charset charset = Charset.forName("UTF-8");
    private static byte[] keyBytes = key0.getBytes(charset);

    public static String encode(String enc) {
        byte[] b = enc.getBytes(charset);
        for (int i = 0, size = b.length; i < size; i++) {
            for (byte keyBytes0 : keyBytes) {
                b[i] = (byte) (b[i] ^ keyBytes0);
            }
        }
        b = Base64Utils.encode(b);
        return new String(b);
    }

    public static String decode(String dec) {
        byte[] e = dec.getBytes(charset);
        e = Base64Utils.decode(e);
        byte[] dee = e;
        for (int i = 0, size = e.length; i < size; i++) {
            for (byte keyBytes0 : keyBytes) {
                e[i] = (byte) (dee[i] ^ keyBytes0);
            }
        }
        return new String(e);
    }


}

