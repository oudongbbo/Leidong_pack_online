<%--
  Created by IntelliJ IDEA.
  User: Andy
  Date: 2017/1/9
  Time: 9:46
  To change this template use File | Settings | File Templates.
  广告渠道包
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/head-bootstrap.jsp" %>
    <title>渠道打包</title>
</head>
<body>
<div id="wu-layout" class="easyui-layout" data-options="fit:true">
    <div class="pack-layout">
        <form id="pack-form" method="post" action="${ctx}/andrPack/cchPack/submit" role="form">
            <table id="pack-table" class="pack-table table table-bordered">
                <tr>
                    <td class="pack-table-title">打包的游戏：</td>
                    <td>
                        <select id="pack-form-gameId-sel" name="gameId"
                                class="pack-form-controller">
                            <option></option>
                            <c:forEach items="${gameList}" var="item">
                                <c:if test="${item.status == 1}">
                                    <option value="${item.id}"
                                            <c:if test="${item.id == selectGameId}"
                                            >selected="selected"</c:if>>${item.gameName}(${item.gameShortName} ${item.gameId})
                                    </option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="pack-table-title">选择渠道：</td>
                    <td>
                        <div class="pack-form-controller">
                            <button id="pack-from-select-btn" type="button"
                                    class="btn btn-default btn-block pack-start-btn">
                                <span class="glyphicon glyphicon-check"></span> 点击弹出渠道选择框
                            </button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="pack-table-title">参数预览：</td>
                    <td>
                        <div id="pack-table-param-preview" style="width: 60%;"></div>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <div class="pack-form-controller">
                            <button id="pack-submit-btn" type="submit" class="btn btn-primary btn-block pack-start-btn">
                                <span class="glyphicon glyphicon-inbox"></span> 开始打包
                            </button>
                        </div>
                    </td>
                </tr>
                <%--<tr>--%>
                    <%--<td class="pack-table-title">打包过程日志：</td>--%>
                    <%--<td>--%>
                          <%--<textarea id="pack-result-logs"--%>
                                    <%--class="pack-form-logs form-control pack-form-controller " readonly></textarea>--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <tr>
                    <td class="pack-table-title">打包结果：</td>
                    <td id="pack-result-download">
                        <c:if test="${!empty result}">
                            <c:choose>
                                <c:when test="${result.success}">
                                    <span class="pack-result pack-result-suc">打包成功</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="pack-result pack-result-error">打包失败：${result.message}</span>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

<%-- 渠道选择 --%>
<div id="myModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <p class="modal-title">请选择渠道</p>
            </div>
            <div class="modal-body">
                <div id="checkbox-all-select">
                    <a id="ckbox-all-sel-link" href="#">全选</a>
                    &nbsp;
                    <a id="ckbox-invert-sel-link" href="#">反选</a>
                </div>
                <div id="checkbox-content">
                    <form id="checkbox-form">
                        <table id="checkbox-table"></table>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button id="myModal-save-btn" type="button" class="btn btn-primary btn-sm">确认</button>
                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<%-- 查看参数 --%>
<div id="paramModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <form id="param-form" method="post" action="${ctx}/packManager/gameParamRecord/updateRecordData">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h5 class="modal-title">参数预览</h5>
                </div>
                <div class="modal-body">
                    <div>
                        <table id="param-table" class="table">
                            <tr>
                                <td class="param-name">
                                    渠道名
                                </td>
                                <td>
                                    <span id="param-cchName" style="padding-left: 4px;"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="param-name">
                                    横竖屏
                                </td>
                                <td class="param-value">
                                    <select id="param-isLandScape" name="record.isLandScape" class="form-control">
                                        <option value="1">横屏</option>
                                        <option value="0">竖屏</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="param-name">
                                    是否定额
                                </td>
                                <td>
                                    <select id="param-isFinal" name="record.isFinal" class="form-control">
                                        <option value="1">定额</option>
                                        <option value="0">不定额</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="param-name">
                                    重建R文件
                                </td>
                                <td>
                                    <select id="param-replaceR" name="record.replaceR" class="form-control">
                                        <option value="0">否</option>
                                        <option value="1">是</option>
                                    </select>
                                </td>
                            </tr>
                            <tr id="param-pname-content">
                                <td class="param-name">
                                    包名
                                </td>
                                <td>
                                    <input id="param-pname" name="record.pname" class="form-control"/>
                                </td>
                            </tr>
                        </table>
                        <input id="param-gpRecordId" type="hidden" name="record.gpRecordId"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary btn-sm">修改</button>
                    <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">关闭</button>
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script type="text/javascript">

    $(document).ready(function () {

        // 搜索元素
        $("#pack-form-gameId-sel").select2({
            placeholder: '请选择游戏',
            allowClear: true,
            language: 'zh-CN',
            width: '60%'
        });

        // 对应游戏是否有渠道参数
        var hasCchParam = false;

        // 选择游戏下拉框改变事件
        $('#pack-form-gameId-sel').change(function () {
            hasCchParam = false;

            // 清空操作
            $("#checkbox-table").text(""); // 清空选择框表格
            $('#pack-table-param-preview').text(""); // 清空参数预览
            paramListBySelectGame = null; // 清空选择的游戏参数列表

            var select_GameId = $(this).val(); // 选择的游戏
            if (select_GameId != 0) {
                hasCchParam = createCchCheckBoxTable(select_GameId);
            }
        });

        // 选择渠道按钮点击事件
        $('#pack-from-select-btn').click(function () {
            showModal();
        });

        // 渠道勾选框全选链接点击事件
        $('#ckbox-all-sel-link').click(function () {
            $("#checkbox-form input").each(function () {
                // 全部勾选
                $(this).prop("checked", true);
            });
        });

        // 渠道勾选框反选链接点击事件
        $('#ckbox-invert-sel-link').click(function () {
            $("#checkbox-form input").each(function () {
                // 反选
                if ($(this).is(':checked')) {
                    $(this).prop("checked", false);
                } else {
                    $(this).prop("checked", true);
                }
            });
        });

        // 模态框保存按钮点击事件
        $('#myModal-save-btn').click(function () {
            showParamPreview(); //显示参数预览
            $("#myModal").modal('hide'); // 隐藏弹出框
        });

        // 参数预览修改按钮提交事件
        $('#param-form').submit(function () {
            var url = $(this).attr("action");
            $.ajax({
                type: 'POST',
                url: url,
                data: $(this).serialize(),
                success: function (data) {
                    if (data) {
                        if (data.success) {
                            reloadOtherPackManager();

                            // 当前所修改的修改js中的游戏参数渠道数据
                            currentPreviewGameParamItem.record.gpRecordData = data.rows.record.gpRecordData;
                            alert("修改成功!");
                            $('#paramModal').modal('hide'); // 关闭参数弹出框
                        } else {
                            showErrorMessage(-1, data.message);
                        }
                    } else {
                        showErrorMessage(-1, "无数据返回");
                    }
                },
                error: function (xmlhttp) {
                    showErrorMessage(xmlhttp.status, "出错!");
                }
            });
            return false;
        });

        // 开始打包提交事件
        $("#pack-form").submit(function () {
            var _gameId = $("#pack-form-gameId-sel").val(); // 游戏id

            if (!_gameId) {
                alert("请先选择游戏");
                return false;
            }

            if (!checkParamList || checkParamList.length == 0) {
                alert("请先勾选渠道");
                return false;
            }

            // 获取选中的游戏参数id
            var selectIdsList = [];
            for (var i = 0; i < checkParamList.length; i++) { // 取出勾选的参数id
                selectIdsList.push(checkParamList[i].gameParamId);
            }

            var selectIdsJsonArr = JSON.stringify(selectIdsList); // 把参数列表转为json

            // 打包数据
            var url = $(this).attr("action");
            var postData = $(this).serialize() + "&" + "idsList=" + selectIdsJsonArr;

            // 检查
            $.ajax({
                type: 'POST',
                url: '${ctx}/andrPack/cchPack/checkRunning',
                data: "idsList=" + selectIdsJsonArr,
                success: function (checkData) {
                    if (checkData) {
                        if (checkData.success) {
                            if (confirm(checkData.message)) {

                                // 发送打包请求
                                $.ajax({
                                    type: 'POST',
                                    url: url,
                                    data: postData,
                                    beforeSend: function () {
                                        // 打包遮罩层
                                        $(this).jqLoading({
                                            type: 0,
                                            backgroundImage: '${ctxStatic}' + '/images/loading.gif',
                                            text: '打包中,请稍候...'
                                        });
                                    },
                                    success: function (submitData) {
                                        $(this).jqLoading("destroy");

                                        if (submitData) {
                                            handlerPackResult(submitData);
                                        } else {
                                            showErrorMessage(-1, "无数据返回");
                                        }
                                    },
                                    error: function (xmlhttp) {
                                        $(this).jqLoading("destroy");
                                        showErrorMessage(xmlhttp.status, "出错!");
                                    }
                                });


                            }
                        } else {
                            alert(checkData.message);
                        }
                    }
                },
                error: function (xmlhttp) {
                    showErrorMessage(xmlhttp.status, "出错!");
                }
            });

            return false;

        });


        /**
         * 显示选择渠道的弹出框
         * @returns {boolean}
         */
        function showModal() {
            var formGameId = $('#pack-form-gameId-sel'); // 选择游戏下拉框
            var select_GameId = formGameId.val(); // 选择的游戏
            if (select_GameId == 0) { // 没选择游戏
                alert("请先选择打包的游戏!");
                return false;
            }

            if (!hasCchParam) {
                alert("此游戏没有可对接渠道参数，请在参数管理中配置");
                return false;
            }
            // 弹出选择渠道窗口
            $('#myModal').modal();
        }

        // 取出游戏参数json列表并转换成json对象
        var gameParamListJson = '${gameParamListJson}'.replace(/\r\n/g, "\\r\\n");
        gameParamListJson = eval("(" + gameParamListJson + ")");


        /**
         * 创建渠道选择勾选框表格
         * @param gameId 游戏Id
         * @returns {boolean} 是否有渠道
         */
        function createCchCheckBoxTable(_gameId) {
            // 构建选择框表格
            var html = "";
            var checkNum = 0; // 勾选框数量计数器
            for (var i = 0; i < gameParamListJson.length; i++) {
                var gameParam = gameParamListJson[i];
                if (gameParam.game.id == _gameId) {
                    if (checkNum >= 5 && checkNum % 5 == 0) { // 每5个就换行
                        html += "</tr>";
                    }
                    if (checkNum % 5 == 0) { // 每5个就换行
                        html += "<tr>";
                    }
                    html += createCheckBox(gameParam.cch.id, gameParam.cch.cchName, checkNum); //创建勾选框
                    checkNum++; // 勾选框数量加1
                }
            }
            // 插入表格元素中
            $("#checkbox-table").append(html);

            // 判断此游戏是否有渠道
            if (checkNum > 0) {
                return true;
            } else {
                return false;
            }
        }

        /**
         * 创建勾选框
         * @param cchId 渠道Id
         * @param cchName 渠道名
         * @param index 个数
         * @returns {string}
         */
        function createCheckBox(_cchId, cchName, index) {
            return "<td><label class='checkbox-inline'><input type='checkbox' name='checkbox" + index + "' value='"
                + _cchId + "'>" + cchName + "</label></td>";
        }

        /**
         * 展示参数预览
         */
        function showParamPreview() {
            var paramPreviewDiv = $('#pack-table-param-preview');
            paramPreviewDiv.text(""); // 清空参数预览

            // 把其他的游戏参数过滤出去
            var select_GameId = $("#pack-form-gameId-sel").val(); // 选择的游戏
            paramListBySelectGame = [];
            for (var i = 0; i < gameParamListJson.length; i++) {
                var item = gameParamListJson[i];
                if (item.game.id == select_GameId) {
                    paramListBySelectGame.push(item);
                }
            }

            // 构建参数预览的html
            var html = "";
            checkParamList = [];
            var count = 0; // 选中参数计数器
            $("#checkbox-form input").each(function (index) {
                if ($(this).is(':checked')) {
                    // 把勾选的参数加入到列表中
                    var item = paramListBySelectGame[index];
                    checkParamList.push(item);

                    if (count != 0 && count % 8 == 0) { // 每10个换行
                        html += "<br/><br/>";
                    }
                    // 参数预览的html样式处理
                    html += "<a href='#' onclick='showParamModal(" + count + ");' >"
                        + item.cch.cchName + '(' + item.cch.cchShortName + ")</a>&nbsp;&nbsp;&nbsp;";
                    count++; // 加1
                }
            });
            paramPreviewDiv.append(html);
        }
    });

    var paramListBySelectGame; // 已选游戏的参数列表
    var checkParamList; // 已勾选的参数列表
    var currentPreviewGameParamItem; // 当前预览的游戏参数

    /**
     * 显示查看参数弹出框
     * @param index
     */
    function showParamModal(index) {
        currentPreviewGameParamItem = checkParamList[index];
        var item = currentPreviewGameParamItem;

        $('#param-gpRecordId').val(item.record.gpRecordId); // 游戏参数id
        $("#param-cchName").text(item.cch.cchName); // 渠道名

        // 把包名以下的参数全删除
        $("#param-pname-content").nextAll().each(function () {
            $(this).remove();
        });

        createFormByParam(item.record.gpRecordData); // 创建参数表单

        $("#paramModal").modal(); // 展示参数预览框
    }

    /**
     * 通过参数构造表单
     */
    function createFormByParam(data) {
        // 拆分换行参数
        var paramList = data.split("\r\n");
        // 组装参数表单
        var html = "";
        for (var i = 0; i < paramList.length; i++) {
            var dividerIndex = paramList[i].indexOf('='); // 拆分=参数, 左边为参数名, 右边为参数值
            if (dividerIndex != -1) {
                var allAttr0 = paramList[i].substring(0, dividerIndex); // 等于号前面的参数名
                var allAttr1 = paramList[i].substr(dividerIndex + 1); // 等于号后面的参数值

                if (allAttr0 == "isLandScape") { // 横竖屏
                    $("#param-isLandScape").val(allAttr1);
                } else if (allAttr0 == "isFinal") { // 是否定额
                    $("#param-isFinal").val(allAttr1);
                } else if (allAttr0 == "pname") { // 包名
                    $("#param-pname").val(allAttr1);
                } else if (allAttr0 == "replaceR") { // 是否重建R
                    $("#param-replaceR").val(allAttr1);
                }
                else {
                    // 组装参数html
                    html = html + createParamInput(allAttr0, allAttr1);
                }
            }
        }
        // 把html添加进去
        $("#param-table").append(html);
    }

    /**
     * 创建参数输入框
     */
    function createParamInput(name, value) {
        return "<tr><td class='param-name'>" + name + "</td><td class='param-value'><input type='text' " +
            "name='allParam-" + name + "' class='form-control' autocomplete='off' value='" + value + "' /></td></tr>";
    }

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
        alert("失败：" + oriMessage);
    }

    /**
     * 处理打包结果
     * @param data 返回的数据
     */
    function handlerPackResult(data) {
        var resultItem = $('#pack-result-download'); // 打包结果元素
        // 清空上一次打包结果数据
        var zipSingleItem = $('#pack-result-zip-single');
        if (zipSingleItem) {
            zipSingleItem.remove();
        }
        resultItem.text('');

        // 打包过程日志
        if (data.rows && data.rows.packLogs) {
            $('#pack-result-logs').text(data.rows.packLogs);
        }

        if (data.success) {
            // 下载结果
            resultItem.append('<span class="pack-result pack-result-suc">' + data.message + '&nbsp;&nbsp;&nbsp;</span>');
            if (data.rows.singleApkFilePath) {

                // 只有一个包 下载
                resultItem.append('<span class="pack-result">下载地址：' +
                    '<a class="btn btn-primary btn-sm" style="color: white;" href="'
                    + data.rows.singleApkFilePath + '">' +
                    ' 点击下载<a/></span>');
            } else if (data.rows.zipFilePath) {

                // 批量下载
                resultItem.append('<span class="pack-result">批量打包下载地址：' +
                    '<a class="btn btn-primary btn-sm" style="color: white;" href="'
                    + data.rows.zipFilePath + '">' +
                    ' 点击下载<a/></span>');

                // 单个包下载
                var html = '<tr id="pack-result-zip-single"><td class="pack-table-title">单个包下载：</td><td><div>';
                var filePathList = data.rows.filePathList;
                for (var i = 0; i < filePathList.length; i++) {
                    var filePath = filePathList[i];
                    if (i != 0 && i % 2 != 0) {
                        html = html + '&nbsp;&nbsp;&nbsp;&nbsp;';
                    }
                    if (i != 0 && i % 2 == 0) {
                        html = html + '<br /><br />';
                    }
                    html = html + '<span>' + (i + 1) + '&nbsp;|&nbsp;' +
                        filePath.key + '&nbsp;|&nbsp;<a class="btn btn-primary btn-sm"' +
                        ' style="color: white" href="' + filePath.value + '">点击下载</a></span>';
                }
                html = html + '</div></td></tr>';

                $('#pack-table').append(html);
            }

        } else {
            resultItem.append('<span class="pack-result pack-result-suc">打包失败：' + data.message + '</span>');
        }
    }

    /**
     * 刷新其他打包管理页面
     */
    function reloadOtherPackManager() {
        window.parent.reloadPackManagerTab('渠道包');
    }

</script>

</body>
</html>
