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
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openAdd()" plain="false">新增游戏</a>
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
            <label>游戏名：</label>
            <select id="s_gameName" class="easyui-combobox">
                <option value="">全部</option>
                <c:forEach items="${gameList}" var="item">
                    <option value="${item.gameName}">${item.gameName}</option>
                </c:forEach>
            </select>
            <label>游戏标识：</label>
            <select id="s_gameShortName" class="easyui-combobox">
                <option value="">全部</option>
                <c:forEach items="${gameList}" var="item">
                    <option value="${item.gameShortName}">${item.gameShortName}</option>
                </c:forEach>
            </select>
            <label>运营类型：</label>
            <select id="s_gameType" class="easyui-combobox">
                <option value="0">全部</option>
                <option value="1">独代</option>
                <option value="2">联运</option>
            </select>
            <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="startSearch();" >开始检索</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="wu-datagrid-2" toolbar="#wu-toolbar-2"></table>
</div>
<!-- Begin of easyui-dialog -->

<%-- 新增对话框 --%>
<div id="wu-dialog-2" class="easyui-dialog" data-options="closed:true, iconCls:'icon-save'"
     style="width:380px; padding:10px;display: none;">
    <form id="wu-form-2" method="post" enctype="multipart/form-data">
        <table style="border-collapse:separate; border-spacing:0px 6px;">
            <tr>
                <td align="right">游戏ID：</td>
                <td><input name="gameId" class="wu-text easyui-textbox"
                           data-options="prompt:'如：100008', required:true, validType:'length[1,11]'"
                           autocomplete="off" placeholder="如：100011"/></td>
            </tr>
            <tr>
                <td align="right">游戏名：</td>
                <td><input name="gameName" class="wu-text easyui-textbox"
                           data-options="prompt:'如：圣物英雄', required:true, validType:'length[1,40]'"
                           autocomplete="off" placeholder="如：龙族契约"/></td>
            </tr>
            <tr>
                <td align="right">游戏标识：</td>
                <td><input name="gameShortName" class="wu-text easyui-textbox"
                           autocomplete="off" data-options="prompt:'如：swyy(游戏名拼音首字母)', required:true, validType:'length[1,24]'"
                           placeholder="如：swyy(游戏名拼音首字母)"/></td>
            </tr>
            <tr>
                <td align="right">运营类型：</td>
                <td>
                    <select name="gameType" class="easyui-combobox"
                            panelHeight="auto" style="width:250px" data-options="required:true">
                        <option value="1">独代</option>
                        <option value="2">联运</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right">横竖屏：</td>
                <td>
                    <select name="isLandScape" class="easyui-combobox"
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
                    <select name="isFinal" class="easyui-combobox"
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
                    <select name="replaceR" class="easyui-combobox"
                            panelHeight="auto" style="width:250px" title="replaceR"
                            data-options="required:true">
                        <option value="0">否</option>
                        <option value="1">是</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right">CP母包：</td>
                <td><input name="gameCPFile" class="wu-text easyui-filebox"
                           data-options="buttonText:'选择文件', accept:'.apk', required:true" /></td>
            </tr>
            <tr>
                <td align="right" style="vertical-align: top;">更新说明：</td>
                <td><input name="ver.gameVerUpDesc" class="wu-textarea easyui-textbox"
                           data-options="prompt:'首次提交1.2.6', multiline:true, required:true, validType:'length[1,200]'"
                           style="height: 60px;" autocomplete="off" placeholder="首次提交1.2.6" /></td>
            </tr>
        </table>
    </form>
</div>

<%-- 更新对话框 --%>
<div id="wu-dialog-3" class="easyui-dialog" data-options="closed:true, iconCls:'icon-save'"
     style="width:380px; padding:10px;display: none;">
    <form id="wu-form-3" method="post" enctype="multipart/form-data">
        <table style="border-collapse:separate; border-spacing:0px 6px;">
            <tr>
                <td align="right">游戏ID：</td>
                <td><span name="gameId"></span></td>
            </tr>
            <tr>
                <td align="right">游戏名：</td>
                <td><input name="gameName" class="wu-text easyui-textbox"
                           data-options="prompt:'如：龙族契约', required:true, validType:'length[1,40]'"
                           autocomplete="off" placeholder="如：龙族契约"/></td>
            </tr>
            <tr>
                <td align="right">游戏标识：</td>
                <td><input name="gameShortName" class="wu-text easyui-textbox"
                           autocomplete="off" data-options="prompt:'如：lzqy(游戏名拼音首字母)', required:true, validType:'length[1,24]'"
                           placeholder="如：lzqy(游戏名拼音首字母)"/></td>
            </tr>
            <tr>
                <td align="right">运营类型：</td>
                <td>
                    <select name="gameType" class="easyui-combobox"
                            panelHeight="auto" style="width:250px" data-options="required:true">
                        <option value="1">独代</option>
                        <option value="2">联运</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right">横竖屏：</td>
                <td>
                    <select name="isLandScape" class="easyui-combobox"
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
                    <select name="isFinal" class="easyui-combobox"
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
                    <select name="replaceR" class="easyui-combobox"
                            panelHeight="auto" style="width:250px" title="replaceR"
                            data-options="required:true">
                        <option value="0">否</option>
                        <option value="1">是</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right">CP母包：</td>
                <td><input name="gameCPFile" class="wu-text easyui-filebox"
                           data-options="buttonText:'选择文件', accept:'.apk', required:true" /></td>
            </tr>
            <tr>
                <td align="right" style="vertical-align: top;">更新说明：</td>
                <td><input name="ver.gameVerUpDesc" class="wu-textarea easyui-textbox"
                           data-options="prompt:'首次提交1.2.6', multiline:true, required:true, validType:'length[1,200]'"
                           style="height: 60px;" autocomplete="off" placeholder="首次提交1.2.6" /></td>
            </tr>
            <tr style="display: none;">
                <td align="right">ID：</td>
                <td><input name="id" type="hidden" value="0" /></td>
            </tr>
            <tr style="display: none;">
                <td align="right">游戏ID：</td>
                <td><input name="gameId"  type="hidden" /></td>
            </tr>
        </table>
    </form>
</div>

<%-- 修改对话框 --%>
<div id="wu-dialog-4" class="easyui-dialog" data-options="closed:true, iconCls:'icon-save'"
     style="width:380px; padding:10px;display: none;">
    <form id="wu-form-4" method="post" enctype="multipart/form-data">
        <table style="border-collapse:separate; border-spacing:0px 6px;">
            <tr>
                <td align="right">游戏ID：</td>
                <td><span name="gameId"></span></td>
            </tr>
            <tr>
                <td align="right">游戏名：</td>
                <td><input name="gameName" class="wu-text easyui-textbox"
                           data-options="prompt:'如：龙族契约', required:true, validType:'length[1,40]'"
                           autocomplete="off" placeholder="如：龙族契约"/></td>
            </tr>
            <tr>
                <td align="right">游戏标识：</td>
                <td><input name="gameShortName" class="wu-text easyui-textbox"
                           autocomplete="off" data-options="prompt:'如：lzqy(游戏名拼音首字母)', required:true, validType:'length[1,24]'"
                           placeholder="如：lzqy(游戏名拼音首字母)"/></td>
            </tr>
            <tr>
                <td align="right">运营类型：</td>
                <td>
                    <select name="gameType" class="easyui-combobox"
                            panelHeight="auto" style="width:250px" data-options="required:true">
                        <option value="1">独代</option>
                        <option value="2">联运</option>
                    </select>
                </td>
            </tr>
            <tr style="display: none;">
                <td align="right">ID：</td>
                <td><input name="id" type="hidden" value="0" /></td>
            </tr>
            <tr style="display: none;">
                <td align="right">游戏ID：</td>
                <td><input name="gameId"  type="hidden" /></td>
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
            url: '${ctx}/packManager/game/add',
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
     * Name 更新记录
     */
    function edit() {
        $('#wu-form-3').form('submit', {
            url: '${ctx}/packManager/game/edit',
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
     * Name 修改记录
     */
    function change() {
        $('#wu-form-4').form('submit', {
            url: '${ctx}/packManager/game/change',
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
                            $('#wu-dialog-4').dialog('close');
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
                    $('#wu-dialog-4').dialog('close');
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
            $.messager.confirm("确认删除", "确认删除此数据", function(result) {
                if (result) {
                    $.messager.progress({
                        title: "提示",
                        msg: "操作进行中"
                    });

                    $.ajax({
                        url: '${ctx}/packManager/game/status?id=' + item.id,
                        success: function (data) {
                            $.messager.progress('close');
                            if (data && data.success) {
                                $.messager.alert('信息提示', '删除成功!');
                                reloadOtherPackManager();
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
        $('#wu-dialog-2').dialog({
            closed: false,
            modal: true,
            title: "新增游戏",
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
     * Name 打开更新窗口
     */
    function openEdit(index) {
        var item = $('#wu-datagrid-2').datagrid('getData').rows[index];
        if (item) {

            handlerFormData(item);
            $('#wu-form-3').form('load', item);
            $('#wu-dialog-3').dialog({
                closed: false,
                modal: true,
                title: "更新游戏",
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

    /**
     * Name 打开修改窗口
     */
    function openChange(index) {
        var item = $('#wu-datagrid-2').datagrid('getData').rows[index];
        if (item) {

            handlerFormData(item);
            $('#wu-form-4').form('load', item);
            $('#wu-dialog-4').dialog({
                closed: false,
                modal: true,
                title: "更新游戏",
                left: 600,
                top: 140,
                buttons: [{
                    text: '确定',
                    iconCls: 'icon-ok',
                    handler: change
                }, {
                    text: '取消',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        $('#wu-dialog-4').dialog('close');
                    }
                }]
            });
        } else {
//            $.messager.alert("信息提示", "请先选择修改的数据项", "info");
        }
    }

    /** 处理表单数据 **/
    function handlerFormData(item) {
        item["id"] = item.id;
        item["gameId"] = item.gameId;
        item["gameName"] = item.gameName;
        item["gameShortName"] = item.gameShortName;
        item["gameType"] = item.gameType;
//        item["cchVerName"] = "";
        item["ver.gameVerUpDesc"] = "";
        item["ver.gameVerNum"] = "";
        item["ver.gameVerName"] = "";

        $("span[name='gameId']").text(item.gameId);
    }

    /**
     * Name 载入数据
     */
    function loadData(query_params) {
        var onselect = false;
        var selectId = 0;
        $('#wu-datagrid-2').datagrid({
            idField: 'id',
            url: '${ctx}/packManager/game/list',
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
                {field: 'gameId', title: '游戏ID', width: 80, sortable: true},
                {field: 'gameName', title: '游戏名称'},
                {field: 'gameShortName', title: '游戏标识'},
                <c:if test="${sessionScope.currentUserGroup.groupSuperManager == 1}">
                {field: 'company', title: '隶属于', width: 100,
                    formatter: function (val, row) {
                        return row.company.companyName + '(' + row.company.companyDesc + ')';
                    }},
                </c:if>
                {field: 'gameType', title: '运营类型', width: 70, sortable: true,
                    formatter: function (val, row) {
                        var type = val;
                        if (type == 1) {
                            return '独代'
                        } else if (type == 2) {
                            return '联运'
                        } else {
                            return '未知'
                        }
                    }
                },
                {field: 'ver.gameVerNum', title: '版本号', width: 100, sortable: true,
                    formatter: function (val, row) {return row.ver.gameVerNum;}},
                {field: 'ver.gameVerName', title: '版本名', width: 120,
                    formatter: function (val, row) {return row.ver.gameVerName;}},
                {field:'recordData', title:'参数预览', width:70,
                    formatter: function (val, row, index) {
                        return '<a class="wu-table-operation" onclick="showParam(' + index + ')" href="#">点击查看</a>';}
                },
                {field:'gameCreateDate', title:'创建时间', width:120, sortable: true,
                    formatter: function (val) {return toDate(val);}},
                {field: 'ver.gameVerUpDate', title: '最近修改', width: 120, sortable: true,
                    formatter: function (val, row) {return toDate(row.ver.gameVerUpDate);}},
                {field: 'ver.gameVerUpSJoysPath', title: '雷动母包下载', width: 90,
                    formatter: function (val, row) {
                        var link = '${ctxRes}' + row.ver.gameVerUpSJoysPath;
                        return '<a class="wu-table-operation" href="' + link + '">点击下载</a>';
                    }},
                {field: 'ver.gameVerUpCPPath', title: 'CP包下载', width: 90,
                    formatter: function (val, row) {
                        var link = '${ctxRes}' + row.ver.gameVerUpCPPath;
                        return '<a class="wu-table-operation" href="' + link + '">点击下载</a>';
                }},
                {field:'operation', title: '操作', width: 60, formatter: function (val, row, index) {
                    return '<a class="wu-table-operation" onclick="openEdit(' + index + ')" href="#">更新</a>';
                }},
                {field:'operation1', title: '操作1', width: 60, formatter: function (val, row, index) {
                    return '<a class="wu-table-operation" onclick="openChange(' + index + ')" href="#">修改</a>';
                }},
                {field:'operation2', title: '操作2', width: 80, formatter: function (val, row) {
                    return '<a class="wu-table-operation" href="gameVersion?_gameId=' + row.id + '">查询详情</a>';
                }},
                {field:'operation3', title: '操作3', width: 60, formatter: function (val, row, index) {
                    return '<a class="wu-table-operation" onclick="removeData('+ index +')" href="#">删除</a>';
                }}
            ]],
            onLoadSuccess: function () { // 读取数据成功调用
                // 把表格设置为填满空间
                $('.datagrid-wrap').css("height", "100%");
//                $('.datagrid-body').css("height", "100%");
            },
            onSelect: function (val, row) { // 选中行与取消选中处理
                var rowId = row.gameId;
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
        var dformat = [ d.getFullYear(), d.getMonth() + 1, d.getDate() ].join('/')
            + ' ' + [ d.getHours(), d.getMinutes()].join(':');
        return dformat;
    }

    /** 显示参数 **/
    function showParam(index) {
        var item = $('#wu-datagrid-2').datagrid('getData').rows[index];
        if (item) {
            var data = "";
            data = data + "isLandScape=" + item.isLandScape + "<br /><br />";
            data = data + "isFinal=" + item.isFinal + "<br /><br />";
            data = data + "replaceR=" +  item.replaceR;
            $.messager.alert("参数预览", data);
        }
    }

    /**
     * 刷新其他打包管理页面
     */
    function reloadOtherPackManager() {
        window.parent.reloadPackManagerTab('游戏管理');
    }

    /**
     * 开始检索
     */
    function startSearch() {
        var gameId = $('#s_gameId').combobox('getValue');
        var gameName = $('#s_gameName').combobox('getValue');
        var gameShortName = $('#s_gameShortName').combobox('getValue');
        var gameType = $('#s_gameType').combobox('getValue');

        if (gameType.trim() == '') { // 空字符串设置为0
            gameType = 0;
        }

        var query_params = {
            gameId : gameId,
            gameName : gameName,
            gameShortName : gameShortName,
            gameType : gameType
        };
        loadData(query_params);
    }


</script>

</body>
</html>
