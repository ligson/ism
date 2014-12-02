<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/12/2 0002
  Time: 17:20
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<div class="admin-con" data-options="region:'north'" style="height:100px;overflow:hidden;border:0">
    <div class="container-fluid">
        <div class="row">
            <div class="ism_logo logo-width col-md-2">
                <h1 class="logo-img">后台管理系统</h1>
            </div>

            <div class="ism_nav col-md-8">
                <div class="ism_nav_item">
                <a class="btn btn-default btn-block" href="${createLink(controller:'goodsMgr',action:'marketList')}">商品管理</a></div>
                <div class="ism_nav_item">
                    <a class="btn btn-default btn-block" href="${createLink(controller:'userMgr',action:'index')}">用户管理</a></div>
                <div class="ism_nav_item">
                    <a class="btn btn-default btn-block" href="${createLink(controller:'systemMgr',action:'index')}">系统管理</a></div>
            </div>


            <div class="ism_user col-md-2">
                <div class="ism_user">
                    <img class="img-circle" src="${resource(dir: 'images', file: 'use-img.jpg')}"/>

                    <p>
                        <a href="">${session.user?.nickName}</a>
                        <span>2014-05-06</span>
                    </p>

                </div>
            </div>
        </div>
    </div>
</div>
<div data-options="region:'south',split:true" style="height:50px;">
    版权归XXXXX所有
</div>
