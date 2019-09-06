<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
    <meta name="copyright" content="All Rights Reserved, Copyright (C) 2016, LingWu, Ltd."/>
    <title>${projectNameCN}-首页</title>
    <script type="text/javascript">
        $(function () {
            $('.wu-side-tree li').bind("click", function () {
                var clickLink = $(this).find("a");
                var title = clickLink.text();
                var url = clickLink.attr('data-link');
                var iconCls = clickLink.attr('data-icon');
                var iframe = clickLink.attr('iframe') == 1 ? true : false;
                addTab(title, url, iconCls, iframe);
            });
        })

        /**
         * Name 载入树形菜单
         */
        $('#wu-side-tree').tree({
            url: '${ctxStatic}/temp/menu.php',
            cache: false,
            onClick: function (node) {
                var url = node.attributes['url'];
                if (url == null || url == "") {
                    return false;
                }
                else {
                    addTab(node.text, url, '', node.attributes['iframe']);
                }
            }
        });

        /**
         * Name 选项卡初始化
         */
        function initTab() {
            $('#wu-tabs').tabs({
                tools: [{
                    iconCls: 'icon-reload',
                    border: true,
                    handler: function () {
//                        $('#wu-datagrid').datagrid('reload');
                        // 刷新
                        var tabPanel = $('#wu-tabs');
                        var tab = tabPanel.tabs('getSelected');
                        var title = tab.title;
                        var href = tab.href;
                        refreshTab({tabTitle: title, url: href});
                    }
                }]
            });
        }

        /**
         * Name 添加菜单选项
         * Param title 名称
         * Param href 链接
         * Param iconCls 图标样式
         * Param iframe 链接跳转方式（true为iframe，false为href）
         */
        function addTab(title, href, iconCls, iframe) {
            var tabPanel = $('#wu-tabs');
            if (!tabPanel.tabs('exists', title)) {
                var content = '<div style="overflow: hidden;height: 100%;"><iframe scrolling="auto" frameborder="no" src="' + href + '" style="width:100%;height:100%;"></iframe></div>';
                if (iframe) {
                    tabPanel.tabs('add', {
                        title: title,
                        content: content,
                        iconCls: 'icon-' + iconCls,
                        fit: true,
                        cls: 'pd3',
                        closable: true
                    });
                }
                else {
                    tabPanel.tabs('add', {
                        title: title,
                        href: href,
                        iconCls: 'icon-' + iconCls,
                        fit: true,
                        cls: 'pd3',
                        closable: true
                    });
                }

                initCloseTabEvent();
            }
            else {
                tabPanel.tabs('select', title);
            }
        }

        function refreshTab(cfg) {
            var refresh_tab = cfg.tabTitle ? $('#wu-tabs').tabs('getTab', cfg.tabTitle) : $('#wu-tabs').tabs('getSelected');
            if (refresh_tab && refresh_tab.find('iframe').length > 0) {
                var _refresh_ifram = refresh_tab.find('iframe')[0];
                var refresh_url = cfg.url ? cfg.url : _refresh_ifram.src;
                _refresh_ifram.contentWindow.location.href = refresh_url;
            }
        }

        /**
         * Name 移除菜单选项
         */
        function removeTab(index) {
            var tabPanel = $('#wu-tabs');
//            var tab = tabPanel.tabs('getSelected');
//            if (tab){
//                var index = tabPanel.tabs('getTabIndex', tab);
            tabPanel.tabs('close', index);
//            }
        }

        /**
         *   初始化关闭tab事件
         */
        function initCloseTabEvent() {
            var tabPanel = $('#wu-tabs');
            var tabs = tabPanel.tabs('tabs');

            for (var i = 0; i < tabs.length; i++) {

                // 绑定鼠标中键关闭tab事件
                tabs[i].panel('options').tab.unbind().bind('mouseup', {index: i}, function (e) {
                    var currentIndex = e.data.index;
                    if (e.which == 2) { // 鼠标中键
                        closeSelectTab(currentIndex, tabPanel, tabs);
                        return false;
                    }
                });

                // 绑定鼠标双击关闭tab事件
                tabs[i].panel('options').tab.dblclick({index: i}, function (e) {
                    var currentIndex = e.data.index;
                    closeSelectTab(currentIndex, tabPanel, tabs);
                });

                // 取消鼠标中键选中tab的事件
                tabs[i].panel('options').tab.click(function (e) {
                    if (e.which == 2) { // 鼠标中键
                        return false;
                    }
                });
            }
        }

        /**
         * 关闭所选的选项卡
         */
        function closeSelectTab(currentIndex, tabPanel, tabs) {
            // 获取当前选中的tab信息
            var currentTab = tabPanel.tabs('getSelected');
            var currentTabIndex = tabPanel.tabs('getTabIndex', currentTab);
            var currentTabTitle = currentTab.panel('options').title;

            if (tabs[currentIndex].panel('options').title != '首页') { // 首页不能中键关闭
                removeTab(currentIndex); // 关闭当前tab
                if (currentTabIndex != currentIndex) { // 当关闭的tab不是当前选中时, 有可能会跳转到其他tab, 通过这个来指定到原来的tab上
                    tabPanel.tabs('select', currentTabTitle);
                }

                initCloseTabEvent(); // 删除tab后位置发生变化, 需要重新初始化事件
            }
        }

        /**
         * 刷新打包管理的标签页
         */
        function reloadPackManagerTab(currentTitle) {
            // 不刷新当前所操作的标签页 currentTitle
            var titleArray = ['游戏管理', '渠道管理', '游戏参数管理', '渠道包', '图标合并工具'];
            for (var i = 0; i < titleArray.length; i++) {
                var title = titleArray[i];
                if (title != currentTitle) {
                    reloadTab(title);
                }
            }
        }


        /**
         * 刷新用户管理的标签页
         */
        function reloadUserManagerTab(currentTitle) {
            // 不刷新当前所操作的标签页 currentTitle
            var titleArray = ['用户组管理', '用户管理'];
            for (var i = 0; i < titleArray.length; i++) {
                var title = titleArray[i];
                if (title != currentTitle) {
                    reloadTab(title);
                }
            }
        }


        /**
         * 刷新标签页
         */
        function reloadTab(title) {
            var tabPanel = $('#wu-tabs');
            var tab = tabPanel.tabs('getTab', title);
            if (tab) {
                // 刷新页面
                var refreshIfram = tab.find('iframe')[0];
                var refreshUrl = refreshIfram.src;
                refreshIfram.contentWindow.location.href = refreshUrl;
            }
        }


        /**
         * 初始化
         */
        $(document).ready(function () {
            initTab();
        });

        /**
         * Name 修改密码
         */
        function change() {
            $('#wu-form-1').form('submit', {
                url: '${ctx}/user/changeMyPsw',
                success: function (data) {
                    if (data) {
                        try {
                            var dat = eval('(' + data + ')'); // 转换为json对象
                            if (dat && dat.success) {
                                $.messager.alert('信息提示', '密码修改成功！', 'info', function () {
                                    window.location.href = "${ctx}/logout"
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
                }
            });
        }

        /**
         * 修改密码
         */
        function openMyPsw() {
            $('#wu-dialog-1').dialog({
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
                        $('#wu-dialog-1').dialog('close');
                    }
                }]
            });
        }


    </script>
</head>
<body class="easyui-layout">
<!-- begin of header -->
<div class="wu-header" data-options="region:'north',border:false,split:false">
    <div class="wu-header-left">
        <h1 style="font-family: '微软雅黑'; font-weight: bold;">${projectNameCN}</h1>
    </div>
    <div class="wu-header-right">
        <p><strong class1="easyui-tooltip" title1="2条未读消息">${sessionScope.currentUser.username}</strong>，欢迎您！</p>
        <p>当前IP：<%=request.getRemoteAddr() %>&nbsp;&nbsp;&nbsp;<a href="#" onclick="openMyPsw()">修改密码</a><a
                href="logout">安全退出</a></p>
    </div>
</div>
<!-- end of header -->
<!-- begin of sidebar -->
<div class="wu-sidebar" data-options="region:'west',split:true,border:true,title:'导航菜单'">
    <div class="easyui-accordion" data-options="border:false,fit:true">
        <c:forEach items="${menuList}" var="menuBean">
            <c:if test="${menuBean.moduleEntity.status == 1 && menuBean.moduleEntity.isShow == 1}">
                <div title="${menuBean.moduleEntity.moduleName}"
                     data-options="iconCls:'icon-${menuBean.moduleEntity.moduleIcon}'" style="padding:5px;">
                    <ul class="easyui-tree wu-side-tree">
                        <c:forEach items="${menuBean.menuEntityList}" var="menu">
                            <c:if test="${menu.status == 1 && menu.isShow == 1 && menu.moduleId eq menuBean.moduleEntity.moduleId}">
                                <li iconCls="icon-${menu.menuIcon}">
                                    <a href="javascript:void(0)" data-icon="${menu.menuIcon}"
                                       data-link="${ctx}${menu.menuUrl}" iframe="1">${menu.menuName}</a>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>
<!-- end of sidebar -->
<!-- begin of main -->
<div class="wu-main" data-options="region:'center'">
    <div id="wu-tabs" class="easyui-tabs" data-options="border:false,fit:true">
        <div title="首页" data-options="href:'',closable:false,iconCls:'icon-tip',cls:'pd3'">
            <c:if test="${sessionScope.currentUserGroup != null
                && sessionScope.currentUserGroup.groupSuperManager == 1}">
                <div style="text-align: center; font-weight: bold; font-size: 18px;">
                    偷偷告诉你，你是超级管理员哦，你最叼哦！<br/>(〝▼皿▼）▄︻┻┳═一…… ☆（>○<）
                </div>
            </c:if>
        </div>
    </div>
</div>
<!-- end of main -->
<!-- begin of footer -->
<div class="wu-footer" data-options="region:'south',border:true,split:true">
    &copy; 2019 玛雅游戏 All Rights Reserved
</div>
<!-- end of footer -->


<div id="wu-dialog-1" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'"
     style="width:360px; padding:10px;">
    <form id="wu-form-1" method="post">
        <table>
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

</body>
</html>
