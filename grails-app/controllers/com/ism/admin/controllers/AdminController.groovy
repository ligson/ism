package com.ism.admin.controllers

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
