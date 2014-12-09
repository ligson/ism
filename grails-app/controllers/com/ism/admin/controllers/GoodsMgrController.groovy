package com.ism.admin.controllers

import com.ism.address.domains.City
import com.ism.goods.domains.Goods
import com.ism.goods.domains.Category
import com.ism.market.domains.Market
import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONArray

class GoodsMgrController {
    def goodService;
    def categoryService;
    def index() {
        return render(view: "index");
    }
    /**
     * 商品列表
     * @return
     */
    def list(){
        JSONArray result;//返回的json
        def page=params.page;
        def rows=params.rows;
        int intPage = Integer.parseInt((page == null || page == "0") ? "1":page);
        //每页显示条数
        int number = Integer.parseInt((rows == null || rows == "0") ? "10":rows);
        //每页的开始记录  第一页为1  第二页为number +1
        int start = (intPage-1)*number;
        List<Goods> list=null;
        int total=Goods.findAll().size();
        if(total>0){
            list=Goods.findAll();
        }
        Map<String, Object> jsonMap = new HashMap<String, Object>();//定义map
        jsonMap.put("total", total);//total键 存放总记录数，必须的
        jsonMap.put("rows", list);//rows键 存放每页记录 list
        def res = [];
        list.each {
            def tmp = [:];
            tmp.id= it.id;
            tmp.name = it.name;
            tmp.no = it.no;
            tmp.market = it.market;
            tmp.mid=it.market.id;
            tmp.remark = it.remark;
            res.add(tmp);
        }
        return render(res as JSON);
    }
    //获取超市列表json（为combox使用）
    def getMarketListJson() {
        JSONArray result;//返回的json
        List<Market> list=null;
        int total=Market.findAll().size();
        if(total>0){
            list=Market.findAll();
        }
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
    def goodList(){

    }
    def categoryList(){}
    /**
     * 新增超市
     */
    def addGood() {
        def result=goodService.addGood(params);
        return render(result as JSON);
    }
    /**
     * 编辑超市
     * @return
     */
    def updateGood(){
        def result=goodService.updateGood(params);
        return render(result as JSON);
    }
    /**
     * 删除超市
     */
    def removeGood(){
        def result=goodService.removeGood(params);
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
    def categoryAjaxList(){
            JSONArray result;//返回的json
            def page=params.page;
            def rows=params.rows;
            int intPage = Integer.parseInt((page == null || page == "0") ? "1":page);
            //每页显示条数
            int number = Integer.parseInt((rows == null || rows == "0") ? "10":rows);
            //每页的开始记录  第一页为1  第二页为number +1
            int start = (intPage-1)*number;
            List<Category> list=null;
            int total=Category.findAll().size();
            if(total>0){
                list=Category.findAll();
            }
            Map<String, Object> jsonMap = new HashMap<String, Object>();//定义map
            jsonMap.put("total", total);//total键 存放总记录数，必须的
            jsonMap.put("rows", list);//rows键 存放每页记录 list
            def res = [];
            list.each {
                def tmp = [:];
                tmp.id= it.id;
                tmp.name= it.name;
                tmp.no = it.no;
                tmp.displayNum = it.displayNum;
                tmp.market = it.market;
                tmp.mid=it.market.id;
                tmp.goodses = it.goodses;
                tmp.sortType = it.sortType;
                tmp.validFlag = it.validFlag;
                res.add(tmp);
            }
            return render(res as JSON);
        }
/**
 * 新增分类
 */
    def addCategory() {
        def result=categoryService.addCategory(params);
        return render(result as JSON);
    }
    /**
     * 编辑分类
     * @return
     */
    def updateCategory(){
        def result=categoryService.updateCategory(params);
        return render(result as JSON);
    }
    /**
     * 删除分类
     */
    def removeCategory(){
        def result=categoryService.removeCategory(params);
        return render(result as JSON);
    }
}
