<%@ page import="com.ism.market.domains.Market" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>超市管理</title>
    <script type="text/javascript" src="${resource(dir: "js/ism/admin", file: "cityMgr.js")}"></script>
</head>
<body>
<div id="list_data"></div>
<div id="dlg" class="easyui-dialog" style="width: 400px; height: 280px; padding: 10px 20px;"
     closed="true" buttons="#dlg-buttons">
    <div class="ftitle">

    </div>
    <form id="fm" method="post">
        <div class="fitem">
            <label style="width:100px;">
                超市名称
            </label>
            <input name="name" id="name" class="easyui-validatebox" required="true" style="width:200px;"/>
        </div>
        <div class="fitem">
            <label style="width:100px;">
                所在地区</label>
            <input class="easyui-combotree" name="cid" data-options="url:'cityList',method:'get',required:true" style="width:200px;">
        </div>
        <div class="fitem">
            <label style="width:100px;">
                是否已接入APP</label>
            <select name="state"style="width:200px;" class="easyui-combobox">
                <g:each in="${Market.stateCnName.keySet()}" var="key">
                    <option value="${key}">${Market.stateCnName.get(key)}</option>
                </g:each>
            </select>

        </div>
        <div class="fitem">
            <label style="width:100px;">
                接入时间</label>
            <input name="accessTime" id="accessTime" class="easyui-datebox" required="true" style="width:200px;" />
        </div>
        <input type="hidden" name="action" id="hidtype" />
    </form>
</div>
?<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveuser()" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#dlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>

<script type="text/javascript">
    //datagrid初始化
    var datagrid=$('#list_data').datagrid({
        columns:[[
            {field:'id',title:'ID',width:'20%',align:'center'},
            {field:'name',title:'超市名称',width:'20%',align:'center'},
            {field:'city',title:'所在地区',width:'20%',align:'center',formatter:function(value){
                return value.name;
            }},
            {field:'state',title:'是否已接入APP',width:'20%',align:'center',
                formatter:function(value){
            if(value==0){
                return "未接入";
            }else{
                return "已接入";
            }}
            },

            {field:'accessTime',title:'接入时间',width:'20%',align:'center'}
        ]],
        title:'超市管理',
        iconCls:'icon-edit',//图标
        width: 700,
        height: 'auto',
        nowrap: false,
        striped: true,
        border: true,
        collapsible:true,//是否可折叠的
        fit: true,//自动大小
        url:'list',
        //sortName: 'code',
        //sortOrder: 'desc',
        remoteSort:false,
        idField:'fldId',
        singleSelect:false,//是否单选
        pagination:true,//分页控件
        rownumbers:true,//行号
        frozenColumns:[[
            {field:'ck',checkbox:true}
        ]],
        toolbar: [{
            text: '添加',
            iconCls: 'icon-add',
            handler: function() {
                newuser();
            }
        }, '-', {
            text: '修改',
            iconCls: 'icon-edit',
            handler: function() {
                edituser();
            }
        }, '-',{
            text: '删除',
            iconCls: 'icon-remove',
            handler: function(){
                alert("删除");
            }
        }]
    });
    //设置分页控件
    var p = $('#list_data').datagrid('getPager');
    $(p).pagination({
        pageSize: 10,//每页显示的记录条数，默认为10
        pageList: [5,10,15,20,25,30,50,100],//可以设置每页记录条数的列表
        beforePageText: '第',//页数文本框前显示的汉字
        afterPageText: '页    共 {pages} 页',
        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
        /*onBeforeRefresh:function(){
         $(this).pagination('loading');
         alert('before refresh');
         $(this).pagination('loaded');
         }*/
    });
    $('#cid').combobox({
        url:'cityData',
        valueField:'id',
        textField:'text'
    });
    var url;
    var type;
    function newuser() {
        $("#dlg").dialog("open").dialog('setTitle', '新增超市'); ;
        $("#fm").form("clear");
        url = "addMarket";
        $("#hidtype").val("submit");
    }
    function edituser() {
        var row = $("#dg").datagrid("getSelected");
        if (row) {
            $("#dlg").dialog("open").dialog('setTitle', 'Edit User');
            $("#fm").form("load", row);
            url = "UserManage.aspx?id=" + row.ID;
        }
    }
    function saveuser() {
        $("#fm").form("submit", {
            url: url,
            onsubmit: function () {
                return $(this).form("validate");
            },
            success: function (result) {
                data = eval("(" + result + ")");
                if (data.success) {
                    $.messager.alert("提示信息", "操作成功");
                    $("#dlg").dialog("close");
                    datagrid.datagrid("reload");
                }
                else {
                    $.messager.alert("提示信息", "操作失败");
                }
            }
        });
    }
    function destroyUser() {
        var row = $('#dg').datagrid('getSelected');
        if (row) {
            $.messager.confirm('Confirm', 'Are you sure you want to destroy this user?', function (r) {
                if (r) {
                    $.post('destroy_user.php', { id: row.id }, function (result) {
                        if (result.success) {
                            $('#dg').datagrid('reload');    // reload the user data
                        } else {
                            $.messager.show({   // show error message
                                title: 'Error',
                                msg: result.errorMsg
                            });
                        }
                    }, 'json');
                }
            });
        }
    }

</script>
</body>
</html>