package com.ism.good.service.impl

import com.ism.address.domains.City
import com.ism.good.service.IGoodService
import com.ism.goods.domains.Goods
import com.ism.market.domains.Market
import com.ism.order.service.IOrderService
import grails.transaction.Transactional

@Transactional
class GoodService implements IGoodService {
    /**
     * 新增商品
     * @param params
     * @return
     */
    Map addGood(Map params) {
        def result = [:];
        def good=new Goods(params);
        good.content=params.editorValue;
        //def market=Market.findById(params.mid);
        //goods.setMarket(market);
        if (good.save(flush: true)) {
            result.success = true;
            result.msg = "保存成功";
        }
        return result;
    }
    /**
     * 更新超市
     * @param params
     * @return
     */
    Map updateMarket(Map params){
        def result=[:];
        def good=Goods.findById(params.id);
        good.gdname=params.gdname;
        good.remark=params.remark;
        good.content=params.content;
        //Market market=Market.findById(params.mid);
       // good.market=market;
        if (good.save(flush: true)) {
            result.success = true;
        } else {
            result.success = false;
            result.msg = "保存失败!";
        }
        return result;
    }
    /**
     * 删除超市
     * @param params
     * @return
     */
    Map removeMarket(Map params){
        def result=[:];
        Goods goods=Goods.findById(params.id);
        if(goods){
            goods.delete(flush:true)
            result.success = true;
        }else{
            result.success=false;
        }
        return result;
    }
}
