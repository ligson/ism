package com.ism.good.service

import grails.converters.JSON

/**
 * Created by Administrator on 2014/11/27.
 */
interface IGoodService {
    public interface IOrderService {
        /**
         * 新增超市
         */
        def addGood(Map params);
        /**
         * 编辑超市
         * @return
         */

        def updateGood(Map params);

        /**
         * 删除超市
         */
        def removeGood(Map params);
    }
}