<%@ page import="com.ism.message.domains.Message; com.ism.vip.domains.Vip " contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>会员管理</title>
</head>
<body>
<div id="list_data"></div>
<div id="addDlg" class="easyui-dialog" style="width: 400px; height: 280px; padding: 10px 20px;"
     closed="true" buttons="#dlg-buttons">
    <div class="ftitle">

    </div>
    <form id="addFm" method="post">
        <div class="fitem">
            <label style="width:100px;">
                消息标题
            </label>
            <input name="name"  class="easyui-validatebox" required="true" style="width:200px;"/>
        </div>
        <div class="fitem">
            <label style="width:100px;">
                消息内容
            </label>
            <input name="no"  class="easyui-validatebox" required="true" style="width:200px;"/>
        </div>
        <div class="fitem">
            <label style="width:100px;">
                发送人
            </label>
            <input name="originalPrice"  class="easyui-validatebox" required="true" style="width:200px;"/>
        </div>
        <div class="fitem">
            <label style="width:100px;">
                会员状态</label>
            <select name="status" style="width:200px;" class="easyui-combobox">
                <g:each in="${Message.msgTypeName.keySet()}" var="key">
                    <option value="${key}">${Message.msgTypeName.get(key)}</option>
                </g:each>
            </select>
        </div>
        <input type="hidden" name="action" id="addHideType" />
    </form>
</div>
<div id="addDlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="save('add')" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#addDlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>

<div id="dlg" class="easyui-dialog" style="width: 400px; height: 280px; padding: 10px 20px;"
     closed="true" buttons="#dlg-buttons">
    <div class="ftitle">

    </div>
    <form id="fm" method="post">
        <div class="fitem">
            <label style="width:100px;">
                会员状态</label>
            <select name="status" style="width:200px;" class="easyui-combobox">
                <g:each in="${Vip.stateCnName.keySet()}" var="key">
                    <option value="${key}">${Vip.stateCnName.get(key)}</option>
                </g:each>
            </select>
        </div>
        <input type="hidden" name="action" id="hidtype" />
    </form>
</div>
?<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="save('update')" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#dlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>

<script type="text/javascript">
    //datagrid初始化
    var datagrid=$('#list_data').datagrid({
        columns:[[
            {field:'id',title:'ID',width:'20%',align:'center'},
            {field:'mobile',title:'手机号码',width:'20%',align:'center'},
            {field:'registerDate',title:'注册日期',width:'20%',align:'center'},
            {field:'lastLoginDate',title:'最后登录时间',width:'20%',align:'center'},
            {field:'status',title:'会员状态',width:'20%',align:'center',formatter:function(value){
                if(value==1){
                    return "正常";
                }else{
                    return "禁用";
                }
            }}
        ]],
        title:'会员管理',
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
            text: '消息推送',
            iconCls: 'icon-add',
            handler: function() {
                addMessage();
            }
        },{
            text: '修改',
            iconCls: 'icon-edit',
            handler: function() {
                updateVip();
            }
        }, '-',{
            text: '删除',
            iconCls: 'icon-remove',
            handler: function(){
                removeVip();
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
    function addMessage() {
        var $win;
        $win = $('#dlg').window({
            title: '消息推送',
            width: 520,
            height: 350,
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
        $("#addFm").form("clear");
        url = "addMessage";
        $("#addHideType").val("submit");
    }
    function updateVip() {
        var row = $('#list_data').datagrid("getSelected");
        if (row) {
            if(row.length>1){
                $.messager.alert("提示信息", "只能选择一条会员信息");
                return ;
            }else {
                var $win;
                $win = $('#dlg').window({
                    title: '编辑会员信息',
                    width: 300,
                    height: 150,
                    shadow: true,
                    modal: true,
                    iconCls: 'icon-add',
                    closed: true,
                    minimizable: true,
                    maximizable: true,
                    maximized: false,
                    collapsible: true
                });
                $win.window('open');
                $("#fm").form("load", row);
                url = "updateVip?id=" + row.id;
            }
        }else{
            $.messager.alert("提示信息", "请选择一条会员信息");
        }
    }
    function save(flag) {
        var $form;
        if(flag='add'){
            $form= $("#addFm");
        }else{
            $form=$("#fm");
        }
        $form.form("submit", {
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
    function removeVip() {
        var row = datagrid.datagrid('getSelected');
        if (row) {
            $.messager.confirm('Confirm', '确定要删除选择的数据吗?', function (r) {
                if (r) {
                    $.post('removeVip', { id: row.id }, function (result) {
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