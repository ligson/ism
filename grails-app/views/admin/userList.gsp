<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户管理</title>
</head>
<body>

<table id="list_data" cellspacing="0" cellpadding="0">
    <thead>
    <tr>
        <th field="id" width="100">ID</th>
        <th field="cellphone" width="100">部门</th>
        <th field="password" width="100">网站</th>
        <th field="email" width="100">名称</th>
        <th field="nickName" width="100">管理员</th>
    </tr>
    </thead>
</table>
<div id="dlg" class="easyui-dialog" style="width: 400px; height: 280px; padding: 10px 20px;"
     closed="true" buttons="#dlg-buttons">
    <div class="ftitle">
        信息编辑
    </div>
    <form id="fm" method="post">
        <div class="fitem">
            <label>
                昵称
            </label>
            <input name="nickName" class="easyui-validatebox" required="true" />
        </div>
        <div class="fitem">
            <label>
                手机号</label>
            <input name="cellphone" class="easyui-validatebox" required="true" />
        </div>
        <div class="fitem">
            <label>
                电子邮件</label>
            <input name="email" class="easyui-vlidatebox" />
        </div>
        <div class="fitem">
            <label>
                密码</label>
            <input name="password" class="easyui-validatebox" required="true" />
        </div>
        <div class="fitem">
            <label>
                性别</label>
            <input name="sex" class="easyui-vlidatebox" />
        </div>
        <div class="fitem">
            <label>
                生日</label>
            <input name="birth" class="easyui-vlidatebox" />
        </div>
        <div class="fitem">
            <label>
                用户头像</label>
            <input name="photo" class="easyui-vlidatebox" />
        </div>
        <div class="fitem">
            <label>
                创建时间</label>
            <input name="CreateTime" class="easyui-datebox" required="true" />
        </div>
        <div class="fitem">
            <label>
                创建人</label>
            <input name="CreateName" class="easyui-vlidatebox" />
        </div>
        <input type="hidden" name="action" id="hidtype" />
        <input type="hidden" name="ID" id="Nameid" />
    </form>
</div>
?<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveuser()" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#dlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>

<script type="text/javascript">
    //datagrid初始化
    $('#list_data').datagrid({
        title:'用户管理',
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
    var url;
    var type;
    function newuser() {
        $("#dlg").dialog("open").dialog('setTitle', '新增用户'); ;
        $("#fm").form("clear");
        url = "save";
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
                if (result == "1") {
                    $.messager.alert("提示信息", "操作成功");
                    $("#dlg").dialog("close");
                    $("#dg").datagrid("load");
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