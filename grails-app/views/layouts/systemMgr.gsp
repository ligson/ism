<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/11/27 0027
  Time: 13:01
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:layoutTitle/>-系统管理</title>
    <g:include view="layouts/adminCommonHead.gsp"/>
    <g:layoutHead/>
</head>

<body class="easyui-layout">
<g:include view="layouts/adminCommonBody.gsp"/>
<div id="westPanel"  data-options="region:'west',split:false" title="导航菜单" style="width:150px;"  about="systemMgr">
    <div class="easyui-accordion" style="width:148px;height:100%;">
        <div title="系统设置" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
            <ul class="easyui-tree"><li><a href="${createLink(controller:'systemMgr',action:'userList')}">用户管理</a></li></ul>
            <ul class="easyui-tree"><li><a href="${createLink(controller:'goodsMgr',action:'marketList')}">菜单管理</a></li></ul>
            <ul class="easyui-tree"><li><a href="${createLink(controller:'goodsMgr',action:'marketList')}">角色管理</a></li></ul>
            <ul class="easyui-tree"><li><a href="${createLink(controller:'systemMgr',action:'codeSortList')}">代码管理</a></li></ul>
        </div>
        <div title="统计管理" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
            <ul class="easyui-tree">
                <li><a href="${createLink(controller:'goodsMgr',action:'cityMgr')}">超市统计</a></li><!--统计接入APP超市的分布与数量以及名称-->
                <li><a href="${createLink(controller:'goodsMgr',action:'cityMgr')}">商品统计</a></li><!--统计商品的销售情况-->
                <li><a href="${createLink(controller:'goodsMgr',action:'cityMgr')}">订单统计</a></li><!--统计订单的金额数-->
            </ul>
        </div>
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
                        <li><a href= "${resource(dir: 'js/lib/jquery-easyui-1.4.1/demo/form', file: 'basic.html')}">欢迎</a></li>
                    </ul>
                </li>
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