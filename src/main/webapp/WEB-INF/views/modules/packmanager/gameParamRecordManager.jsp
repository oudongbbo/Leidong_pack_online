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
            <a href="${ctx}/packManager/gameParam" class="easyui-linkbutton" iconCls="icon-back" plain="false">返回游戏参数管理</a>
            <a href="#" class="easyui-linkbutton wu-toolbar-button-padding" iconCls="icon-refresh"
               onclick="javascript:window.location.reload()" plain="false">刷新</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="wu-datagrid-2" toolbar="#wu-toolbar-2"></table>
</div>
<!-- Begin of easyui-dialog -->

<div id="wu-dialog-2" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'"
     style="min-width:380px;width: auto; padding:10px; display: none;">
    <form id="wu-form-2" method="post">
        <table style="border-collapse:separate; border-spacing:0px 6px;">
            <tr>
                <td align="right">行数：</td>
                <td><span name="index"></span></td>
            </tr>
            <%--<tr>--%>
                <%--<td align="right">固定参数：</td>--%>
                <%--<td>--%>
                    <%--<table>--%>
                        <%--<tr>--%>
                            <%--<td align="right">横竖屏：</td>--%>
                            <%--<td>--%>
                                <%--<select name="record.isLandScape" class="easyui-combobox"--%>
                                        <%--panelHeight="auto" style="width:250px" title="isLandScape"--%>
                                        <%--data-options="required:true">--%>
                                    <%--<option value="1">横屏</option>--%>
                                    <%--<option value="0">竖屏</option>--%>
                                <%--</select>--%>
                            <%--</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td align="right">是否定额：</td>--%>
                            <%--<td>--%>
                                <%--<select name="record.isFinal" class="easyui-combobox"--%>
                                        <%--panelHeight="auto" style="width:250px" title="isFinal"--%>
                                        <%--data-options="required:true">--%>
                                    <%--<option value="1">定额</option>--%>
                                    <%--<option value="0">不定额</option>--%>
                                <%--</select>--%>
                            <%--</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td align="right">重建R文件：</td>--%>
                            <%--<td>--%>
                                <%--<select name="record.replaceR" class="easyui-combobox"--%>
                                        <%--panelHeight="auto" style="width:250px" title="replaceR"--%>
                                        <%--data-options="required:true">--%>
                                    <%--<option value="0">否</option>--%>
                                    <%--<option value="1">是</option>--%>
                                <%--</select>--%>
                            <%--</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td align="right">包名：</td>--%>
                            <%--<td>--%>
                                <%--<input type="text" name="record.pname" class="wu-text easyui-textbox"--%>
                                       <%--autocomplete="off" data-options="prompt:'如：com.starjoys.ysdk',--%>
                                        <%--required:true, validType:'length[1,30]'"--%>
                                       <%--placeholder="如：com.starjoys.ysdk"/>--%>
                            <%--</td>--%>
                        <%--</tr>--%>
                    <%--</table>--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td align="right">渠道参数：</td>--%>
                <%--<td id="wu-dialog-2-alone-param"></td>--%>
            <%--</tr>--%>
            <tr>
                <td align="right" style="vertical-align: top;">更新说明：</td>
                <td><input name="record.gpRecordUpDesc" class="wu-textarea easyui-textbox"
                           data-options="prompt:'首次建立游戏参数', multiline:true, required:true, validType:'length[1,200]'"
                           style="height: 60px;" autocomplete="off" placeholder="首次游戏渠道关联"/></td>
            </tr>
            <tr style="display: none">
                <td>游戏参数记录Id：</td>
                <td><input type="hidden" name="record.gpRecordId" /></td>
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
            url: '${ctx}/packManager/gameParamRecord/edit',
            success: function (data) {
                // 隐藏
                disLoad();

                // 返回数据处理
                if (data) {
                    try {
                        var dat = eval('(' + data + ')'); // 转换为json对象
                        if (dat && dat.success) {
                            reloadOtherPackManager();
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
     * Name 打开修改窗口
     */
    function openEdit(index) {
        var item = $('#wu-datagrid-2').datagrid('getData').rows[index];
        $("span[name='index']").text(index + 1);
        if (item) {
            handlerBaseData(item); // 处理基础数据

            $('#wu-dialog-2').dialog({
                closed: false,
                modal: true,
                title: "编辑游戏参数记录",
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
                        $('#wu-dialog-2').dialog('close');
                    }
                }]
            });
        } else {
//            $.messager.alert("信息提示", "请先选择修改的数据项", "info");
        }
    }

    /** 处理基础数据 **/
    function handlerBaseData(item) {
        var dialog = $("#wu-dialog-2");
        dialog.find("input[textboxname='record.gpRecordUpDesc']").textbox("setValue", item.record.gpRecordUpDesc); // 更新说明
        dialog.find("input[name='record.gpRecordId']").val(item.record.gpRecordId); // id

        // 动态创建表单
//        var aloneParam = $("#wu-dialog-2-alone-param");
//        createFormByParam(aloneParam, dialog, getCchById(item.cch.id)); // 创建表单
//
//        // 给动态生成的表单赋值
//        var data = item.record.gpRecordData;
//        var dataParamList = data.split("\r\n");
//        for (var i = 0; i < dataParamList.length; i++) {
//            var dividerIndex = dataParamList[i].indexOf('='); // 拆分=参数, 左边为参数名, 右边为参数值
//            if (dividerIndex != -1) {
//                var key = dataParamList[i].substring(0, dividerIndex); // 等于号前面的参数名
//                var value = dataParamList[i].substr(dividerIndex + 1); // 等于号后面的参数值
//                var commonParamInput;
//                if (key == "isLandScape" || key == "isFinal" || key == "replaceR") { // 横竖屏 定额
//                    commonParamInput = "select[comboname='record." + key + "']";
//                    dialog.find(commonParamInput).combobox("setValue", value);
//                    continue;
//                } else if (key == "pname") { // 包名
//                    commonParamInput = "input[textboxname='record." + key + "']";
//                    dialog.find(commonParamInput).textbox("setValue", value);
//                    continue;
//                } else { // 动态参数
//                    var cchParamInput = "input[textboxname='allParam-" + key + "']";
//                    dialog.find(cchParamInput).textbox("setValue", value);
//                }
//            }
//        }
    }

    /**
     * Name 载入数据
     */
    function loadData() {
        var onselect = false;
        var selectId = 0;
        var params = getRequest();
        $('#wu-datagrid-2').datagrid({
            idField: 'gameParamId',
            url: '${ctx}/packManager/gameParamRecord/list?gameParamId=' + params["gameParamId"],
            loadFilter: function (data) { // 数据格式化
                data = {
                    total: data.rows.length,
                    rows: data.rows
                };
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
                {field: 'game.gameId', title: '游戏ID', width: 80, sortable: true,
                    formatter: function (val, row) {
                    return row.game.gameId;
                }},
                {field: 'game.gameName', title: '游戏名称', width: 120,
                    formatter: function (val, row) {
                    return row.game.gameName;
                }},
                {field: 'game.gameType', title: '运营类型', width: 60, sortable: true,
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
                {field: 'game.gameShortName', title: '游戏标识', formatter: function (val, row) {
                    return row.game.gameShortName;
                }},
                {field: 'cch.cchName', title: '渠道名', width: 100, formatter: function (val, row) {
                    return row.cch.cchName;
                }},
                {field: 'cch.cchShortName', title: '渠道标识', width: 100, formatter: function (val, row) {
                    return row.cch.cchShortName;
                }},
                {field:'record.gpRecordData', title:'参数预览', width:70,
                    formatter: function (val, row, index) {
                        return '<a class="wu-table-operation" onclick="showParam(' + index + ')" href="#">点击查看</a>';}
                },
                {field: 'record.gpRecordUpDate', title: '更新时间', width: 120, sortable: true,
                    formatter: function (val, row) {return toDate(row.record.gpRecordUpDate);}},
                {field: 'record.user.username', title: '更新者', width: 120,
                    formatter: function (val, row) {return row.record.user.username;}},
                {field: 'record.gpRecordUpDesc', title: '更新详情', width: 160, formatter: function (val, row) {
                    return row.record.gpRecordUpDesc;
                }},
                {field:'operation', title: '操作', width: 60, formatter: function (val, row, index) {
                    return '<a class="wu-table-operation" onclick="openEdit('+ index +')" href="#">编辑</a>';
                }}
            ]],
            onLoadSuccess: function () { // 读取数据成功调用
                // 把表格设置为填满空间
//                $('.datagrid-wrap').css("height", "100%");
//                $('.datagrid-body').css("height", "100%");
                $('.datagrid-body').css("height", $('body').innerHeight() - 44);
            },
            onSelect: function (val, row) { // 选中行与取消选中处理
                var rowId = row.record.gpRecordId;
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

    /** 显示参数 **/
    function showParam(index) {
        var item = $('#wu-datagrid-2').datagrid('getData').rows[index];
        if (item) {
            var data = item.record.gpRecordData.replace(/\r\n/g, '<br /><br />');
            $.messager.alert("参数预览", data);
        }
    }

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
    function createFormByParam(item, dialog, cch) {
        if (cch.cchAllParam && cch.cchAllParam.trim() != "") {
            // 拆分换行参数
            var cchAllParamList = cch.cchAllParam.split("\r\n");
            var cchRequireParamList = cch.cchRequireParam.split("\r\n");
            // 组装渠道参数列表
            var html = "<table id='wu-dialog-alone-param-table'>";
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
            html += "</table>";
            // 显示列表
            item.text("");
            var result = item.append(html);

            // 渲染渠道参数列表, 并调整宽度
            $.parser.parse(result.parent());
            dialog.css("width", "auto");
            dialog.siblings().css("width", "auto");
        }
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
     * 刷新其他打包管理页面
     */
    function reloadOtherPackManager() {
        window.parent.reloadPackManagerTab("游戏参数管理");
    }


</script>

</body>
</html>
