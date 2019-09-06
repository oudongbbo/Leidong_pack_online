package com.starjoys.tool.packonline.utils;

import com.starjoys.tool.packonline.bean.ValidationResultBean;
import org.apache.commons.collections.CollectionUtils;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.groups.Default;
import java.util.*;

/**
 * 校验工具类
 * @author wdmcygah
 *
 */
public class ValidationUtils {

    private static Validator validator =  Validation.buildDefaultValidatorFactory().getValidator();

    /**
     * 校验对象
     *
     * @param obj
     * @param <T>
     * @return
     */
    public static <T> ValidationResultBean validateEntity(T obj) {
        ValidationResultBean result = new ValidationResultBean();
        Set<ConstraintViolation<T>> set = validator.validate(obj, Default.class);
        if(CollectionUtils.isNotEmpty(set) ){
            result.setHasErrors(true);
            Map<String,String> errorMsg = new HashMap<>();
            for(ConstraintViolation<T> cv : set){
                errorMsg.put(cv.getPropertyPath().toString(), cv.getMessage());
            }
            result.setErrorMsg(errorMsg);
        }
        return result;
    }

    /**
     * 校验属性
     *
     * @param obj
     * @param propertyName
     * @param <T>
     * @return
     */
    public static <T> ValidationResultBean validateProperty(T obj, String propertyName) {
        ValidationResultBean result = new ValidationResultBean();
        Set<ConstraintViolation<T>> set = validator.validateProperty(obj, propertyName, Default.class);
        if(CollectionUtils.isNotEmpty(set) ){
            result.setHasErrors(true);
            Map<String,String> errorMsg = new HashMap<>();
            for(ConstraintViolation<T> cv : set){
                errorMsg.put(propertyName, cv.getMessage());
            }
            result.setErrorMsg(errorMsg);
        }
        return result;
    }

    /**
     * 验证多选属性
     *
     * @param obj
     * @param propertyNameArray
     * @param <T>
     * @return
     */
    public static <T> ValidationResultBean validateProperty(T obj, String[] propertyNameArray) {
        ValidationResultBean result = new ValidationResultBean();
        for (String propertyName : propertyNameArray) {
            result = validateProperty(obj, propertyName);
            if (result.isHasErrors()) {
                return result;
            }
        }
        return result;
    }

    /**
     * 验证多选属性
     *
     * @param obj
     * @param propertyNameList
     * @param <T>
     * @return
     */
    public static <T> ValidationResultBean validateProperty(T obj, List<String> propertyNameList) {
        ValidationResultBean result = new ValidationResultBean();
        for (String propertyName : propertyNameList) {
            result = validateProperty(obj, propertyName);
            if (result.isHasErrors()) {
                return result;
            }
        }
        return result;
    }


    /**
     * 获取第一个错误信息
     * @param validationResultBean
     * @return
     */
    public static String getFirstErrorMessage(ValidationResultBean validationResultBean) {
        Iterator<String> iterator = validationResultBean.getErrorMsg().keySet().iterator();
        String message = null;
        if (iterator.hasNext()) {
            message = validationResultBean.getErrorMsg().get(iterator.next());
        }
        return message;
    }


}
