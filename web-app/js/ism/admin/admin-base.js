/**
 * Created by ligson on 2014/12/5 0005.
 */
$(function(){
    var westPanel = $("#westPanel");
    var about = westPanel.attr("about");
    var liMenu = westPanel.find("li");
    liMenu.click(function(){
        var index = liMenu.index($(this));
        $.cookie("admin-menu-index-"+about,index);
    });

    var showIndex = $.cookie("admin-menu-index-"+about);
    var accordion = $(".easyui-accordion");
    if(showIndex){
        var panel = $(liMenu[showIndex]).parents(".panel")[0];
        var panelArray = accordion.find(".panel");
        var panelIndex = panelArray.index(panel);
        accordion.accordion("select",panelIndex);
        var navTitle = $(panel).find(".panel-title").html()+"&gt;&gt;"+$(liMenu[showIndex]).find("a").html();
        $("#mainDiv").panel("setTitle",navTitle)
    }
});