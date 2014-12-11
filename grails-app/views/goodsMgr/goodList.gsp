<%@ page import="com.ism.market.domains.Market" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>商品管理</title>
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
                选择地区</label>
            <input class="easyui-combotree" id="cid"  name="cid" data-options="url:'cityList',method:'get',required:true" style="width:200px;">
        </div>
        <div class="fitem">
            <label style="width:100px;">
                选择超市
            </label>
            <input name="mid" id="mid" class="easyui-combobox"  data-options="valueField:'id',textField:'name',url:'',required:true"  style="width:200px;">
        </div>
         <div class="fitem">
             <label style="width:100px;">
                 选择分类
             </label>
             <input name="categoryId" id="categoryId" class="easyui-combobox"  data-options="valueField:'id',textField:'name',url:'',required:true"  style="width:200px;">
         </div>
        <div class="fitem">
            <label style="width:100px;">
                商品名称
            </label>
            <input name="name"  class="easyui-validatebox" required="true" style="width:200px;"/>
        </div>
         <div class="fitem">
             <label style="width:100px;">
                 商品编号
             </label>
             <input name="no"  class="easyui-validatebox" required="true" style="width:200px;"/>
         </div>
        <div class="fitem">
            <label style="width:100px;">
                商品内容
            </label>
            <ueditor:editor id="content" name="content" style="width:100%;height:360px;">Hello World</ueditor:editor>

        </div>
        <div class="fitem">
            <label style="width:100px;">
                备注
            </label>
            <input name="remark"  class="easyui-validatebox" required="true" style="width:200px;"/>
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
            {field:'city',title:'所在地区',width:'20%',align:'center',formatter:function(value){
                return value.name;
            }},
            {field:'market',title:'超市名称',width:'20%',align:'center',formatter:function(value){
                return value.name;
            }},
            {field:'category',title:'分类名称',width:'20%',align:'center',formatter:function(value){
                return value.name;
            }},
            {field:'name',title:'商品名称',width:'20%',align:'center'},
            {field:'no',title:'商品名称',width:'20%',align:'center'},
            {field:'remark',title:'备注',width:'20%',align:'center'},
            {field:'sendTime',title:'发布时间',width:'20%',align:'center'}
        ]],
        title:'商品管理',
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
                addGood();
            }
        }, '-', {
            text: '修改',
            iconCls: 'icon-edit',
            handler: function() {
                updateGood();
            }
        }, '-',{
            text: '删除',
            iconCls: 'icon-remove',
            handler: function(){
                removeGood();
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
    //地区，超市，分类联动
    function linkSelect() {
        $("#cid").combotree({
            onSelect: function (data) {
                if(typeof(data)!='undefined'){
                    var cid = data.id;
                    $("#mid").combobox('clear','');
                    $("#categoryId").combobox('clear','');
                    var url = "getMarketListJson?cid=" + cid;
                    $('#mid').combobox('reload', url);  // 使用新的URL重新载入列表数据
                }
            }
        });
         $("#mid").combobox({
            onSelect: function (value) {
                if(typeof(value)!='undefined'){
                    $("#categoryId").combobox('clear','');
                    var mid = value.id;
                    var url = "getCategoryListJson?mid=" + mid;
                    $("#categoryId").combobox('reload', url);
                }

            }
        });
    }
    function addGood() {
        var $win;
        $win = $('#dlg').window({
            title: '添加商品信息',
            width: 820,
            height: 650,
            shadow: true,
            modal: true,
            iconCls: 'icon-add',
            closed: true,
            minimizable: true,
            maximizable: true,
            maximized:true,
            collapsible: true
        });
        linkSelect();
        $win.window('open');
        $("#fm").form("clear");
        url = "addGood";
        $("#hidtype").val("submit");
    }
    var mCombox;
    function updateGood() {
        var row = datagrid.datagrid("getSelected");
        linkSelect();
        if (row) {
            $('#cid').combotree('setValue', row.city.id);//地区
            //根据地区id查询超市
             url = "getMarketListJson?cid=" + row.city.id;
            $('#mid').combobox('reload', url);  // 使用新的URL重新载入列
            $('#mid').combobox('setValue', row.market.id);//超市
            //根据超市id查询分类
            url = "getCategoryListJson?mid=" + row.market.id;
            $("#categoryId").combobox('reload', url);
            $('#categoryId').combobox('setValue', row.category.id);//分类
            $("#dlg").dialog("open").dialog('setTitle', '编辑超市');
            $("#fm").form("load", row);
            url = "updateGood?id=" + row.id;
        }
    }
    function save() {
        alert(url);
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
    function removeGood() {
        var row = datagrid.datagrid('getSelected');
        if (row) {
            $.messager.confirm('提示', '确定要删除选择的数据吗?', function (r) {
                if (r) {
                    $.post('removeGood', { id: row.id }, function (result) {
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

    $(document).ready(function () {



    });


</script>
</body>
</html>