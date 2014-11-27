package com.ism.good.service

/**
 * Created by Administrator on 2014/11/27.
 */
interface IGoodService {
    public interface IOrderService {
        /***
         * 新增
         */
        public Map add(Map params);

        /***
         * 修改
         */
        public Map update(Map params);
        /***
         * 删除
         */
        public Map delete(Map params);

        /***
         * 查询
         */
        public Map findAllList(Map params);
    }
}