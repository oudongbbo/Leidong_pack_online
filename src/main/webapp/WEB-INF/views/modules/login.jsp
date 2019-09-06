<%--
  Created by IntelliJ IDEA.
  User: Andy
  Date: 2016/12/29
  Time: 1:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <title>${projectNameCN}-登录</title>
    <link rel="shortcut icon" href="${ctxStatic}/images/favicon.ico" type="image/x-icon" />
    <script type="text/javascript" src="${ctxStatic}/js/jquery-1.9.1.min.js"></script>
    <style>
        body {
            background: rgb(220, 220, 220);
            font-family: "Helvetica Neue", "Hiragino Sans GB", "Microsoft YaHei", "\9ED1\4F53", Arial, sans-serif;
            color: #222;
            font-size: 12px;
        }

        * {
            padding: 0;
            margin: 0;
        }

        .top_div {
            background: #008ead;
            width: 100%;
            height: 400px;
        }

        .ipt {
            border: 1px solid #d3d3d3;
            padding: 10px 10px 10px 35px;
            width: 340px;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s
        }

        .ipt:focus {
            border-color: #66afe9;
            outline: 0;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, .6);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, .6)
        }

        .u_logo {
            background: url("${ctxStatic}/images/username.png") no-repeat;
            padding: 10px 10px;
            position: absolute;
            top: 43px;
            left: 40px;

        }

        .p_logo {
            background: url("${ctxStatic}/images/password.png") no-repeat;
            padding: 10px 10px;
            position: absolute;
            top: 12px;
            left: 40px;
        }

        a {
            text-decoration: none;
        }

        .tou {
            background: url("${ctxStatic}/images/tou.png") no-repeat;
            width: 97px;
            height: 92px;
            position: absolute;
            top: -87px;
            left: 140px;
        }

        .left_hand {
            background: url("${ctxStatic}/images/left_hand.png") no-repeat;
            width: 32px;
            height: 37px;
            position: absolute;
            top: -38px;
            left: 150px;
        }

        .right_hand {
            background: url("${ctxStatic}/images/right_hand.png") no-repeat;
            width: 32px;
            height: 37px;
            position: absolute;
            top: -38px;
            right: -64px;
        }

        .initial_left_hand {
            background: url("${ctxStatic}/images/hand.png") no-repeat;
            width: 30px;
            height: 20px;
            position: absolute;
            top: -12px;
            left: 100px;
        }

        .initial_right_hand {
            background: url("${ctxStatic}/images/hand.png") no-repeat;
            width: 30px;
            height: 20px;
            position: absolute;
            top: -12px;
            right: -112px;
        }

        .left_handing {
            background: url("${ctxStatic}/images/left-handing.png") no-repeat;
            width: 30px;
            height: 20px;
            position: absolute;
            top: -24px;
            left: 139px;
        }

        .right_handinging {
            background: url("${ctxStatic}/images/right_handing.png") no-repeat;
            width: 30px;
            height: 20px;
            position: absolute;
            top: -21px;
            left: 210px;
        }

    </style>

    <script type="text/javascript">
        $(function () {
            //得到焦点
            $("#password").focus(function () {
                $("#left_hand").animate({
                    left: "150",
                    top: " -38"
                }, {
                    step: function () {
                        if (parseInt($("#left_hand").css("left")) > 140) {
                            $("#left_hand").attr("class", "left_hand");
                        }
                    }
                }, 2000);
                $("#right_hand").animate({
                    right: "-64",
                    top: "-38px"
                }, {
                    step: function () {
                        if (parseInt($("#right_hand").css("right")) > -70) {
                            $("#right_hand").attr("class", "right_hand");
                        }
                    }
                }, 2000);
            });
            //失去焦点
            $("#password").blur(function () {
                $("#left_hand").attr("class", "initial_left_hand");
                $("#left_hand").attr("style", "left:100px;top:-12px;");
                $("#right_hand").attr("class", "initial_right_hand");
                $("#right_hand").attr("style", "right:-112px;top:-12px");
            });
        });

        // 回车键登录
        function loginKeyPress() {
            if (event.keyCode == 13) {
                postLogin();
            }
        }

        // 发送登陆
        function postLogin() {
            $("#userForm").submit();
        }

        $(document).ready(function () {
            var paramArray = getRequest();
            var msg = paramArray["msg"];
            if (msg) {
                var alertStr = '';
                switch(msg) {
                    case 'authReset' : {
                        alertStr = '您的权限已发生变化,请重新登录!';
                        break;
                    }
                }
                alert(alertStr);
                window.location.href = '${ctx}/login';
            }
        });

        /**
         * 获取参数
         * @returns {Object}
         * @constructor
         */
        function getRequest() {
            var url = location.search; //获取url中"?"符后的字串
            var theRequest = new Object();
            if (url.indexOf("?") != -1) {
                var str = url.substr(1);
                strs = str.split("&");
                for(var i = 0; i < strs.length; i ++) {
                    theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
                }
            }
            return theRequest;
        }

    </script>
</head>
<body>
<div class="top_div"></div>
<div style="background: rgb(255, 255, 255); margin: -100px auto auto; border: 1px solid rgb(232, 232, 232);
   border-image: none; width: 400px; height: 200px; text-align: center;
   -webkit-border-radius: 6px;-moz-border-radius: 6px;border-radius: 6px;
   -webkit-box-shadow: #666 0px 0px 10px;-moz-box-shadow: #666 0px 0px 10px;box-shadow: #666 0px 0px 10px;">
    <div style="width: 165px; height: 96px; position: absolute;">
        <div class="tou"></div>
        <div class="initial_left_hand" id="left_hand"></div>
        <div class="initial_right_hand" id="right_hand"></div>
    </div>
    <form id="userForm" method="post" action="#">
        <p style="padding: 30px 0 10px; position: relative;">
            <span class="u_logo"></span>
            <input class="ipt" id="username" type="text" name="username" placeholder="请输入用户名" value="${username}"
                   onkeypress="loginKeyPress()">
        </p>
        <p style="position: relative;">
            <span class="p_logo"></span>
            <input class="ipt" id="password" type="password" name="password" placeholder="请输入密码" value="${password}"
                   onkeypress="loginKeyPress()">
        </p>
        <div style="height: 50px; line-height: 50px; margin-top: 20px; border-top-color: rgb(190, 190, 190);
          border-top-width: 0px; border-top-style: solid;">
            <p style="margin: 0 35px 20px 45px;">
            <span style="float: left; color: #CC2222; font-weight: bold;">
                <%--<a style="color: rgb(204, 204, 204);" href="#">忘记密码?</a>--%>
                <c:if test="${errorMsg != null}">登录失败，${errorMsg}</c:if>
            </span>
                <span style="float: right;">
                <%--<a style="color: rgb(204, 204, 204); margin-right: 10px;" href="#">注册</a>--%>
                <a style="background: rgb(0, 142, 173); padding: 7px 20px; border-radius: 4px;
                 border: 1px solid rgb(26, 117, 152); border-image: none;
                  color: rgb(255, 255, 255); font-weight: bold;" href="#" onclick="postLogin()">登录</a>
           </span>
            </p>
        </div>
    </form>
</div>
</body>
</html>
