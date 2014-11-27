package com.ism.goods.domains

import com.ism.market.domains.Market
import com.ism.order.domains.Order

/***
 * 商品类
 */
class Goods {
    Category category;
    Market market;
    String gdId;//商品ID
    String gdname;//商品名称
    String content;//商品简介
    String remark;//备注
    static hasMany = [orders:Order]
    static constraints = {
    }
}
