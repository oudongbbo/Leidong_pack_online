<%--
  Created by IntelliJ IDEA.
  User: Andy
  Date: 2017/1/22
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
</head>
<body>
<div id="wu-layout" class="easyui-layout" data-options="fit:true">
    <!-- Begin of toolbar -->
    <div id="wu-toolbar-2">
        <div class="wu-toolbar-search" >
            <label>打包功能名称：</label>
            <input id="s_menuName" class="easyui-textbox" data-options="prompt:'输入打包功能名称'" />
            <label>操作者：</label>
            <select id="s_userId" class="easyui-combobox">
                <option value="">全部</option>
                <c:forEach items="${userList}" var="item">
                    <c:if test="${item.status == 1}">
                        <option value="${item.userId}">${item.username}</option>
                    </c:if>
                </c:forEach>
            </select>
            <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="startSearch();" >开始检索</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-refresh"
               onclick="javascript:window.location.reload()" plain="false">刷新</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="wu-datagrid-2" toolbar="#wu-toolbar-2"></table>
</div>

<script type="text/javascript">

    /**
     * Name 载入数据
     */
    function loadData(query_params) {
        var onselect = false;
        var selectId = 0;
        $('#wu-datagrid-2').datagrid({
            idField: 'packLogId',
            url: '${ctx}/systemLog/packLog/list',
            loadFilter: function (data) { // 数据格式化
                data = {
                    total: data.total,
                    rows: data.rows
                };
                return data;
            },
            rownumbers: true,
            singleSelect: true,
            queryParams: query_params,
            pageSize: 30,
            pageList: [20, 30, 40, 50, 100],
            pagination:true,
            remoteSort: false,
            multiSort:false,
            fitColumns:false,
            striped: true,
            fit: true,
            columns: [[
                {field: 'menu.menuName', title: '打包功能名称', width: 220,
                    formatter: function (val, row) {return row.menu.menuName;}},
                {field: 'user.username', title: '打包者', width: 200,
                    formatter: function (val, row) {return row.us.username;}},
                {field: 'packLogDate', title: '打包日期', width: 220,
                    formatter: function (val) {return toDate(val);}},
                {field: 'packLogResult', title: '打包结果', width: 120,
                    formatter: function (val) {
                        if (val == 0) {
                            return '<span class="text-hide">失败</span>';
                        } else if (val == 1) {
                            return '<span class="text-active">成功</span>';
                        }
                }},
                {field: 'packLogPath', title: '日志下载', width: 120,
                    formatter: function (val) {
                        var link = '${ctxRes}' + val;
                        return '<a class="wu-table-operation" download="" href="' + link + '">点击下载</a>';
                    }
                }
            ]],
            onLoadSuccess: function () { // 读取数据成功调用
                // 把表格设置为填满空间
                $('.datagrid-wrap').css("height", "100%");
            },
            onSelect: function (val, row) { // 选中行与取消选中处理
                var rowId = row.packLogId;
                var select = $(this).datagrid('getSelected');
                if (select != null && onselect == true && selectId == rowId) {
                    $(this).datagrid('unselectAll');
                    onselect = false;
                } else {
                    selectId = rowId;
                    onselect = true;
                }
            },
            onLoadError: function (result) {
                $.messager.alert("错误", "获取数据出错!", "error");
            }
        });
    }

    /**
     * 加载完毕后调用读取数据
     */
    $(document).ready(function () {
        loadData();
    });

    /**
     * 窗口改变时表格自适应
     */
    $(window).resize(function () {
        // 自适应高度
        $('.datagrid-view').css("height", "100%");
        $('.datagrid-body').css("height", "100%");

        // 自适应宽度
        var width = $('body').innerWidth() - 2;
        $('.datagrid').css("width", width + 2);
        $('.datagrid-wrap').css("width", width);
        $('.datagrid-view').css("width", width);
        $('.datagrid-view2').css("width", width - 26);
        $('.datagrid-header').css("width", width);
    });


    /**
     * 转换成日期
     * @param ns
     * @returns {string}
     */
    function toDate(ns) {
        if (ns) {
            var d = new Date(ns);
            var dformat = [ d.getFullYear(), d.getMonth() + 1, d.getDate() ].join('/')
                + ' ' + [ d.getHours(), d.getMinutes()].join(':');
            return dformat;
        } else {
            return '';
        }
    }


    /**
     * 开始检索
     */
    function startSearch() {
        var menuName = $('#s_menuName').textbox('getValue');
        var userId = $('#s_userId').combobox('getValue');

        if (userId.trim() == '') { // 空字符串设置为0
            userId = 0;
        }

        var query_params = {
            'menu.menuName': menuName,
            'us.userId': userId
        };
        loadData(query_params);
    }

</script>

</body>
</html>
