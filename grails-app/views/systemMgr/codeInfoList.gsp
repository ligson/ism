<%@ page import="com.ism.code.domains.CodeInfo;" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="layout" content="none">
    <title>代码明细</title>
</head>
<body>
<script type="text/javascript">
    $(function () {
        $("#codeInfoGrid").datagrid({
            url: "codeInfoDataList",
            idField: 'id', fit: true, fitColumns: true, singleSelect: false,
            rownumbers: true, nowrap: false, pagination: true, pageSize: 10,
            pageList: [10, 20, 30, 40, 50],
            columns: [[
                { field: 'ck', checkbox: true },
                { field: 'pCode', title: '父编码', width: 30 ,formatter:function(value,row,index){
                    var s="";
                    if(value){
                         s = '<a href="#" onclick="detail('+row.id+')">'+row.pCode+'</a> ';
                    }
                    return s;
                }},
                { field: 'codeName', title: '代码名称', width: 30 },
                { field: 'codeValue', title: '代码值', width: 30 },
                { field: 'flag', title: '有效标识', width: 10 ,formatter:function(value){
                    if(value=='1'){
                        return "有效";
                    }else{
                        return "无效";
                    }
                }},
                { field: 'dispSn', title: '序号', width: 25 }
                ]],
            toolbar: [{
                text: '查询',
                iconCls: 'icon-search'

            }, '-',
                  {
                      text: '新建',
                      iconCls: 'icon-add',
                      handler: addCodeInfo
                  }, '-',
                  {
                      text: '编辑',
                      iconCls: 'icon-edit',
                      handler: editCodeInfo
                  }, '-',
                  {
                      text: '删除',
                      iconCls: 'icon-remove',
                      handler: deleteCodeInfo

                  }
                  ]
        })
    })
    //关闭弹出窗口
    function addCodeInfo() {
        var d=$("<div/>").dialog({
            href: "addCodeInfoPage",
            title: "添加代码分类",
            height: 230,
            width: 400,
            modal: true,
            iconCls: "icon-add",
            buttons: [
                         {
                             text: '确定添加',
                             iconCls: 'icon-add',
                             handler: function () {
                                 $("#hidtype").val("submit");
                                 var url="addCodeInfo";
                                 $("#addCodeInfoForm").form("submit", {
                                     url: url,
                                     onSubmit: function () {
                                         return $(this).form('validate');
                                     },
                                     success: function (result) {
                                             d.dialog('destroy');
                                             $.messager.alert("提示信息", "操作成功");
                                             $("#datagrid").datagrid("reload");
                                     }
                                 });
                             }
                         },
                         {
                             text: '取消添加',
                             iconCls: 'icon-cancel',
                             handler: function () {d.dialog('destroy');
                             }
                         }
                ],
            onClose: function () {
                $(this).dialog('destroy');
            }
        });
    }
    function editCodeInfo() {
        //alert(1);
        var r = $("#codeInfoGrid").datagrid("getChecked");
        var row = $("#codeInfoGrid").datagrid("getSelected");
        if (r.length < 1) { $.messager.alert("错误", "请选择一个要修改的用户"); return; }
        if (r.length > 1) {
            $.messager.alert("错误", "一次只能修改一个用户");
            $("#codeInfoGrid").datagrid('clearSelections').datagrid('clearChecked');
            return;
        }

        var updDialog=$("<div/>").dialog({
            href: "editCodeInfoPage",
            title: "修改用户",
            height: 230,
            width: 400,
            modal: true,
            iconCls: "icon-edit",
            buttons: [
                         {
                             text: '确定修改',
                             iconCls: 'icon-edit',
                             handler: function () {
                                 $("#hidtype").val("submit");
                                 $("#editeCodeInfoForm").form("submit", {
                                     url: "editCodeInfo?id="+row.id,
                                     onSubmit: function () {
                                         return $(this).form('validate');
                                     },
                                     success: function (result) {
                                             updDialog.dialog('destroy');
                                             $.messager.alert("提示", "操作成功");
                                             $("#datagrid").datagrid("reload").datagrid('clearSelections').datagrid('clearChecked');
                                     }
                                 });
                             }
                         },
                         {
                             text: '取消修改',
                             iconCls: 'icon-cancel',
                             handler: function () { updDialog.dialog('destroy'); }
                         }
                ],
            onClose: function () {
                updDialog.dialog('destroy');
            },
            onLoad: function () {
                $("#editeCodeInfoForm").form("load",row );

            }
        });

    }

    function deleteCodeInfo() {
        var rows = $("#codeInfoGrid").datagrid("getChecked");
        if (rows.length < 1) { $.messager.alert("错误", "请选择要删除的代码分类"); return; }
        $.messager.confirm('提示！', '确定删除这' + rows.length + '个代码分类吗？', function (r) {
            if (r) {
                para = {};
                para.id = "";
                $.each(rows, function (i, row) {
                    alert(rows.length);
                    if(i<rows.length-1){
                        para.id +=row.id +",";
                    }else{
                        para.id+=row.id;
                    }
                });
                $.ajax({
                    url: "deleteCodeInfo",
                    data: para,
                    type: "POST",
                    dataType: "text",
                    success: function (result) {
                            $.messager.alert("提示", "操作成功");
                            $("#datagrid").datagrid("reload").datagrid('clearSelections').datagrid('clearChecked'); ;
                    }
                });
            }
        });
    }

    function setrole() {
        var rows = $("#codeInfoGrid").datagrid("getChecked");
        if (rows.length < 1) { $.messager.alert("错误", "请选择要设置角色的用户"); return; }
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
                                             d.dialog('destroy');
                                             $.show_warning("提示", "操作成功");
                                             $("#datagrid").datagrid("reload").datagrid('clearSelections').datagrid('clearChecked');
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
                                             $("#datagrid").datagrid("reload").datagrid('clearSelections').datagrid('clearChecked');
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
%{--<div class="easyui-layout" data-options="fit : true,border : false">--}%
    %{--<div data-options="region:'north',title:'代码明细信息',border:false,iconCls:'icon-columns'"--}%
        %{--style="height: 10px; background: #f4f4f4;">--}%
        %{--<div class="fitem">--}%
            %{--<label style="width:100px;">--}%
                %{--上级代码名称：--}%
            %{--</label>--}%
        %{--</div>--}%
        %{--<div class="fitem">--}%
            %{--<label style="width:100px;">--}%
                %{--上级代码值：--}%
            %{--</label>--}%
        %{--</div>--}%
    %{--</div>--}%
    %{--<div data-options="region:'center',border:false">--}%
        %{--<table id="datagrid">--}%
        %{--</table>--}%
    %{--</div>--}%
%{--</div>--}%

<table id="codeInfoGrid">
</table>