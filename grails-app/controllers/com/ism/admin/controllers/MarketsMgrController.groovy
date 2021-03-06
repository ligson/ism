package com.ism.admin.controllers

import com.ism.market.domains.Market
import com.ism.system.utils.SystemConfig
import com.ism.address.domains.City
import com.ism.user.domains.User
import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONArray

class MarketsMgrController {
    def marketService;
    def locationService;

    def index() {
    }

    def list() {
        JSONArray result;//返回的json
        def page = params.page;
        def rows = params.rows;
        int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
        //每页显示条数
        int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
        //每页的开始记录  第一页为1  第二页为number +1
        int start = (intPage-1)*number;
        List<Market> list=null;
        int total=Market.findAll().size();
        if(total>0){
            list=Market.findAll();
        }
        Map<String, Object> jsonMap = new HashMap<String, Object>();//定义map
        jsonMap.put("total", total);//total键 存放总记录数，必须的
        jsonMap.put("rows", list);//rows键 存放每页记录 list
        def res = [];
        list.each {
            def tmp = [:];
            tmp.id= it.id;
            tmp.name = it.name;
            tmp.accessTime = it.accessTime;
            tmp.state = it.state;
            tmp.city = it.city;
            res.add(tmp);
        }
        return render(res as JSON);
    }

    def marketList() {

    }
    /**
     * 新增超市
     */
    def addMarket() {
        def result=marketService.addMarket(params);
        return render(result as JSON);
    }
    /**
     * 编辑超市
     * @return
     */
    def updateMarket(){
        def result=marketService.updateMarket(params);
        return render(result as JSON);
    }
    /**
     * 删除超市
     */
    def removeMarket(){
        def result=marketService.removeMarket(params);
        return render(result as JSON);
    }
    def cityMgr() {

    }

    def addCity() {
        def result = locationService.addCity(params);
        return render(result as JSON);
    }


    def removeCity(){
        def result = locationService.removeCity(params);
        return render(result as JSON);
    }
    def cityList() {
        List<City> cities = [];
        if (params.id) {
            City father = City.findById(params.id);
            if (father) {
                cities = City.findAllByFatherCity(father);
            } else {
                cities = [];
            }

        } else {
            cities = City.findAllByFatherCityIsNull();
        }
        def result = [];
        cities.each {
            def tmp = [:];
            tmp.id = it.id;
            tmp.text = it.name;
            tmp.level = it.level;
            tmp.code = it.code;
            tmp.description = it.description;
            tmp.state = "closed";
            result.add(tmp);
        }
        return render(result as JSON)
    }

}
