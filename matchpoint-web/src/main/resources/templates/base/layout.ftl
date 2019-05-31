<!DOCTYPE html>

<head>

    <#include "header.ftl">

    <#macro css>

        <#nested>

    </#macro>

</head>

<body>

<div id="wrapper">

    <#include "sidebar.ftl">

    <#macro layout>

        <#nested>

    </#macro>

</div>

    <#include "footer.ftl">

</body>

<#macro js>

    <#nested>

</#macro>

</html>