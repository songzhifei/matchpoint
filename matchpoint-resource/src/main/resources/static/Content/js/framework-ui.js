
$.reload = function () {
    location.reload();
    return false;
}
$.loading = function (bool, text) {
    var $loadingpage = top.$("#loadingPage");
    var $loadingtext = $loadingpage.find('.loading-content');
    if (bool) {
        $loadingpage.show();
    } else {
        if ($loadingtext.attr('istableloading') == undefined) {
            $loadingpage.hide();
        }
    }
    if (!!text) {
        $loadingtext.html(text);
    } else {
        $loadingtext.html("数据加载中，请稍后…");
    }
    $loadingtext.css("left", (top.$('body').width() - $loadingtext.width()) / 2 - 50);
    $loadingtext.css("top", (top.$('body').height() - $loadingtext.height()) / 2);
}
$.request = function (name) {
    var search = location.search.slice(1);
    var arr = search.split("&");
    for (var i = 0; i < arr.length; i++) {
        var ar = arr[i].split("=");
        if (ar[0] == name) {
            if (unescape(ar[1]) == 'undefined') {
                return "";
            } else {
                return unescape(ar[1]);
            }
        }
    }
    return "";
}
$.currentWindow = function () {
    var iframeId = top.$(".NFine_iframe:visible").attr("id");
    return top.frames[iframeId];
}
$.browser = function () {
    var userAgent = navigator.userAgent;
    var isOpera = userAgent.indexOf("Opera") > -1;
    if (isOpera) {
        return "Opera"
    };
    if (userAgent.indexOf("Firefox") > -1) {
        return "FF";
    }
    if (userAgent.indexOf("Chrome") > -1) {
        if (window.navigator.webkitPersistentStorage.toString().indexOf('DeprecatedStorageQuota') > -1) {
            return "Chrome";
        } else {
            return "360";
        }
    }
    if (userAgent.indexOf("Safari") > -1) {
        return "Safari";
    }
    if (userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera) {
        return "IE";
    };
}
$.download = function (url, data, method) {
    if (url && data) {
        data = typeof data == 'string' ? data : jQuery.param(data);
        var inputs = '';
        $.each(data.split('&'), function () {
            var pair = this.split('=');
            inputs += '<input type="hidden" name="' + pair[0] + '" value="' + pair[1] + '" />';
        });
        $('<form action="' + url + '" method="' + (method || 'post') + '">' + inputs + '</form>').appendTo('body').submit().remove();
    };
};

$.modalOpen = function (options) {
    var defaults = {
        id: null,
        full: false,
        title: '系统窗口',
        width: "100px",
        height: "100px",
        url: '',
        shade: 0.3,
        btn: ['确认', '关闭'],
        btnclass: ['btn btn-primary', 'btn btn-danger'],
        maxmin:false,
        callBack: null
    };
    var options = $.extend(defaults, options);
    var _width = top.$(window).width() > parseInt(options.width.replace('px', '')) ? options.width : top.$(window).width() + 'px';
    var _height = top.$(window).height() > parseInt(options.height.replace('px', '')) ? options.height : top.$(window).height() + 'px';
    top.layer.open({
        id: options.id,
        type: 2,
        shade: options.shade,
        title: options.title,
        fix: false,
        area: [_width, _height],
        content: options.url,
        btn: options.btn,
        btnclass: options.btnclass,
        maxmin : options.maxmin==true?options.maxmin:options.full, // LHQ 
        success: function (layero, index) {
            // $(layero[0].getElementsByTagName('iframe')[0]).attr("id", "layerui-layer-iframe-" + options.id).attr("name", "layerui-layer-iframe-" + options.id);
            if (options.full) {
                top.layer.full(index);
            }
        },
        yes: function (layerId) {
            if (options.callBack) {
                // var result = options.callBack("layerui-layer-iframe-" + options.id);
                var result = options.callBack(options.id);
            }
        }, cancel: function () {
            return true;
        }
    });
}
$.modalConfirm = function (content, callBack) {
    top.layer.confirm(content, {
        icon: "fa-exclamation-circle",
        title: "系统提示",
        btn: ['确认', '取消'],
        btnclass: ['btn btn-primary', 'btn btn-danger'],
    }, function () {
        callBack(true);
    }, function () {
        callBack(false)
    });
}
$.modalAlert = function (content, type) {
    var icon = "";
    if (type == 'success') {
        icon = "fa-check-circle";
    }
    if (type == 'error') {
        icon = "fa-times-circle";
    }
    if (type == 'warning') {
        icon = "fa-exclamation-circle";
    }
    top.layer.alert(content, {
        icon: icon,
        title: "系统提示",
        btn: ['确认'],
        btnclass: ['btn btn-primary'],
    });
}
$.modalMsg = function (content, type) {
    if (type != undefined) {
        var icon = "";
        if (type == 'success') {
            icon = "fa-check-circle";
        }
        if (type == 'error') {
            icon = "fa-times-circle";
        }
        if (type == 'warning') {
            icon = "fa-exclamation-circle";
        }
        top.layer.msg(content, { icon: icon, time: 4000, shift: 5 });
        top.$(".layui-layer-msg").find('i.' + icon).parents('.layui-layer-msg').addClass('layui-layer-msg-' + type);
    } else {
        top.layer.msg(content);
    }
}
$.modalPrompt = function (options, callBack) {
    var defaults = {
        title: '请输入值',
        value: '初始值',
        formType: 0, //输入框类型，支持0（文本）默认1（密码）2（多行文本）
        btn: ['确认', '取消'],
        btnclass: ['btn btn-primary', 'btn btn-danger']
        // ,area: ['800px', '350px'] //自定义文本域宽高
    };
    var options = $.extend(defaults, options);
    top.layer.prompt(options, function (value, index, elem) {
        if (callBack && typeof callBack == "function") {
            var result = callBack(value, elem);
            if (!(result === false)) {
                top.layer.close(index);
            }
        }
        top.layer.close(index);
    });

}
$.modalCloseAll = function (type) {
    if (type == undefined || type == null || type == "") {
        top.layer.closeAll();
    } else {
        top.layer.closeAll(type);
    }
}
$.modalClose = function () {
    var index = top.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
    if (index == undefined) {
        $.modalCloseAll('iframe');
        return;
    }
    var $IsdialogClose = top.$("#layui-layer" + index).find('.layui-layer-btn').find("#IsdialogClose");
    var IsClose = $IsdialogClose.is(":checked");
    if ($IsdialogClose.length == 0) {
        IsClose = true;
    }
    if (IsClose) {
        top.layer.close(index);
    } else {
        location.reload();
    }
}

$.postForm = function (url, formModel, success, error) {
    $.ajax({
        url: url, type: "post", dataType: "json", data: formModel,
        success: success, error: error        
    });
}
$.submitForm = function (options) {
    var defaults = {
        url: "",
        param: [],
        loading: "正在提交数据...",
        success: null,
        close: true
    };
    var options = $.extend(defaults, options);
    $.loading(true, options.loading);
    if (true) {
        if ($('[name=__RequestVerificationToken]').length > 0) {
            options.param["__RequestVerificationToken"] = $('[name=__RequestVerificationToken]').val();
        }
        $.ajax({
            url: options.url,
            data: options.param,
            type: "post",
            dataType: "json",
            success: function (data) {
                if (data.state == "success") {
                    options.success(data);
                    $.modalMsg(data.message || "操作成功！", data.state);
                    if (options.close == true) {
                        $.modalClose();
                    }
                } else {
                    $.modalAlert(data.message || "操作失败！", data.state);
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                $.loading(false);
                $.modalMsg(errorThrown, "error");
            },
            beforeSend: function () {
                $.loading(true, options.loading);
            },
            complete: function () {
                $.loading(false);
            }
        });
    }
}
$.deleteForm = function (options) {
    var defaults = {
        prompt: "注：您确定要删除该项数据吗？",
        url: "",
        param: [],
        loading: "正在删除数据...",
        success: null,
        close: true
    };
    var options = $.extend(defaults, options);
    if ($('[name=__RequestVerificationToken]').length > 0) {
        options.param["__RequestVerificationToken"] = $('[name=__RequestVerificationToken]').val();
    }
    $.modalConfirm(options.prompt, function (r) {
        if (r) {
            $.loading(true, options.loading);
            if (true) {
                $.ajax({
                    url: options.url,
                    data: options.param,
                    type: "post",
                    dataType: "json",
                    success: function (data) {
                        if (data.state == "success") {
                            options.success(data);
                            $.modalMsg(data.message, data.state);
                        } else {
                            $.modalAlert(data.message, data.state);
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        $.loading(false);
                        $.modalMsg(errorThrown, "error");
                    },
                    beforeSend: function () {
                        $.loading(true, options.loading);
                    },
                    complete: function () {
                        $.loading(false);
                    }
                });
            }
        }
    });

}
$.jsonWhere = function (data, action) {
    if (action == null) return;
    var reval = new Array();
    $(data).each(function (i, v) {
        if (action(v)) {
            reval.push(v);
        }
    })
    return reval;
}
$.fn.formValid = function () {
    return $(this).valid({
        errorPlacement: function (error, element) {
            element.parents('.formValue').addClass('has-error');
            element.parents('.has-error').find('i.error').remove();
            element.parents('.has-error').append('<i class="form-control-feedback fa fa-exclamation-circle error" data-placement="left" data-toggle="tooltip" title="' + error + '"></i>');
            $("[data-toggle='tooltip']").tooltip();
            if (element.parents('.input-group').hasClass('input-group')) {
                element.parents('.has-error').find('i.error').css('right', '33px')
            }
        },
        success: function (element) {
            element.parents('.has-error').find('i.error').remove();
            element.parent().removeClass('has-error');
        }
    });
}
$.fn.formSerialize = function (formdate) {
    var element = $(this);
    if (!!formdate) {
        for (var key in formdate) {
            var $id = element.find('#' + key);
            var value = typeof formdate[key] == "string"
                ? $.trim(formdate[key]).replace(/&nbsp;/g, '')
                : formdate[key];
            var type = $id.attr('type');
            if ($id.hasClass("select2-hidden-accessible")) {
                type = "select";
            }
            switch (type) {
                case "checkbox":
                    if (!!value) {
                        $id.prop("checked", true);
                    } else {
                        $id.prop("checked", false);
                    }
                    break;
                case "select":
                    $id.val(value).trigger("change");
                    break;
                default:
                    $id.val(value);
                    break;
            }
        };
        return false;
    }
    var postdata = {};
    element.find('input, select, textarea').each(function (r) {
        var $this = $(this);
        var id = $this.attr('id');
        var type = $this.attr('type');
        switch (type) {
            case "checkbox":
                postdata[id] = $this.is(":checked");
                break;
            default:
                var value = $this.val();
                postdata[id] = value;
                break;
        }
    });
    if ($('[name=__RequestVerificationToken]').length > 0) {
        postdata["__RequestVerificationToken"] = $('[name=__RequestVerificationToken]').val();
    }
    return postdata;
};
$.fn.bindSelect = function (options) {
    var defaults = {
        id: "id",
        text: "text",
        search: false,
        url: "",
        param: [],
        change: null,
        data: null
    };
    var options = $.extend(defaults, options);
    var $element = $(this);
    var renderOptions = function (data) {
        $.each(data, function (i) {
            $element.append($("<option></option>").val(data[i][options.id]).html(data[i][options.text]));
        });
        var select2api = $element.select2({
            minimumResultsForSearch: options.search == true ? 0 : -1
        });
        $element.on("change", function (e) {
            if (options.change != null) {
                options.change(data[$(this).find("option:selected").index()]);
            }
            $("#select2-" + $element.attr('id') + "-container").html($(this).find("option:selected").text().replace(/　　/g, ''));
        });
        return select2api;
    };
    if (options.data && options.data.length > 0) {
        return renderOptions(options.data);
    } else if (options.url != "") {
        $.ajax({
            url: options.url,
            data: options.param,
            dataType: "json",
            async: false,
            success: function (data) {
                options.data = data;
                return renderOptions(data);
            }
        });
    } else {
        return $element.select2({
            minimumResultsForSearch: -1
        });
    }
}
$.fn.authorizeButton = function () {
    var moduleId = top.$(".NFine_iframe:visible").attr("id").substr(6);
    var dataJson = top.clients.authorizeButton[moduleId];
    var $element = $(this);
    $element.find('a[authorize=yes]').attr('authorize', 'no');
    if (dataJson != undefined) {
        $.each(dataJson, function (i) {
            $element.find("#" + dataJson[i].F_EnCode).attr('authorize', 'yes');
        });
    }
    $element.find("[authorize=no]").parents('li').prev('.split').remove();
    $element.find("[authorize=no]").parents('li').remove();
    $element.find('[authorize=no]').remove();
}

$.fn.jqGridSelectedRowElement = function () {
    var $grid = $(this);
    var selectedRowIds = $grid.jqGrid("getGridParam", "selarrrow");
    if (selectedRowIds != "") {
        var json = [];
        var len = selectedRowIds.length;
        for (var i = 0; i < len ; i++) {
             var rowData = $grid.jqGrid('getRowData', selectedRowIds[i]);
             json.push(rowData);
        }
        return json;
    } else {
         return $grid.jqGrid('getRowData', $grid.jqGrid('getGridParam', 'selrow'));
    }
}
$.fn.jqGridSelectedRowValue = function () {
    var $grid = $(this);
    var tableData = $grid.data("jqgrid-data");
    return tableData[$grid.jqGrid('getGridParam', 'selrow') - 1];
}
$.fn.jqGridCheckedRowValue = function () {
    var $grid = $(this);
    var selectedRowIds = $grid.jqGrid("getGridParam", "selarrrow");
    var tableData = $grid.data("jqgrid-data");
    if (selectedRowIds != "") {
        var json = [];
        var len = selectedRowIds.length;
        for (var i = 0; i < len ; i++) {
            json.push(tableData[selectedRowIds[i] - 1]);
        }
        return json;
    } else {
        return [];
    }
}
$.fn.dataGrid = function (options) {
    var defaults = {
        datatype: "json",
        autowidth: true,
        rownumbers: true,
        shrinkToFit: false,
        gridview: true,
        styleUI: "Bootstrap",
        rowNum: 50,
        rowList:[50, 100, 200]

    };
    var options = $.extend(defaults, options);
    var $element = $(this);
    options["onSelectRow"] = function (rowid, status, e) {
        var length = 0;
        if (options.multiselect) {
            var selarrrow = $(this).jqGrid("getGridParam", "selarrrow");
            if (selarrrow) {
                length = selarrrow.length;
            }
        } else {
            if (status) length = 1;
        }
        var $operate = $(".operate");
        if ($operate.length > 0) {
            if (length > 0) {
                $operate.animate({ "left": 0 }, 200);
            } else {
                $operate.animate({ "left": '-100.1%' }, 200);
            }
            $operate.find('.first span').html(length);
            $operate.find('.close').click(function () {
                $operate.animate({ "left": '-100.1%' }, 200);
            });
        }
    };
    options["onSelectAll"] = function (aRowids, status) {
        var length = $(this).jqGrid("getGridParam", "selarrrow").length;
        var $operate = $(".operate");
        if (status) {
            $operate.animate({ "left": 0 }, 200);
        } else {
            $operate.animate({ "left": '-100.1%' }, 200);
        }
        $operate.find('.first span').html(length);
        $operate.find('.close').click(function () {
            $operate.animate({ "left": '-100.1%' }, 200);
        });
    };
    options["loadComplete"] = function (data) {
        $element.data("jqgrid-data", data.rows);
    };
    $element.jqGrid(options);
};