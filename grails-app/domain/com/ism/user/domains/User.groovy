package com.ism.user.domains

/***
 * 用户类
 */
class User {
    String nickName;
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
        nickName(nullable:true)
        password(nullable: false, maxSize: 255)
        cellphone(nullable: true, maxSize: 32,unique:true)
        email(nullable: true, email: true,unique:true)
        photo(nullable: true, maxSize: 255)
        birth(nullable: true, maxSize: 255)
    }
    //字段跟数据库的关联
    static mapping = {
        state(column: "user_state")
        table("ism_user")
    }
}
