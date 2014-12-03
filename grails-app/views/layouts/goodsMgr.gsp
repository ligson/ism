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
    <g:include view="layouts/adminCommonHead.gsp"/>
    <g:layoutHead/>
</head>

<body class="easyui-layout">
<g:include view="layouts/adminCommonBody.gsp"/>
<div data-options="region:'west',split:false" title="导航菜单" style="width:150px;">
    <div class="easyui-accordion" style="width:148px;height:100%;">
        <div title="超市管理" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
            <ul class="easyui-tree">
                <li><a href="${createLink(controller:'marketMgr',action:'index')}"><span>超市管理</span></a></li>
                <li><a href="#"><span>商品管理</span></a></li>
                <li><a href="#"><span>分类管理</span></a></li>
            </ul>
        </div>

        <div title="会员管理" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
            <ul class="easyui-tree">
                <li>
                    <a href="#">会员管理</a>
                </li>
                <li>
                    <a href="#">订单管理</a>
                </li>
                <li>
                    <a href="#"><span>短信管理</span></a>
                </li>
                <li>
                    <a href="#"><span>消息管理</span></a>
                </li>
            </ul>
        </div>
        <div title="系统管理" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
            <ul class="easyui-tree">
                <li><a href="#"><span>用户管理</span></a></li>
                <li><a href="#"><span>菜单管理</span></a></li>
                <li><a href="#"><span>角色管理</span></a></li>
            </ul>
        </div>
        <div title="地区管理" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
            <ul class="easyui-tree">
                <li><a href="${createLink(controller:'goodsMgr',action:'cityMgr')}">地区列表</a></li>
            </ul>
        </div>
    </div>

</div>
<div data-options="region:'center',title:'主页面',iconCls:'icon-ok'" id="mainDiv">
    <g:layoutBody/>
</div>
</body>
</html>