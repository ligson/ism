package com.ism.order.domains

import com.ism.goods.domains.Goods

/**
 * 订单
 */
class Order {
    //商品和订单是多对多关系
    static hasMany = [goodses:Goods]
    //订单依赖于商品
    static belongsTo = [Goods]
    Goods goods;
    String orderNo;//订单编号
    double price;//订单总价
    int orderState;
    static constraints = {
    }
    static mapping = {
        table("ism_order")
    }
    static final Map orderStateMap = [
            0 : "未支付",
            1 : "已支付"
    ]
}
