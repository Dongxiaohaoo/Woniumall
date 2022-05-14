<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <base href="${pageContext.request.contextPath}/"/>
    <meta charset="UTF-8">
    <title>种类列表</title>
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
		function ValidateForm() {
			var elementsByTagName = document.getElementsByTagName("input");
			for (let i = 0;i < elementsByTagName.length;i++){
				if (elementsByTagName[i].value == ''){
					layer.msg("请完整填写数据...")
					return false;
				}
			}
			return true;
		}
    </script>
</head>
<body>

<div>
    <!-- 路径导航  -->
    <ol class="breadcrumb">
        <li>你现在的位置是：<a href="">类品管理</a></li>
        <li class="active">添加种类</li>
    </ol>
</div>

<div class="container">
    <form action="admin/category" method="post" id="myform" onsubmit="return ValidateForm()">
        <input type="hidden" name="opr" value="addCategory">
        <table class="table table-bordered">
            <tr>
                <td class="col-md-1">商品类名：</td>
                <td class="text-center">
                    <input type="text" class="form-control" name="name" id="name"
                           placeholder="请输入种类名" value="${categoryName}"></td>
            </tr>
            <tr>
                <td colspan="2" class="text-center">
                    <button type="submit" class="btn btn-success">保存</button>
                    <span>${msg}</span>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>