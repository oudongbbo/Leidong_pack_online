package com.starjoys.tool.packonline.filter;

import com.starjoys.tool.packonline.utils.EncryptUtils;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

/**
 * leidong_pack_online
 *
 * @author Administrator
 * @version 1.0
 * @create 2017/8/4
 */

public class EncryptPropertyPlaceholderConfigurer extends PropertyPlaceholderConfigurer {

    private String[] encryptPropNames = {"username", "password"};

    @Override
    protected String convertProperty(String propertyName, String propertyValue) {
//        if (isEncryptProp(propertyName)) {
//            String decryptValue = EncryptUtils.decode(propertyValue);
////            System.out.println(propertyName + "解密内容:" + decryptValue);
//            return decryptValue;
//        } else {
//            return propertyValue;
//        }

        return propertyValue;
    }

    /**
     * 判断是否是加密的属性
     *
     * @param propertyName
     * @return
     */
    private boolean isEncryptProp(String propertyName) {
        for (String encryptPropertyName : encryptPropNames) {
            if (encryptPropertyName.equals(propertyName))
                return true;
        }
        return false;
    }

}
