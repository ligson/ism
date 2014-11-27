package com.ism.admin.controllers

class GoodsMgrController {

    def index() {
        return redirect(action:'index')
    }
    def findAllList(){
        if(params.size()==2){
            return render(view:'login');
        }else{
            def result = goodService.findAllList(params);
            if(result.success){
                return redirect(controller:'goodsMgr',action:'index')
            }else{
                return render(view:'login',model:[result:result]);
            }
        }
    }
}
