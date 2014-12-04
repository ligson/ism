package ism

class AdminFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
                if((controllerName+"").equals("admin")||(controllerName+"").endsWith("Mgr")){
                    if(!"login".equals(actionName)){
                        if(!session.user){
                            redirect(controller:"admin",action:"login")
                            return false;
                        }
                    }
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
