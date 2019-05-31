<!DOCTYPE html>
<html lang="zh-CN" style="overflow: hidden;">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>赛事星管理平台</title>

    <script src="/source/Content/js/jquery/jquery-2.1.1.min.js"></script>
    <link href="/source/Content/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/source/Content/js/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="/source/Content/css/framework-theme.css" rel="stylesheet" />
    <script src="/source/Content/js/layer/layer.mp.min.js"></script>
    <link href="/source/Content/helper.css" rel="stylesheet" />
    <link href="/source/Content/style.css" rel="stylesheet" />
    <script src="/source/Content/js/bootstrap/bootstrap.js"></script>
    <script src="/source/Content/js/cookie/jquery.cookie.js"></script>
    <script src="/source/Content/js/framework-ui.js"></script>
    <style>

    </style>
</head>
<body style="overflow: hidden;">
<div id="ajax-loader" style="cursor: progress; position: fixed; top: -50%; left: -50%; width: 200%; height: 200%; background: #fff; z-index: 10000; overflow: hidden;">
    <img src="/source/Content/img/ajax-loader.gif" style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; margin: auto;" />
</div>
<div id="theme-wrapper">
    <header class="navbar" id="header-navbar">
        <div class="container" style="padding-right: 0px;">
            <a href="#" id="logo" class="navbar-brand">赛事星管理平台</a>
            <div class="clearfix">
                <div class="nav-no-collapse navbar-left pull-left">
                    <ul class="nav navbar-nav pull-left">
                        <li>
                            <a class="btn" id="make-small-nav"><i class="fa fa-bars"></i></a>
                        </li>
                    </ul>
                </div>
                <div class="nav-no-collapse pull-right" id="header-nav">
                    <ul class="nav navbar-nav pull-right">
                        <li class="dropdown profile-dropdown">
                            <a href="#" class="dropdown" data-toggle="dropdown">
                                <img src="http://localhost:7080/source/Content/img/samples/pikachu-300.jpg" alt="" />
                                <span class="hidden-xs"> admin </span>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                @*<li><a class="menuItem" data-id="userInfo" href="/SystemManage/User/Info"><i class="fa fa-user"></i>个人信息</a></li>
                                <li><a href="javascript:void();"><i class="fa fa-inbox"></i>我的信箱</a></li>
                                <li><a href="javascript:void();" onclick="layer.msg('浏览器缓存清除成功');"><i class="fa fa-trash-o"></i>清空缓存</a></li>
                                <li><a href="javascript:void();"><i class="fa fa-paint-brush"></i>皮肤设置</a></li>
                                <li class="divider"></li>*@
                                <li><a href="../account/logout"><i class="ace-icon fa fa-power-off"></i>安全退出</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <div id="page-wrapper" class="container">
        <div class="row">
            <div id="nav-col">
                <section id="col-left" class="col-left-nano">
                    <div id="col-left-inner" class="col-left-nano-content">
                        <div id="user-left-box" class="clearfix hidden-sm hidden-xs dropdown profile2-dropdown">
                            <img alt="" src="http://localhost:7080/source/Content/img/samples/pikachu-300.jpg" />
                            <div class="user-box">
                                <span class="name"> admin </span>
                                <span class="status">
                                        <i class="fa fa-circle"></i>在线
                                    </span>
                            </div>
                        </div>
                        <div class="navbar-collapse navbar-ex1-collapse" id="sidebar-nav">
                            <ul class="nav nav-pills nav-stacked">
                                <li class="open"><a data-id="11" href="#" class="dropdown-toggle"><i class="fa fa-gears"></i><span>系统管理</span><i class="fa fa-angle-right drop-icon"></i></a><ul class="submenu" style="display: block; overflow: auto; height: 227px;"><li><a class="menuItem" data-id="1101" href="../user/index" data-index="1101">个人用户管理</a></li><li><a class="menuItem" data-id="1102" href="/manage/Institution/Index" data-index="1102">机构用户管理</a></li><li><a class="menuItem" data-id="1103" href="/manage/Institution/InstitutionMembers" data-index="1103">机构成员</a></li><li><a class="menuItem" data-id="1104" href="/manage/ExamPaper/IgnoreAdKeywordManage" data-index="1104">关键词忽略列表</a></li><li><a class="menuItem" data-id="1105" href="/manage/CacheManage" data-index="1105">Cache管理</a></li><li><a class="menuItem" data-id="1106" href="/manage/Images/Webuploader" data-index="1106">图片上传入口</a></li><li><a class="menuItem" data-id="1109" href="/manage/AdminLog/Index" data-index="1109">管理员日志</a></li><li><a class="menuItem" data-id="1110" href="/manage/CrystalQuartzPanel.axd" data-index="1110">定时任务管理</a></li></ul></li>
                                <li><a data-id="12" href="#" class="dropdown-toggle"><i class="fa fa-file-text"></i><span>试卷和试题</span><i class="fa fa-angle-right drop-icon"></i></a><ul class="submenu"><li><a class="menuItem" data-id="1201" href="/manage/ExamPaper/Index" data-index="1201">所有已发布的活动</a></li><li><a class="menuItem" data-id="1205" href="/manage/ExamActivity/Index" data-index="1205">考试活动管理</a></li><li><a class="menuItem" data-id="1202" href="/manage/MatchActivity/Index" data-index="1202">竞赛活动管理</a></li><li><a class="menuItem" data-id="1203" href="/manage/Examinee/RankingIndex" data-index="1203">考试名次</a></li><li><a class="menuItem" data-id="1204" href="/manage/Examinee/Index" data-index="1204">考生考卷管理</a></li></ul></li>
                            </ul>
                        </div>
                    </div>
                </section>
            </div>
            <div id="content-wrapper">
                <div class="content-tabs">
                    <button class="roll-nav roll-left tabLeft">
                        <i class="fa fa-backward"></i>
                    </button>
                    <nav class="page-tabs menuTabs">
                        <div class="page-tabs-content" style="margin-left: 0px;">
                            <a href="javascript:;" class="menuTab active" data-id="../Dashboard/Index" style="padding-right: 15px;">平台介绍</a>
                        </div>
                    </nav>
                    <button class="roll-nav roll-right tabRight">
                        <i class="fa fa-forward" style="margin-left: 3px;"></i>
                    </button>
                    <div class="btn-group roll-nav roll-right">
                        <button class="dropdown tabClose" data-toggle="dropdown">
                            页签操作<i class="fa fa-caret-down" style="padding-left: 3px;"></i>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li><a class="tabReload" href="javascript:void();">刷新当前页面</a></li>
                            <li><a class="tabCloseCurrent" href="javascript:void();">关闭当前</a></li>
                            <li><a class="tabCloseAll" href="javascript:void();">全部关闭</a></li>
                            <li><a class="tabCloseOther" href="javascript:void();">除此之外全部关闭</a></li>
                        </ul>
                    </div>
                    <button class="roll-nav roll-right refreshCurrentPage" title="刷新当前页面"><i class="fa fa-refresh"></i></button>
                </div>
                <div class="content-iframe" style="background-color: #f9f9f9; overflow: hidden;">
                    <div class="mainContent" id="content-main" style="margin: 10px; margin-bottom: 0px; padding: 0;">
                        <iframe class="NFine_iframe" width="100%" height="100%" src="../Dashboard/Index" frameborder="0" data-id="../Dashboard/Index"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="loadingPage" style="display: none;">
    <div class="loading-shade"></div>
    <div class="loading-content" onclick="$.loading(false)">数据加载中，请稍后…</div>
</div>
<script src="/source/Content/js/index.js"></script>
<script src="/source/Content/js/indextab.js"></script>
<script src="/source/Content/js/loading/pace.min.js"></script>
</body>
</html>