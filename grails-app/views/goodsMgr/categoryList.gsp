<%@ page import="com.ism.goods.domains.Category" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>分类管理</title>
    <script type="text/javascript" src="${resource(dir: "js/ism/admin", file: "cityMgr.js")}"></script>
    <ueditor:resources/>

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
                 选择超市
             </label>
             <input name="mid"  class="easyui-validatebox" required="true" style="width:200px;"/>
         </div>
        <div class="fitem">
            <label style="width:100px;">
                分类名称
            </label>
            <input name="name"  class="easyui-validatebox" required="true" style="width:200px;"/>
        </div>
         <div class="fitem">
             <label style="width:100px;">
                 分类编号
             </label>
             <input name="no"  class="easyui-validatebox" required="true" style="width:200px;"/>
         </div>
         <div class="fitem">
             <label style="width:100px;">
                 分类类型
             </label>
             <input name="sortType"  class="easyui-validatebox" style="width:200px;"/>
         </div>
         <div class="fitem">
             <label style="width:100px;">
                 显示序号
             </label>
             <input name="displayNum"  class="easyui-validatebox" style="width:200px;"/>
         </div>
         <div class="fitem">
             <label style="width:100px;">
                 是否有效</label>
             <select name="validFlag" style="width:200px;" class="easyui-combobox">
                 <g:each in="${Category.validFlagMap.keySet()}" var="key">
                     <option value="${key}">${Category.validFlagMap.get(key)}</option>
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
            {field:'id',title:'ID',width:'20%',align:'center'},
           /* {field:'city',title:'所在地区',width:'20%',align:'center',formatter:function(value){
                return value.name;
            }},*/
            {field:'market',title:'超市名称',width:'20%',align:'center'},
            {field:'name',title:'分类名称',width:'20%',align:'center'},
            {field:'no',title:'分类编码',width:'20%',align:'center'},
            {field:'sortType',title:'类型',width:'20%',align:'center'},
            {field:'displayNum',title:'显示序号',width:'20%',align:'center'},
            {field:'validFlag',title:'有效标识',width:'20%',align:'center'}
        ]],
        title:'分类管理',
        iconCls:'icon-edit',//图标
        width: 700,
        height: 'auto',
        nowrap: false,
        striped: true,
        border: true,
        collapsible:true,//是否可折叠的
        fit: true,//自动大小
        url:'categoryListAjax',
        //sortName: 'code',
        //sortOrder: 'desc',
        remoteSort:false,
        idField:'fldId',
        singleSelect:true,//是否单选
        pagination:true,//分页控件
        rownumbers:true,//行号
        frozenColumns:[[
            {field:'ck',checkbox:true}
        ]],
        toolbar: [{
            text: '添加',
            iconCls: 'icon-add',
            handler: function() {
                addCategory();
            }
        }, '-', {
            text: '修改',
            iconCls: 'icon-edit',
            handler: function() {
                updateCategory();
            }
        }, '-',{
            text: '删除',
            iconCls: 'icon-remove',
            handler: function(){
                removeCategory();
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
    function addCategory() {
        var $win;
        $win = $('#dlg').window({
            title: '添加分类信息',
            width: 620,
            height: 450,
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
        url = "addCategory";
        $("#hidtype").val("submit");
    }
    function updateCategory() {
        var row = datagrid.datagrid("getSelected");
        if (row) {
            $("#dlg").dialog("open").dialog('setTitle', '编辑分类');
            $("#fm").form("load", row);
            url = "updateCategory?id=" + row.id;
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
    function removeCategory() {
        var row = datagrid.datagrid('getSelected');
        if (row) {
            $.messager.confirm('提示', '确定要删除选择的数据吗?', function (r) {
                if (r) {
                    $.post('removeCategory', { id: row.id }, function (result) {
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