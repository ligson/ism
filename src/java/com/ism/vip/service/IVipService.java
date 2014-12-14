package com.ism.vip.service;

import java.util.Map;

public interface IVipService {
    /**
     * 更新会员
     *
     * @param params
     * @return
     */
    Map updateVip(Map params);

    /**
     * 删除会员
     *
     * @param params
     * @return
     */
    Map removeVip(Map params);

    /**
     * 密码重置
     */
    Map resPassword(Map params);
}
