package com.ism.admin.controllers

import com.ism.user.domains.User
import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONArray

class SystemMgrController {
    def userService;
    def index() {}
    /**
     * 用户列表页面跳转
     */
    def userList(){

    }
    /**
     * 用户列表数据初始化
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
}
