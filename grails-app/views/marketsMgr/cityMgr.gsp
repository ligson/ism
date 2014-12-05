<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/12/2 0002
  Time: 21:00
--%>

<%@ page import="com.ism.address.domains.City" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>地区管理</title>
    <script type="text/javascript" src="${resource(dir: "js/ism/admin", file: "cityMgr.js")}"></script>
</head>

<body>
<div class="easyui-layout" data-options="fit:true">
    <div data-options="region:'west'" style="width:200px" title="22">
        <ul id="cityTree">
        </ul>

        <div id="treeMenu" class="easyui-menu" style="width:120px;">
            <div onclick="append()" data-options="iconCls:'icon-add'">Append</div>

            <div onclick="removeit()" data-options="iconCls:'icon-remove'">Remove</div>

            <div class="menu-sep"></div>

            <div onclick="expand()">Expand</div>

            <div onclick="collapse()">Collapse</div>
        </div>
    </div>

    <div data-options="region:'center',fit:true" title="22323">

        <g:form controller="marketsMgr" action="addCity" name="modifyCityForm">
            <table>
                <tr>
                    <td colspan="2">当前选择地区<input type="hidden" name="cityId" value=""/></td>
                </tr>
                <tr>
                    <td>地区名称:</td><td><input type="text" name="name" value=""></td>
                </tr>
                <tr>
                    <td>地区类型:</td><td>
                    <select name="type">
                        <g:each in="${City.typeCnName.keySet()}" var="key">
                            <option value="${key}">${City.typeCnName.get(key)}</option>
                        </g:each>
                    </select>
                </td>
                </tr>
                <tr>
                    <td>地区邮编:</td><td><input type="text" name="code" value=""/></td>
                </tr>
                <tr>
                    <td>地区级别:</td><td><input type="text" name="level" value=""></td>
                </tr>
                <tr>
                    <td>地区介绍:</td>
                    <td>
                        <textarea name="description"></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" class="easyui-linkbutton"  value="修改"/>
                    </td>
                </tr>
            </table>
        </g:form>

        <a href="javascript:void(0);" onclick="addArea()" class="easyui-linkbutton"
           data-options="iconCls:'icon-add'">添加地区</a>

    </div>
</div>


<div id="addAreaDlg" class="easyui-dialog" title="添加地区" style="width:400px;height:300px;"
     data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
    <g:form controller="marketsMgr" action="addCity" name="addCityForm">

        <input type="hidden" name="fId" value="">
        <table>
            <tr>
                <td>名称：</td>
                <td><input type="text" name="name" ></td>
            </tr>
            <tr>
                <td>类型：</td>
                <td>
                    <select  name="type">
                        <g:each in="${City.typeCnName.keySet()}" var="key">
                            <option value="${key}">${City.typeCnName.get(key)}</option>
                        </g:each>
                    </select>
                </td>
            </tr>

            <tr>
                <td>邮编:</td>
                <td>
                    <input  name="code" value=""/>
                </td>
            </tr>
            <tr>
                <td>级别:</td>
                <td><input  name="level"  disabled="disabled"></td>
            </tr>
            <tr>
                <td>介绍:</td>
                <td>
                    <input name="description" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" class="easyui-linkbutton" value="提交"/>
                    <input type="reset" class="easyui-linkbutton" value="重置"/>
                </td>
            </tr>

        </table>
    </g:form>
</div>
</body>
</html>