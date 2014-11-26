package com.ism.user.domains

/***
 * 用户类
 */
class User {
    String name;
    String password;
    String cellphone;
    String email;
    boolean sex = true;
    String photo;
    String birth;
    String registerDate = new Date().format("yyyyMMddHHmmss");
    String lastLoginDate = new Date().format("yyyyMMddHHmmss");
    int state = 1;
    //字段的逻辑约束
    static constraints = {
        name(nullable:true,maxSize:255,unique:true)
        password(nullable:false,maxSize:255)
        cellphone(nullable:true,maxSize: 32)
        email(nullable:true,email:true)
        photo(nullable:true,maxSize:255)
        birth(nullable:true,maxSize:255)
    }
    //字段跟数据库的关联
    static mapping = {
        name(column:"user_name")
        passowrd(column:"user_password")
        cellphone(column:"user_cellphone")
        email(column:"user_column")
        sex(column:"user_sex")
        photo(column:"user_photo")
        birth(column:"user_birth")
        registerDate(column:"user_registerDate")
        lastLoginDate(column:"user_lastLoginDate")
        state(column:"user_state")
        
        table("ism_user")
    }
}
