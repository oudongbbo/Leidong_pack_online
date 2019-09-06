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
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openAdd()" plain="false">新增用户组</a>
            <a href="#" class="easyui-linkbutton wu-toolbar-button-padding" iconCls="icon-refresh"
               onclick="javascript:window.location.reload()" plain="false">刷新</a>
        </div>
        <div class="wu-toolbar-search" >
            <label>用户组名称：</label>
            <select id="s_groupId" class="easyui-combobox">
                <option value="0">全部</option>
                <c:forEach items="${groupList}" var="item">
                    <option value="${item.groupId}">${item.groupName}</option>
                </c:forEach>
            </select>
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
                <td align="right">用户组名称：</td>
                <td><input name="groupName" class="wu-text easyui-textbox"
                           data-options="prompt:'如：用户组名称', required:true, validType:'length[1, 100]'"
                           autocomplete="off" placeholder="如：用户组名称"/></td>
            </tr>
            <tr>
                <td align="right">所属公司：</td>
                <td>
                    <select id="add_companyId" name="company.companyId" class="easyui-combobox"
                            panelHeight="auto" style="width:250px" title="companyId"
                            data-options="required:true">
                        <c:forEach items="${companyList}" var="item">
                            <c:if test="${item.status == 1}">
                                <option value="${item.companyId}">${item.companyName}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right">权限设置：</td>
                <td>
                    <select id="authForm1" name="groupMenus"
                            class="wu-text easyui-combotree auth-select" multiple >
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right" style="vertical-align: top;">用户组描述：</td>
                <td><input name="groupDesc" class="wu-textarea easyui-textbox"
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
                <td align="right">用户组名称：</td>
                <td><input name="groupName" class="wu-text easyui-textbox"
                           data-options="prompt:'如：用户组名称', required:true, validType:'length[1, 100]'"
                           autocomplete="off" placeholder="如：用户组名称"/></td>
            </tr>
            <tr>
                <td align="right">所属公司：</td>
                <td>
                    <select name="company.companyId" class="easyui-combobox"
                            panelHeight="auto" style="width:250px" title="companyId"
                            data-options="required:true">
                        <c:forEach items="${companyList}" var="item">
                            <c:if test="${item.status == 1}">
                                <option value="${item.companyId}">${item.companyName}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right" style="vertical-align: top;">用户组描述：</td>
                <td><input name="groupDesc" class="wu-textarea easyui-textbox"
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
                    <input name="groupId" type="hidden" />
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
            url: '${ctx}/system/userGroupManager/add',
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
            url: '${ctx}/system/userGroupManager/edit',
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
     * 权限设置
     */
    function authSet(groupId) {
        // 取出勾选
        var checkNodes = $('#authTree').tree('getChecked', 'checked');
        var ids = '';
        for (var i = 0; i < checkNodes.length; i++) {
            var node = checkNodes[i];
            if (i != 0) {
                ids = ids + ',';
            }
            ids = ids + node.id;
        }

        // 组装传输的参数
        var param = 'groupMenus=' + ids + '&groupId=' + groupId;

        $.messager.progress({
            title: "提示",
            msg: "设置中..."
        });
        $.ajax({
            url: '${ctx}/system/userGroupManager/authSet',
            method: 'post',
            data: param,
            success: function (data) {
                $.messager.progress('close');
                $('#wu-dialog-3').dialog('close');
                if (data && data.success) {
                    $.messager.alert('信息提示', '设置成功!');

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


    /**
     * Name 打开添加窗口
     */
    function openAdd() {
        $('#add_companyId').combobox('clear');
        $('#wu-dialog-1').dialog({
            closed: false,
            modal: true,
            title: "新增用户组",
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
        item['company.companyId'] = item.company.companyId;
        if (item) {
//            handlerBaseData(item); // 处理基础数据
            $('#wu-form-2').form('load', item);

            $('#wu-dialog-2').dialog({
                closed: false,
                modal: true,
                title: "编辑用户组",
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

    function openAuth(index) {
        var item = $('#wu-datagrid-2').datagrid('getData').rows[index];
        if (item) {
            handlerAuthData(item);

            $('#wu-dialog-3').dialog({
                closed: false,
                modal: true,
                title: "权限设置",
                left: 600,
                top: 80,
                buttons: [{
                    text: '确定',
                    iconCls: 'icon-ok',
                    handler: function () {
                        authSet(item.groupId);
                    }
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
     * 处理当前所勾选的权限数据
     */
    function handlerAuthData(item) {
        // 当前用户的权限数组
        var groupActs = item.groupActs;

        var authTree = $('#authTree');
        // 权限设置对话框中的数据初始化
        authTree.tree({
            checkbox: true,
            data: authMenuData
        });

        if (groupActs && groupActs != '') {
            var actsArray = groupActs.split(',');
            for (var i = 0; i < actsArray.length; i++) {
                var act = actsArray[i];
                authTree.tree('check', authTree.tree('find', act).target);
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
            idField: 'groupId',
            url: '${ctx}/system/userGroupManager/list',
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
                {field: 'groupName', title: '用户组名称', width: 300},
                {field: 'company.companyName', title: '所属公司', width: 160,
                    formatter: function (val, row) {return row.company.companyName;}},
                {field: 'groupDesc', title: '用户组描述', width: 300},
                {field: 'groupCreateDate', title: '创建时间', width: 140, sortable: true,
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
                {field:'operation', title: '操作', width: 90, formatter: function (val, row, index) {
                    return '<a class="wu-table-operation" onclick="openAuth(' + index + ')" href="#">权限设置</a>';
                }},
                {field:'operation1', title: '操作1', width: 60, formatter: function (val, row, index) {
                    return '<a class="wu-table-operation" onclick="openEdit(' + index + ')" href="#">编辑</a>';
                }}
            ]],
            onLoadSuccess: function () { // 读取数据成功调用
                // 把表格设置为填满空间
                $('.datagrid-wrap').css("height", "100%");
            },
            onSelect: function (val, row) { // 选中行与取消选中处理
                var rowId = row.groupId;
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

        makeAuthTree();
    });

    var authMenuData; // 权限菜单数据

    /**
     * 解析权限菜单
     */
    function makeAuthTree() {
        // 解析权限菜单
        authMenuData = JSON.parse('${menuListJson}');
        toggleTreeLevel(authMenuData, 2);
        // 新增对话框中的权限
        $('.auth-select').combotree('loadData', authMenuData);
        // 权限设置对话框中的
        $('#authTree').tree({
            checkbox: true,
            data: authMenuData
        });
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
     * 开始检索
     */
    function startSearch() {
        var groupId = $('#s_groupId').combobox('getValue');
        var companyId = $('#s_companyId').combobox('getValue');
        if (groupId.trim() == '') { // 空字符串设置为0
            groupId = 0;
        }
        if (companyId.trim() == '') { // 空字符串设置为0
            companyId = 0;
        }
        var query_params = {
            groupId : groupId,
            'company.companyId' : companyId
        };
        loadData(query_params);
    }

    /**
     * 打开或者关闭某一层级
     * @param data 树形数据
     * @param level 层级
     * @param isOpen 是否展开
     */
    function toggleTreeLevel(data, level, isOpen) {
        if (data) {
            // 先通过遍历取出对应层数的所有子数据
            var tempData = data;
            for (var i = 0; i < level; i++) {
                var array = [];
                for (var j = 0; j < tempData.length; j++) {
                    var item1 = tempData[j];
                    if (item1) {
                        var child = item1.children;
                        if (child) {
                            for (var k = 0; k < child.length; k++) {
                                var item2 = child[k];
                                if (item2) array.push(item2);
                            }
                        }
                    }
                }
                tempData = array;
            }
            // 把当层的子数据设置好
            for (i = 0; i < tempData.length; i++) {
                var item = tempData[i];
                if (item && isOpen) {
                    item.state = 'open';
                } else {
                    item.state = 'closed';
                }
            }
        }
    }


    /**
     * 刷新其他用户管理页面
     */
    function reloadOtherUserManager() {
        window.parent.reloadUserManagerTab("用户组管理");
    }

</script>

</body>
</html>
