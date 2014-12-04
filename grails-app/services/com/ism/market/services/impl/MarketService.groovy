package com.ism.market.services.impl

import com.ism.address.domains.City
import com.ism.market.domains.Market

/**
 * Created by ZhengYunFei on 2014/11/27.
 */
class MarketService implements IMarketSerices{

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
            result.market = market;
        } else {
            result.success = false;
            result.msg = "保存失败!";
        }
      return result;
    }
}