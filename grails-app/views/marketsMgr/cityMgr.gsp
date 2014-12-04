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
        <ul class="easyui-tree">
            <li>
                <span>My Documents</span>
                <ul>
                    <li data-options="state:'closed'">
                        <span>Photos</span>
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
                        <span>Program Files</span>
                        <ul>
                            <li>Intel</li>
                            <li>Java</li>
                            <li>Microsoft Office</li>
                            <li>Games</li>
                        </ul>
                    </li>
                    <li>index.html</li>
                    <li>about.html</li>
                    <li>welcome.html</li>
                </ul>
            </li>
        </ul>

        <div id="mm" class="easyui-menu" style="width:120px;">
            <div onclick="append()" data-options="iconCls:'icon-add'">Append</div>

            <div onclick="removeit()" data-options="iconCls:'icon-remove'">Remove</div>

            <div class="menu-sep"></div>

            <div onclick="expand()">Expand</div>

            <div onclick="collapse()">Collapse</div>
        </div>
    </div>

    <div data-options="region:'center',fit:true" title="22323">
        <a href="javascript:void(0);" onclick="addArea()" class="easyui-linkbutton"
           data-options="iconCls:'icon-add'">添加地区</a>

        <div id="addAreaDlg" class="easyui-dialog" title="添加地区" style="width:400px;height:200px;"
             data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
            <g:form controller="goodsMgr" action="addCity">

            <input type="hidden" value="">
            <table>
                <tr>
                    <td>名称：</td>
                    <td><input class="easyui-textbox" type="text" name="name" data-options="required:true"></td>
                </tr>
                <tr>
                    <td>类型：</td>
                    <td>
                        <select class="easyui-combobox" name="type">
                            <g:each in="${City.typeCnName.keySet()}" var="key">
                                <option value="${key}">${City.typeCnName.get(key)}</option>
                            </g:each>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>邮编:</td>
                    <td>
                        <input  class="easyui-textbox" name="code" data-options="require:true"/>
                    </td>
                </tr>
                <tr>
                    <td>级别:</td>
                    <td><input class="easy-textbox" name="level" data-options="require:true" disabled="disabled"></td>
                </tr>
                <tr>
                    <td rowspan="2">介绍:</td>
                    <td rowspan="2">
                        <textarea  class="easyui-textbox" name="description" data-options="multiline:true"></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitAddAreaForm()">Submit</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">Clear</a>
                    </td>
                </tr>

            </table>
            </g:form>
        </div>
    </div>
</div>

</body>
</html>