package com.ism.admin.controllers

import com.google.gson.Gson
import com.google.gson.JsonObject
import com.ism.code.domains.CodeInfo
import com.ism.code.domains.CodeSort
import com.ism.tree.domains.TreeJson
import com.ism.user.domains.User
import grails.converters.JSON
import groovy.json.JsonBuilder
import net.sf.json.JSONArray
import net.sf.json.JSONObject
import net.sf.json.util.JSONUtils

class SystemMgrController {
    def userService;
    def codeService;
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
    /**代码管理**/
    /**
     * 代码管理页面初始化
     */
    def codeSortList(){}
    /**
     * 代码管理数据初始化加载
     */
    def codeSortDataList(){
        def page=params.page;
        def rows=params.rows;
        int intPage = Integer.parseInt((page == null || page == "0") ? "1":page);
        //每页显示条数
        int number = Integer.parseInt((rows == null || rows == "0") ? "10":rows);
        //每页的开始记录  第一页为1  第二页为number +1
        int start = (intPage-1)*number;
        List<CodeSort> list=null;
        int total=CodeSort.findAll().size();
        if(total>0){
            list=CodeSort.findAll();
        }
        return render(list as JSON);
    }
    /**
     * 新增代码分类页面初始化
     */
    def addCodeSortPage(){

    }
    /**
     * 新增代码分类
     */
    def addCodeSort(){
        def result=codeService.addCodeSort(params);
        return render(result as JSON);
    }
    /**
     * 编辑分类页面跳转初始化
     */
    def editCodeSortPage(){

    }
    /**
     * 编辑代码分类
     */
    def editCodeSort(){
        def result=codeService.editCodeSort(params);
        return render(result as JSON);
    }
    /**
     * 删除代码分类
     */
    def deleteCodeSort(){
        def result=codeService.deleteCodeSort(params);
        return render(result as JSON);
    }
    /**
     * 代码详细列表初始化
     */
    def codeInfoList(){}
    /**
     * 代码信息列表数据加载初始化
     */
    def codeInfoDataList(){
        def page=params.page;
        def rows=params.rows;
        int intPage = Integer.parseInt((page == null || page == "0") ? "1":page);
        //每页显示条数
        int number = Integer.parseInt((rows == null || rows == "0") ? "10":rows);
        //每页的开始记录  第一页为1  第二页为number +1
        int start = (intPage-1)*number;
        List<CodeInfo> list=null;
        int total=CodeInfo.findAll().size();
        if(total>0){
            list=CodeInfo.findAll();
        }
        Map<String, Object> jsonMap = new HashMap<String, Object>();//定义map
        jsonMap.put("total", total);//total键 存放总记录数，必须的
        jsonMap.put("rows", list);//rows键 存放每页记录 list
        return render(jsonMap as JSON);
    }
    /**
     * 新增代码信息页面初始化
     */
    def addCodeInfoPage(){}
    /**
     * 新增代码信息
     */
    def addCodeInfo(){
        def result=codeService.addCodeInfo(params);
        return render(result as JSON);
    }
    /**
     * 编辑代码信息页面初始化
     */
    def editCodeInfoPage(){}
    /**
     * 编辑代码信息
     */
    def editCodeInfo(){
        def result=codeService.editCodeInfo(params);
        return render(result as JSON);
    }
    /**
     * 删除代码信息
     */
    def deleteCodeInfo(){
        def result=codeService.deleteCodeInfo(params);
        return render(result as JSON);
    }
}
