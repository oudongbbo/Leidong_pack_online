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
            <label>行为名称：</label>
            <input id="s_actionName" class="easyui-textbox" data-options="prompt:'输入行为名称'" />
            <label>操作者：</label>
            <select id="s_actionUser" class="easyui-combobox">
                <option value="">全部</option>
                <c:forEach items="${userList}" var="item">
                    <c:if test="${item.status == 1}">
                        <option value="${item.username}">${item.username}</option>
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
            idField: 'actionId',
            url: '${ctx}/systemLog/actionLog/list',
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
                {field: 'actionName', title: '行为名称', width: 220},
                {field: 'actionUrl', title: '行为链接', width: 340},
                {field: 'actionDate', title: '行为日期', width: 130,
                    formatter: function (val) {return toDate(val);}},
                {field: 'actionUser', title: '操作者', width: 80},
                {field: 'actionParam', title: '行为参数', width: 80,
                    formatter: function (val, row, index) {
                        return '<a class="wu-table-operation" onclick="showParam(' + index + ')" href="#">点击查看</a>';
                    }
                },
            ]],
            onLoadSuccess: function () { // 读取数据成功调用
                // 把表格设置为填满空间
                $('.datagrid-wrap').css("height", "100%");
            },
            onSelect: function (val, row) { // 选中行与取消选中处理
                var rowId = row.actionId;
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
        var actionName = $('#s_actionName').textbox('getValue');
        var actionUser = $('#s_actionUser').combobox('getValue');
        var query_params = {
            'actionName' : actionName,
            'actionUser' : actionUser
        };
        loadData(query_params);
    }

    /** 显示参数 **/
    function showParam(index) {
        var item = $('#wu-datagrid-2').datagrid('getData').rows[index];
        if (item && item.actionParam) {
            var data = item.actionParam.replace(/&/g, '<br />');
            $.messager.alert("行为参数", data);
        }
    }

</script>

</body>
</html>
