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
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openAdd()" plain="false">新增打包工具</a>
            <a href="#" class="easyui-linkbutton wu-toolbar-button-padding" iconCls="icon-refresh"
               onclick="javascript:window.location.reload()" plain="false">刷新</a>
        </div>
        <div class="wu-toolbar-search" >
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="wu-datagrid-2" toolbar="#wu-toolbar-2"></table>
</div>
<!-- Begin of easyui-dialog -->

<%-- 新增 --%>
<div id="wu-dialog-1" class="easyui-dialog" data-options="closed:true, iconCls:'icon-save'"
     style="width:420px; padding:10px;display: none;" >
    <form id="wu-form-1" method="post"  enctype="multipart/form-data">
        <table style="border-collapse:separate; border-spacing:0 6px;">
            <tr>
                <td align="right">打包工具名称：</td>
                <td><input name="packToolName" class="wu-text easyui-textbox"
                           data-options="prompt:'如：打包工具名称', required:true, validType:'length[1, 100]'"
                           autocomplete="off" placeholder="如：打包工具名称"/></td>
            </tr>
            <tr>
                <td align="right">打包工具文件名：</td>
                <td><input name="packToolFileName" class="wu-text easyui-textbox"
                           data-options="prompt:'如：会把上传的文件统一改成此文件名', required:true, validType:'length[1, 100]'"
                           autocomplete="off" placeholder="如：会把上传的文件统一改成此文件名"/></td>
            </tr>
            <tr>
                <td align="right">打包工具文件：</td>
                <td><input name="packToolUploadFile" class="wu-text easyui-filebox"
                           data-options="buttonText:'选择文件', accept:'.jar', prompt:'只支持jar文件',required:true" /></td>
            </tr>
            <tr>
                <td align="right" style="vertical-align: top;">更新说明：</td>
                <td><input name="record.ptRecordUpDesc" class="wu-textarea easyui-textbox"
                           data-options="multiline:true, required:true, prompt:'如:首次提交'"
                           style="height: 60px;" autocomplete="off"/></td>
            </tr>
        </table>
    </form>
</div>

<%-- 更新 --%>
<div id="wu-dialog-2" class="easyui-dialog" data-options="closed:true, iconCls:'icon-save'"
     style="width:380px; padding:10px;display: none;">
    <form id="wu-form-2" method="post"  enctype="multipart/form-data">
        <table style="border-collapse:separate; border-spacing:0 6px;">
            <tr>
                <td align="right">打包工具名称：</td>
                <td><input name="packToolName" class="wu-text easyui-textbox"
                           data-options="prompt:'如：打包工具名称', required:true, validType:'length[1, 100]'"
                           autocomplete="off" placeholder="如：打包工具名称"/></td>
            </tr>
            <tr>
                <td align="right">打包工具文件名：</td>
                <td><input name="packToolFileName" class="wu-text easyui-textbox"
                           data-options="prompt:'如：会把上传的文件统一改成此文件名', required:true, validType:'length[1, 100]'"
                           autocomplete="off" placeholder="如：会把上传的文件统一改成此文件名"/></td>
            </tr>
            <tr>
                <td align="right">打包工具文件：</td>
                <td><input name="packToolUploadFile" class="wu-text easyui-filebox"
                           data-options="buttonText:'选择文件', accept:'.jar', prompt:'只支持jar文件', required:true" /></td>
            </tr>
            <tr>
                <td align="right" style="vertical-align: top;">更新说明：</td>
                <td><input name="record.ptRecordUpDesc" class="wu-textarea easyui-textbox"
                           data-options="multiline:true, required:true, prompt:'把更新的内容写下来'"
                           style="height: 60px;" autocomplete="off"/></td>
            </tr>
            <tr style="display: none;">
                <td></td>
                <td>
                    <input name="packToolId" type="hidden" />
                </td>
            </tr>
        </table>
    </form>
</div>

<%-- 修改 --%>
<div id="wu-dialog-3" class="easyui-dialog" data-options="closed:true, iconCls:'icon-save'"
     style="width:380px; padding:10px;display: none;">
    <form id="wu-form-3" method="post"  enctype="multipart/form-data">
        <table style="border-collapse:separate; border-spacing:0 6px;">
            <tr>
                <td align="right">打包工具名称：</td>
                <td><input name="packToolName" class="wu-text easyui-textbox"
                           data-options="prompt:'如：打包工具名称', required:true, validType:'length[1, 100]'"
                           autocomplete="off" placeholder="如：打包工具名称"/></td>
            </tr>
            <tr>
                <td align="right">打包工具文件名：</td>
                <td><input name="packToolFileName" class="wu-text easyui-textbox"
                           data-options="prompt:'如：会把上传的文件统一改成此文件名', required:true, validType:'length[1, 100]'"
                           autocomplete="off" placeholder="如：会把上传的文件统一改成此文件名"/></td>
            </tr>
            <tr style="display: none;">
                <td></td>
                <td>
                    <input name="packToolId" type="hidden" />
                </td>
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
        $('#wu-form-1').form('submit', {
            url: '${ctx}/system/packToolManager/add',
            success: function (data) {
                // 隐藏
                disLoad();

                // 返回数据处理
                if (data) {
                    try {
                        var dat = eval('(' + data + ')'); // 转换为json对象
                        if (dat && dat.success) {
                            $.messager.alert('信息提示', '添加成功！', 'info', function () {
                                window.location.reload();
                            });
                            $('#wu-dialog-1').dialog('close');
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
                    $('#wu-dialog-1').dialog('close');
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
        $('#wu-form-2').form('submit', {
            url: '${ctx}/system/packToolManager/edit',
            success: function (data) {
                // 隐藏
                disLoad();

                // 返回数据处理
                if (data) {
                    try {
                        var dat = eval('(' + data + ')'); // 转换为json对象
                        if (dat && dat.success) {
                            $.messager.alert('信息提示', '更新成功！', 'info', function () {
                                $('#wu-datagrid-2').datagrid('reload');
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
     * Name 打开添加窗口
     */
    function openAdd() {
        $('#wu-dialog-1').dialog({
            closed: false,
            modal: true,
            title: "新增打包工具",
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
                    $('#wu-dialog-1').dialog('close');
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
            $('#wu-form-2').form('load', item);

            $('#wu-dialog-2').dialog({
                closed: false,
                modal: true,
                title: "更新打包工具",
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

    /**
     * Name 打开修改窗口
     */
    function openChange(index) {
        var item = $('#wu-datagrid-2').datagrid('getData').rows[index];
        if (item) {

            $('#wu-form-3').form('load', item);
            $('#wu-dialog-3').dialog({
                closed: false,
                modal: true,
                title: "修改打包工具",
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
                        $('#wu-dialog-3').dialog('close');
                    }
                }]
            });
        } else {
//            $.messager.alert("信息提示", "请先选择修改的数据项", "info");
        }
    }

    /**
     * Name 修改记录
     */
    function change() {
        $('#wu-form-3').form('submit', {
            url: '${ctx}/system/packToolManager/change',
            success: function (data) {
                // 隐藏
                disLoad();

                // 返回数据处理
                if (data) {
                    try {
                        var dat = eval('(' + data + ')'); // 转换为json对象
                        if (dat && dat.success) {
                            $.messager.alert('信息提示', '修改成功！', 'info', function () {
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
     * Name 载入数据
     */
    function loadData(query_params) {
        var onselect = false;
        var selectId = 0;
        $('#wu-datagrid-2').datagrid({
            idField: 'packToolId',
            url: '${ctx}/system/packToolManager/list',
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
                {field: 'packToolName', title: '打包工具名称', width: 240},
                {field: 'packToolFileName', title: '打包工具文件名', width: 200},
                {field: 'packToolCreateDate', title: '创建时间', width: 140, sortable: true,
                    formatter: function (val) {return toDate(val);}},
                {field: 'record.ptRecordUpDate', title: '更新时间', width: 140, sortable: true,
                    formatter: function (val, row) {return toDate(row.record.ptRecordUpDate);}},
                {field: 'record.ptRecordUpPath', title: '打包工具下载', width: 90,
                    formatter: function (val, row) {
                        var link = '${ctxRes}' + row.record.ptRecordUpPath;
                        return '<a class="wu-table-operation" href="' + link + '">点击下载</a>';
                    }},
                {field:'operation', title: '操作', width: 60, formatter: function (val, row, index) {
                    return '<a class="wu-table-operation" onclick="openEdit(' + index + ')" href="#">更新</a>';
                }},
                {field:'operation1', title: '操作1', width: 60, formatter: function (val, row, index) {
                    return '<a class="wu-table-operation" onclick="openChange(' + index + ')" href="#">修改</a>';
                }},
                {field:'operation2', title: '操作2', width: 80, formatter: function (val, row) {
                    return '<a class="wu-table-operation"  href="packToolRecordManager?packToolId=' + row.packToolId + '">查询详情</a>';
                }},
                {field:'operation3', title: '操作3', width: 60, hidden: true, formatter: function (val, row, index) {
                    return '<a class="wu-table-operation" onclick="removeData('+ index +')" href="#">删除</a>';
                }}
            ]],
            onLoadSuccess: function () { // 读取数据成功调用
                // 把表格设置为填满空间
                $('.datagrid-wrap').css("height", "100%");
            },
            onSelect: function (val, row) { // 选中行与取消选中处理
                var rowId = row.packToolId;
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
        var d = new Date(ns);
        var dformat = [d.getFullYear(), d.getMonth() + 1, d.getDate()].join('/')
            + ' ' + [d.getHours(), d.getMinutes()].join(':');
        return dformat;
    }



</script>

</body>
</html>
