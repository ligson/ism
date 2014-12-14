package com.ism.vip.service.impl

import com.ism.string.utils.RegUtils
import com.ism.user.domains.User
import com.ism.user.service.IUserService
import com.ism.vip.domains.Vip
import com.ism.vip.service.IVipService
import grails.transaction.Transactional

@Transactional
class VipService implements IVipService {

    //对其他service进行注入，注意名字的写法
    def utilService;
    /**
     * 更新用户
     * @param params
     * @return
     */
    Map updateVip(Map params){
        def result=[:];
        def vip=Vip.findById(params.id);
        vip.status=params.status;
        if (vip.save(flush: true)) {
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
    Map removeVip(Map params){
        def result=[:];
        Vip vip=Vip.findById(params.id);
        if(vip){
            vip.delete(flush:true)
            result.success = true;
        }else{
            result.success=false;
        }
        return result;
    }
    /**
     * 密码重置
     */
    Map resPassword(Map params){
        def result=[:];
        Vip vip=Vip.findById(params.id);
        vip.password=params.password.encodeAsSHA1();
        if(vip.save(flush: true)){
            result.success=true;
        }else{
            result.success=false;
        }
        return result;

    }
}
