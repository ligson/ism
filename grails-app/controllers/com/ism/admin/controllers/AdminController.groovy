package com.ism.admin.controllers

import com.ism.user.domains.User
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
                return redirect(controller:'goodsMgr',action:'index')
            }else{
                return render(view:'login',model:[result:result]);
            }
        }
    }
  def userList(){

  }
}
