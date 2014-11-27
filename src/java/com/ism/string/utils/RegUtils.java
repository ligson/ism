package com.ism.string.utils;

import org.apache.commons.validator.routines.EmailValidator;

/**
 * Created by Administrator on 2014/11/27 0027.
 */
public class RegUtils {
    public static boolean isEmail(String email){
        EmailValidator validator = EmailValidator.getInstance();
        return  validator.isValid(email);
    }
    public static boolean isCellphone(String cellphone){
        cellphone = cellphone+"";
        return cellphone.matches(" ^(13[0-9]|15[0|3|6|7|8|9]|18[8|9])\\d{8}$");
    }
}
