package com.ism.market.services.impl

/**
 * Created by Administrator on 2014/11/27.
 */
interface IMarketSerice {
    public Map addMarket(Map params);
    public Map updateMarket(Map params);
    /**
     * 删除超市
     * @param params
     * @return
     */
    Map removeMarket(Map params);
}