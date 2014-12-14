package com.ism.vip.domains

/***
 * app注册会员
 * 为了简单起见，注册的用户名必须是手机号码
 * 只需要通过手机号码，和用户注册的密码就可以登录app
 */
class Vip {
    String mobile;//会员手机号码
    String password;//会员登录密码
    String registerDate = new Date().format("yyyy-MM-dd HH:mm:ss");//会员注册时间
    String lastLoginDate = new Date().format("yyyy-MM-dd HH:mm:ss");//会员最后登录时间
    String status;//会员状态
    //字段的逻辑约束
    static constraints = {
        mobile(nullable: true, maxSize: 11, unique: true)
    }
    //字段跟数据库的关联
    static mapping = {
        status(column: "vip_status")
        table("ism_vip")

    }
    static final Map stateCnName = [
            1: "正常",
            0: "禁用"
    ]
}
