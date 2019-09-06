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
    <script type="text/javascript" src="${ctxStatic}/js/md5.js"></script>
    <script type="text/javascript">

        //弹出加载层
        function load() {
            $("<div class='datagrid-mask'></div>").css({
                display: "block", width: "100%",
                height: $(window).height()
            }).appendTo("body");
            $("<div class='datagrid-mask-msg'></div>").html("操作中，请稍候。。。").appendTo("body").css({
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
                url: '${ctx}/user/add',
                success: function (data) {
                    if (data) {
                        try {
                            var dat = eval('(' + data + ')'); // 转换为json对象
                            if (dat && dat.success) {
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
                }
            });
        }

        /**
         * Name 修改记录
         */
        function edit() {
            $('#wu-form-3').form('submit', {
                url: '${ctx}/user/edit',
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
         * Name 修改记录
         */
        function change() {
            $('#wu-form-4').form('submit', {
                url: '${ctx}/user/change',
                success: function (data) {
                    if (data) {
                        try {
                            var dat = eval('(' + data + ')'); // 转换为json对象
                            if (dat && dat.success) {
                                $.messager.alert('信息提示', '密码修改成功！', 'info', function () {
                                    window.location.reload();
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
                }
            });
        }

        /**
         * Name 删除记录
         */
        function remove1() {
            var item = $('#wu-datagrid-2').datagrid('getSelected');
            if (item) {
                $.messager.progress({
                    title: "提示",
                    msg: "操作进行中"
                });
                $.ajax({
                    url: '${ctx}/user/status?id=' + item.userId,
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
            } else {
                $.messager.alert("信息提示", "请先选择修改的数据项", "info");
            }
        }

        /**
         * Name 打开添加窗口
         */
        function openAdd() {
            $('#wu-dialog-2').dialog({
                closed: false,
                modal: true,
                title: "添加信息",
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
        function openEdit() {
            var item = $('#wu-datagrid-2').datagrid('getSelected');
            if (item) {
                $('#wu-form-3').form('load', item);
                $('#wu-dialog-3').dialog({
                    closed: false,
                    modal: true,
                    title: "修改信息",
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
                $.messager.alert("信息提示", "请先选择修改的数据项", "info");
            }
        }


        /**
         * Name 打开修改窗口
         */
        function openPsw() {
            var item = $('#wu-datagrid-2').datagrid('getSelected');
            if (item) {
                item['password'] = '';
                $('#changePaw-username').text(item['username']);
                $('#wu-form-4').form('load', item);
                $('#wu-dialog-4').dialog({
                    closed: false,
                    modal: true,
                    title: "修改密码",
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
                $.messager.alert("信息提示", "请先选择修改的数据项", "info");
            }
        }

        /**
         * Name 分页过滤器
         */
        function pagerFilter(data) {
            if (typeof data.length == 'number' && typeof data.splice == 'function') {// is array
                data = {
                    total: data.length,
                    rows: data
                }
            }
            var dg = $(this);
            var opts = dg.datagrid('options');
            var pager = dg.datagrid('getPager');
            pager.pagination({
                onSelectPage: function (pageNum, pageSize) {
                    opts.pageNumber = pageNum;
                    opts.pageSize = pageSize;
                    pager.pagination('refresh', {pageNumber: pageNum, pageSize: pageSize});
                    dg.datagrid('loadData', data);
                },
                onRefresh: function (pageNum, pageSize) {
                    loadData();
                }
            });
            if (!data.originalRows) {
                data.originalRows = (data.rows);
            }
            var start = (opts.pageNumber - 1) * parseInt(opts.pageSize);
            var end = start + parseInt(opts.pageSize);
            data.rows = (data.originalRows.slice(start, end));
            return data;
        }

        /**
         * Name 载入数据
         */
        function loadData() {
            var onselect = false;
            var selectId = 0;
            $('#wu-datagrid-2').datagrid({
                idField: 'userId',
                url: '${ctx}/user/list',
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
//                fitColumns:true,
                striped: true,
                fit: true,
                columns: [[
                    {field: 'userId', title: '用户标识', width: 120, sortable: true, hidden: true},
                    {field: 'username', title: '用户名', width: 120, sortable: true},
                    {
                        field: 'password', title: '密码', width: 280, formatter: function (value) {
                        return hex_md5(value);
                    }
                    },
                    {field: 'userGroupName', title: '用户组名', width: 100, sortable: true},
                    {field: 'realname', title: '姓名', width: 120, sortable: true},
                    {field: 'mobile', title: '手机号码', width: 180},
                    {field: 'email', title: '邮箱', width: 180},
                    {field: 'createTime', title: '注册时间', width: 240},
                    {
                        field: 'status', title: '状态', width: 80, formatter: function (value) {
                        if (value == 1) {
                            return '<span style="color: #008ead">启用</span>';
                        } else {
                            return '<span style="color: #CC2222">停用</span>';
                        }
                    }
                    }
                ]],
                onLoadSuccess: function () { // 读取数据成功调用
                    // 把表格设置为填满空间
                    $('.datagrid-wrap').css("height", "100%");
//                    $('.datagrid-body').css("height", "100%");
                },
                onSelect: function (index, row) { // 选中行与取消选中处理
                    var select = $(this).datagrid('getSelected');
                    if (select != null && onselect == true && selectId == row.userId) {
                        $(this).datagrid('unselectAll');
                        onselect = false;
                    } else {
                        selectId = row.userId;
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

        function addPswFocus() {
            $('#add-psw').attr('type', 'password');
        }


    </script>
</head>
<body>
<div id="wu-layout" class="easyui-layout" data-options="fit:true">
    <!-- Begin of toolbar -->
    <div id="wu-toolbar-2">
        <div class="wu-toolbar-button" style="margin-top: 8px;">
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openAdd()" plain="false">添加</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-edit" onclick="openEdit()" plain="false"
               style="margin-left: 10px;">修改</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-cut" onclick="openPsw()" plain="false"
               style="margin-left: 10px;">修改密码</a>
            <%--<a href="#" class="easyui-linkbutton" iconCls="icon-remove" onclick="remove1()" plain="false"--%>
               <%--style="margin-left: 10px;">状态变更</a>--%>
            <%--<form action="upload" method="post" enctype="multipart/form-data">--%>
            <%--<input name="file" type="file" class="easyui-filebox" style="width:200px;">--%>
            <%--<input type="submit" value="发送">--%>
            <%--</form>--%>
            <%--<form action="download" method="get">--%>
            <%--<input name="fileName" type="text">--%>
            <%--<input type="submit" value="下载" >--%>
            <%--</form>--%>

        </div>
        <div class="wu-toolbar-search" style="margin-top: 4px;margin-bottom: 4px;">
            <label>用户名：</label><input class="wu-text" style="width:120px">
            <label style="margin-left: 8px;">姓名：</label><input class="wu-text" style="width:120px">
            <a href="#" class="easyui-linkbutton" iconCls="icon-search" style="margin-left: 8px;">开始检索</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="wu-datagrid-2" toolbar="#wu-toolbar-2"></table>
</div>
<!-- Begin of easyui-dialog -->

<div id="wu-dialog-2" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'"
     style="width:350px; padding:10px;">
    <form id="wu-form-2" method="post">
        <table>
            <tr>
                <td width="60" align="right">用户名:</td>
                <td><input type="text" name="username" class="wu-text easyui-validatebox"
                           autocomplete="off" data-options="required:true, validType:'length[1,16]'"/></td>
            </tr>
            <tr>
                <td align="right">密 码:</td>
                <td><input id="add-psw" type="text" name="password" class="wu-text easyui-validatebox"
                           data-options="required:true, validType:'length[1,16]'" autocomplete="off" onfocus="addPswFocus()"/></td>
            </tr>
            <tr>
                <td align="right">姓 名:</td>
                <td><input type="text" name="realname" class="wu-text easyui-validatebox"
                           data-options="required:true, validType:'length[1,32]'" autocomplete="off"/></td>
            </tr>
            <tr>
                <td align="right">用户组名:</td>
                <td>
                    <select name="userGroupId" class="easyui-combobox easyui-validatebox"
                            panelHeight="auto" style="width:200px" title="userGroupName" data-options="required:true">
                        <option value="0">选择用户组</option>
                        <c:forEach items="${userGroupList}" var="userGroup">
                            <option value="${userGroup.groupId}">${userGroup.groupName}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right">手机号码:</td>
                <td><input type="text" name="mobile" class="wu-text easyui-validatebox"
                           data-options="validType:'length[0,11]'"/></td>
            </tr>
            <tr>
                <td align="right">邮 箱:</td>
                <td><input type="text" name="email" class="wu-text easyui-validatebox"
                           data-options="validType:'email'"/></td>
            </tr>
            <tr>
                <td align="right">状 态:</td>
                <td>
                    <div style="float: left;">
                        <input style="float: left;" type="radio" name="status" value="1"/>
                        <div style="margin-top: 2px; float: left;">
                            <span>启用</span>
                        </div>
                    </div>
                    <div style="float: left;">
                        <input style="float: left;" type="radio" name="status" value="0" checked="checked"/>
                        <div style="margin-top: 2px; float: left;">
                            <span>停用</span>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</div>

<div id="wu-dialog-3" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'"
     style="width:350px; padding:10px;">
    <form id="wu-form-3" method="post">
        <table>
            <tr style="display: none">
                <td width="60" align="right">用户标识:</td>
                <td><input type="hidden" name="userId" class="wu-text easyui-validatebox" autocomplete="off"/></td>
            </tr>
            <tr>
                <td width="60" align="right">用户名:</td>
                <td><input type="text" name="username" class="wu-text easyui-validatebox"
                           autocomplete="off" data-options="required:true, validType:'length[1,16]'"/></td>
            </tr>
            <tr>
                <td align="right">姓 名:</td>
                <td><input type="text" name="realname" class="wu-text easyui-validatebox"
                           data-options="required:true, validType:'length[1,32]'" autocomplete="off"/></td>
            </tr>
            <tr>
                <td align="right">用户组名:</td>
                <td>
                    <select name="userGroupId" class="easyui-combobox easyui-validatebox"
                            panelHeight="auto" style="width:200px" title="userGroupName" data-options="required:true">
                        <option value="0">选择用户组</option>
                        <c:forEach items="${userGroupList}" var="userGroup">
                            <option value="${userGroup.groupId}">${userGroup.groupName}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right">手机号码:</td>
                <td><input type="text" name="mobile" class="wu-text easyui-validatebox"
                           data-options="validType:'length[0,11]'"/></td>
            </tr>
            <tr>
                <td align="right">邮 箱:</td>
                <td><input type="text" name="email" class="wu-text easyui-validatebox"
                           data-options="validType:'email'"/></td>
            </tr>
            <tr>
                <td align="right">状 态:</td>
                <td>
                    <div style="float: left;">
                        <input style="float: left;" type="radio" name="status" value="1"/>
                        <div style="margin-top: 2px; float: left;">
                            <span>启用</span>
                        </div>
                    </div>
                    <div style="float: left;">
                        <input style="float: left;" type="radio" name="status" value="0" checked="checked"/>
                        <div style="margin-top: 2px; float: left;">
                            <span>停用</span>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</div>

<div id="wu-dialog-4" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'"
     style="width:350px; padding:10px;">
    <form id="wu-form-4" method="post">
        <table>
            <tr style="display: none">
                <td width="60" align="right">用户标识:</td>
                <td><input type="hidden" name="userId" class="wu-text easyui-validatebox" autocomplete="off"/></td>
            </tr>
            <tr>
                <td width="60" align="right">用户名:</td>
                <td><span id="changePaw-username"></span></td>
            </tr>
            <tr>
                <td align="right">旧密码:</td>
                <td><input type="password" name="oldPassword" class="wu-text easyui-validatebox"
                           data-options="required:true, validType:'length[1,16]'" autocomplete="off"/></td>
            </tr>
            <tr>
                <td align="right">密 码:</td>
                <td><input type="password" name="password" class="wu-text easyui-validatebox"
                           data-options="required:true, validType:'length[1,16]'" autocomplete="off"/></td>
            </tr>
            <tr>
                <td align="right">确认密码:</td>
                <td><input type="password" name="confirmPassword" class="wu-text easyui-validatebox"
                           data-options="required:true, validType:'length[1,16]'" autocomplete="off"/></td>
            </tr>
        </table>
    </form>
</div>

<!-- End of easyui-dialog -->
</body>
</html>
