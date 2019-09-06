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
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openAdd()" plain="false">新增公司</a>
            <a href="#" class="easyui-linkbutton wu-toolbar-button-padding" iconCls="icon-refresh"
               onclick="javascript:window.location.reload()" plain="false">刷新</a>
        </div>
        <div class="wu-toolbar-search" >
            <label>公司名称：</label>
            <select id="s_companyId" class="easyui-combobox">
                <option value="0">全部</option>
                <c:forEach items="${companyList}" var="item">
                    <option value="${item.companyId}">${item.companyName}</option>
                </c:forEach>
            </select>
            <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="startSearch();" >开始检索</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="wu-datagrid-2" toolbar="#wu-toolbar-2"></table>
</div>
<!-- Begin of easyui-dialog -->

<%-- 新增 --%>
<div id="wu-dialog-1" class="easyui-dialog" data-options="closed:true, iconCls:'icon-save'"
     style="width:380px; padding:10px;display: none;">
    <form id="wu-form-1" method="post">
        <table style="border-collapse:separate; border-spacing:0 6px;">
            <tr>
                <td align="right">公司名称：</td>
                <td><input name="companyName" class="wu-text easyui-textbox"
                           data-options="prompt:'如：公司名称', required:true, validType:'length[1, 100]'"
                           autocomplete="off" placeholder="如：公司名称"/></td>
            </tr>
            <tr>
                <td align="right" style="vertical-align: top;">公司描述：</td>
                <td><input name="companyDesc" class="wu-textarea easyui-textbox"
                           data-options="multiline:true, validType:'length[1,200]'"
                           style="height: 60px;" autocomplete="off"/></td>
            </tr>
            <tr>
                <td align="right">状态：</td>
                <td>
                    <label><input type="radio" name="status" value="1"/>启用</label>
                    <label><input type="radio" name="status" value="0" checked="checked"/>停用</label>
                </td>
            </tr>
        </table>
    </form>
</div>

<%-- 编辑 --%>
<div id="wu-dialog-2" class="easyui-dialog" data-options="closed:true, iconCls:'icon-save'"
     style="width:380px; padding:10px;display: none;">
    <form id="wu-form-2" method="post">
        <table style="border-collapse:separate; border-spacing:0 6px;">
            <tr>
                <td align="right">公司名称：</td>
                <td><input name="companyName" class="wu-text easyui-textbox"
                           data-options="prompt:'如：公司名称', required:true, validType:'length[1, 100]'"
                           autocomplete="off" placeholder="如：公司名称"/></td>
            </tr>
            <tr>
                <td align="right" style="vertical-align: top;">公司描述：</td>
                <td><input name="companyDesc" class="wu-textarea easyui-textbox"
                           data-options="multiline:true, validType:'length[1,200]'"
                           style="height: 60px;" autocomplete="off"/></td>
            </tr>
            <tr>
                <td align="right">状态：</td>
                <td>
                    <label><input type="radio" name="status" value="1"/>启用</label>
                    <label><input type="radio" name="status" value="0" checked="checked"/>停用</label>
                </td>
            </tr>
            <tr style="display: none;">
                <td></td>
                <td>
                    <input name="companyId" type="hidden" />
                </td>
            </tr>
        </table>
    </form>
</div>

<%-- 权限设置 --%>
<div id="wu-dialog-3" class="easyui-dialog" data-options="closed:true, iconCls:'icon-save'"
     style="width:380px; height: 540px; padding:10px;display: none;">
    <ul id="authTree" class="easyui-tree" ></ul>
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
            url: '${ctx}/system/companyManager/add',
            success: function (data) {
                // 隐藏
                disLoad();

                // 返回数据处理
                if (data) {
                    try {
                        var dat = eval('(' + data + ')'); // 转换为json对象
                        if (dat && dat.success) {
                            reloadOtherUserManager();
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
            url: '${ctx}/system/companyManager/edit',
            success: function (data) {
                // 隐藏
                disLoad();

                // 返回数据处理
                if (data) {
                    try {
                        var dat = eval('(' + data + ')'); // 转换为json对象
                        if (dat && dat.success) {
                            reloadOtherUserManager();
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
            title: "新增公司",
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
                title: "编辑公司",
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
     * Name 载入数据
     */
    function loadData(query_params) {
        var onselect = false;
        var selectId = 0;
        $('#wu-datagrid-2').datagrid({
            idField: 'companyId',
            url: '${ctx}/system/companyManager/list',
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
                {field: 'companyName', title: '公司名称', width: 260},
                {field: 'companyDesc', title: '公司描述', width: 300},
                {field: 'companyCreateDate', title: '创建时间', width: 140, sortable: true,
                    formatter: function (val, row) {return toDate(val);}},
                {field: 'status', title: '状态', width: 80, sortable: true,
                    formatter: function (val) {
                        switch (val) {
                            case 0:
                                return '<span class="text-hide">停用</span>';
                            case 1:
                                return '<span class="text-active">启用</span>';
                        }
                        return '';
                }},
                {field:'operation', title: '操作', width: 60, formatter: function (val, row, index) {
                    return '<a class="wu-table-operation" onclick="openEdit(' + index + ')" href="#">编辑</a>';
                }}
            ]],
            onLoadSuccess: function () { // 读取数据成功调用
                // 把表格设置为填满空间
                $('.datagrid-wrap').css("height", "100%");
            },
            onSelect: function (val, row) { // 选中行与取消选中处理
                var rowId = row.companyId;
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
        var dformat = [d.getFullYear(), d.getMonth() + 1, d.getDate()].join('/')
            + ' ' + [d.getHours(), d.getMinutes()].join(':');
        return dformat;
    }

    /**
     * 开始检索
     */
    function startSearch() {
        var companyId = $('#s_companyId').combobox('getValue');

        if (companyId.trim() == '') { // 空字符串设置为0
            companyId = 0;
        }

        var query_params = {
            companyId : companyId
        };
        loadData(query_params);
    }

    /**
     * 刷新其他用户管理页面
     */
    function reloadOtherUserManager() {
        window.parent.reloadUserManagerTab("公司管理");
    }


</script>

</body>
</html>
