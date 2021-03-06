<%--
  Created by IntelliJ IDEA.
  User: Andy
  Date: 2016/12/29
  Time: 18:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE HTML>
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
            <label>合并图标类型：</label>
            <select id="s_mergeType" class="easyui-combobox">
                <option value="">全部</option>
                <option value="1">选游戏</option>
                <option value="0">没选游戏</option>
            </select>
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
            <%--<label>运营类型：</label>--%>
            <%--<select id="s_gameType" class="easyui-combobox">--%>
                <%--<option value="0">全部</option>--%>
                <%--<option value="1">独代</option>--%>
                <%--<option value="2">联运</option>--%>
            <%--</select>--%>
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
            idField: 'icMergeRecordId',
            url: '${ctx}/toolboxRecord/iconMergeRecord/list',
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
                {field: 'cch.cchName', title: '渠道名', width: 120,
                    formatter: function (val, row) {return row.cch.cchName;}},
                {field: 'cch.cchShortName', title: '渠道标识', width: 90,
                    formatter: function (val, row) {return row.cch.cchShortName;}},
                {field: 'game.gameId', title: '游戏ID', width: 80, sortable:true,
                    formatter: function (val, row) {
                       if (row.game) {
                           return row.game.gameId;
                       }
                    }},
                {field: 'game.gameName', title: '游戏名称', width: 110,
                    formatter: function (val, row) {
                        if (row.game) {
                            return row.game.gameName;
                        }
                }},
                {field: 'game.gameType', title: '运营类型', width: 70,  sortable:true,
                    formatter: function (val, row) {
                        if (row.game) {
                            var type = row.game.gameType;
                            if (type == 1) {
                                return '独代'
                            } else if (type == 2) {
                                return '联运'
                            } else {
                                return '未知'
                            }
                        }
                    }
                },
                {field: 'game.gameShortName', title: '游戏标识', width: 90,
                    formatter: function (val, row) {
                        if (row.game) {
                            return row.game.gameShortName;
                        }
                }},
                {field: 'icMergeRecordDirection', title: '角标方向', width: 80},
                {field: 'us.username', title: '打包者', width: 80,
                    formatter: function (val, row) {return row.us.username;}},
                {field: 'cchRecordStartDate', title:'开始时间', width:130, sortable:true,
                    formatter: function (val, row) {return toDate(row.icMergeRecordStartDate);}},
                {field: 'cchRecordEndDate', title:'完成时间', width:130, sortable:true,
                    formatter: function (val, row) {return toDate(row.icMergeRecordEndDate);}},
                {field: 'icMergeRecordOutput', title: '图标下载', width: 70,
                    formatter: function (val, row) {
                        var output = row.icMergeRecordOutput;
                        if (output) {
                            return '<a class="wu-table-operation" href="' + output + '" download="image">点击下载</a>';
                        } else {
                            return '';
                        }
                    }
                },
                {field:'icMergeRecordMsgResult', title:'打包结果'}

            ]],
            onLoadSuccess: function () { // 读取数据成功调用
                // 把表格设置为填满空间
                $('.datagrid-wrap').css("height", "100%");
//                $('.datagrid-body').css("height", "100%");
            },
            onSelect: function (val, row) { // 选中行与取消选中处理
                var rowId = row.icMergeRecordId;
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
//        var gameType = $('#s_gameType').combobox('getValue');
        var _cchId = $('#s_cch_id').combobox('getValue');
        var cchShortName = $('#s_cchShortName').combobox('getValue');
        var userId = $('#s_userId').combobox('getValue');
        var sMergeType = $('#s_mergeType').combobox('getValue');

        if (_cchId.trim() == '') { // 空字符串设置为0
            _cchId = 0;
        }

        if (userId.trim() == '') { // 空字符串设置为0
            userId = 0;
        }

        var query_params = {
            "game.gameId" : gameId,
            "game.gameName" : gameName,
//            "game.gameType" : gameType,
            "cch.id" : _cchId,
            "cch.cchShortName" : cchShortName,
            "us.userId" : userId,
            "sMergeType" : sMergeType
        };
        loadData(query_params);
    }


</script>

</body>
</html>
