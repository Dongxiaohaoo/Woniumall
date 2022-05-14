<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<base href="${pageContext.request.contextPath}/"/>
<title>蜗牛图书商城管理-登录</title>
 <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
    <script type="text/javascript">
    	
    </script>
	<script>
		if ("${msg}" != ""){
			layer.msg("${msg}")
		}
	</script>
</head>
<body>
	<div style="width:20%;margin:0 auto; text-align: center; padding-top:5% ">
		<p id="msg" style="color:red"></p>
		<form action="admin/login" id="myform" method="post">
			<input type="hidden" name="opr" value="login">
			<div class="form-group form-inline">
				<label for="account">用户名：</label>
		        <input type="text" title="admin" class="form-control" value="${cookie.account.value}" id="account" name="account" placeholder="请输入用户名">
			</div>
			<div class="form-group form-inline">
				<label for="account">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
		    	<input type="password" title="admin" class="form-control" value="${cookie.password.value}" id="password" name="password" placeholder="请输入密码"/>
			</div>
			<input type="checkbox" name="rememberMe" checked>记住密码
			<div class="form-group">
				<button class="btn btn-success btn-md" id="btnLogin" type="submit">登录</button>
				<button class="btn btn-danger btn-md"  type="reset">取消</button><br>
				<span>当前在线人数：<span style="color:red;">${count}</span></span>
			</div>
		</form>
	</div>
</body>
</html>