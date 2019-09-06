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
    <div id="wu-toolbar-2" style="padding-bottom: 6px;">
        <div class="wu-toolbar-button">
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openAdd()" plain="false">新增菜单</a>
            <a href="#" class="easyui-linkbutton wu-toolbar-button-padding" iconCls="icon-refresh"
               onclick="javascript:window.location.reload()" plain="false">刷新</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="main-tree" class="easyui-treegrid" toolbar="#wu-toolbar-2"></table>
</div>
<!-- Begin of easyui-dialog -->

<%-- 新增对话框 --%>
<div id="wu-dialog-1" class="easyui-dialog" data-options="closed:true, iconCls:'icon-save'"
     style="width:380px; padding:10px;display: none;">
    <form id="wu-form-1" method="post">
        <table style="border-collapse:separate; border-spacing:0 6px;">
            <tr>
                <td align="right">菜单名称：</td>
                <td><input id="menuNameForm1" name="menuName" class="wu-text easyui-textbox"
                           data-options="prompt:'如：用户管理', required:true, validType:'length[1, 100]'"
                           autocomplete="off" placeholder="如：用户管理"/></td>
            </tr>
            <tr>
                <td align="right">菜单链接：</td>
                <td><input id="menuUrlForm1" name="menuUrl" class="wu-text easyui-textbox"
                           data-options="prompt:'如：/system/userManager', required:true"
                           autocomplete="off" placeholder="如：/system/userManager"/></td>
            </tr>
            <tr>
                <td align="right">上级菜单：</td>
                <td>
                    <select id="menuParentIdForm1" name="menuParentId"
                            class="wu-text easyui-combotree parent-menu-select"
                            data-options="required:true">
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right">菜单排序：</td>
                <td>
                    <input id="menuSortForm1" name="menuSort" class="wu-text easyui-numberspinner" data-options="min:1,required:true"
                           value="1"/>
                </td>
            </tr>
            <tr>
                <td align="right">菜单图标：</td>
                <td><input id="menuIconForm1" name="menuIcon" class="wu-text easyui-textbox"
                           autocomplete="off" data-options="prompt:'如：disk-black', validType:'length[0, 100]'"
                           placeholder="如：disk-black"/></td>
            </tr>
            <tr>
                <td align="right" style="vertical-align: top;">菜单描述：</td>
                <td><input id="menuDescForm1" name="menuDesc" class="wu-textarea easyui-textbox"
                           data-options="multiline:true, validType:'length[0, 200]'"
                           style="height: 60px;" autocomplete="off"/></td>
            </tr>
            <tr>
                <td align="right">导航菜单：</td>
                <td>
                    <label><input type="radio" name="isShow" value="1"/>展示</label>
                    <label><input type="radio" name="isShow" value="0" checked="checked"/>不展示</label>
                </td>
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
                    <input type="hidden" name="menuId" value="0" />
                </td>
            </tr>
            <tr style="display: none;">
                <td></td>
                <td>
                    <input type="hidden" name="moduleId" value="0" />
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
            url: '${ctx}/system/menuManager/add',
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
        $('#wu-form-1').form('submit', {
            url:  '${ctx}/system/menuManager/edit',
            success: function (data) {
                // 隐藏
                disLoad();

                // 返回数据处理
                if (data) {
                    try {
                        var dat = eval('(' + data + ')'); // 转换为json对象
                        if (dat && dat.success) {
                            $.messager.alert('信息提示', '更新成功！', 'info', function () {
                                $('#main-tree').treegrid('reload');
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
     * Name 打开添加窗口
     */
    function openAdd() {
        clearDialog();
        $('#wu-dialog-1').dialog({
            closed: false,
            modal: true,
            title: "新增菜单",
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
    function openEdit(id) {
        var item = $('#main-tree').treegrid('find', id);
        if (item) {
            $('#wu-form-1').form('load', item);
            handlerBaseData(item); // 处理基础数据

            $('#wu-dialog-1').dialog({
                closed: false,
                modal: true,
                title: "编辑菜单",
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

    /** 处理基础数据 **/
    function handlerBaseData(item) {
//        $("span[name='game.gameId']").text(item.game.gameId);
//        $("span[name='game.gameName']").text(item.game.gameName);
//        $("span[name='game.gameShortName']").text(item.game.gameShortName);
//        $("span[name='cch.cchName']").text(item.cch.cchName + '(' + item.cch.cchShortName
//            + ' ' + item.cch.cchId + ')');
//        $("span[name='cch.cchShortName']").text(item.cch.cchShortName);
//        var gameTypeSpan = $("span[name='game.gameType']");
//        if (item.game.gameType == 1) {
//            gameTypeSpan.text("独代");
//        } else if (item.game.gameType == 2) {
//            gameTypeSpan.text("联运");
//        } else {
//            gameTypeSpan.text("未知");
//        }

        var select = $('#menuParentIdForm1');
        var tree = select.combotree('tree');
        var parent = tree.tree('getParent', tree.tree('find', item.id).target);
        select.combotree('setValue', parent.id);
    }

    /** 清除对话框中的内容 **/
    function clearDialog() {
        $('input[name=menuId]').val('0');
        $('input[name=moduleId]').val('0');
        $('#menuNameForm1').textbox('setValue', '');
        $('#menuUrlForm1').textbox('setValue', '');
        $('#menuIconForm1').textbox('setValue', '');
        $('#menuDescForm1').textbox('setValue', '');
        $('#menuSortForm1').textbox('setValue', '1');

        var select = $('#menuParentIdForm1');
        select.combotree('setValue', 0);

//        $('input[name=isShow]:eq(0)').removeAttr("checked");
        $('input[name=isShow]:eq(1)').prop('checked', true);
        $('input[name=status]:eq(1)').prop('checked', true);
    }

    /**
     * Name 载入数据
     */
    function loadData() {
        var onselect = false;
        var selectId = 0;
        $('#main-tree').treegrid({
            idField: 'menuId',
            treeField: 'menuName',
            url: '${ctx}/system/menuManager/list',
            loadFilter: function (data) { // 数据格式化
                return data.rows;
            },
            rownumbers: true,
            singleSelect: true,
            remoteSort: false,
            multiSort: false,
            fitColumns: false,
//            striped: true,
            fit: true,
            animate: true,
//            lines: true,
            columns: [[
                {
                    field: 'menuName', title: '菜单名称', width: 340
                },
                {
                    field: 'menuUrl', title: '菜单URL', width: 360
                },
                {
                    field: 'menuIcon', title: '图标名称',
                    formatter: function (val) {
                        if (val) return val;
                        return '';
                    }
                },
                {
                    field: 'menuType', title: '菜单类型', width: 80,
                    formatter: function (val, row) {
                        if (row.menuId < 0) {
                            return '<span class="text-active">模块</span>'
                        } else if (row.menuId > 0) {
                            if (row.children && row.children.length > 0) {
                                return '<span>父菜单</span>';
                            }
                        }
                        return '';
                    }
                },
                {
                    field: 'menuSort', title: '菜单排序', width: 70,
                    formatter: function (val, row) {
                        if (row.isShow == 1) {
                            return val;
                        }
                        return '';
                    }
                },
                {
                    field: 'status', title: '状态', width: 60,
                    formatter: function (val) {
                        switch (val) {
                            case 0:
                                return '<span class="text-hide">停用</span>';
                            case 1:
                                return '<span class="text-active">启用</span>';
                        }
                        return '';
                    }
                },
                {
                    field: 'isShow', title: '导航菜单', width: 80,
                    formatter: function (val) {
                        switch (val) {
                            case 0:
                                return '<span class="text-hide">不展示</span>';
                            case 1:
                                return '<span class="text-active">展示</span>';
                        }
                        return '';
                    }
                },
                {
                    field: 'operation', title: '操作', width: 60,
                    formatter: function (val, row, index) {
                        if (row.status != -1) {
                            return '<a class="wu-table-operation" onclick="openEdit(' + row.id + ')" href="#">编辑</a>';
                        }
                    }
                }
            ]],
            onLoadSuccess: function (row, data) { // 读取数据成功调用
                // 把表格设置为填满空间
                $('.datagrid-wrap').css("height", "100%");
//                $('.datagrid-body').css("height", "100%");

                toggleTreeLevel(data, 1); // 关闭第一层
                var select = $('.parent-menu-select');
                select.combotree('loadData', data); // 给上级菜单下拉选择控件设置树形数据
                select.combotree('setValue', 0); // 默认选择顶级菜单
            },
            onSelect: function (val, row) { // 选中行与取消选中处理
                var rowId = val.menuId;
                var select = $(this).treegrid('getSelected');
                if (select != null && onselect == true && selectId == rowId) {
                    $(this).treegrid('unselectAll');
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


</script>

</body>
</html>
