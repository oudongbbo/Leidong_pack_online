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
            <a href="${ctx}/packManager/game" class="easyui-linkbutton" iconCls="icon-back" plain="false">返回游戏管理</a>
            <a href="#" class="easyui-linkbutton wu-toolbar-button-padding" iconCls="icon-refresh"
               onclick="javascript:window.location.reload()" plain="false">刷新</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="wu-datagrid-2" toolbar="#wu-toolbar-2"></table>
</div>
<!-- Begin of easyui-dialog -->

<div id="wu-dialog-2" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'"
     style="width:380px; padding:10px; display: none;">
    <form id="wu-form-2" method="post">
        <table style="border-collapse:separate; border-spacing:0px 6px;">
            <tr style="display: none;">
                <td align="right">渠道版本ID：</td>
                <td><input name="cchVerId" type="hidden" /></td>
            </tr>
            <tr>
                <td align="right">渠道版本：</td>
                <td>
                    <input type="text" name="cchVerName" class="wu-text easyui-textbox"
                           autocomplete="off" data-options="prompt:'如：1.2.6', required:true, validType:'length[1,40]'"
                           placeholder="如：1.2.6"/>
                </td>
            </tr>
            <tr>
                <td align="right">渠道更新状态：</td>
                <td>
                    <select name="cchVerUpStatus" class="easyui-combobox"
                            panelHeight="auto" style="width:250px" title="cchSplash">
                        <option value="2">渠道更新</option>
                        <option value="3">渠道修复</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right" style="vertical-align: top;">更新说明：</td>
                <td><input name="cchVerUpDesc" class="wu-textarea easyui-textbox"
                           data-options="prompt:'首次提交1.2.6', multiline:true, required:true, validType:'length[1,200]'"
                           style="height: 60px;" autocomplete="off" placeholder="首次提交1.2.6" /></td>
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
     * Name 修改记录
     */
    function edit() {
        $('#wu-form-2').form('submit', {
            url: '${ctx}/packManager/cchVersion/edit',
            success: function (data) {
                if (data) {
                    try {
                        var dat = eval('(' + data + ')'); // 转换为json对象
                        if (dat && dat.success) {
                            $.messager.alert('信息提示', '修改成功！', 'info', function () {
                                window.location.reload();
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
                }
                $.ajax({
                    url: '${ctx}/packManager/cchVersion/status?id=' + item.cchVerId,
                    success: function (data) {
                        $.messager.progress('close');
                        if (data && data.success) {
                            loadData();
                            return;
                        }
                        $.messager.alert('信息提示', data.message + '!', 'error');
                    },
                    error: function (xmlhttp) {
                        $.messager.progress('close');
                        showErrorMessage(xmlhttp.status, "请求错误!");
                    }
                });
            });
        } else {
//            $.messager.alert("信息提示", "请先选择修改的数据项", "info");
        }
    }

    /**
     * Name 打开修改窗口
     */
    function openEdit(index) {
        var item = $('#wu-datagrid-2').datagrid('getData').rows[index];
        if (item) {
            $('#wu-form-2').form('load', item);
            $('#wu-dialog-2').dialog({
                closed: false,
                modal: true,
                title: "编辑渠道版本信息",
                buttons: [{
                    text: '确定',
                    iconCls: 'icon-ok',
                    handler: edit
                }, {
                    text: '取消',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        $('#wu-dialog-2').dialog('close');
                    }
                }]
            });
        } else {
//            $.messager.alert("信息提示", "请先选择修改的数据项", "info");
        }
    }

    /**
     * Name 载入数据
     */
    function loadData() {
        var onselect = false;
        var selectId = 0;
        var params = getRequest();
        $('#wu-datagrid-2').datagrid({
            idField: 'ver',
            url: '${ctx}/packManager/gameVersion/list?id=' + params["_gameId"],
            loadFilter: function (data) { // 数据格式化
                data = {
                    total: data.rows.length,
                    rows: data.rows
                }
                return data;
            },
            rownumbers: true,
            singleSelect: true,
//                pageSize:20,
//                pagination:true,
            remoteSort: false,
//                multiSort:true,
            fitColumns:false,
            striped: true,
            fixed: true,
            columns: [[
                {field: 'gameId', title: '游戏ID', width: 80, sortable: true},
                {field: 'gameName', title: '游戏名称'},
                {field: 'gameShortName', title: '游戏标识'},
                {field: 'gameType', title: '运营类型', width: 60, sortable: true,
                    formatter: function (val) {
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
                    formatter: function (val, row) {
                    return row.ver.gameVerNum;
                }},
                {field: 'ver.gameVerName', title: '版本名', width: 120,
                    formatter: function (val, row) {
                    return row.ver.gameVerName;
                }},
                {field: 'ver.user.username', title: '更新者', width: 90,
                    formatter: function (val, row) {
                    return row.ver.user.username;
                }},
                {field: 'ver.gameVerUpDate', title: '更新时间', width: 120, sortable: true,
                    formatter: function (val, row) {return toDate(row.ver.gameVerUpDate);}},
                {field: 'ver.gameVerUpDesc', title: '更新详情', width: 160, formatter: function (val, row) {
                    return row.ver.gameVerUpDesc;
                }},
                {field: 'ver.gameVerUpSJoysPath', title: '雷动母包下载', width: 90, formatter: function (val, row) {
                    var link = '${ctxRes}' + row.ver.gameVerUpSJoysPath;
                    return '<a class="wu-table-operation" href="' + link + '">点击下载</a>';
                }},
                {field: 'ver.gameVerUpCPPath', title: 'CP包下载', width: 90,
                    formatter: function (val, row) {
                        var link = '${ctxRes}' + row.ver.gameVerUpCPPath;
                        return '<a class="wu-table-operation" href="' + link + '">点击下载</a>'
                }}
            ]],
            onLoadSuccess: function () { // 读取数据成功调用
                // 把表格设置为填满空间
//                $('.datagrid-wrap').css("height", "100%");
//                $('.datagrid-body').css("height", "100%");
                $('.datagrid-body').css("height", $('body').innerHeight() - 44);
            },
            onSelect: function (val, row) { // 选中行与取消选中处理
                var rowId = row.ver.gameVerId;
                var select = $(this).datagrid('getSelected');
                if (select != null && onselect == true && selectId == rowId) {
                    $(this).datagrid('unselectAll');
                    onselect = false;
                } else {
                    selectId = rowId;
                    onselect = true;
                }
            },
            onLoadError: function () {
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
//        $('.datagrid-view').css("height", "100%");
//        $('.datagrid-body').css("height", "100%");
        $('.datagrid-body').css("height", $('body').innerHeight() - 44);

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
        return [ d.getFullYear(), d.getMonth() + 1, d.getDate() ].join('/')
            + ' ' + [ d.getHours(), d.getMinutes()].join(':');
    }

    /**
     * 获取参数
     * @returns {Object}
     * @constructor
     */
    function getRequest() {
        var url = location.search; //获取url中"?"符后的字串
        var theRequest = new Object();
        if (url.indexOf("?") != -1) {
            var str = url.substr(1);
            strs = str.split("&");
            for(var i = 0; i < strs.length; i ++) {
                theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
            }
        }
        return theRequest;
    }


</script>

</body>
</html>
