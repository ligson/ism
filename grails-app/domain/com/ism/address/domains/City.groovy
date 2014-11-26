package com.ism.address.domains
/***
 * 地区表
 */
class City {
    String name;
    //代码 国家是国号86 省级的是省级的
    String code;
    int level = 1;
    String description;
    City fatherCity;
    static constraints = {
        description(nullable:true)
        code(nullable:true)
        fatherCity(nullable:true)
    }
}
