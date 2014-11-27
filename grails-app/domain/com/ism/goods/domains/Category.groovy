package com.ism.goods.domains

import com.ism.market.domains.Market

/***
 * 商品分类类
 */
class Category {
    //一对多映射
    static hasMany = [goodses:Goods]
    Market market;
    static constraints = {
    }
}
