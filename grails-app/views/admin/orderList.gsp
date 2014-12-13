<%@ page import="com.ism.order.domains.Order;" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>订单管理</title>
</head>
<body>
<div id="tb" style="padding:2px 5px;">
    订单编号：<input class="easyui-validatebox" style="width:110px">
    订单开始日期: <input class="easyui-datebox" style="width:110px">
    到: <input class="easyui-datebox" style="width:110px">
    订单状态:
    <select class="easyui-combobox" panelHeight="auto" style="width:100px">
        <option value="1">已支付</option>
        <option value="2">未支付</option>
    </select>
    <a href="#" class="easyui-linkbutton" iconCls="icon-search">Search</a>
</div>
<div id="list_data"></div>

<div id="dlg" class="easyui-dialog" style="width: 400px; height: 280px; padding: 10px 20px;"
     closed="true" buttons="#dlg-buttons">
    <form id="fm" method="post">
        <div class="fitem">
            <label style="width:100px;">
                订单编号
            </label>
            <input name="orderNo"  class="easyui-validatebox" required="true" style="width:200px;"/>
        </div>
        <div class="fitem">
            <label style="width:100px;">
                订单总价</label>
            <input class="easyui-validatebox" name="price" required="true" style="width:200px;">
        </div>
        <div class="fitem">
            <label style="width:100px;">
                订单状态</label>
            <select name="sex"style="width:200px;" class="easyui-combobox">
                <g:each in="${Order.orderStateMap.keySet()}" var="key">
                    <option value="${key}">${Order.orderStateMap.get(key)}</option>
                </g:each>
            </select>
        </div>
        <input type="hidden" name="action" id="hidtype" />
    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="save()" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#dlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>

<script type="text/javascript">
    //datagrid初始化
    var datagrid=$('#list_data').datagrid({
        columns:[[
            {field:'orderNo',title:'订单编号',width:'20%',align:'center'},
            {field:'price',title:'订单总价',width:'20%',align:'center'},
            {field:'orderCreateDate',title:'订单生成时间',width:'20%',align:'center'},
            {field:'vip',title:'会员手机号',width:'20%',align:'center',formatter:function(value){
                return value.mobile;
            }},
            {field:'orderState',title:'订单状态',width:'20%',align:'center',formatter:function(value){
                if(value==1){
                    return "已支付";
                }else{
                    return "未支付";
                }
            }}
        ]],
        title:'订单管理',
        iconCls:'icon-edit',//图标
        width: 700,
        height: 'auto',
        nowrap: false,
        striped: true,
        border: true,
        collapsible:true,//是否可折叠的
        fit: true,//自动大小
        url:'findOrderList',
        //sortName: 'code',
        //sortOrder: 'desc',
        remoteSort:false,
        idField:'fldId',
        singleSelect:false,//是否单选
        pagination:true,//分页控件
        rownumbers:true,//行号
        frozenColumns:[[
            {field:'ck',checkbox:true}
        ]]
        //,
//        toolbar: [{
//            text: '添加',
//            iconCls: 'icon-add',
//            handler: function() {
//                addUser();
//            }
//        }, '-', {
//            text: '修改',
//            iconCls: 'icon-edit',
//            handler: function() {
//                updateUser();
//            }
//        }, '-',{
//            text: '删除',
//            iconCls: 'icon-remove',
//            handler: function(){
//                removeUser();
//            }
//        }]
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