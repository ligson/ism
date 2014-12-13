package com.ism.order.domains

import com.ism.goods.domains.Goods
import com.ism.vip.domains.Vip

/**
 * 订单
 */
class Order {
    //商品和订单是多对多关系
    static hasMany = [goodses:Goods]
    //订单依赖于商品
    static belongsTo = [Goods]
    Vip vip;//会员
    String orderNo;//订单编号
    double price;//订单总价
    int orderState;
    String orderCreateDate;//订单创建时间
    static constraints = {
        vip(nullable: true)
    }
    static mapping = {
        table("ism_order")
    }
    static final Map orderStateMap = [
            0 : "未支付",
            1 : "已支付"
    ]
}
