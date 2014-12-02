package com.ism.admin.controllers

class LayoutsController {
    /**
     * 登录成功-首页
     * @return
     */
    def index() {
        return render(view:'index');
    }
    /**
     * 主页-center-初始化欢迎页面
     * @return
     */
    def welcome(){
        return render(view: 'welcome');
    }
}
