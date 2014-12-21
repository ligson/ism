<%@ page import="com.ism.code.domains.CodeSort" contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="layout" content="none">
    <title>新增代码分类</title>
</head>
<body>
<div id="dlg">
    <div class="ftitle">
    </div>
    <form id="editeCodeSortForm" method="post">
        <div class="fitem">
            <label style="width:100px;">
                代码名称
            </label>
            <input name="codeSortName" id="codeSortName" class="easyui-validatebox" required="true" style="width:200px;"/>
        </div>
        <div class="fitem">
            <label style="width:100px;">
                代码类别
            </label>
            <input name="codeSortType"  class="easyui-validatebox" required="true" style="width:200px;"/>
        </div>
        <div class="fitem">
            <label style="width:100px;">
                有效标识</label>
            <select name="flag"style="width:200px;" class="easyui-combobox" required="true">
                <g:each in="${CodeSort.validFalgMap.keySet()}" var="key">
                    <option value="${key}">${CodeSort.validFalgMap.get(key)}</option>
                </g:each>
            </select>

        </div>
        <div class="fitem">
            <label style="width:100px;">
                备注</label>
            <input name="remark" class="easyui-datebox"  style="width:200px;" />
        </div>
        <input type="hidden" name="action" id="hidtype" />
    </form>
</div>

