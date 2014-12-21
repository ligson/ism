<%@ page import="com.ism.user.domains.User;" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>代码管理</title>
    <script type="text/javascript" src="${resource(dir: "js/ism/systemMgr/", file: "tree.js")}"></script>
    <script type="text/javascript" src="${resource(dir: "js/ism/systemMgr/", file: "codeInfo.js")}"></script>
    <script type="text/javascript">
        $(function () {
            $('#tree').tree({
                checkbox: false,
                url: 'codeSortDataList',
                parentField:"pid",
                textFiled:"text",
                idFiled:"id"
            });
        })
        function append(){
            var t = $('#tree');
            var node = t.tree('getSelected');
            t.tree('append', {
                parent: (node?node.target:null),
                data: [{
                    text: 'new item1'
                },{
                    text: 'new item2'
                }]
            });
        }
        function removeit(){
            var node = $('#tree').tree('getSelected');
            $('#tree').tree('remove', node.target);
        }
        function collapse(){
            var node = $('#tree').tree('getSelected');
            $('#tree').tree('collapse',node.target);
        }
        function expand(){
            var node = $('#tree').tree('getSelected');
            $('#tree').tree('expand',node.target);
        }
    </script>

</head>
<body>
<div class="easyui-layout" data-options="fit:true">
    <div data-options="region:'west'" style="width:200px" title="代码分类">
        <ul id="tree"></ul>
        <div id="treeMenu" class="easyui-menu" style="width:120px;">
            <div onclick="append()" data-options="iconCls:'icon-add'">Append</div>

            <div onclick="removeit()" data-options="iconCls:'icon-remove'">Remove</div>

            <div class="menu-sep"></div>

            <div onclick="expand()">Expand</div>

            <div onclick="collapse()">Collapse</div>
        </div>
    </div>

    <div data-options="region:'center',fit:true" title="代码明细">
        <table id="codeInfoGrid"></table>
    </div>
</div>
</body>
</html>
