<%@ page import="com.ism.code.domains.CodeInfo" contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="layout" content="none">
    <title>编辑代码分类</title>
</head>
<body>
<div id="dlg">
    <div class="ftitle">
    </div>
    <form id="editCodeSortForm" method="post">
        <div class="fitem">
            <label style="width:100px;">
                代码名称
            </label>
            <input name="codeName" id="codeSortName" class="easyui-validatebox" required="true" style="width:200px;"/>
        </div>
        <div class="fitem">
            <label style="width:100px;">
                代码值
            </label>
            <input name="codeValue"  class="easyui-validatebox" required="true" style="width:200px;"/>
        </div>
        <div class="fitem">
            <label style="width:100px;">
                有效标识</label>
            <select name="flag"style="width:200px;" class="easyui-combobox" required="true">
                <g:each in="${CodeInfo.validFalgMap.keySet()}" var="key">
                    <option value="${key}">${CodeInfo.validFalgMap.get(key)}</option>
                </g:each>
            </select>

        </div>
        <div class="fitem">
            <label style="width:100px;">
                排序序号</label>
            <input name="dispSn" class="easyui-datebox"  style="width:200px;" />
        </div>
        <input type="hidden" name="action" id="hidtype" />
    </form>
</div>

