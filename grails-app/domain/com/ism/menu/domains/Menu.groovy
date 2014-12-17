package com.ism.menu.domains

/**
 * Created by ZhengYunFei on 2014/12/17.
 */
class Menu {
    String menuId;//菜单ID
    String menuCode;//菜单编码（唯一编码）
    String menuTitle;//菜单标题
    String pMenuCode;//菜单父编码
    String menuUrl;//菜单url
    String sortNo;//排序序号
    String menuStatus;//菜单状态
    String menuIco;//菜单图标
    static mapping = {
        table('ism_menu')
    }
    static constraints = {

    }

}
