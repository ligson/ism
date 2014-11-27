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
    String orderNo;//订单编号
    double price;//订单总价
    static constraints = {
    }
}
