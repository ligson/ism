package com.ism.goods.domains

import com.ism.market.domains.Market

/***
 * 商品分类类
 */
class Category {
    //一对多映射
    static hasMany = [goodses:Goods]
    Market market;
    String pid="999999";//父类编码
    String name;//分类名称
    String no;//分类编号
    String sortType;//分类类型
    String validFlag;//是否有效
    String displayNum;//显示序号
    static constraints = {
        market(nullable: true)
        name(nullable: true)
        no(nullable: true)
        displayNum(nullable: true)
    }
    static mapping = {}
    static final Map validFlagMap = [
            0 : "禁用",
            1 : "启用"
    ]
}
