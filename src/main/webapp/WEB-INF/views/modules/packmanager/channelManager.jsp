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
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openAdd()" plain="false">新增渠道</a>
            <a href="#" class="easyui-linkbutton wu-toolbar-button-padding" iconCls="icon-refresh"
               onclick="javascript:window.location.reload()" plain="false">刷新</a>
        </div>
        <div class="wu-toolbar-search" >
            <label>渠道ID：</label>
            <select id="s_cchId" class="easyui-combobox">
                <option value="">全部</option>
                <c:forEach items="${cchList}" var="item">
                    <option value="${item.cchId}">${item.cchId}</option>
                </c:forEach>
            </select>
            <label>渠道名称：</label>
            <select id="s_cchName" class="easyui-combobox">
                <option value="">全部</option>
                <c:forEach items="${cchList}" var="item">
                    <option value="${item.cchName}">${item.cchName}</option>
                </c:forEach>
            </select>
            <label>渠道标识：</label>
            <select id="s_cchShortName" class="easyui-combobox">
                <option value="">全部</option>
                <c:forEach items="${cchList}" var="item">
                    <option value="${item.cchShortName}">${item.cchShortName}</option>
                </c:forEach>
            </select>
            <label>渠道状态：</label>
            <select id="s_cchVerUpStatus" class="easyui-combobox">
                <option value="0">全部</option>
                <option value="1">首次对接</option>
                <option value="2">渠道更新</option>
                <option value="3">渠道修复</option>
            </select>
            <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="startSearch();" >开始检索</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="wu-datagrid-2" toolbar="#wu-toolbar-2"></table>
</div>
<!-- Begin of easyui-dialog -->

<div id="wu-dialog-2" class="easyui-dialog" data-options="closed:true, iconCls:'icon-add'"
     style="width:380px; padding:10px;display: none;">
    <form id="wu-form-2" method="post" enctype="multipart/form-data">
        <table style="border-collapse:separate; border-spacing:0px 6px;">
            <tr>
                <td width="60" align="right">渠道ID：</td>
                <td><input id="cchIdAdd" name="cchId" class="wu-text easyui-textbox"
                           data-options="prompt:'如：101', required:true"
                           autocomplete="off" placeholder="如：101"/></td>
            </tr>
            <tr>
                <td width="60" align="right">渠道名：</td>
                <td><input name="cchName" class="wu-text easyui-textbox"
                           data-options="prompt:'如：腾讯ysdk', required:true, validType:'length[1,40]'"
                           autocomplete="off" placeholder="如：腾讯ysdk"/></td>
            </tr>
            <tr>
                <td width="60" align="right">渠道简写：</td>
                <td><input name="cchShortName" class="wu-text easyui-textbox"
                           autocomplete="off" data-options="prompt:'如：ysdk', required:true, validType:'length[1,24]'"
                           placeholder="如：ysdk"/></td>
            </tr>
            <tr>
                <td align="right">渠道权重：</td>
                <td>
                    <select name="cchWeight" class="easyui-combobox"
                            panelHeight="auto" style="width:250px">
                        <option value="1">一级(最重要)</option>
                        <option value="2">二级(重要)</option>
                        <option value="3" selected="selected">三级(普通)</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right" style="vertical-align: top;">渠道参数：</td>
                <td>
                    <input name="cchAllParam" class="wu-textarea easyui-textbox"
                           data-options="prompt:'全部参数：\nmainActivity=技术确认\nappid=QQID\nwxAppid=微信ID',
                            multiline:true, validType:'length[1, 200]'"
                           style="height: 80px;" autocomplete="off"
                           placeholder="全部参数：\nmainActivity=技术确认\nappid=QQID\nwxAppid=微信ID" />
                </td>
            </tr>
            <tr>
                <td align="right"></td>
                <td>
                    <input name="cchRequireParam" class="wu-textarea easyui-textbox"
                           data-options="prompt:'必填参数：\nappid=\nwxAppid=',
                            multiline:true, validType:'length[1,200]'"
                           style="height: 80px;" autocomplete="off" placeholder="必填参数：\nappid=\nwxAppid=" />
                </td>
            </tr>
            <tr>
                <td align="right">渠道data：</td>
                <td><input name="cchDataFile" class="wu-text easyui-filebox"
                           data-options="prompt:'渠道data的zip压缩包', buttonText:'选择文件', required:true" /></td>
            </tr>
            <tr id="cchPluginAdd" style="display: none;">
                <td align="right">渠道plugin：</td>
                <td><input name="cchPluginFile" class="wu-text easyui-filebox"
                           data-options="prompt:'SDK自营plugin的zip压缩包', buttonText:'选择文件'" /></td>
            </tr>
            <tr style="display: none;">
                <td align="right">渠道版本：</td>
                <td>
                    <input name="ver.cchVerName" class="wu-text easyui-textbox"
                           autocomplete="off" data-options="prompt:'如：1.2.6', required:true, validType:'length[1,40]'"
                           placeholder="如：1.2.6" type="hidden" value="0" />
                </td>
            </tr>
            <tr>
                <td align="right" style="vertical-align: top;">更新说明：</td>
                <td><input name="ver.cchVerUpDesc" class="wu-textarea easyui-textbox"
                           data-options="prompt:'首次提交1.2.6', multiline:true, required:true, validType:'length[1,200]'"
                           style="height: 60px;" autocomplete="off" placeholder="首次提交1.2.6" /></td>
            </tr>
            <tr>
                <td align="right">渠道闪屏：</td>
                <td>
                    <select name="cchSplash" class="easyui-combobox"
                            panelHeight="auto" style="width:250px" title="cchSplash">
                        <option value="">请选择</option>
                        <option value="有(手动)">有(手动)</option>
                        <option value="有(自带)">有(自带)</option>
                        <option value="不需要">不需要</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right">渠道角标：</td>
                <td>
                    <input name="cchLTIconFile" class="wu-text easyui-filebox"
                           data-options="prompt:'左上角', buttonText:'选择文件'"
                           style="width: 124px;" />
                    <input name="cchRTIconFile" class="wu-text easyui-filebox"
                           data-options="prompt:'右上角', buttonText:'选择文件'"
                           style="width: 124px;" />
                    <br /> <br />
                    <input name="cchLBIconFile" class="wu-text easyui-filebox"
                           data-options="prompt:'左下角', buttonText:'选择文件'"
                           style="width: 124px;" />
                    <input name="cchRBIconFile" class="wu-text easyui-filebox"
                           data-options="prompt:'右下角', buttonText:'选择文件'"
                           style="width: 124px;" />
                </td>
            </tr>
        </table>
    </form>
</div>

<%-- 编辑框 --%>
<div id="wu-dialog-3" class="easyui-dialog" data-options="closed:true, iconCls:'icon-save'"
     style="width:390px; padding:10px; display: none;">
    <form id="wu-form-3" method="post" enctype="multipart/form-data">
        <table style="border-collapse:separate; border-spacing:0px 6px;">
            <tr style="display: none;">
                <td align="right">ID：</td>
                <td><input name="id" type="hidden" /></td>
            </tr>
            <tr style="display: none;">
                <td align="right">渠道ID：</td>
                <td><input name="cchId" type="hidden" /></td>
            </tr>
            <tr>
                <td align="right">渠道名：</td>
                <td><input name="cchName" class="wu-text easyui-textbox"
                           data-options="prompt:'如：腾讯ysdk', required:true, validType:'length[1,40]'"
                           autocomplete="off" placeholder="如：腾讯ysdk"/></td>
            </tr>
            <tr>
                <td align="right">渠道简写：</td>
                <td><input name="cchShortName" class="wu-text easyui-textbox"
                           autocomplete="off" data-options="prompt:'如：ysdk', required:true, validType:'length[1,24]'"
                           placeholder="如：ysdk"/></td>
            </tr>
            <tr>
                <td align="right">渠道权重：</td>
                <td>
                    <select name="cchWeight" class="easyui-combobox"
                            panelHeight="auto" style="width:250px">
                        <option value="1">一级(最重要)</option>
                        <option value="2">二级(重要)</option>
                        <option value="3">三级(普通)</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right" style="vertical-align: top;">渠道参数：</td>
                <td>
                    <input name="cchAllParam" class="wu-textarea easyui-textbox"
                           data-options="prompt:'全部参数：\nmainActivity=技术确认\nappid=QQID\nwxAppid=微信ID',
                            multiline:true"
                           style="height: 80px;" autocomplete="off"
                           placeholder="全部参数：\nmainActivity=技术确认\nappid=QQID\nwxAppid=微信ID" />
                </td>
            </tr>
            <tr>
                <td align="right"></td>
                <td>
                    <input name="cchRequireParam" class="wu-textarea easyui-textbox"
                           data-options="prompt:'必填参数：\nappid=\nwxAppid=',
                            multiline:true"
                           style="height: 80px;" autocomplete="off" placeholder="必填参数：\nappid=\nwxAppid=" />
                </td>
            </tr>
            <tr>
                <td align="right">渠道data：</td>
                <td><input name="cchDataFile" class="wu-text easyui-filebox"
                           data-options="prompt:'渠道data的zip压缩包', buttonText:'选择文件',
                            accept:'application/zip', required:true" /></td>
            </tr>
            <tr id="cchPluginEdit" style="display: none;">
                <td align="right">渠道plugin：</td>
                <td><input name="cchPluginFile" class="wu-text easyui-filebox"
                           data-options="prompt:'SDK自营plugin的zip压缩包', buttonText:'选择文件',
                            accept:'application/zip'" /></td>
            </tr>
            <tr style="display: none;">
                <td align="right">渠道版本：</td>
                <td>
                    <input name="ver.cchVerName" class="wu-text easyui-textbox"
                           autocomplete="off" data-options="prompt:'如：1.2.6', required:true, validType:'length[1,40]'"
                           placeholder="如：1.2.6" type="hidden" value="0" />
                </td>
            </tr>
            <tr>
                <td align="right">渠道更新状态：</td>
                <td>
                    <select name="ver.cchVerUpStatus" class="easyui-combobox"
                            panelHeight="auto" style="width:250px" title="cchSplash">
                        <option value="2">渠道更新</option>
                        <option value="3">渠道修复</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right" style="vertical-align: top;">更新说明：</td>
                <td><input name="ver.cchVerUpDesc" class="wu-textarea easyui-textbox"
                           data-options="prompt:'首次提交1.2.6', multiline:true, required:true, validType:'length[1,200]'"
                           style="height: 60px;" autocomplete="off" placeholder="首次提交1.2.6" /></td>
            </tr>
            <tr>
                <td align="right">渠道闪屏：</td>
                <td>
                    <select name="cchSplash" class="easyui-combobox"
                            panelHeight="auto" style="width:250px" title="cchSplash">
                        <option value="">请选择</option>
                        <option value="有(手动)">有(手动)</option>
                        <option value="有(自带)">有(自带)</option>
                        <option value="不需要">不需要</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right">渠道角标：</td>
                <td>
                    <input name="cchLTIconFile" class="wu-text easyui-filebox"
                           data-options="prompt:'左上角', buttonText:'选择文件'"
                           style="width: 124px;" />
                    <input name="cchRTIconFile" class="wu-text easyui-filebox"
                           data-options="prompt:'右上角', buttonText:'选择文件'"
                           style="width: 124px;" />
                    <br /> <br />
                    <input name="cchLBIconFile" class="wu-text easyui-filebox"
                           data-options="prompt:'左下角', buttonText:'选择文件'"
                           style="width: 124px;" />
                    <input name="cchRBIconFile" class="wu-text easyui-filebox"
                           data-options="prompt:'右下角', buttonText:'选择文件'"
                           style="width: 124px;" />
                </td>
            </tr>
            <tr style="display: none">
                <td></td>
                <td><input name="cchSubscript" type="hidden" /></td>
            </tr>
        </table>
    </form>
</div>

<%-- 修改框 --%>
<div id="wu-dialog-4" class="easyui-dialog" data-options="closed:true, iconCls:'icon-save'"
     style="width:390px; padding:10px; display: none;">
    <form id="wu-form-4" method="post" enctype="multipart/form-data">
        <table style="border-collapse:separate; border-spacing:0px 6px;">
            <tr>
                <td align="right">渠道名：</td>
                <td><input name="cchName" class="wu-text easyui-textbox"
                           data-options="prompt:'如：腾讯ysdk', required:true, validType:'length[1,40]'"
                           autocomplete="off" placeholder="如：腾讯ysdk"/></td>
            </tr>
            <tr>
                <td align="right">渠道简写：</td>
                <td><input name="cchShortName" class="wu-text easyui-textbox"
                           autocomplete="off" data-options="prompt:'如：ysdk', required:true, validType:'length[1,24]'"
                           placeholder="如：ysdk"/></td>
            </tr>
            <tr>
                <td align="right">渠道权重：</td>
                <td>
                    <select name="cchWeight" class="easyui-combobox"
                            panelHeight="auto" style="width:250px">
                        <option value="1">一级(最重要)</option>
                        <option value="2">二级(重要)</option>
                        <option value="3">三级(普通)</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right" style="vertical-align: top;">渠道参数：</td>
                <td>
                    <input name="cchAllParam" class="wu-textarea easyui-textbox"
                           data-options="prompt:'全部参数：\nmainActivity=技术确认\nappid=QQID\nwxAppid=微信ID',
                            multiline:true"
                           style="height: 80px;" autocomplete="off"
                           placeholder="全部参数：\nmainActivity=技术确认\nappid=QQID\nwxAppid=微信ID" />
                </td>
            </tr>
            <tr>
                <td align="right"></td>
                <td>
                    <input name="cchRequireParam" class="wu-textarea easyui-textbox"
                           data-options="prompt:'必填参数：\nappid=\nwxAppid=',
                            multiline:true"
                           style="height: 80px;" autocomplete="off" placeholder="必填参数：\nappid=\nwxAppid=" />
                </td>
            </tr>
            <tr>
                <td align="right">渠道闪屏：</td>
                <td>
                    <select name="cchSplash" class="easyui-combobox"
                            panelHeight="auto" style="width:250px" title="cchSplash">
                        <option value="">请选择</option>
                        <option value="有(手动)">有(手动)</option>
                        <option value="有(自带)">有(自带)</option>
                        <option value="不需要">不需要</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right">渠道角标：</td>
                <td>
                    <input name="cchLTIconFile" class="wu-text easyui-filebox"
                           data-options="prompt:'左上角', buttonText:'选择文件'"
                           style="width: 124px;" />
                    <input name="cchRTIconFile" class="wu-text easyui-filebox"
                           data-options="prompt:'右上角', buttonText:'选择文件'"
                           style="width: 124px;" />
                    <br /> <br />
                    <input name="cchLBIconFile" class="wu-text easyui-filebox"
                           data-options="prompt:'左下角', buttonText:'选择文件'"
                           style="width: 124px;" />
                    <input name="cchRBIconFile" class="wu-text easyui-filebox"
                           data-options="prompt:'右下角', buttonText:'选择文件'"
                           style="width: 124px;" />
                </td>
            </tr>
            <tr style="display: none">
                <td></td>
                <td><input name="cchSubscript" type="hidden" /></td>
            </tr>
            <tr style="display: none;">
                <td align="right">ID：</td>
                <td><input name="id" type="hidden" /></td>
            </tr>
            <tr style="display: none;">
                <td align="right">渠道ID：</td>
                <td><input name="cchId" type="hidden" /></td>
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
            url: '${ctx}/packManager/cch/add',
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
            url: '${ctx}/packManager/cch/edit',
            success: function (data) {
                // 隐藏
                disLoad();

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
            url: '${ctx}/packManager/cch/change',
            success: function (data) {
                // 隐藏
                disLoad();

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
                        url: '${ctx}/packManager/cch/status?id=' + item.id,
                        success: function (data) {
                            $.messager.progress('close');
                            if (data && data.success) {
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
            title: "新增渠道",
            left: 600,
            top: 80,
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
                title: "更新渠道",
                left: 600,
                top: 80,
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
                title: "更新渠道",
                left: 600,
                top: 100,
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
//        item["cchVerName"] = "";
        item["ver.cchVerUpStatus"] = 2;
        item["ver.cchVerUpDesc"] = "";

        // 判断如果cchid为100, 显示渠道插件编辑文件上传框
        var cchPluginEdit = $('#cchPluginEdit');
        if (item.cchId && item.cchId == 100) {
            cchPluginEdit.css('display', '');
        } else {
            cchPluginEdit.css('display', 'none');
        }
    }

    /**
     * Name 载入数据
     */
    function loadData(query_params) {
        var onselect = false;
        var selectId = 0;
        $('#wu-datagrid-2').datagrid({
            idField: 'id',
            url: '${ctx}/packManager/cch/list',
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
                {field: 'cchId', title: '渠道ID', width: 80, sortable: true},
                {field: 'cchName', title: '渠道名称', width: 120},
                {field: 'cchShortName', title: '渠道标识', width: 90, sortable: true},
                {field: 'cchWeight', title: '渠道权重', width: 80, sortable: true,
                    formatter:function (val) {
                   return val + "级";
                }},
                {field: 'cchSplash', title: '闪屏'},
                {field: 'cchSubscript', title: '角标'},
                {field: 'ver.cchVerName', title: '最新版本', width: 100,
                    formatter: function (val, row) {return row.ver.cchVerName;}},
                {field:'cchParam', title:'参数预览', width:70,
                    formatter: function (val, row, index) {
                    return '<a class="wu-table-operation" onclick="showCchParam(' + index + ')" href="#">点击查看</a>';
                }},
                {field: 'cchCreateDate', title: '创建时间', width: 120, sortable: true,
                    formatter: function (val, row) {return toDate(val);}},
                {field: 'ver.cchVerUpDate', title: '最近修改', width: 120, sortable: true,
                    formatter: function (val, row) {return toDate(row.ver.cchVerUpDate);}},
                {field: 'ver.cchVerUpStatus', title: '渠道状态', width: 70, formatter: function (val, row) {
                    var result = "";
                    switch (row.ver.cchVerUpStatus) {
                        case 1:
                            result = "首次对接";
                            break;
                        case 2:
                            result = "渠道更新";
                            break;
                        case 3:
                            result = "渠道修复";
                            break;
                    }
                    return result;
                }},
                {field:'operation', title: '操作', width: 60, formatter: function (val, row, index) {
                    return '<a class="wu-table-operation" onclick="openEdit(' + index + ')" href="#">更新</a>';
                }},
                {field:'operation1', title: '操作1', width: 60, formatter: function (val, row, index) {
                    return '<a class="wu-table-operation" onclick="openChange(' + index + ')" href="#">修改</a>';
                }},
                {field:'operation2', title: '操作2', width: 80, formatter: function (val, row) {
                    return '<a class="wu-table-operation" href="cchVersion?_cchId=' + row.id + '">查询详情</a>';
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
                var rowId = row.cchId;
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

    /** 显示渠道参数 **/
    function showCchParam(index) {
        var item = $('#wu-datagrid-2').datagrid('getData').rows[index];
        if (item) {
            var allParam = item.cchAllParam.replace(/\r\n/g, '<br />');
            var requireParam = item.cchRequireParam.replace(/\r\n/g, '<br />');
            $.messager.alert("参数预览",
                '<br /><table border="1" cellpadding="0" rules="rows" frame="void"><td>全部参数：</td><td>' + allParam + '</td></tr>' +
                '<tr><td>必填参数：</td><td>' + requireParam + '</td></tr></table>');
        }
    }

    /**
     * 加载完毕后调用读取数据
     */
    $(document).ready(function () {
        loadData();

        /** 判断如果cchid为100, 把渠道插件添加文件上传框显示出来 **/
        var cchPluginAdd = $('#cchPluginAdd');
        $('#cchIdAdd').textbox('textbox').focusout(function () {
            var currentCchId = $(this).val();
            if (currentCchId && currentCchId == 100) {
                cchPluginAdd.css('display', '');
            } else {
                cchPluginAdd.css('display', 'none');
            }
        })
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

    /**
     * 刷新其他打包管理页面
     */
    function reloadOtherPackManager() {
        window.parent.reloadPackManagerTab("渠道管理");
    }


    /**
     * 开始检索
     */
    function startSearch() {
        var cchId = $('#s_cchId').combobox('getValue');
        var cchName = $('#s_cchName').combobox('getValue');
        var cchShortName = $('#s_cchShortName').combobox('getValue');
        var cchVerUpStatus = $('#s_cchVerUpStatus').combobox('getValue');

        if (cchVerUpStatus.trim() == '') { // 空字符串设置为0
            cchVerUpStatus = 0;
        }

        var query_params = {
            cchId : cchId,
            cchName : cchName,
            cchShortName : cchShortName,
            "ver.cchVerUpStatus" : cchVerUpStatus
        };
        loadData(query_params);
    }


</script>

</body>
</html>
