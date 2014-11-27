package com.ism.goods.domains

import com.ism.market.domains.Market

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
    static constraints = {
    }
}
