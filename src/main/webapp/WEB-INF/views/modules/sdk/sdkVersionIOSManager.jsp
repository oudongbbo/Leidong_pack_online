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
            <a href="${ctx}/sdk/sdkIOSManager" class="easyui-linkbutton" iconCls="icon-back" plain="false">返回国内SDK IOS</a>
            <a href="#" class="easyui-linkbutton wu-toolbar-button-padding" iconCls="icon-refresh"
               onclick="javascript:window.location.reload()" plain="false">刷新</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="wu-datagrid-2" toolbar="#wu-toolbar-2"></table>
</div>
<!-- Begin of easyui-dialog -->

<div id="wu-dialog-1" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'"
     style="min-width:380px;width: auto; padding:10px; display: none;">
    <form id="wu-form-1" method="post">
        <table style="border-collapse:separate; border-spacing:0px 6px;">
            <tr>
                <td align="right">行数：</td>
                <td><span name="index"></span></td>
            </tr>
            <tr>
                <td align="right">版本名：</td>
                <td><input name="ver.sdkVerName" class="wu-text easyui-textbox"
                           data-options="prompt:'如：1.2.4', required:true, validType:'length[1, 100]'"
                           autocomplete="off" placeholder="如：1.2.4"/></td>
            </tr>
            <tr>
                <td align="right" style="vertical-align: top;">更新说明：</td>
                <td><input name="ver.sdkVerUpDesc" class="wu-textarea easyui-textbox"
                           data-options="multiline:true, required:true, prompt:'把更新的内容写下来'"
                           style="height: 60px;" autocomplete="off"/></td>
            </tr>
            <tr style="display: none;">
                <td></td>
                <td>
                    <input name="ver.sdkVerId" type="hidden" />
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
     * Name 修改记录
     */
    function edit() {
        $('#wu-form-1').form('submit', {
            url: '${ctx}/sdk/sdkVersionIOSManager/edit',
            success: function (data) {
                // 隐藏
                disLoad();

                // 返回数据处理
                if (data) {
                    try {
                        var dat = eval('(' + data + ')'); // 转换为json对象
                        if (dat && dat.success) {
                            $.messager.alert('信息提示', '编辑成功！', 'info', function () {
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
     * Name 打开修改窗口
     */
    function openEdit(index) {
        var item = $('#wu-datagrid-2').datagrid('getData').rows[index];
        $("span[name='index']").text(index + 1);
        if (item) {
            item['ver.sdkVerId'] = item.ver.sdkVerId;
            item['ver.sdkVerName'] = item.ver.sdkVerName;
            item['ver.sdkVerUpDesc'] = item.ver.sdkVerUpDesc;

            $('#wu-form-1').form('load', item);
            $('#wu-dialog-1').dialog({
                closed: false,
                modal: true,
                title: "编辑SDK版本信息",
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
                        $('#wu-dialog-1').dialog('close');
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
            idField: 'ver.sdkVerId',
            url: '${ctx}/sdk/sdkVersionIOSManager/list?sdkId=' + params["sdkId"],
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
                {field: 'cch.cchId', title: '渠道ID', width: 70,
                    formatter: function (val, row) {return row.sdkCchId;}},
                {field: 'cch.cchName', title: 'SDK名称', width: 140,
                    formatter: function (val, row) {return row.sdkName;}},
                {field: 'ver.sdkVerName', title: '版本名', width: 100,
                    formatter: function (val, row) {return row.ver.sdkVerName;}},
                {field: 'ver.us.username', title: '更新者', width: 100,
                    formatter: function (val, row) {return row.ver.us.username;}},
                {field: 'ver.sdkVerUpDesc', title: '更新说明', width: 70,
                    formatter: function (val, row, index) {
                        return '<a class="wu-table-operation" onclick="showDesc(' + index + ')" href="#">点击查看</a>';
                 }},
                {field: 'ver.sdkVerUpDate', title: '更新时间', width: 120, sortable: true,
                    formatter: function (val, row) {return toDate(row.ver.sdkVerUpDate);}},
                {field: 'ver.sdkVerUpPath', title: 'SDK下载', width: 90,
                    formatter: function (val, row) {
                        var link = '${ctxRes}' + row.ver.sdkVerUpPath;
                        return '<a class="wu-table-operation" href="' + link + '">点击下载</a>';
                    }},
                {field:'operation', title: '操作', width: 60, formatter: function (val, row, index) {
                    return '<a class="wu-table-operation" onclick="openEdit('+ index +')" href="#">编辑</a>';
                }}
            ]],
            onLoadSuccess: function () { // 读取数据成功调用
                // 把表格设置为填满空间
                $('.datagrid-wrap').css("height", "100%");
//                $('.datagrid-body').css("height", "100%");
            },
            onSelect: function (val, row) { // 选中行与取消选中处理
                var rowId = row.ver.sdkVerId;
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

    /** 显示更新说明 **/
    function showDesc(index) {
        var item = $('#wu-datagrid-2').datagrid('getData').rows[index];
        if (item) {
            $.messager.alert('更新说明', item.ver.sdkVerUpDesc);
        }
    }

</script>

</body>
</html>
