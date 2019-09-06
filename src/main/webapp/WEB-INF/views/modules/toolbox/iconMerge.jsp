<%--
  Created by IntelliJ IDEA.
  User: Andy
  Date: 2017/1/22
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/head-bootstrap.jsp" %>
    <title>图标合并工具</title>
    <style type="text/css">
        .radio-inline {
            margin-right: 10px;
        }
    </style>
</head>
<body>
<div id="wu-layout">
    <div class="pack-layout">
        <form id="pack-form" method="post" action="${ctx}/toolbox/iconMerge/submit" role="form"
              enctype="multipart/form-data">
            <table id="pack-table" class="pack-table table table-bordered">
                <tr>
                    <td class="pack-table-title">上传游戏图标：</td>
                    <td><input id="pack-form-icon-file" name="iconFile" type="file"></td>
                </tr>
                <tr>
                    <td class="pack-table-title pack-form-tip">选择游戏须知：</td>
                    <td><span class="pack-form-tip">所属游戏可不选择，选择会覆盖渠道打包的图标，请谨慎选择！</span></td>
                </tr>
                <tr>
                    <td class="pack-table-title">所属游戏：</td>
                    <td>
                        <select id="pack-form-game-sel" name="game.id"
                                class="pack-form-controller">
                            <option></option>
                            <c:forEach items="${gameList}" var="item">
                                <c:if test="${item.status == 1}">
                                    <option value="${item.id}" >${item.gameName}(${item.gameShortName} ${item.gameId})
                                    </option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="pack-table-title">合并的渠道角标：</td>
                    <td>
                        <select id="pack-form-cch-sel" name="cch.id"
                                class="pack-form-controller">
                            <option></option>
                            <c:forEach items="${cchList}" var="item">
                                <c:if test="${item.status == 1 and item.cchSubscript != null and item.cchSubscript != ''}">
                                    <option value="${item.id}" >${item.cchName}(${item.cchShortName} ${item.cchId})
                                    </option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="pack-table-title">选择角标方向：</td>
                    <td id="direction-checkBox-group">
                    </td>
                </tr>
                <tr>
                    <td class="pack-table-title">合并后图标的宽高：</td>
                    <td>
                        <input id="pack-form-zoom" class="form-control pack-form-controller" name="zoomSize" type="number" value="512" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <div class="pack-form-controller">
                            <button type="submit" class="btn btn-primary btn-block pack-start-btn">
                                <span class="glyphicon glyphicon-inbox"></span> 开始合并
                            </button>
                        </div>
                    </td>
                </tr>
                <%--<tr>--%>
                    <%--<td class="pack-table-title">打包过程日志：</td>--%>
                    <%--<td>--%>
                          <%--<textarea class="pack-form-logs form-control pack-form-controller"--%>
                                    <%--style="max-height: 220px;" readonly><c:if--%>
                                  <%--test="${!empty result}">${result.rows.packLogs}</c:if></textarea>--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <tr>
                    <td class="pack-table-title">打包结果：</td>
                    <td id="pack-result-download">
                        <c:if test="${!empty result}">
                            <c:choose>
                                <c:when test="${result.success}">
                                    <span class="pack-result pack-result-suc">打包成功 </span>
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

<script type="text/javascript">

    $(document).ready(function () {
        initPage();
        initData();
        initEvent();
    });


    /** 渠道列表 **/
    var cchList = null;

    /**
     * 初始化页面
     */
    function initPage() {
        initFileInput('pack-form-icon-file');
        initSelect('pack-form-game-sel', '选择游戏（选择会自动复制到渠道打包图片中，不选择会提供下载地址）');
        initSelect('pack-form-cch-sel', '选择渠道');
    }

    /**
     * 初始化数据
     */
    function initData() {
        cchList = JSON.parse('${cchListJson}'.replace(/\r\n/g, '\\r\\n'));
    }

    /**
     * 初始化事件
     */
    function initEvent() {

        // 渠道下拉框选择事件
        $('#pack-form-cch-sel').change(function () {
            $('#direction-checkBox-group').text('');  // 清空角标方向勾选框组

            var select_cchId = $(this).val();
            if (select_cchId && select_cchId != '') {
                var selectCchObj = null;
                // 找出所选的渠道对象
                for (var i = 0; i < cchList.length; i++) {
                    var item = cchList[i];
                    if (item && item.id == select_cchId) {
                        selectCchObj = item;
                        break;
                    }
                }

                if (selectCchObj) {
                    var subscript = selectCchObj.cchSubscript; // 角标
                    createSubscriptGroup(subscript);
                }
            }
        });

        // 表单提交
        $('#pack-form').submit(function () {
            if (confirm("确认打包?")) {

                var fd = new FormData();

                // 把表单中的所有非文件的参数放到fd对象中
                var dataArray = $(this).serializeArray();
                for (var i = 0; i < dataArray.length; i++) {
                    var item = dataArray[i];
                    if (item.name == 'game.id' && !item.value) {
                        fd.append(item.name, 0);
                    } else {
                        fd.append(item.name, item.value);
                    }
                }
                // 把文件放到表单中
                fd.append("iconFile", $('#pack-form-icon-file').get(0).files[0]);

                // 提交表单
                $.ajax({
                    url: $(this).attr('action'),
                    type: "POST",
                    processData: false,
                    contentType: false,
                    data: fd,
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

            return false;
        });


        // 限制宽高非数字
        $("#pack-form-zoom").keypress(function (event) {
            return (/[\d]/.test(String.fromCharCode(event.keyCode)))
        });

    }


    /**
     * 初始化上传控件
     * @param inputId 控件id
     */
    function initFileInput(inputId) {
        var control = $('#' + inputId);
        control.fileinput({
            initialCaption: '图标大小必须为512，只支持png图片格式',
            language: 'zh', //设置语言
            uploadUrl: '', //上传的地址
//                allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
            showUpload: false, //是否显示上传按钮
            showCaption: true,//是否显示标题
            showPreview: true, // 是否显示预览
            browseClass: 'btn btn-primary' //按钮样式
        });
    }

    /**
     * 初始化下拉框控件
     * @param selectId 下拉框id
     * @param placeholder 注释
     */
    function initSelect(selectId, placeholder) {
        selectId = '#' + selectId;
        $(selectId).select2({
            placeholder: placeholder,
            allowClear: true,
            language: 'zh-CN',
            width: '60%'
        });
    }


    /**
     * 创建角标单选组
     */
    function createSubscriptGroup(subscript) {
        var html = '';
        if (subscript) {

            var subscriptArray = subscript.split('|'); // 分隔出角标数组
            for (var i = 0; i < subscriptArray.length; i++) {
                var item = subscriptArray[i];
                switch (item) {
                    case '左上': {
                        html += '<label class="radio-inline"><input ' +
                            'name="icMergeRecordDirection" type="radio" ' +
                            'value="左上">左上角</label>';
                        break;
                    }
                    case '右上': {
                        html += '<label class="radio-inline"><input ' +
                            'name="icMergeRecordDirection" type="radio" ' +
                            'value="右上">右上角</label>';
                        break;
                    }
                    case '左下': {
                        html += '<label class="radio-inline"><input ' +
                            'name="icMergeRecordDirection" type="radio" ' +
                            'value="左下">左下角</label>';
                        break;
                    }
                    case '右下': {
                        html += '<label id="direction-default-checkbox" class="radio-inline"><input ' +
                            'name="icMergeRecordDirection" type="radio" ' +
                            'value="右下" checked>右下角</label>';
                        break;
                    }
                }
            }

        }

        // 没有角标时
        if (html == '') {
            html += '<span>此渠道没有上传角标</span>';
        }

        // 生成html
        var group = $('#direction-checkBox-group');
        group.append(html);

        // 没有右下角角标时,默认勾选第一个
//        if ($('#direction-default-checkbox').length <= 0) {
//            group.children().first().find('input').attr('checked', '');
//        }
    }

    /**
     * 处理打包结果
     * @param data 返回的数据
     */
    function handlerPackResult(data) {
        var resultItem = $('#pack-result-download'); // 打包结果元素
        // 清空上一次打包结果数据
        resultItem.text('');

        // 打包过程日志
//        if (data.rows && data.rows.packLogs) {
//            $('#pack-result-logs').text(data.rows.packLogs);
//        }

        if (data.success) {
            // 下载结果
            resultItem.append('<span class="pack-result pack-result-suc">' + data.message + '&nbsp;&nbsp;&nbsp;</span>');
            if (data.rows.singleApkFilePath) {

                // 只有一个包 下载
                resultItem.append('<span class="pack-result">下载地址：' +
                    '<a class="btn btn-primary btn-sm" style="color: white;" href="'
                    + data.rows.singleApkFilePath + '" target="_blank" download="image" >' +
                    ' 点击下载<a/></span>');
            }

        } else {
            resultItem.append('<span class="pack-result pack-result-suc">打包失败：' + data.message + '</span>');
        }
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


</script>
</body>
</html>
