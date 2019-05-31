<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8"/>
    <title>愿世界没有Bug</title>
</head>
<body>
<h1>Sorry,异常了(自定义)</h1>
<div>
    <p>错误码:${errorInfo.getCode()}</p>
    <p>映射路径:${errorInfo.getUrl()}</p>
    <p>错误信息:${errorInfo.getMessage()}</p>
</div>
</body>
</html>