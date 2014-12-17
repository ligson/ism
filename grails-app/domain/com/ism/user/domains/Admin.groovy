package com.ism.user.domains

/***
 * 后台用户管理账号
 */
class Admin {
    String account;
    String xingming;
    String sex;
    String birth;
    String sfz;
    String tel;
    String dizhi;
    String email;
    String qq ;
    String credate;
    String password;
    String nickName;
    //字段的逻辑约束
    static constraints = {
    }
    //字段跟数据库的关联
    static mapping = {
        table("ism_admin")
    }
    static final Map stateCnName = [
            1: "正常",
            0: "禁用"
    ]
    static final Map sexCnName = [
            1: "男",
            0:"女",
    ]
}
