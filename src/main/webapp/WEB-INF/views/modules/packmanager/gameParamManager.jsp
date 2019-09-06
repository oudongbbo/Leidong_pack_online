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
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openAdd()" plain="false">新增游戏参数</a>
            <a href="#" class="easyui-linkbutton wu-toolbar-button-padding" iconCls="icon-refresh"
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
            <label>游戏名称：</label>
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
            <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="startSearch();" >开始检索</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="wu-datagrid-2" toolbar="#wu-toolbar-2"></table>
</div>
<!-- Begin of easyui-dialog -->

<div id="wu-dialog-2" class="easyui-dialog" data-options="closed:true, iconCls:'icon-save'"
     style="min-width:430px; width: auto; padding:10px; display: none;">
    <form id="wu-form-2" method="post" enctype="multipart/form-data">
        <table style="border-collapse:separate; border-spacing:0px 6px;">
            <tr>
                <td align="right">游戏名称：</td>
                <td>
                    <select id="wu-dialog-gameName" name="game.id" class="easyui-combobox"
                            panelHeight="auto" style="width:250px" title="gameType" data-options="required:true">
                        <option value="0">请选择</option>
                        <c:forEach items="${gameList}" var="item">
                            <option value="${item.id}">${item.gameName}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr id="wu-form-2-table-gameId">
                <td align="right">游戏ID：</td>
                <td><span id="wu-dialog-gameId"></span></td>
            </tr>
            <tr>
                <td align="right">游戏标识：</td>
                <td><span id="wu-dialog-gameShortName"></span></td>
            </tr>
            <tr>
                <td align="right">运营类型：</td>
                <td id="wu-dialog-gameType"></td>
            </tr>
            <tr>
                <td align="right">渠道名称：</td>
                <td>
                    <select id="wu-dialog-cchName" name="cch.id" class="easyui-combobox"
                            panelHeight="auto" style="width:250px" title="cchName"
                            data-options="required:true">
                        <option value="0">请选择</option>
                        <c:forEach items="${cchList}" var="item">
                            <option value="${item.id}">${item.cchName}(${item.cchShortName} ${item.cchId})</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right">渠道标识：</td>
                <td><span id="wu-dialog-cchShortName"></span></td>
            </tr>
            <tr>
                <td align="right">固定参数：</td>
                <td>
                    <table>
                        <tr>
                            <td align="right">横竖屏：</td>
                            <td>
                                <select name="record.isLandScape" class="easyui-combobox"
                                        panelHeight="auto" style="width:250px" title="isLandScape"
                                        data-options="required:true">
                                    <option value="1">横屏</option>
                                    <option value="0">竖屏</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">是否定额：</td>
                            <td>
                                <select name="record.isFinal" class="easyui-combobox"
                                        panelHeight="auto" style="width:250px" title="isFinal"
                                        data-options="required:true">
                                    <option value="1">定额</option>
                                    <option value="0">不定额</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">重建R文件：</td>
                            <td>
                                <select name="record.replaceR" class="easyui-combobox"
                                        panelHeight="auto" style="width:250px" title="replaceR"
                                        data-options="required:true">
                                    <option value="0">否</option>
                                    <option value="1">是</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">包名：</td>
                            <td>
                                <input type="text" name="record.pname" class="wu-text easyui-textbox"
                                       autocomplete="off" data-options="prompt:'如：com.starjoys.ysdk',
                                        required:true"
                                       placeholder="如：com.starjoys.ysdk"/>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="right">渠道参数：</td>
                <td id="wu-dialog-alone-param">

                </td>
            </tr>
            <tr>
                <td align="right">游戏Icon：</td>
                <td><input name="iconFile" class="wu-text easyui-filebox"
                           data-options="buttonText:'选择文件', accept:'.png', prompt:'只支持png格式'"/></td>
            </tr>
            <tr>
                <td align="right" style="vertical-align: top;">更新说明：</td>
                <td><input name="record.gpRecordUpDesc" class="wu-textarea easyui-textbox"
                           data-options="prompt:'首次建立游戏参数', multiline:true, required:true, validType:'length[1,200]'"
                           style="height: 60px;" autocomplete="off" placeholder="首次游戏渠道关联"/></td>
            </tr>
        </table>
    </form>
</div>

<div id="wu-dialog-3" class="easyui-dialog" data-options="closed:true, iconCls:'icon-save'"
     style="min-width:460px; width: auto; padding:10px; display: none;">
    <form id="wu-form-3" method="post" enctype="multipart/form-data">
        <table style="border-collapse:separate; border-spacing:0px 6px;">
            <tr>
                <td align="right">游戏ID：</td>
                <td><span name="game.gameId"></span></td>
            </tr>
            <tr>
                <td align="right">游戏名称：</td>
                <td><span name="game.gameName"></span></td>
            </tr>
            <tr>
                <td align="right">游戏标识：</td>
                <td><span name="game.gameShortName"></span></td>
            </tr>
            <tr>
                <td align="right">运营类型：</td>
                <td><span name="game.gameType"></span></td>
            </tr>
            <tr>
                <td align="right">渠道名称：</td>
                <td><span name="cch.cchName"></span></td>
            </tr>
            <tr>
                <td align="right">渠道标识：</td>
                <td><span name="cch.cchShortName"></span></td>
            </tr>
            <tr>
                <td align="right">固定参数：</td>
                <td>
                    <table>
                        <tr>
                            <td align="right">横竖屏：</td>
                            <td>
                                <select name="record.isLandScape" class="easyui-combobox"
                                        panelHeight="auto" style="width:250px" title="isLandScape"
                                        data-options="required:true">
                                    <option value="1">横屏</option>
                                    <option value="0">竖屏</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">是否定额：</td>
                            <td>
                                <select name="record.isFinal" class="easyui-combobox"
                                        panelHeight="auto" style="width:250px" title="isFinal"
                                        data-options="required:true">
                                    <option value="1">定额</option>
                                    <option value="0">不定额</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">重建R文件：</td>
                            <td>
                                <select name="record.replaceR" class="easyui-combobox"
                                        panelHeight="auto" style="width:250px" title="replaceR"
                                        data-options="required:true">
                                    <option value="0">否</option>
                                    <option value="1">是</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">包名：</td>
                            <td>
                                <input type="text" name="record.pname" class="wu-text easyui-textbox"
                                       autocomplete="off" data-options="prompt:'如：com.starjoys.ysdk',
                                        required:true"
                                       placeholder="如：com.starjoys.ysdk"/>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="right">渠道参数：</td>
                <td id="wu-dialog-3-alone-param"></td>
            </tr>
            <tr>
                <td align="right">游戏Icon：</td>
                <td><input name="iconFile" class="wu-text easyui-filebox"
                           data-options="buttonText:'选择文件', accept:'.png', prompt:'只支持png格式'"/></td>
            </tr>
            <tr>
                <td align="right" style="vertical-align: top;">更新说明：</td>
                <td><input name="record.gpRecordUpDesc" class="wu-textarea easyui-textbox"
                           data-options="prompt:'首次建立游戏参数', multiline:true, required:true, validType:'length[1,200]'"
                           style="height: 60px;" autocomplete="off" placeholder="首次游戏渠道关联"/></td>
            </tr>
            <tr style="display: none">
                <td>游戏参数Id：</td>
                <td><input type="hidden" name="gameParamId" /></td>
            </tr>
            <tr style="display: none">
                <td>游戏Id：</td>
                <td><input type="hidden" name="game.id" /></td>
            </tr>
            <tr style="display: none">
                <td>图标：</td>
                <td><input type="hidden" name="gameParamIcon" /></td>
            </tr>
        </table>
    </form>
</div>

<!-- End of easyui-dialog -->

<script type="text/javascript">

    //弹出加载层
    function load() {
        $("<div class='datagrid-mask'></div>").css({
            display: "block", width: "100%",
            height: $(window).height()
        }).appendTo("body");
        $("<div class='datagrid-mask-msg'></div>").html("数据上传中，请稍候。。。").appendTo("body").css({
            display: "block", left: ($(document.body).outerWidth(true) - 190) / 2,
            top: ($(window).height() - 45) / 2
        });
    }

    //取消加载层
    function disLoad() {
        $(".datagrid-mask").remove();
        $(".datagrid-mask-msg").remove();
    }

    /**
     * Name 添加记录
     */
    function add() {
        $('#wu-form-2').form('submit', {
            url: '${ctx}/packManager/gameParam/add',
            success: function (data) {
                // 隐藏
                disLoad();

                // 返回数据处理
                if (data) {
                    try {
                        var dat = eval('(' + data + ')'); // 转换为json对象
                        if (dat && dat.success) {
                            reloadOtherPackManager();
                            $.messager.alert('信息提示', '添加成功！', 'info', function () {
                                window.location.reload();
                            });
                            $('#wu-dialog-2').dialog('close');
                        }
                        else {
                            $.messager.alert('信息提示', dat.message + '!', 'error');
                        }
                    } catch (e) {
                        $.messager.alert('信息提示', data + '!', 'error');
                    }
                }
            },
            onSubmit: function () {
                if ($(this).form('validate')) { // 先进行验证
                    // 提交时显示时显示加载样式, 关闭对话框
                    load();
                    $('#wu-dialog-2').dialog('close');
                    return true;
                } else {
                    return false;
                }
            }
        });
    }

    /**
     * Name 修改记录
     */
    function edit() {
        $('#wu-form-3').form('submit', {
            url: '${ctx}/packManager/gameParam/edit',
            success: function (data) {
                // 隐藏
                disLoad();

                // 返回数据处理
                if (data) {
                    try {
                        var dat = eval('(' + data + ')'); // 转换为json对象
                        if (dat && dat.success) {
                            reloadOtherPackManager();
                            $.messager.alert('信息提示', '更新成功！', 'info', function () {
                                $('#wu-datagrid-2').datagrid('reload');
                            });
                            $('#wu-dialog-3').dialog('close');
                        }
                        else {
                            $.messager.alert('信息提示', dat.message + '!', 'error');
                        }
                    } catch (e) {
                        $.messager.alert('信息提示', data + '!', 'error');
                    }
                }
            },
            onSubmit: function () {
                if ($(this).form('validate')) { // 先进行验证
                    // 提交时显示时显示加载样式, 关闭对话框
                    load();
                    $('#wu-dialog-3').dialog('close');
                    return true;
                } else {
                    return false;
                }
            }
        });
    }

    /**
     * Name 删除记录
     */
    function removeData(index) {
        var item = $('#wu-datagrid-2').datagrid('getData').rows[index];
        if (item) {
            $.messager.confirm("确认删除", "确认删除此数据", function (result) {
                if (result) {
                    $.messager.progress({
                        title: "提示",
                        msg: "操作进行中"
                    });

                    $.ajax({
                        url: '${ctx}/packManager/gameParam/status?id=' + item.gameParamId,
                        success: function (data) {
                            $.messager.progress('close');
                            if (data && data.success) {
                                reloadOtherPackManager();
                                $.messager.alert('信息提示', '删除成功!');
                                $('#wu-datagrid-2').datagrid('reload');
                                return;
                            }
                            $.messager.alert('信息提示', data.message + '!', 'error');
                        },
                        error: function (xmlhttp) {
                            $.messager.progress('close');
                            showErrorMessage(xmlhttp.status, "请求错误!");
                        }
                    });
                }
            });
        } else {
//            $.messager.alert("信息提示", "请先选择修改的数据项", "info");
        }
    }

    /**
     * Name 打开添加窗口
     */
    function openAdd() {
        $("#wu-form-2-table-gameId").css("display", "");
        $('#wu-dialog-2').dialog({
            closed: false,
            modal: true,
            title: "新增游戏参数",
            left: 600,
            top: 140,
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: add
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#wu-dialog-2').dialog('close');
                }
            }]
        });
    }

    /**
     * Name 打开修改窗口
     */
    function openEdit(index) {
        var item = $('#wu-datagrid-2').datagrid('getData').rows[index];
        if (item) {
            handlerBaseData(item); // 处理基础数据

            $('#wu-dialog-3').dialog({
                closed: false,
                modal: true,
                title: "更新游戏参数",
                left: 600,
                top: 140,
                buttons: [{
                    text: '确定',
                    iconCls: 'icon-ok',
                    handler: edit
                }, {
                    text: '取消',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        $('#wu-dialog-3').dialog('close');
                    }
                }]
            });
        } else {
//            $.messager.alert("信息提示", "请先选择修改的数据项", "info");
        }
    }

    /** 处理基础数据 **/
    function handlerBaseData(item) {
        $("#wu-dialog-3 input[name='game.id']").val(item.game.id);

        $("span[name='game.gameId']").text(item.game.gameId);
        $("span[name='game.gameName']").text(item.game.gameName);
        $("span[name='game.gameShortName']").text(item.game.gameShortName);
        $("span[name='cch.cchName']").text(item.cch.cchName + '(' + item.cch.cchShortName
            + ' ' + item.cch.cchId + ')');
        $("span[name='cch.cchShortName']").text(item.cch.cchShortName);
        var gameTypeSpan = $("span[name='game.gameType']");
        if (item.game.gameType == 1) {
            gameTypeSpan.text("独代");
        } else if (item.game.gameType == 2) {
            gameTypeSpan.text("联运");
        } else {
            gameTypeSpan.text("未知");
        }

        var dialog = $("#wu-dialog-3");
        dialog.find("input[textboxname='record.gpRecordUpDesc']").textbox("setValue", item.record.gpRecordUpDesc); // 更新说明
        dialog.find("input[name='gameParamIcon']").val(item.gameParamIcon); // 图标
        dialog.find("input[name='gameParamId']").val(item.gameParamId); // id

        // 动态创建表单
        var aloneParam = $("#wu-dialog-3-alone-param");
        createFormByParam(aloneParam, dialog, getCchById(item.cch.id), item.game.gameId); // 创建表单

        // 给动态生成的表单赋值
        var data = item.record.gpRecordData;
        var dataParamList = data.split("\r\n");
        for (var i = 0; i < dataParamList.length; i++) {
            var dividerIndex = dataParamList[i].indexOf('='); // 拆分=参数, 左边为参数名, 右边为参数值
            if (dividerIndex != -1) {
                var key = dataParamList[i].substring(0, dividerIndex); // 等于号前面的参数名
                var value = dataParamList[i].substr(dividerIndex + 1); // 等于号后面的参数值
                var commonParamInput;
                if (key == "isLandScape" || key == "isFinal" || key == "replaceR") { // 横竖屏 定额
                    commonParamInput = "select[comboname='record." + key + "']";
                    dialog.find(commonParamInput).combobox("setValue", value);
                    continue;
                } else if (key == "pname") { // 包名
                    commonParamInput = "input[textboxname='record." + key + "']";
                    dialog.find(commonParamInput).textbox("setValue", value);
                    continue;
                } else { // 动态参数
                    var cchParamInput = "input[textboxname='allParam-" + key + "']";
                    dialog.find(cchParamInput).textbox("setValue", value);
                }
            }
        }
    }

    /**
     * Name 载入数据
     */
    function loadData(query_params) {
        var onselect = false;
        var selectId = 0;
        $('#wu-datagrid-2').datagrid({
            idField: 'gameParamId',
            url: '${ctx}/packManager/gameParam/list',
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
            fitColumns: false,
            striped: true,
            fit: true,
            columns: [[
                {
                    field: 'game.gameId', title: '游戏ID', width: 80, sortable: true,
                    formatter: function (val, row) {
                        return row.game.gameId;
                    }
                },
                {
                    field: 'game.gameName', title: '游戏名称',
                    formatter: function (val, row) {
                        return row.game.gameName;
                    }
                },
                {
                    field: 'game.gameType', title: '运营类型', width: 70, sortable: true,
                    formatter: function (val, row) {
                        var type = row.game.gameType;
                        if (type == 1) {
                            return '独代'
                        } else if (type == 2) {
                            return '联运'
                        } else {
                            return '未知'
                        }
                    }
                },
                {
                    field: 'game.gameShortName', title: '游戏标识',
                    formatter: function (val, row) {
                        return row.game.gameShortName;
                    }
                },
                {
                    field: 'cch.cchName', title: '渠道名', width: 100,
                    formatter: function (val, row) {
                        return row.cch.cchName;
                    }
                },
                {
                    field: 'cch.cchShortName', title: '渠道标识', width: 100,
                    formatter: function (val, row) {
                        return row.cch.cchShortName;
                    }
                },
                {
                    field: 'gameParamIcon', title: '图标', width: 70,
                    formatter: function (val) {
                        if (val == 1) {
                            return '<span style="color: #3e8f3e; font-weight: bold;">已上传</span>';
                        } else {
                            return '无';
                        }
                    }
                },
                {
                    field: 'gameParamCreateDate', title: '创建时间', width: 120, sortable: true,
                    formatter: function (val) {
                        return toDate(val);
                    }
                },
                {
                    field: 'recrod.gpRecordUpDate', title: '更新时间', width: 120, sortable: true,
                    formatter: function (val, row) {
                        return toDate(row.record.gpRecordUpDate);
                    }
                },
                {
                    field: 'operation', title: '操作', width: 60, formatter: function (val, row, index) {
                    return '<a class="wu-table-operation" onclick="openEdit(' + index + ')" href="#">更新</a>';
                }
                },
                {
                    field: 'operation1', title: '操作1', width: 80, formatter: function (val, row) {
                    return '<a class="wu-table-operation" href="gameParamRecord?gameParamId=' + row.gameParamId + '">查询详情</a>';
                }
                },
                {
                    field: 'operation2', title: '操作2', width: 60, formatter: function (val, row, index) {
                    return '<a class="wu-table-operation" onclick="removeData(' + index + ')" href="#">删除</a>';
                }
                }
            ]],
            onLoadSuccess: function (data) { // 读取数据成功调用
                // 把表格设置为填满空间
                $('.datagrid-wrap').css("height", "100%");
//                $('.datagrid-body').css("height", "100%");
            },
            onSelect: function (val, row) { // 选中行与取消选中处理
                var rowId = row.gameParamId;
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
    var currentSelectedGameId = null;
    $(document).ready(function () {
        loadData();

        // 游戏下拉框选择事件
        $("#wu-dialog-gameName").combobox({
            onChange: function(n, o) {
                var gameList = JSON.parse('${gameListJson}'.replace(/\r\n/g, "\\r\\n")); // 把字符串转为对象
                var i = 0;
                for (; i < gameList.length; i++) {
                    if (gameList[i].id == n) {
                        currentSelectedGameId = gameList[i].gameId;

                        $("#wu-dialog-gameId").text(gameList[i].gameId); // 读取游戏ID
                        $("#wu-dialog-gameShortName").text(gameList[i].gameShortName); // 读取游戏标识
                        var gameType;
                        switch (gameList[i].gameType) {
                            case 1: gameType = '独代'; break;
                            case 2: gameType = '联运'; break;
                        }
                        $("#wu-dialog-gameType").text(gameType); // 读取运营类型
                        break;
                    }
                }
                if (i >= gameList.length) { // 清空
                    $("#wu-dialog-gameId").text("");
                    $("#wu-dialog-gameShortName").text("");
                    $("#wu-dialog-gameType").text("");
                    currentSelectedGameId = null;
                }
            }
        });

        // 渠道下拉框选择事件
        $("#wu-dialog-cchName").combobox({
            onChange: function(n, o) {
                var cch = getCchById(n);
                if (cch) {
                    $("#wu-dialog-cchShortName").text(cch.cchShortName); // 读取渠道标识

                    // 动态创建表单
                    var aloneParam = $("#wu-dialog-alone-param");
                    var dialog = $("#wu-dialog-2");
                    createFormByParam(aloneParam, dialog, cch, currentSelectedGameId); // 创建表单
                } else { // 清空
                    $("#wu-dialog-cchShortName").text("");
                    $("#wu-dialog-alone-param").text("");
                }

            }
        });

    });

    /**
     * 通过id获取渠道对象
     */
    function getCchById(_cchId) {
        var cchListJson = '${cchListJson}';
        cchListJson = cchListJson.replace(/\r\n/g, "\\r\\n");
        var cchList = JSON.parse(cchListJson);
        for (var i = 0; i < cchList.length; i++) {
            if (cchList[i].id == _cchId) {
                return cchList[i];
            }
        }
        return null;
    }

    /**
     * 通过参数构造表单
     */
    function createFormByParam(item, dialog, cch, gameId) {
        var html = "<table id='wu-dialog-alone-param-table'>";
        if (cch.cchAllParam && cch.cchAllParam.trim() != "") {
            // 拆分换行参数
            var cchAllParamList = cch.cchAllParam.split("\r\n");
            var cchRequireParamList = cch.cchRequireParam.split("\r\n");
            // 组装渠道参数列表
            for (var i = 0; i < cchAllParamList.length; i++) {
                var dividerIndex = cchAllParamList[i].indexOf('='); // 拆分=参数, 左边为参数名, 右边为参数值
                if (dividerIndex != -1) {
                    var allAttr0 = cchAllParamList[i].substring(0, dividerIndex); // 等于号前面的参数名
                    var allAttr1 = cchAllParamList[i].substr(dividerIndex + 1); // 等于号后面的参数值

                    var prompt = "";
                    // 判断是否有hint
                    if (allAttr1) {
                        prompt = allAttr1;
                    }

                    // 必填处理
                    var isRequire = null;
                    for (var j = 0; j < cchRequireParamList.length; j++) {
                        var requireAttr = cchRequireParamList[j].replace("=", ""); // 拆分=参数, 左边为必填参数, 右边只有等于号
                        if (requireAttr == allAttr0) { // 相等就意味着必填
                            isRequire = true;
                            break;
                        }
                    }

                    // 组装参数html
                    html = html + "<tr><td align='right'>" + allAttr0
                        + "：<td><td>" + createParamInput("allParam-" + allAttr0, prompt, isRequire) + "</td></tr>";
                }
            }
        }

        if (gameId != null) {
            if (gameId == "100195") { // 碰碰车需要增加一个qq分享id参数
                html = html + "<tr><td align='right'>qq_appid：<td><td>"
                    + createParamInput("allParam-qq_appid", "疯狂碰碰车的qq分享id", true) + "</td></tr>";
            }
        }
        html += "</table>";
        // 显示列表
        item.text("");
        var result = item.append(html);

        // 渲染渠道参数列表, 并调整宽度
        $.parser.parse(result.parent());
        dialog.css("width", "auto");
        dialog.siblings().css("width", "auto");
    }

    /**
     * 创建参数输入框
     */
    function createParamInput(name, prompt, isRequire) {
        if (prompt != "") {
            prompt = "如：" + prompt;
        }
        if (isRequire) {
            var input = "<input type='text' name='" + name + "' class='wu-text easyui-textbox' " +
                " autocomplete='off' data-options='prompt:\"" + prompt + "\", required:true' />";
        } else {
            input = "<input type='text' name='" + name + "' class='wu-text easyui-textbox' " +
            " autocomplete='off' data-options='prompt:\"" + prompt + "\"' />";
        }
        return input;
    }


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
     * 显示错误信息
     * @param status 状态码
     * @param oriMessage 信息
     */
    function showErrorMessage(status, oriMessage) {
        if (status == 404) {
            oriMessage = '找不到网址!';
        } else if (status == 403) {
            oriMessage = '无权限!';
        }
        $.messager.alert('信息提示', oriMessage, 'error');
    }

    /**
     * 转换成日期
     * @param ns
     * @returns {string}
     */
    function toDate(ns) {
        var d = new Date(ns);
        var dformat = [d.getFullYear(), d.getMonth() + 1, d.getDate()].join('/')
            + ' ' + [d.getHours(), d.getMinutes()].join(':');
        return dformat;
    }

    /**
     * 刷新其他打包管理页面
     */
    function reloadOtherPackManager() {
        window.parent.reloadPackManagerTab("游戏参数管理");
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

        if (cch_id.trim() == '') { // 空字符串设置为0
            cch_id = 0;
        }

        if (gameType.trim() == '') { // 空字符串设置为0
            gameType = 0;
        }


        var query_params = {
            'game.gameId' : gameId,
            'game.gameName' : gameName,
            'game.gameType' : gameType,
            'cch.id' : cch_id,
            'cch.cchShortName' : cchShortName
        };
        loadData(query_params);
    }


</script>

</body>
</html>
