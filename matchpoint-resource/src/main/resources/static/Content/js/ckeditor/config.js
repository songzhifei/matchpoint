
// https://docs.ckeditor.com/#!/api/CKEDITOR.config
CKEDITOR.editorConfig = function (config) {
    // Define changes to default configuration here. For example:
    // config.language = 'fr';
    config.enterMode = CKEDITOR.ENTER_BR;
    config.shiftEnterMode = CKEDITOR.ENTER_BR;
    // config.uiColor = '#AADC6E';
    // config.removePlugins = 'elementspath'; //这个只是不显示body和p标签，并没有去掉自动增加的p标签
    // config.startupMode = 'source'; //启动源码
    config.allowedContent = true; // 关闭ACF。因此，CKEditor不会过滤输入的内容，包括在粘贴操作期间。通过将各种来源的内容粘贴到下面的编辑器中并进入第一个（自动模式打开）进行试验。比较结果。
};