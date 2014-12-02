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
    int type = TYPE_CITY;
    static constraints = {
        description(nullable: true)
        code(nullable: true)
        fatherCity(nullable: true)
    }
    static mapping = {
        type(column: "city_type")
    }

    //省
    static final int TYPE_PROVINCE = 1;
    //市
    static final int TYPE_CITY = 2;
    //市区
    static final int TYPE_CITY_AREA = 3;
    //县
    static final int TYPE_COUNTY = 4;

    //直辖市
    static final int TYPE_PROVINCE_CITY = 5;

    static final Map typeCnName = [
            TYPE_PROVINCE : "省",
            TYPE_CITY     : "市",
            TYPE_CITY_AREA: "市辖区",
            TYPE_COUNTY   : "县",
            TYPE_PROVINCE_CITY :"直辖市"
    ]
}
