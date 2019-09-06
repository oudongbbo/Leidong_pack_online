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
    <title>控制台日志</title>
</head>
<body>
<div id="wu-layout">
    <div class="pack-layout">
        <form id="pack-form" method="get" action="${ctx}/systemLog/consoleLog/submit" onsubmit="return confirm('确认清除日志?');">
            <table id="pack-table" class="pack-table table table-bordered">
                <tr>
                    <td class="pack-table-title">操作：</td>
                    <td>
                        <button type="button" class="btn btn-primary pack-start-btn"
                                onclick="window.location.reload();">
                            <span class="glyphicon glyphicon-refresh"></span> 刷新日志
                        </button>
                        <button style="margin-left: 40px" type="submit" class="btn btn-primary pack-start-btn">
                            <span class="glyphicon glyphicon-trash"></span> 清除日志
                        </button>
                    </td>
                </tr>
                <tr>
                    <td class="pack-table-title">控制台日志：</td>
                    <td>
                    <textarea style="width: 80%;"
                              class="pack-console-logs form-control pack-form-controller"
                              wrap="off" readonly><c:if
                            test="${!empty result && result.success}">${result.rows}</c:if><c:if
                            test="${!empty result && !result.success}">${result.message}</c:if>
                    </textarea>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

<script type="text/javascript">

    $(document).ready(function () {
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
        alert("失败：" + oriMessage);
    }


</script>
</body>
</html>
