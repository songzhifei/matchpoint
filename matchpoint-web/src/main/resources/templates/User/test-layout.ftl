<#include "../base/layout.ftl" >
<@css>

    <link href="vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <link href="vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

</@css>

<@layout>

<div id="page-wrapper">

    <div class="row">

        <div class="col-lg-12">

            <h1 class="page-header"></h1>

        </div>

    </div>

    <div class="row">

        <div class="col-lg-12">

            <div class="panel panel-default">

                <div class="panel-heading">

                    用户列表

                </div>

                <!-- /.panel-heading -->

                <div class="panel-body">

                    <button type="button" onclick="location='/user-add'" class="btn btn-primary">新增</button>

                    <br/>

                    <br/>

                    <table width="100%" class="table table-striped table-bordered table-hover"

                           id="dataTables-example">

                        <thead>

                        <tr>

                            <th width="7%">ID</th>

                            <th>姓名</th>

                            <th>年龄</th>

                            <th>性别</th>

                            <th>手机</th>

                            <th>操作</th>

                        </tr>

                        </thead>

                        <tbody>

                        <#list user_list as user>

                        <tr class="odd gradeX">

                            <td>${user.id}</td>

                            <td>${user.name}</td>

                            <td>${user.age}</td>

                            <td>

                                <#if user.sex == "1">

                                    男

                                <#else >

                                女

                                </#if >

                            </td>

                            <td>${user.mobile}</td>

                            <td><a href="/user-edit?id=${user.id}">修改</a> <a href="/user-delete?id=${user.id}">删除</a></td>

                        </tr>

                        </#list>

                        </tbody>

                    </table>

                </div>

                <!-- /.panel-body -->

            </div>

            <!-- /.panel -->

        </div>

        <!-- /.col-lg-12 -->

    </div>

</div>

</@layout>

<script src="vendor/datatables/js/jquery.dataTables.min.js"></script>

<script src="vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>

<script src="vendor/datatables-responsive/dataTables.responsive.js"></script>

<script layout:fragment="script">

    $(document).ready(function () {

        $('#dataTables-example').DataTable({

            responsive: true

        });

    });

</script>

</@js>