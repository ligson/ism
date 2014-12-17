﻿<%@ page import="com.ism.user.domains.User;" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>代码管理</title>
    <script type="text/javascript" src="${resource(dir: "js/ism/admin", file: "cityMgr.js")}"></script>
</head>
<body>
<script type="text/javascript">
    $(function () {
        $("#dg_user").datagrid({
            url: "codeSortDataList",
            idField: 'id', fit: true, fitColumns: true, singleSelect: false,
            rownumbers: true, nowrap: false, pagination: true, pageSize: 10,
            pageList: [10, 20, 30, 40, 50],
            columns: [[
                { field: 'ck', checkbox: true },
                { field: 'codeSortType', title: '代码类别', width: 30 },
                { field: 'codeSortName', title: '代码名称', width: 30 },
                { field: 'validFalg', title: '有效标识', width: 10 },
                { field: 'remark', title: '备注', width: 25 }
                ]],
            toolbar: [{
                text: '查询',
                iconCls: 'icon-search'

            }, '-',
                  {
                      text: '新建',
                      iconCls: 'icon-add',
                      handler: addCodeSort
                  }, '-',
                  {
                      text: '编辑',
                      iconCls: 'icon-edit',
                      handler: editCodeSort
                  }, '-',
                  {
                      text: '删除',
                      iconCls: 'icon-remove',
                      handler: deleteCodeSort

                  }, '-',
                  {
                      text: '设置用户角色',
                      iconCls: 'icon-group_key',
                      handler: setrole

                  }, '-',
                  {
                      text: '设置用户组织',
                      iconCls: 'icon-org',
                      handler: setorg

                  }]
        })
    })
    function addCodeSort() {
        $("<div/>").dialog({
            href: "codeSort_add.htm",
            title: "添加代码分类",
            height: 300,
            width: 800,
            modal: true,
            iconCls: "icon-add",
            buttons: [
                         {
                             text: '确定添加',
                             iconCls: 'icon-add',
                             handler: function () {
                                 var d = $(this).closest('.window-body');
                                 $("#f_user_add").form("submit", {
                                     url: "addCodeSort",
                                     onSubmit: function (param) {
                                         param.action = 'add';
                                         return $(this).form('validate');
                                     },
                                     success: function (result) {
                                         dealAjaxResult(result, function (r) {
                                             d.dialog('destroy');
                                             $.show_warning("提示", "操作成功");
                                             $("#dg_user").datagrid("reload");
                                         })
                                     }
                                 });
                             }
                         },
                         {
                             text: '取消添加',
                             iconCls: 'icon-cancel',
                             handler: function () { $(this).closest('.window-body').dialog('destroy'); }
                         }
                ],
            onClose: function () {
                $(this).dialog('destroy');
            }
        });
    }
    function editCodeSort() {
        //alert(1);
        var r = $("#dg_user").datagrid("getChecked");
        if (r.length < 1) { $.show_warning("错误", "请选择一个要修改的用户"); return; }
        if (r.length > 1) {
            $.show_warning("错误", "一次只能修改一个用户");
            $("#dg_user").datagrid('clearSelections').datagrid('clearChecked');
            return;

        }

        $("<div/>").dialog({
            href: "/htm_ui/ui_user_edit.htm",
            title: "修改用户",
            height: 300,
            width: 800,
            modal: true,
            iconCls: "icon-edit",
            buttons: [
                         {
                             text: '确定修改',
                             iconCls: 'icon-edit',
                             handler: function () {
                                 var d = $(this).closest('.window-body');
                                 $("#f_user_edit").form("submit", {
                                     url: "editCodeSort",
                                     onSubmit: function (param) {
                                         param.action = 'edit';
                                         param.id = r[0].id;
                                         return $(this).form('validate');
                                     },
                                     success: function (result) {
                                         dealAjaxResult(result, function (r) {
                                             d.dialog('destroy');
                                             $.show_warning("提示", "操作成功");
                                             $("#dg_user").datagrid("reload").datagrid('clearSelections').datagrid('clearChecked');
                                         })
                                     }
                                 });
                             }
                         },
                         {
                             text: '取消修改',
                             iconCls: 'icon-cancel',
                             handler: function () { $(this).closest('.window-body').dialog('destroy'); }
                         }
                ],
            onClose: function () {
                $(this).dialog('destroy');
            },
            onLoad: function () {
                $("#password1").val(r[0].password);
                $("#f_user_edit").form("load", r[0]);

            }
        });

    }

    function deleteCodeSort() {
        var rows = $("#dg_user").datagrid("getChecked");
        if (rows.length < 1) { $.show_warning("错误", "请选择要删除的用户"); return; }
        $.messager.confirm('提示！', '确定删除这' + rows.length + '个用户?', function (r) {
            if (r) {
                para = {};
                para.action = "dele";
                para.timespan = new Date().getTime();
                para.id = "";
                $.each(rows, function (i, row) {
                    para.id = para.id + "'" + row.id + "',";
                });
                $.ajax({
                    url: "deleteCodeSort",
                    data: para,
                    type: "POST",
                    dataType: "text",
                    success: function (result) {
                        dealAjaxResult(result, function (r) {
                            $.show_warning("提示", "操作成功");
                            $("#dg_user").datagrid("reload").datagrid('clearSelections').datagrid('clearChecked'); ;
                        })
                    }
                });
            }
        });
    }

    function setrole() {
        var rows = $("#dg_user").datagrid("getChecked");
        if (rows.length < 1) { $.show_warning("错误", "请选择要设置角色的用户"); return; }
        $("<div/>").dialog({
            href: "/htm_ui/ui_user_setrole.htm",
            title: "设置用户角色--" + rows.length + "个用户",
            height: 180,
            width: 400,
            modal: true,
            iconCls: "icon-group_key",
            buttons: [
                         {
                             text: '确定设置',
                             iconCls: 'icon-group_key',
                             handler: function () {
                                 var d = $(this).closest('.window-body');
                                 ids = "";
                                 $.each(rows, function (i, row) {
                                     ids = ids + row.id + ",";
                                 });
                                 $("#f_user_setrole").form("submit", {
                                     url: "../ashx_ui/ui_user.ashx",
                                     onSubmit: function (param) {
                                         param.action = 'setrole';
                                         param.id = ids;
                                         // return $(this).form('validate');
                                     },
                                     success: function (result) {
                                         dealAjaxResult(result, function (r) {
                                             d.dialog('destroy');
                                             $.show_warning("提示", "操作成功");
                                             $("#dg_user").datagrid("reload").datagrid('clearSelections').datagrid('clearChecked');
                                         })
                                     }
                                 });
                             }
                         },
                         {
                             text: '取消设置',
                             iconCls: 'icon-cancel',
                             handler: function () { $(this).closest('.window-body').dialog('destroy'); }
                         }
                ],
            onClose: function () {
                $(this).dialog('destroy');
            }

        });
    }

    function setorg() {
        var rows = $("#dg_user").datagrid("getChecked");
        if (rows.length < 1) { $.show_warning("错误", "请选择要设置组织的用户"); return; }
        $("<div/>").dialog({
            href: "/htm_ui/ui_user_setorg.htm",
            title: "设置用户组织--" + rows.length + "个用户",
            height: 180,
            width: 400,
            modal: true,
            iconCls: "icon-org",
            buttons: [
                         {
                             text: '确定设置',
                             iconCls: 'icon-org',
                             handler: function () {
                                 var d = $(this).closest('.window-body');
                                 ids = "";
                                 $.each(rows, function (i, row) {
                                     ids = ids + row.id + ",";
                                 });
                                 $("#f_user_setorg").form("submit", {
                                     url: "../ashx_ui/ui_user.ashx",
                                     onSubmit: function (param) {
                                         param.action = 'setorg';
                                         param.id = ids;
                                     },
                                     success: function (result) {
                                         dealAjaxResult(result, function (r) {
                                             d.dialog('destroy');
                                             $.show_warning("提示", "操作成功");
                                             $("#dg_user").datagrid("reload").datagrid('clearSelections').datagrid('clearChecked');
                                         })
                                     }
                                 });
                             }
                         },
                         {
                             text: '取消设置',
                             iconCls: 'icon-cancel',
                             handler: function () { $(this).closest('.window-body').dialog('destroy'); }
                         }
                ],
            onClose: function () {
                $(this).dialog('destroy');
            }

        });
    }
</script>
<div class="easyui-layout" data-options="fit : true,border : false">
    <div data-options="region:'north',title:'查询条件',border:false,iconCls:'icon-columns'"
        style="height: 100px; background: #f4f4f4;">
        <!-- <div id="p" class="easyui-panel" title="检索条件" style="padding: 10px; height: 100px;
                background: #f4f4f4; border-bottom: none" data-options="iconCls:'icon-columns',closable:false,  
                collapsible:true,minimizable:false,maximizable:false">
            </div>-->
    </div>
    <div data-options="region:'center',border:false">
        <table id="dg_user">
        </table>
    </div>
</div>
