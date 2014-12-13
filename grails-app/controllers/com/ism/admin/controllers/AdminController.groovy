package com.ism.admin.controllers

import com.ism.address.domains.City
import com.ism.goods.domains.Goods
import com.ism.market.domains.Market
import com.ism.user.domains.User
import com.ism.order.domains.Order
import com.ism.vip.domains.Vip
import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject
class AdminController {

    def userService;
    def index() {
        return render(view:'login')
    }
    def login(){
        if(request.method.equalsIgnoreCase("get")){
            return render(view:'login');
        }else{
            def result = userService.login(params);
            if(result.success){
                return redirect(controller:'marketsMgr',action:'marketList')
            }else{
                return render(view:'login',model:[result:result]);
            }
        }
    }
  def userList(){

  }
    /**
     * 用户列表
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
        List<User> list=null;
        int total=User.findAll().size();
        if(total>0){
            list=User.findAll();
        }
        Map<String, Object> jsonMap = new HashMap<String, Object>();//定义map
        jsonMap.put("total", total);//total键 存放总记录数，必须的
        jsonMap.put("rows", list);//rows键 存放每页记录 list
//        def res = [];
//        list.each {
//            def tmp = [:];
//            tmp.id= it.id;
//            tmp.name = it.nickName;
//            tmp.originalPrice=it.birth;
//            tmp.currentPrice=it.cellphone;
//            tmp.no = it.createName;
//            tmp.market = it.state;
//            tmp.mid=it.role;
//            tmp.city=it.registerDate;
//            tmp.category=it.;
//            tmp.remark = it.remark;
//            res.add(tmp);
//        }
        return render(jsonMap as JSON);
    }
    /**
     * 新增用户
     */
    def addUser() {
        def result=userService.addUser(params);
        return render(result as JSON);
    }
    /**
     * 编辑用户
     * @return
     */
    def updateUser(){
        def result=userService.updateUser(params);
        return render(result as JSON);
    }
    /**
     * 删除用户
     */
    def removeUser(){
        def result=userService.removeUser(params);
        return render(result as JSON);
    }
    //订单管理(页面跳转)
    def orderList(){}
    //点单管理页面数据加载列表
    def findOrderList(){
        JSONArray result;//返回的json
        def page=params.page;
        def rows=params.rows;
        int intPage = Integer.parseInt((page == null || page == "0") ? "1":page);
        //每页显示条数
        int number = Integer.parseInt((rows == null || rows == "0") ? "10":rows);
        //每页的开始记录  第一页为1  第二页为number +1
        int start = (intPage-1)*number;
        List<Order> list=null;
        int total=Order.findAll().size();
        if(total>0){
            list=Order.findAll();
        }
        Map<String, Object> jsonMap = new HashMap<String, Object>();//定义map
        jsonMap.put("total", total);//total键 存放总记录数，必须的
        jsonMap.put("rows", list);//rows键 存放每页记录 list
        def res = [];
        list.each {
        def tmp = [:];
        tmp.orderNo= it.orderNo;
        tmp.price = it.price;
        tmp.orderState=it.orderState;
        tmp.orderCreateDate=it.orderCreateDate;
        tmp.vip=it.vip;
        res.add(tmp);
        }
        return render(res as JSON);
    }
}
