package com.ism.market.services

import com.ism.market.domains.Market

/**
 * Created by ZhengYunFei on 2014/11/27.
 */
class MarketServices implements IMarketSerices{

    @Override
    Map addMarket(Map params) {
        def result = [:];
        def market=new Market();
        market.properties=params;
        if (market.save(flush: true) && (!market.hasErrors())) {
            result.success = true;
            result.market = market;
        } else {
            result.success = false;
            result.msg = "保存失败!";
        }
      return result;
    }
}