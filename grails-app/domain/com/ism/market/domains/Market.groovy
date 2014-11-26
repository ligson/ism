package com.ism.market.domains

import com.ism.goods.domains.Goods

/***
 * 超市类
 */
class Market {

    static hasMany = [goodses:Goods]

    static constraints = {
    }
}
