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
    <title>广告渠道包</title>

    <script type="text/javascript">


        function initFileInput(inputId) {
            var control = $('#' + inputId);
            control.fileinput({
                initialCaption: '<c:if test="${file != null}">上一次上传的母包名：${file.originalFilename}（再次提交需要重新选择文件）</c:if>',
                language: 'zh', //设置语言
                uploadUrl: '', //上传的地址
//                allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
                showUpload: false, //是否显示上传按钮
                showCaption: true,//是否显示标题
                showPreview: false, // 是否显示预览
                browseClass: 'btn btn-primary' //按钮样式
            });
        }

        function initGameSelect(selectId) {
            // 搜索元素
            $('#' + selectId).select2({
                placeholder: '请选择游戏',
                allowClear: true,
                language: 'zh-CN',
                width: '60%'
            });
        }

        $(document).ready(function () {
            // 初始化游戏下拉选择框
            initGameSelect('selectGame');

            <%--<c:if test="${sessionScope.currentUserGroup.groupId == 1}">--%>
            //初始化fileinput
            initFileInput("uploadFile");
            // 上一次选择的母包来源
            var fileSource = '${fileSource}';
            if (fileSource == '2') {
                showInput(2);
            } else {
                showInput(1);
            }
            <%--</c:if>--%>


            // 限制非数字
            $(".pack-form-textbox").keyup(function (event) {
                //如果输入非数字，则替换为''，如果输入数字，则在每4位之后添加一个空格分隔
                if (event.keyCode != 37 && event.keyCode != 39 && event.keyCode != 8) { // 解放左右键的移动
                    this.value = this.value.replace(/[^\d]/g, '');
                }
            });

            $("#pack-form").submit(function () {
                // 检查打包的数字标识
                var num = 0;
                var startNum = $("input[name=mdRecordStart]").val() - 0;
                var endNum = $("input[name=mdRecordEnd]").val() - 0;
                if (startNum) {
                    if (endNum && endNum > 0) {
                        if (endNum < startNum) {
                            alert("提交失败:结束标识不能小于起始标识!");
                            return false;
                        } else {
                            num = endNum - startNum + 1;
                            if (num > 50) {
                                alert("提交失败:打包数量超过50个!");
                                return false;
                            }
                        }
                    } else {
                        // 只有起始标识时只打包一个
                        num = 1;
                    }
                } else {
                    alert("提交失败:起始标识不能为空!");
                    return false;
                }

                var result = confirm("您当前打包数量为" + num + "，确认提交？");
                if (!result) return false;

                // 打包遮罩层
                $(this).jqLoading({
                    type: 0,
                    backgroundImage: '${ctxStatic}' + '/images/loading.gif',
                    text: '打包中,请稍候...'
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
        <form id="pack-form" method="post" action="${ctx}/andrPack/mdPack/submit" role="form"
              enctype="multipart/form-data">
            <table id="pack-table" class="pack-table table table-bordered">
                <%--<c:if test="${sessionScope.currentUserGroup.groupId == 1}">--%>
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
                <%--</c:if>--%>
                <tr>
                    <td id="" class="pack-table-title">上传母包：</td>
                    <td id="inputFileHtml">
                        <%--<c:if test="${sessionScope.currentUserGroup.groupId != 1}">--%>
                            <%--<input type="hidden" name="fileSource" value="2"/>--%>
                        <%--</c:if>--%>

                        <input id="uploadFile" name="file" type="file">
                          <%--<c:if test="${sessionScope.currentUserGroup.groupId != 1}">style="display: none;" </c:if>>--%>


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
                    <td class="pack-table-title">输入渠道标识：</td>
                    <td><span class="pack-form-tip">如果只打一个包，起始和结束标识，保持一致。最多同时打50个推广包。</span></td>
                </tr>
                <tr>
                    <td class="pack-table-title">起始标识：</td>
                    <td><input name="mdRecordStart" type="text"
                               class="form-control pack-form-controller pack-form-textbox"
                               placeholder="如：10000" value="${mdRecordEntity.mdRecordStart}"></td>
                </tr>
                <tr>
                    <td class="pack-table-title">结束标识：</td>
                    <td><input name="mdRecordEnd" type="text"
                               class="form-control pack-form-controller pack-form-textbox"
                               placeholder="如：10050" value="${mdRecordEntity.mdRecordEnd}"></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <div class="pack-form-controller">
                            <button type="submit" class="btn btn-primary btn-block pack-start-btn">
                                <span class="glyphicon glyphicon-inbox"></span> 开始打包
                            </button>
                        </div>
                    </td>
                </tr>
                <%--<tr>--%>
                <%--<td class="pack-table-title">打包过程日志：</td>--%>
                <%--<td>--%>
                <%--<textarea class="pack-form-logs form-control pack-form-controller " readonly><c:if--%>
                <%--test="${!empty result}">${result.rows.packLogs}</c:if></textarea>--%>
                <%--</td>--%>
                <%--</tr>--%>
                <tr>
                    <td class="pack-table-title">打包结果：</td>
                    <td>
                        <c:if test="${!empty result}">
                        <c:choose>
                        <c:when test="${result.success}">
                        <span class="pack-result pack-result-suc">打包成功&nbsp;&nbsp;&nbsp;</span>
                        <c:if test="${result.rows.zipFilePath != null}">
                        <c:set var="filePath" value="${result.rows.zipFilePath}" scope="page"/>
                        <span class="pack-result">批量打包下载地址:
                                      </c:if>
                                      <c:if test="${result.rows.singleApkFilePath != null}">
                                              <c:set var="filePath" value="${result.rows.singleApkFilePath}"
                                                     scope="page"/>
                                              <span class="pack-result">新的推广包下载地址:
                                      </c:if>
                                                  <a class="btn btn-primary btn-sm" style="color: white;"
                                                     href="${filePath}"> 点击下载</a>
                                              </span>
                                  </c:when>
                                  <c:otherwise>
                                      <span class="pack-result pack-result-error">打包失败：${result.message}</span>
                                  </c:otherwise>
                              </c:choose>
                          </c:if>
                    </td>
                </tr>
                <c:if test="${result != null && result.success && result.rows.filePathList != null}">
                    <tr>
                        <td class="pack-table-title">单个包下载：</td>
                        <td>
                            <div>
                                <c:forEach items="${result.rows.filePathList}" var="item" varStatus="status">
                                    <c:if test="${status.count != 1 && (status.count - 1) % 4 != 0}">
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                    </c:if>
                                    <c:if test="${status.count != 1 && (status.count - 1) % 4 == 0}">
                                        <br/><br/>
                                    </c:if>
                                    <span>${status.count}&nbsp;|&nbsp;${item.key}&nbsp;|&nbsp;<a
                                            class="btn btn-primary btn-sm" style="color: white" href="${item.value}">点击下载</a></span>
                                </c:forEach>
                            </div>
                        </td>
                    </tr>
                </c:if>
            </table>
        </form>
    </div>
</div>
</body>
</html>
