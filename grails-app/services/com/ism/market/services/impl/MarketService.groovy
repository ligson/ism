package com.ism.market.services.impl

import com.ism.address.domains.City
import com.ism.market.domains.Market

/**
 * Created by ZhengYunFei on 2014/11/27.
 */
class MarketService implements IMarketSerice{
/**
 * 新增超市
 * @param params
 * @return
 */
    @Override
    Map addMarket(Map params) {
        def result = [:];
        def market=new Market(params);
        String cid=params.cid;
        def city=City.findById(cid);
        market.setCity(city);
        //market.properties=params;
        if (market.save(flush: true)) {
            result.success = true;
        } else {
            result.success = false;
            result.msg = "保存失败!";
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
        def market=Market.findById(params.id);
        market.name=params.name;
        market.state=params.state;
        market.accessTime=params.accessTime;
        City city=City.findById(params.cid);
        market.city=city;
        if (market.save(flush: true)) {
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
        Market market=Market.findById(params.id);
        if(market){
             market.delete(flush:true)
             result.success = true;
        }else{
            result.success=false;
        }
        return result;
    }
}