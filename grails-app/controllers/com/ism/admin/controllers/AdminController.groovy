package com.ism.admin.controllers

import com.ism.user.domains.User
import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject

class AdminController {

    def userService;
    def index() {
        return redirect(action:'login')
    }
    def login(){
        if(params.size()==2){
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

}
