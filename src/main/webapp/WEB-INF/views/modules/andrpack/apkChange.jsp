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
    <title>基本功能</title>

    <script type="text/javascript">


        function initGameSelect(selectId) {
            // 搜索元素
            $('#' + selectId).select2({
                placeholder: '请选择游戏',
                allowClear: true,
                language: 'zh-CN',
                width: '60%'
            });
        }


        function initFileInput(inputId) {
            var control = $('#' + inputId);
            control.fileinput({
                initialCaption: '<c:if test="${localInputFile != null && !empty localInputFile.originalFilename}">上一次上传的母包名：${localInputFile.originalFilename}（再次提交需要重新选择文件）</c:if>',
                language: 'zh', //设置语言
                uploadUrl: '', //上传的地址
//                allowedFileExtensions: ['apk'],//接收的文件后缀
                showUpload: false, //是否显示上传按钮
                showCaption: true,//是否显示标题
                showPreview: false, // 是否显示预览
                browseClass: 'btn btn-primary' //按钮样式
            });
            fileInputError(control);
        }

        function initIconInput(inputId) {
            var control = $('#' + inputId);
            control.fileinput({
                initialCaption: '<c:if test="${iconInputFile != null && !empty iconInputFile.originalFilename}">上一次上传的图标名：${iconInputFile.originalFilename}（再次提交需要重新选择文件）</c:if>',
                language: 'zh', //设置语言
                uploadUrl: '', //上传的地址
//                allowedFileExtensions: ['png'],//接收的文件后缀
                showUpload: false, //是否显示上传按钮
                showCaption: true,//是否显示标题
                showPreview: false, // 是否显示预览
                browseClass: 'btn btn-primary' //按钮样式
            });
        }

        function fileInputError(control) {
            control.on('fileerror', function(event, data, msg) {
                $("#pack-result").html("<span class='pack-result pack-result-error'>文件：" + msg + "</span>");
            });
        }

        $(document).ready(function () {
            //初始化fileinput
            initFileInput("uploadFile");
            initIconInput("uploadIcon");
            // 初始化游戏下拉选择框
            initGameSelect('selectGame');

            // 上一次选择的母包来源
            var fileSource = '${fileSource}';
            if (fileSource == '2') {
                showInput(2);
            } else {
                showInput(1);
            }


            // 限制非数字
            $("#versionNo").keyup(function (event) {
                //如果输入非数字，则替换为''，如果输入数字，则在每4位之后添加一个空格分隔
                if (event.keyCode != 37 && event.keyCode != 39 && event.keyCode != 8) { // 解放左右键的移动
                    this.value = this.value.replace(/[^\d]/g, '');
                }
            });

            $("#pack-form").submit(function () {

                var result = confirm("确认打包？");
                if (!result) return false;

                // 打包遮罩层
                $(this).jqLoading({
                    type:0,
                    backgroundImage: '${ctxStatic}' + '/images/loading.gif',
                    text:'打包中,请稍候...'
                });

                return true;
            });

            /** 母包来源单选按钮的点击事件 **/
            $('input[name=fileSource]').click(function () {
                var val = $(this).val();
                showInput(val);
            });

        });

        /** 显示输入文件框 **/
        function showInput(source) {
            if (source == 1) { // 本地上传
                $('#inputFileHtml .file-input-new').css('display', '');
                $('#inputFileHtml .select2').css('display', 'none');
            } else if (source == 2) { // 服务器获取
                $('#inputFileHtml .file-input-new').css('display', 'none');
                $('#inputFileHtml .select2').css('display', '');
            }
        }

    </script>

</head>
<body>
<div id="wu-layout" class="easyui-layout" data-options="fit:true">
    <div class="pack-layout">
        <form id="pack-form" method="post" action="${ctx}/andrPack/apkChange/submit" role="form" enctype="multipart/form-data" >
            <table id="pack-table" class="pack-table table table-bordered">
                <tr>
                    <td class="pack-table-title">母包来源：</td>
                    <td>
                        <label class="radio-inline">
                            <input type="radio" name="fileSource" value="1"
                                   <c:if test="${fileSource != 2}">checked="checked"</c:if> > 本地上传
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="fileSource" value="2"
                                   <c:if test="${fileSource == 2}">checked="checked"</c:if> > 服务器获取
                        </label>
                    </td>
                </tr>
                <tr>
                    <td id="" class="pack-table-title">上传母包：</td>
                    <td id="inputFileHtml">
                        <input id="uploadFile" name="localInputFile" type="file"  >

                        <select id="selectGame" name="game_Id"
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
                    <td class="pack-table-title">提示：</td>
                    <td><span class="pack-form-tip">留空的功能将不进行更换</span></td>
                </tr>
                <tr>
                    <td class="pack-table-title">换游戏id：</td>
                    <td><input name="apkChangeGameId" type="text" class="form-control pack-form-controller pack-form-textbox"
                               placeholder="如：100107"  value="${apkChangeEntity.apkChangeGameId}" ></td>
                </tr>
                <tr>
                    <td class="pack-table-title">换渠道商id：</td>
                    <td><input name="apkChangeCchId" type="text" class="form-control pack-form-controller pack-form-textbox"
                               placeholder="如：104"  value="${apkChangeEntity.apkChangeCchId}" ></td>
                </tr>
                <tr>
                    <td class="pack-table-title">换广告媒体id：</td>
                    <td><input name="apkChangeMdId" type="text" class="form-control pack-form-controller pack-form-textbox"
                               placeholder="如：10081"  value="${apkChangeEntity.apkChangeMdId}" ></td>
                </tr>
                <tr>
                    <td class="pack-table-title">换游戏名：</td>
                    <td><input name="apkChangeName" type="text" class="form-control pack-form-controller pack-form-textbox"
                               placeholder="如：龙族契约" value="${apkChangeEntity.apkChangeName}" ></td>
                </tr>
                <tr>
                    <td class="pack-table-title">换包名：</td>
                    <td><input name="apkChangePackage" type="text" class="form-control pack-form-controller pack-form-textbox"
                               placeholder="如：com.starjoys.lzqy"  value="${apkChangeEntity.apkChangePackage}" ></td>
                </tr>
                <tr>
                    <td class="pack-table-title">换版本号：</td>
                    <td><input id="versionNo" name="apkChangeVersionNo" type="text" class="form-control pack-form-controller pack-form-textbox"
                               placeholder="如：101，纯数字"  value="${apkChangeEntity.apkChangeVersionNo}" ></td>
                </tr>
                <tr>
                    <td class="pack-table-title">换版本名：</td>
                    <td><input name="apkChangeVersionName" type="text" class="form-control pack-form-controller pack-form-textbox"
                               placeholder="如：1.0.1"  value="${apkChangeEntity.apkChangeVersionName}" ></td>
                </tr>
                <tr>
                    <td class="pack-table-title">换icon：</td>
                    <td><input id="uploadIcon" name="iconInputFile" type="file"></td>
                </tr>
                <tr>
                    <td class="pack-table-title">重新签名：</td>
                    <td>
                        <label class="radio-inline">
                            <input type="radio" name="apkChangeSign" value="1" checked="checked"> 是
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="apkChangeSign" value="0"> 否
                        </label>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td >
                        <div class="pack-form-controller">
                            <button type="submit" class="btn btn-primary btn-block pack-start-btn" >
                                <span class="glyphicon glyphicon-inbox"></span> 开始打包</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="pack-table-title">打包结果：</td>
                    <td id="pack-result">
                        <c:if test="${!empty result}">
                            <c:choose>
                                <c:when test="${result.success}">
                                    <span class="pack-result pack-result-suc">打包成功&nbsp;&nbsp;&nbsp;更改后的APK下载地址：<a
                                            class="btn btn-primary btn-sm" style="color: white;"
                                            href="${result.rows.singleApkFilePath}"> 点击下载</a></span>
                                </c:when>
                                <c:otherwise>
                                    <span class="pack-result pack-result-error">打包失败：${result.message}</span>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
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
            </table>
        </form>
    </div>
</div>
</body>
</html>
