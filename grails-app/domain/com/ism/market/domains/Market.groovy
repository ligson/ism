package com.ism.market.domains

import com.ism.address.domains.City
import com.ism.goods.domains.Category
import com.ism.goods.domains.Goods

/***
 * 超市类
 */
class Market {

   // static hasMany = [goodses:Goods]
    City city;//所在地区
    String name;//名称
    String accessTime;//接入时间
    String state;//接入状态 0未接入 1 已接入
    static constraints = {
        accessTime(nullable:true)
    }
    static final Map stateCnName = [
            0 : "未接入",
            1 : "已接入"
    ]
}
