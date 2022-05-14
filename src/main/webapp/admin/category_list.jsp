<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <base href="${pageContext.request.contextPath}/"/>
    <meta charset="UTF-8">
    <title>论文管理系统-论文列表</title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="layer/layer.js"></script>
    <style type="text/css">
        .table tbody tr td {
            vertical-align: middle;
        }

        table {
            margin-top: 10px;
        }
    </style>
    <script>
        if ("${msg}" == "该分类下还有商品未处理！"){
            layer.msg("${msg}",{icon:2,time:2000})
        }else if ("${msg}" != ''){
            layer.msg("${msg}",{icon:1,time:2000})
        }
        function delCategory(id){
            layer.confirm('您确定要删除此分类？', {
                title:"提示",
                icon:2,
                btn: ['确定','取消'] //按钮
            }, function(){
                window.location.href="admin/category?opr=delCategory&id="+id;
                <%--layer.msg("${msg}", {icon: 2,time:2000});--%>
            }, function(){
            });
        }
    </script>
</head>
<body>
<div>
    <div>
        <!-- 路径导航  -->
        <ol class="breadcrumb">
            <li class="active">你现在的位置是：商品管理</li>
            <li><a href="#">类别列表</a></li>
        </ol>
    </div>
    <!-- 多条件查询结束 -->
    <div style="padding-left: 10px; padding-right: 10px;">
        <!-- 数据列表 -->
        <table class="table table-bordered">
            <thead>
            <tr>
                <th class="col-md-1 text-center">序号</th>
                <th class="col-md-3 text-center">类别名称</th>
                <th class="col-md-1 text-center">状态</th>
                <th class="col-md-2 text-center">操作</th>
            </tr>
            </thead>
            <tbody id="tbd">
            <c:forEach var="category" items="${allCategory}" varStatus="vs">
            <tr class="text-center">
                <td>${vs.count}</td>
                <td>${category.name}</td>
                <td class="text-left">
                    <c:if test="${category.status eq 0}">正常</c:if>
                    <c:if test="${category.status eq 1}">作废</c:if>
                </td>
                <td>
                    <%--删除分类--%>
                    <a href="admin/category?opr=updateCategory&id=${category.id}" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-pencil"></span>修改</a>&nbsp;&nbsp;
                    <a href="javascript:void(0)" onclick="delCategory(${category.id})" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash" ></span>删除</a>&nbsp;&nbsp;
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
<%--        <span>${msg}</span>--%>
        <a href="admin/category?opr=gotoCategoryAdd" class="btn btn-primary">添加类别</a>
    </div>
</div>

</body>
</html>