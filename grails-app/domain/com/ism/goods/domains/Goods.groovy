package com.ism.goods.domains

import com.ism.market.domains.Market
import com.ism.order.domains.Order

/***
 * 商品类
 */
class Goods {
    Category category;
    Market market;
    String no;//商品编号
    String name;//商品名称
    String content;//商品简介
    String remark;//备注
    double originalPrice;//原价
    double currentPrice;//现价
    String  produceType;//商品型号
    String prickle;//计量单位
    int count;//入库数量
    double subtotal;//入库总金额
    static hasMany = [orders:Order]
    static constraints = {
        category(nullable: true)
        no(nullable: true)
        content(nullable: true,maxsize:10000 )
        name(nullable: true)
        remark(nullable: true)
        market(nullable: true)
        produceType(nullable: true)
        prickle(nullable: true)
    }
    static mapping = {
        content(type: "text")
    }

}
