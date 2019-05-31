
<#include "../base/layout-test.ftl">

<@layout>
    <style>
        html, body {
            height: 100%;
            width: 100%;
        }

        .row-input-text {
            border: none;
        }

        .active .row-input-text {
            background-color: #f5f5f5;
        }

        .success .row-input-text {
            background-color: #fff6e5;
        }

        .multi-line {
            white-space: normal !important;
            height: auto !important;
            vertical-align: text-top !important;
            padding-top: 9px !important;
            padding-bottom: 9px !important;
            line-height: 1em !important;
            word-break: break-all;
        }
        .ui-jqgrid .ui-jqgrid-toppager .ui-pager-control, .ui-jqgrid .ui-jqgrid-pager .ui-pager-control{
            height: 30px;
        }
        table{
            font-size: 10px;
        }
        .gridToolbar form{
            margin-bottom: auto;
        }
    </style>
    <style>
        @media (max-width: 768px) {
        .ui-jqgrid .ui-jqgrid-pager .navtable {
            display: none !important;
        }

        .ui-jqgrid .ui-jqgrid-pager .ui-paging-info {
            display: none !important;
        }
    }
    </style>
    <div class="gridToolbar">
    <form class="form-inline">
        <div class="form-group">
            <label for="txt_verifyState">认证状态</label>
            <select class="form-control" id="txt_verifyState">
                <option value="0">全部用户</option>
                <option value="2">已认证</option>
                <option value="1">未认证</option>
            </select>
        </div>
        <div class="form-group">
            <label for=""> 关键字</label>
            <input type="text" class="form-control" id="txt_keyword" placeholder="用户名/昵称/手机">
        </div>
        <a id="btn_search" role="button" class="btn btn-primary"><i class="fa fa-search"></i> 检索</a>
    </form>
</div>

    <div class="contextMenu" id="contextMenu" style="display:none">
    <ul style="width: 300px; font-size: 65%;">
        <li id="menu-view">
            <span><i class="fa fa-lg fa-search-plus"></i> 查看</span>
        </li>
        <li id="menu-edit">
            <span><i class="fa fa-lg fa-pencil-square-o"></i> 编辑</span>
        </li>
    </ul>
</div>

    <div class="gridPanel">
    <table id="gridList"></table>
    <div id="gridPager"></div>
</div>
</@layout>

<script type="text/javascript">
    function btn_details() {
        var keyValue = $("#gridList").jqGridSelectedRowValue().UserName;
        $.modalOpen({
            id: "Details",
            title: "查看用户",
            url: "~/User/Details?keyValue=",
                width: "900px",
                height: "600px",
                btn: null,
    });
    }
    function btn_edit() {
        var keyValue = $("#gridList").jqGridSelectedRowValue().UserName;
        $.modalOpen({
            id: "Form",
            title: "编辑用户",
            url: "~/User/Form?keyValue=",
                width: "900px",
                height: "600px",
                callBack: function (iframeId) {
            top.frames[iframeId].submitForm();
        }
    });
    }

    function gridList() {
        var $gridList = $("#gridList");
        $gridList.dataGrid({
            url: "/api/user/getList",
                height: $(window).height() - 128,
                colModel: [
            { label: '主键', name: 'userguid', hidden: true },
            {
                label: '状态', name: "isblacklistuser", width: 80, align: 'left',
                formatter: function (cellvalue, options, rowObject) {
                    if (cellvalue == 0) {
                        return '<span class="label label-success" style="line-height: 31px;">正常</span>';
                    } else if (cellvalue == 1) {
                        return '<span class="label label-danger" style="line-height: 31px;">黑名单</span>';
                    } else {
                        return cellvalue;
                    }
                }
            },
            {
                label: '手机认证', name: "isverifytel", width: 80, align: 'left',
                formatter: function (cellvalue, options, rowObject) {
                    if (cellvalue == 2) {
                        return '<span class="label label-success" style="line-height: 31px;">已认证</span>';
                    } else {
                        return '<span class="label label-default" style="line-height: 31px;">未认证</span>';
                    }
                }
            },
            { label: '用户名', name: 'username', width: 150, align: 'left' },
            { label: '昵称', name: 'usernick', width: 150, align: 'left' },
            { label: '姓名', name: 'realname', width: 100, align: 'left' },
            {
                label: '性别', name: 'usersex', width: 60, align: 'left',
                formatter: function (cellvalue, options, rowObject) {
                    return cellvalue == 0 ? "保密" : (cellvalue == 1 ? "男" : "女");
                }
            },
            { label: '手机', name: 'tel', width: 120, align: 'left' },
            {
                label: '创建时间', name: 'createon', width: 150, align: 'left',
                formatter: "date", formatoptions: { srcformat: 'Y-m-d H:i:s', newformat: 'Y-m-d H:i:s' }
            },
            { label: '公司', name: 'usercompany', width: 200, align: 'left' },
            { label: '职业', name: 'userjob', width: 150, align: 'left' },
            { label: '地址-省份', name: 'addressprovince', width: 120, align: 'left' },
            { label: '地址-城市', name: 'addresscity', width: 120, align: 'left' },
            { label: '地址-县(区)', name: 'addressarea', width: 120, align: 'left' },
            { label: '地址-详细', name: 'addressdetailed', width: 200, align: 'left' }
        ],
                pager: "#gridPager",
                viewrecords: true,
                gridComplete: initGridContextMenu
    });
        $gridList.navGrid('#gridPager', {
            edit: false,
            add: false,
            del: false,
            search: false,
            refresh: true,
            view: true,
            position: "left",
            cloneToTop: false
        }).navButtonAdd('#gridPager', {
            caption: " 查看",
            buttonicon: "fa fa-lg fa-search-plus",
            onClickButton: btn_details,
            position: "last"
        }).navButtonAdd('#gridPager', {
            caption: " 编辑",
            buttonicon: "fa fa-lg fa-pencil-square-o",
            onClickButton: btn_edit,
            position: "last"
        });

        $("#btn_search").click(function () {
            $gridList.jqGrid('setGridParam', {
                postData: {
                    keyword: $("#txt_keyword").val(),
                    verifyState: $("#txt_verifyState").val()
                },
            }).trigger('reloadGrid');
        });
    }
    function initGridContextMenu() {
        $("#gridList").contextMenu('contextMenu', {
            bindings: {
                'menu-view': function (t) {
                    btn_details();
                },
                'menu-edit': function (t) {
                    btn_edit();
                }
            },
            onContextMenu: function (event, menu) {
                var rowId = $(event.target).parent("tr").attr("id")
                var grid = $("#gridList");
                grid.setSelection(rowId);
                return true;
            }
        });
    }
    $(document).ready(function () {
        gridList();
    });
</script>