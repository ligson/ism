package com.ism.good.service.impl

import com.ism.good.service.IGoodService
import com.ism.goods.domains.Goods
import com.ism.market.domains.Market
import com.ism.order.service.IOrderService
import grails.transaction.Transactional

@Transactional
class GoodService implements IGoodService {
    def marketService;
    /**
     * 新增商品
     * @param params
     * @return
     */
    @Override
    Map add(Map params) {
        def result = [:];
        String gdId=params.gdId;
        String gdname=params.gdname;
        String content=params.content;
        String remark=params.remark;
        String marketId=params.marketId;
        Goods goods=new Goods();
        goods.setGdId(gdId);
        goods.setGdname(gdname);
        goods.setContent(content);
        goods.setRemark(remark);
        Market market=Market.findById(marketId);
        goods.setMarket(market);
        if (goods.save(flush: true)) {
            result.success = true;
            result.msg = "保存成功";
        }
        return result;
    }
}
