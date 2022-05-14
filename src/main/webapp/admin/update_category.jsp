<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <base href="${pageContext.request.contextPath}/"/>
    <meta charset="UTF-8">
    <title>论文管理系统-论文列表</title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
    <style type="text/css">
        .table tbody tr td {
            vertical-align: middle;
        }

        table {
            margin-top: 10px;
        }
    </style>
</head>
<body>

<div>
    <!-- 路径导航  -->
    <ol class="breadcrumb">
        <li>你现在的位置是：<a href="">类别管理</a></li>
        <li class="active">修改类名</li>
    </ol>
</div>

<div class="container">
    <form action="admin/category" method="post" id="myform">
        <input type="hidden" name="opr" value="updateCategory2">
        <input type="hidden" name="id"value="${category.id}">
        <table class="table table-bordered">
            <tr>
                <td class="col-md-1">类别标题：</td>
                <td class="text-center">
                    <input type="text" class="form-control" name="title" id="title"
                           value="${category.name}"></td>
            </tr>
            <tr>
                <td>商品状态：</td>
                <td>
                    <input type="radio"  name="status"  <c:if test="${category.status eq '0'}">checked</c:if> value="0">正常
                    <input type="radio"  name="status"  <c:if test="${category.status eq '1'}">checked</c:if> value="1">作废
                </td>
            </tr>
            <tr>
                <td colspan="2" class="text-center">
                    <span>${msg}</span>
                    <button type="submit" class="btn btn-success">修改</button>
                    <input type="button" class="btn btn-primary" value="返回列表" onclick="javascript:window.location.href='admin/category?opr=gotoCategoryList'">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>