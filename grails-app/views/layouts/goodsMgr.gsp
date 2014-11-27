<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/11/27 0027
  Time: 13:01
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:layoutTitle/>-商品管理</title>
    <r:require modules="jquery,bootstrap,jquery-easyui"/>
    <r:layoutResources/>
    <r:layoutResources/>
    <link type="text/css" rel="stylesheet" href="${resource(dir: 'css/admin', file: 'adminBase.css')}"/>
    <g:layoutHead/>
</head>

<body class="easyui-layout">
<div class="admin-con" data-options="region:'north'" style="height:100px;overflow:hidden;border:0">
    <div class="container-fluid">
        <div class="row">
            <div class="ism_logo logo-width col-md-2">
                <h1 class="logo-img">后台管理系统</h1>
            </div>

            <div class="ism_nav col-md-8">
                <div class="ism_nav_item">
                    <a class="btn btn-default btn-block" href="#">商品管理</a></div>

                <div class="ism_nav_item">
                    <a class="btn btn-default btn-block" href="#">用户管理</a></div>

                <div class="ism_nav_item">
                    <a class="btn btn-default btn-block" href="#">系统管理</a></div>

                <div class="ism_nav_item">
                    <a class="btn btn-default btn-block" href="#">商品管理</a></div>

                <div class="ism_nav_item">
                    <a class="btn btn-default btn-block" href="#">商品管理</a></div>
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

<div data-options="region:'east',split:true" title="East" style="width:150px;"></div>

<div data-options="region:'west',split:false" title="商品管理" style="width:150px;">
    <div class="easyui-accordion" style="width:148px;height:300px;">
        <div title="商品管理" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
            <ul class="easyui-tree">
                <li>
                    <span>商品分类</span>
                    <ul>
                        <li data-options="state:'closed'">
                            <span>衣服</span>
                            <ul>
                                <li>
                                    <span>Friend</span>
                                </li>
                                <li>
                                    <span>Wife</span>
                                </li>
                                <li>
                                    <span>Company</span>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <span>食品</span>
                            <ul>
                                <li>Intel</li>
                                <li>Java</li>
                                <li>Microsoft Office</li>
                                <li>Games</li>
                            </ul>
                        </li>
                        <li>家电</li>
                        <li>小商品</li>
                        <li>welcome.html</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div title="超市管理" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;"></div>
        <div title="About" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;"></div>
        <div title="About" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;"></div>
    </div>

</div>

<div data-options="region:'center',title:'Main Title',iconCls:'icon-ok'">
    <g:layoutBody/>
</div>
</body>
</html>