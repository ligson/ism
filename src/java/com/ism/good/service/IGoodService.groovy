package com.ism.good.service

import grails.converters.JSON

/**
 * Created by ZhengYunFei on 2014/11/27.
 */
interface IGoodService {
    public interface IOrderService {
        /**
         * 新增分类
         */
        def addGood(Map params);
        /**
         * 编辑分类
         * @return
         */

        def updateGood(Map params);

        /**
         * 删除分类
         */
        def removeGood(Map params);
    }
}