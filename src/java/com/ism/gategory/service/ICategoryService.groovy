package com.ism.gategory.service
/**
 * Created by ZhengYunFei on 2014/11/27.
 */
interface ICategoryService {
    public interface IOrderService {
        /**
         * 新增分类
         */
        def addCategory(Map params);
        /**
         * 编辑分类
         */

        def updateCategory(Map params);

        /**
         * 删除分类
         */
        def removeCategory(Map params);
    }
}