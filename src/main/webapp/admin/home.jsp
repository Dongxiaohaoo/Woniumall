<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <base href="${pageContext.request.contextPath}/"/>
    <meta charset="UTF-8">
    <title>蜗牛图书商城后台管</title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
    </script>
    <style>
        #title {
            font-size: 35px;
            text-shadow: 3px 3px 5px #2aabd2;
        }
    </style>
</head>
<body>
<div class="container-pull" style="padding-left: 10px; padding-right: 10px;">
    <h3 class="text-center" id="title">蜗牛图书商城后台管理系统 v1.0</h3>
    <h5>欢迎你：${login.account}</h5>
    <div class="pull-left text-center" style="width:20%;height:650px;border:1px blue solid;">

        <ul class="nav nav-stacked">
            <li role="presentation" class="active">
                <a href="admin/category?opr=gotoCategoryList" target="myframe"><span class="glyphicon glyphicon-th-list"></span> 类别管理</a>
            </li>
            <li role="presentation">
                <a href="admin/goods?opr=getAll" target="myframe"><span class="glyphicon glyphicon-th-large"></span> 商品管理</a>
            </li>
            <li role="presentation">
                <a href="admin/user?opr=getAll" target="myframe"><span class="glyphicon glyphicon-user"></span> 用户管理</a>
            </li>
            <li role="presentation">
                <a href="admin/order?opr=getAll" target="myframe"><span class="glyphicon glyphicon-list-alt"></span> 订单查询</a>
            </li>
            <li role="presentation">
                <a href="admin/login?opr=logout" target="parent"><span class="glyphicon glyphicon-log-out"></span> 退出系统</a>
            </li>
        </ul>
    </div>
    <div class="pull-left" style="width:79%;height:650px;border:1px blue solid; margin-left: 10px ">
        <iframe name="myframe" src="admin/welcome.jsp" width="100%" height="100%" frameborder="no"></iframe>
    </div>
</div>
</body>
<script>
<%--如果未登录，跳转至登录--%>
    window.onload = function () {
        <%--console.log(typeof (${empty login}))--%>
        <%--console.log(typeof ("${login.account}" == ''))--%>
        if (${empty login}){
            window.location.href = "admin/login"
        }
    }
</script>
</html>
