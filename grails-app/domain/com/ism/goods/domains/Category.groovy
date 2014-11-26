package com.ism.goods.domains

/***
 * 商品分类类
 */
class Category {
    //一对多映射
    static hasMany = [goodses:Goods]
    static constraints = {
    }
}
