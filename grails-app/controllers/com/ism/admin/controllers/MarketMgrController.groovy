package com.ism.admin.controllers

import com.ism.user.domains.User
import org.codehaus.groovy.grails.web.json.JSONArray

class MarketMgrController {

    def index() {
    }
    def list(){
        JSONArray result;//返回的json
        def page=params.page;
        def rows=params.rows;
        int intPage = Integer.parseInt((page == null || page == "0") ? "1":page);
        //每页显示条数
        int number = Integer.parseInt((rows == null || rows == "0") ? "10":rows);
        //每页的开始记录  第一页为1  第二页为number +1
        int start = (intPage-1)*number;
        List<User> list=null;
        int total=User.findAll().size();
        if(total>0){
            list=User.findAll();
        }
        Map<String, Object> jsonMap = new HashMap<String, Object>();//定义map
        jsonMap.put("total", total);//total键 存放总记录数，必须的
        jsonMap.put("rows", list);//rows键 存放每页记录 list
         render(contentType: "text/json"){return jsonMap};
    }

    def marketList(){

    }

    def cityMgr(){

    }
}
