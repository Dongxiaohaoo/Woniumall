<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script>
        function ValidateForm() {
            var elementsByTagName = document.getElementsByTagName("input");
            for (let i = 0;i < elementsByTagName.length;i++){
                if (elementsByTagName[i].value == ''){
                    layer.msg("请完整填写数据...")
                    return false;
                }
                console.log(elementsByTagName[i].value)
            }
            return true;
        }
    </script>
    <!-- 配置文件 -->
    <script type="text/javascript" src="ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="ueditor/ueditor.all.js"></script>

    <!-- 实例化编辑器 -->
    <script type="text/javascript">
        window.onload = function (){
            var ue = UE.getEditor('container',{toolbars: [[
                    'fullscreen', 'source', '|', 'undo', 'redo', '|',
                    'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
                    'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
                    'customstyle', 'paragraph', 'fontfamily', 'fontsize']],initialFrameWidth:800,initialFrameHeight:200});
        }
    </script>
    <script>
        function handleFiles(files){
            var image_group= document.getElementById("filegroup");
            for (var i = 0; i < files.length; i++) {
                var img_box = document.createElement("div");
                img_box.setAttribute("class","file-content");
                var img = document.createElement("img");
                img.src = window.URL.createObjectURL(files[i]);
                img.height = 100;
                img.onload = function() {
                    window.URL.revokeObjectURL(this.src);
                }
                img_box.appendChild(img);
                image_group.appendChild(img_box)
            }
        }
    </script>
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
        <li>你现在的位置是：<a href="">商品管理</a></li>
        <li class="active">添加商品</li>
    </ol>
</div>

<div class="container">
    <form action="admin/goods" method="post" id="myform" enctype="multipart/form-data" class="form-inline" onsubmit="return ValidateForm()">
        <input type="hidden" name="opr" value="GoodsAdd">
        名称：<input type="text" name="name" class="form-control">
        类别：<select name="categoryId" class="form-control">
        <c:forEach var="category" items="${categoryList}">
            <option value="${category.id}">${category.name}</option>
        </c:forEach>
    </select>
        库存：<input type="text" name="stock" class="form-control"><br>
        作者：<input type="text" name="author" class="form-control">
        出版社:<input type="text" name="publishier" class="form-control">
        出版时间：<input type="date" name="publishtime" class="form-control"><br>
        市场价：<input type="number" step="0.01" name="marketprice" class="form-control"/>
        销售价：<input type="number" step="0.01" name="saleprice" class="form-control"/>
        是否最新：<select name="isnew" class="form-control">
                    <option value="y">是</option>
                    <option value="n">否</option>
                </select>
        是否最热：<select name="ishot" class="form-control">
                    <option value="y">是</option>
                    <option value="n">否</option>
                </select>
        <div id="filegroup"></div>
        商品图片:<input type="file" name="image" class="form-control" onchange="handleFiles(this.files)">
        <!-- 加载编辑器的容器 -->
        <script id="container" name="content" type="text/plain">这里写你的初始化内容</script>
        <input type="submit" value="提交" class="btn btn-primary">
        <input type="button" value="test" class="btn btn-primary" onclick="ValidateForm()">
    </form>
</div>
</body>
</html>