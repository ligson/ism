<%@ page import="com.ism.user.domains.User;" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>会员管理</title>
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
                会员昵称
            </label>
            <input name="nickName"  class="easyui-validatebox" required="true" style="width:200px;"/>
        </div>
        <div class="fitem">
            <label style="width:100px;">
                密码</label>
            <input class="easyui-validatebox" name="password" required="true" style="width:200px;">
        </div>
        <div class="fitem">
            <label style="width:100px;">
                手机号</label>
            <input class="easyui-validatebox" name="cellphone" required="true" style="width:200px;">
        </div>
        <div class="fitem">
            <label style="width:100px;">
                email</label>
            <input class="easyui-validatebox" name="email" required="true" style="width:200px;">
        </div>
        <div class="fitem">
            <label style="width:100px;">
                性别</label>
            <select name="sex"style="width:200px;" class="easyui-combobox">
                <g:each in="${User.sexCnName.keySet()}" var="key">
                    <option value="${key}">${User.sexCnName.get(key)}</option>
                </g:each>
            </select>
        </div>
        <div class="fitem">
            <label style="width:100px;">
                用户头像</label>
            <input class="easyui-validatebox" name="photo" required="true" style="width:200px;">
        </div>

        <div class="fitem">
            <label style="width:100px;">
                出生日期
            </label>
            <input name="birth"  class="easyui-datebox" required="true" style="width:200px;" />
        </div>
        <div class="fitem">
            <label style="width:100px;">
                创建人</label>
            <input class="easyui-validatebox" name="createName" required="true" style="width:200px;">
        </div>
        <div class="fitem">
            <label style="width:100px;">
                状态</label>
            <select name="state"style="width:200px;" class="easyui-combobox">
                <g:each in="${User.stateCnName.keySet()}" var="key">
                    <option value="${key}">${User.stateCnName.get(key)}</option>
                </g:each>
            </select>
        </div>
        <div class="fitem">
            <label style="width:100px;">
                角色</label>
            <select name="role"style="width:200px;" class="easyui-combobox">
                <g:each in="${User.roleCnName.keySet()}" var="key">
                    <option value="${key}">${User.roleCnName.get(key)}</option>
                </g:each>
            </select>
        </div>

        <input type="hidden" name="action" id="hidtype" />
    </form>
</div>
?<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="save()" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#dlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>

<script type="text/javascript">
    //datagrid初始化
    var datagrid=$('#list_data').datagrid({
        columns:[[
            {field:'id',title:'ID',width:'20%',align:'center'},
            {field:'nickName',title:'会员昵称',width:'20%',align:'center'},
            {field:'cellphone',title:'手机号码',width:'20%',align:'center'},
            {field:'sex',title:'性别',width:'20%',align:'center',formatter:function(value){
                if(value==1){
                    return "男";
                }else{
                    return "女";
                }
            }},
            {field:'birth',title:'出生日期',width:'20%',align:'center'
            },

            {field:'createName',title:'创建人',width:'20%',align:'center'},
            {field:'registerDate',title:'创建时间',width:'20%',align:'center'},
            {field:'state',title:'创建时间',width:'20%',align:'center',formatter:function(value){
                if(value==1){
                    return "正常";
                }else{
                    return "禁用";
                }
            }},
            {field:'role',title:'角色',width:'20%',align:'center',formatter:function(value){
                if(value==0){
                    return "超级管理员";
                }else if(value==1){
                    return "管理员";
                }else{
                    return "普通用户";
                }
            }}
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
                addUser();
            }
        }, '-', {
            text: '修改',
            iconCls: 'icon-edit',
            handler: function() {
                updateUser();
            }
        }, '-',{
            text: '删除',
            iconCls: 'icon-remove',
            handler: function(){
                removeUser();
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
    var url;
    var type;
    function addUser() {
        var $win;
        $win = $('#dlg').window({
            title: '新增用户',
            width: 820,
            height: 650,
            shadow: true,
            modal: true,
            iconCls: 'icon-add',
            closed: true,
            minimizable: true,
            maximizable: true,
            maximized:false,
            collapsible: true
        });
        $win.window('open');
        $("#fm").form("clear");
        url = "addUser";
        $("#hidtype").val("submit");
    }
    function updateUser() {
        var row = datagrid.datagrid("getSelected");
        if (row) {
            var $win;
            $win = $('#dlg').window({
                title: '编辑用户',
                width: 820,
                height: 650,
                shadow: true,
                modal: true,
                iconCls: 'icon-add',
                closed: true,
                minimizable: true,
                maximizable: true,
                maximized:false,
                collapsible: true
            });
            $win.window('open');
            $("#fm").form("load", row);
            url = "updateUser?id=" + row.id;
        }
    }
    function save() {
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
    function removeUser() {
        var row = datagrid.datagrid('getSelected');
        if (row) {
            $.messager.confirm('Confirm', '确定要删除选择的数据吗?', function (r) {
                if (r) {
                    $.post('removeUser', { id: row.id }, function (result) {
                        if (result.success) {
                            $.messager.alert("提示信息", "删除成功");
                            datagrid.datagrid("reload");    // reload the user data
                        } else {
                            $.messager.show({   // show error message
                                title: 'Error',
                                msg:"操作失败"
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