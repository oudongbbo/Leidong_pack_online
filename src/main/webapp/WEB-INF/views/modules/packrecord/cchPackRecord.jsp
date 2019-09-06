<%--
  Created by IntelliJ IDEA.
  User: Andy
  Date: 2016/12/29
  Time: 18:31
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
        <div class="wu-toolbar-button">
            <a href="#" class="easyui-linkbutton" iconCls="icon-refresh"
               onclick="javascript:window.location.reload()" plain="false">刷新</a>
        </div>
        <div class="wu-toolbar-search" >
            <label>游戏ID：</label>
            <select id="s_gameId" class="easyui-combobox">
                <option value="">全部</option>
                <c:forEach items="${gameList}" var="item">
                    <option value="${item.gameId}">${item.gameId}</option>
                </c:forEach>
            </select>
            <label>游戏名：</label>
            <select id="s_gameName" class="easyui-combobox">
                <option value="">全部</option>
                <c:forEach items="${gameList}" var="item">
                    <option value="${item.gameName}">${item.gameName}</option>
                </c:forEach>
            </select>
            <label>运营类型：</label>
            <select id="s_gameType" class="easyui-combobox">
                <option value="0">全部</option>
                <option value="1">独代</option>
                <option value="2">联运</option>
            </select>
            <label>渠道：</label>
            <select id="s_cch_id" class="easyui-combobox">
                <option value="0">全部</option>
                <c:forEach items="${cchList}" var="item">
                    <option value="${item.id}">${item.cchName}[${item.cchId}]</option>
                </c:forEach>
            </select>
            <label>渠道标识：</label>
            <select id="s_cchShortName" class="easyui-combobox">
                <option value="">全部</option>
                <c:forEach items="${cchList}" var="item">
                    <option value="${item.cchShortName}">${item.cchShortName}</option>
                </c:forEach>
            </select>
            <label>打包者：</label>
            <select id="s_userId" class="easyui-combobox">
                <option value="0">全部</option>
                <c:forEach items="${userList}" var="item">
                    <c:if test="${item.status == 1}">
                        <option value="${item.userId}">${item.username}</option>
                    </c:if>
                </c:forEach>
            </select>
            <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="startSearch();" >开始检索</a>
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
            url: '${ctx}/packRecord/cchPackRecord/list',
            loadFilter: function (data) { // 数据格式化
                data = {
                    total: data.total,
                    rows: data.rows
                }
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
                {field: 'gameParam.game.gameId', title: '游戏ID', width: 80, sortable:true,
                    formatter: function (val, row) {return row.gameParam.game.gameId;}},
                {field: 'gameParam.game.gameName', title: '游戏名称',
                    formatter: function (val, row) {return row.gameParam.game.gameName;}},
                {field: 'gameParam.game.gameType', title: '运营类型', width: 60,  sortable:true,
                    formatter: function (val, row) {
                        var type = row.gameParam.game.gameType;
                        if (type == 1) {
                            return '独代'
                        } else if (type == 2) {
                            return '联运'
                        } else {
                            return '未知'
                        }
                    }
                },
                {field: 'gameParam.game.gameShortName', title: '游戏标识',
                    formatter: function (val, row) {return row.gameParam.game.gameShortName;}},
                {field: 'gameParam.cch.cchName', title: '渠道名', width: 120,
                    formatter: function (val, row) {return row.gameParam.cch.cchName;}},
                {field: 'gameParam.cch.cchShortName', title: '渠道标识', width: 90,
                    formatter: function (val, row) {return row.gameParam.cch.cchShortName;}},
                {field: 'cchRecord.cchRecordNum', title: '渠道个数', width: 80, sortable:true,
                    formatter: function (val, row) {return row.cchRecord.cchRecordNum;}},
                {field: 'cchRecord.user.username', title: '打包者', width: 80,
                    formatter: function (val, row) {return row.cchRecord.user.username;}},
                {field: 'cchRecord.cchRecordStartDate', title:'开始时间', width:130, sortable:true,
                    formatter: function (val, row) {return toDate(row.cchRecord.cchRecordStartDate);}},
                {field: 'cchRecord.cchRecordEndDate', title:'完成时间', width:130, sortable:true,
                    formatter: function (val, row) {return toDate(row.cchRecord.cchRecordEndDate);}},
                {field: 'desc', title:'母包详情', width:70,
                    formatter: function (val, row)
                    {return '<a class="wu-table-operation" href="#">点击预览</a>';}},
                {field: 'cchRecord.cchRecordOutput', title: '渠道包', width: 70,
                    formatter: function (val, row) {
                        var output = row.cchRecord.cchRecordOutput;
                        if (output) {
                            return '<a class="wu-table-operation" href="' + output + '">点击下载</a>';
                        } else {
                            return '';
                        }
                    }
                },
                {field:'cchRecord.cchRecordResultMsg', title:'打包结果',
                    formatter: function (val, row) {return row.cchRecord.cchRecordResultMsg;}
                }

            ]],
            onLoadSuccess: function () { // 读取数据成功调用
                // 把表格设置为填满空间
                $('.datagrid-wrap').css("height", "100%");
//                $('.datagrid-body').css("height", "100%");
            },
            onSelect: function (val, row) { // 选中行与取消选中处理
                var rowId = row.cchRecord.cchRecordId;
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
        var gameId = $('#s_gameId').combobox('getValue');
        var gameName = $('#s_gameName').combobox('getValue');
        var gameType = $('#s_gameType').combobox('getValue');
        var cch_id = $('#s_cch_id').combobox('getValue');
        var cchShortName = $('#s_cchShortName').combobox('getValue');
        var userId = $('#s_userId').combobox('getValue');

        if (cch_id.trim() == '') { // 空字符串设置为0
            cch_id = 0;
        }

        if (gameType.trim() == '') { // 空字符串设置为0
            gameType = 0;
        }

        if (userId.trim() == '') { // 空字符串设置为0
            userId = 0;
        }

        var query_params = {
            'gameParam.game.gameId' : gameId,
            'gameParam.game.gameName' : gameName,
            'gameParam.game.gameType' : gameType,
            'gameParam.cch.id' : cch_id,
            'gameParam.cch.cchShortName' : cchShortName,
            'cchRecord.user.userId' : userId
        };
        loadData(query_params);
    }

</script>

</body>
</html>
