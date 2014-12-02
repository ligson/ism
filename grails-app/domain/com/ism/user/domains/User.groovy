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
    String createName;
    String lastLoginDate = new Date().format("yyyyMMddHHmmss");
    int state = 1;
    int role = 1;
    //字段的逻辑约束
    static constraints = {
        nickName(nullable: true)
        password(nullable: false, maxSize: 255)
        cellphone(nullable: true, maxSize: 32, unique: true)
        email(nullable: true, email: true, unique: true)
        photo(nullable: true, maxSize: 255)
        birth(nullable: true, maxSize: 255)
        state(inList: stateCnName.keySet().toList())
        role(inList: roleCnName.keySet().toList())
    }
    //字段跟数据库的关联
    static mapping = {
        state(column: "user_state")
        role(column: "user_role")
        table("ism_user")

    }
    static final Map stateCnName = [
            1: "正常",
            0: "禁用"
    ]
    static final Map roleCnName = [
            0: "超级管理员",
            1:"管理员",
            2: "普通用户"
    ]
}
