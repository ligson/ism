package com.ism.user.domains

/***
 * 用户类
 */
class User {
    String name;
    String password;
    String cellphone;
    String email;
    boolean sex;
    String photo;
    String birth;
    String registerDate = new Date().format("yyyyMMddHHmmss");
    String lastLoginDate = new Date().format("yyyyMMddHHmmss");
    static constraints = {
    }
}
