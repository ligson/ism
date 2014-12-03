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
        <div title="商品管理" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
            <ul class="easyui-tree">
                <li><a href="${createLink(controller:'goodsMgr',action:'goodList')}"><span>商品列表</span></a></li>
                <li><a href="${createLink(controller:'goodsMgr',action:'goodList')}"><span>商品导入</span></a></li>
                <li><a href="${createLink(controller:'goodsMgr',action:'goodList')}"><span>商品导出</span></a></li>
            </ul>
        </div>

        <div title="分类管理" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
            <ul class="easyui-tree">
                <li>
                    <a href="#">分类列表</a>
                </li>
            </ul>
        </div>

    </div>

</div>
<div data-options="region:'center',title:'主页面',iconCls:'icon-ok'" id="mainDiv">
    <g:layoutBody/>
</div>
</body>
</html>