<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户管理</title>
        <r:require modules="jquery,jquery-easyui"/>
        <r:layoutResources/>
        <r:layoutResources/>
    <link type="text/css" rel="stylesheet" href="${resource(dir: 'js/lib/jquery-easyui-1.4.1/demo/', file: 'demo.css')}"/>
</head>
<body>

<table id="list_data" cellspacing="0" cellpadding="0">
    <thead>
    <tr>
        <th field="fldAppDept" width="100">部门</th>
        <th field="fldAppNode" width="100">网站</th>
        <th field="fldAppName" width="100">名称</th>
        <th field="fldAppMgr" width="100">管理员</th>
        <th field="fldAppNote" width="100">注释</th>
        <th field="fldAppType" width="100">类型</th>
        <th field="fldTelphone" width="100">电话</th>
        <th field="fldAppImg" width="100">职务</th>
        <th field="fldAppMonitor" width="100">启用监测</th>
        <th field="fldAppLevel" width="100">要重级别</th>
    </tr>
    </thead>
</table>
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
        collapsible:false,//是否可折叠的
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
                openDialog("add_dialog","add");
            }
        }, '-', {
            text: '修改',
            iconCls: 'icon-edit',
            handler: function() {
                openDialog("add_dialog","edit");
            }
        }, '-',{
            text: '删除',
            iconCls: 'icon-remove',
            handler: function(){
                delAppInfo();
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
</script>
</body>
</html>