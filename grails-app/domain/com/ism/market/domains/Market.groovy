package com.ism.market.domains

import com.ism.address.domains.City
import com.ism.goods.domains.Goods

/***
 * 超市类
 */
class Market {

    static hasMany = [goodses:Goods]
    City city;
    static constraints = {
    }
}
