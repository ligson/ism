package com.ism.user.service;

import com.ism.user.domains.User;

import java.util.Map;

/**
 * Created by ligson on 2014/11/27 0027.
 */
public interface IUserService {
    /***
     * 登录
     * @param params 包含name和password
     * @return 登录成功的用户号
     */
    public Map login(Map params);

    /***
     * 注册
     * @param params 包含cellphone password nickName
     * @return
     */
    public Map register(Map params);

}
