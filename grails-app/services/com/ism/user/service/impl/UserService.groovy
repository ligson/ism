package com.ism.user.service.impl

import com.ism.goods.domains.Category
import com.ism.goods.domains.Goods
import com.ism.market.domains.Market
import com.ism.string.utils.RegUtils
import com.ism.user.domains.User
import com.ism.user.service.IUserService
import grails.transaction.Transactional

@Transactional
class UserService implements IUserService {

    //对其他service进行注入，注意名字的写法
    def utilService;

    @Override
    Map login(Map params) {
        //相当于java的map定义
        def result = [:];
        if (params.name && params.password) {
            User user = null;
            if (RegUtils.isEmail(params.name)) {
                //查询语句动态生成
                user = User.findByEmailAndPassword(params.name, (params.password + "").encodeAsSHA1())
            } else {
                user = User.findByCellphoneAndPassword(params.name, (params.password + "").encodeAsSHA1())
            }
            if (user) {
                result.success = true;
                result.user = user;
                utilService.getSession().setAttribute("user", user);
            } else {
                result.success = false;
                result.msg = "用户账户不正确或者密码错误!";
            }
        } else {
            result.success = false;
            result.msg = "密码或账户不能为空";
        }
        return result;
    }

    @Override
    Map register(Map params) {
        def result = [:];
        String cellphone = params.cellphone;
        String password = params.password;
        String nickName = params.nickName;
        if (cellphone && password && nickName) {
            User user = new User();
            user.cellphone = cellphone;
            //对密码进行加密
            user.password = password.encodeAsSHA1();
            user.nickName = nickName;
            //验证是否保存成功
            if (user.save(flush: true) && (!user.hasErrors())) {
                result.success = true;
                result.user = user;
            } else {
                result.success = false;
                result.msg = "手机号不唯一!";
            }
        } else {
            result.success = false;
            result.msg = "手机号、昵称、密码不允许为空!";
        }

        return result
    }

    public void initSuper(){
        User superAdmin = User.findByRole(0)
        if(!superAdmin){
            superAdmin = new User();
            log.info("超级管理员不存在！初始化超级管理员!")
            superAdmin.cellphone = "13717625140";
            superAdmin.email = "admin@admin.com";
            superAdmin.nickName = "超级管理员";
            superAdmin.password = "password".encodeAsSHA1();
            superAdmin.state = 1;
            superAdmin.role = 0;
            superAdmin.save(flush:true);
            log.info("超级管理员初始化成功！手机：1383838521，email：admin@admin.com,密码:password")
        }
    }
    /**
     * 新增用户
     * @param params
     * @return
     */
    Map addUser(Map params) {
        def result = [:];
        def user=new User(params);
        user.setLastLoginDate( new Date().format("yyyy-MM-dd HH:mm:ss"));
        user.setRegisterDate( new Date().format("yyyy-MM-dd HH:mm:ss"));
        if (user.save(flush: true)) {
            result.success = true;
        }
        return result;
    }
    /**
     * 更新用户
     * @param params
     * @return
     */
    Map updateUser(Map params){
        def result=[:];
        def user=User.findById(params.id);
        user.nickName=params.nickName;
        user.cellphone=params.cellphone;
        user.createName=params.createName;
        user.state=params.state;
        user.role=params.role;
        user.birth=params.birth;
        user.email=params.email;
        user.photo=params.photo;
        user.sex=params.sex;
        user.setLastLoginDate( new Date().format("yyyy-MM-dd HH:mm:ss"));
        user.setRegisterDate( new Date().format("yyyy-MM-dd HH:mm:ss"));
        if (user.save(flush: true)) {
            result.success = true;
        } else {
            result.success = false;
        }
        return result;
    }
    /**
     * 删除用户
     * @param params
     * @return
     */
    Map removeUser(Map params){
        def result=[:];
        User user=User.findById(params.id);
        if(user){
            user.delete(flush:true)
            result.success = true;
        }else{
            result.success=false;
        }
        return result;
    }
}
