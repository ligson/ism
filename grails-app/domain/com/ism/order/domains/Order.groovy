package com.ism.order.domains

import com.ism.goods.domains.Goods

/**
 * 订单
 */
class Order {
    static hasMany = [goodses:Goods]
    String orderNo;//订单编号
    double price;//订单总价
    static constraints = {
    }
}
