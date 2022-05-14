<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <base href="${pageContext.request.contextPath}/"/>
    <meta charset="UTF-8">
    <title>图书管理系统-商品列表</title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
    <!-- 配置文件 -->
    <script type="text/javascript" src="ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="ueditor/ueditor.all.js"></script>
    <!-- 实例化编辑器 -->
    <script type="text/javascript">
        window.onload = function () {
            var ue = UE.getEditor('container', {
                toolbars: [[
                    'fullscreen', 'source', '|', 'undo', 'redo', '|',
                    'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
                    'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
                    'customstyle', 'paragraph', 'fontfamily', 'fontsize']],
                initialFrameWidth: 1000,
                initialFrameHeight: 200
            });
        }
    </script>
    <script>
        function handleFiles(files) {
            var image_group = document.getElementById("filegroup");
            for (var i = 0; i < files.length; i++) {
                var img_box = document.createElement("div");
                img_box.setAttribute("class", "file-content");
                var img = document.createElement("img");
                img.src = window.URL.createObjectURL(files[i]);
                img.height = 100;
                img.onload = function () {
                    window.URL.revokeObjectURL(this.src);
                }
                img_box.appendChild(img);
                image_group.appendChild(img_box)
            }
            document.getElementById("oldImg").style.display = "none";
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
        <li class="active">修改商品</li>
    </ol>
</div>

<div class="container">
    <form action="admin/goods" method="post" id="myform" enctype="multipart/form-data">
        <input type="hidden" name="opr" value="submitUpdate">
        <input type="hidden" name="id" value="${goodsById.id}">
        <table class="table table-bordered">
            <tr>
                <td>商品名：</td>
                <td><input type="text" class="form-control" name="name" value="${goodsById.name}"></td>
                <%--						<td></td>--%>
                <td>商品编号：</td>
                <td><input type="text" class="form-control" value="${goodsById.no}" disabled></td>
            </tr>
            <tr>
                <td>商品类别:</td>
                <td>
                    <select name="categoryId" class="form-control">
                        <c:forEach var="category" items="${categories}">
                            <option value="${category.id}"
                                    <c:if test="${category.name eq goodsById.cname}">selected</c:if>>${category.name}</option>
                        </c:forEach>
                    </select>
                </td>
                <td>库存：</td>
                <td><input type="text" name="stock" class="form-control" value="${goodsById.stock}"></td>
            </tr>
            <tr>
                <td>作者：</td>
                <td><input type="text" name="author" class="form-control" value="${goodsById.author}"></td>
                <td>出版社：</td>
                <td><input type="text" name="publisher" class="form-control" value="${goodsById.publisher}"></td>
            </tr>
            <tr>
                <td>出版时间：</td>
                <td><input type="date" name="publishtime" class="form-control" value="${goodsById.publishtime}"></td>
                <td>市场价：</td>
                <td><input type="number" step="0.01" name="marketprice" class="form-control"
                           value="${goodsById.marketprice}"></td>
            </tr>
            <tr>
                <td>销售价：</td>
                <td><input type="number" step="0.01" name="saleprice" class="form-control"
                           value="${goodsById.saleprice}"></td>
                <td>是否最新：</td>
                <td>
                    <select name="isnew" class="form-control">
                        <option value="y" <c:if test="${goodsById.isnew eq 'y'}">selected</c:if>>是</option>
                        <option value="n" <c:if test="${goodsById.isnew eq 'n'}">selected</c:if>>否</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>是否最热：</td>
                <td>
                    <select name="ishot" class="form-control">
                        <option value="y" <c:if test="${goodsById.ishot eq 'y'}">selected</c:if>>是</option>
                        <option value="n" <c:if test="${goodsById.ishot eq 'n'}">selected</c:if>>否</option>
                    </select>
                </td>
                <td>商品图片：</td>
                <td>
                    <img src="${goodsById.image}" id="oldImg">
                    <div id="filegroup"></div>
                    商品图片:<input type="file" name="image" class="form-control" onchange="handleFiles(this.files)">
                    <%--                    <input type="file" name="image" value="修改图片">--%>
                </td>
            </tr>
            <tr>
                <td>上架时间：</td>
                <td>
                    <input type="datetime-local" name="uptime" class="form-control"
                           value="${goodsById.uptime.replaceAll(' ','T')}" disabled>
                </td>
                <td>下架时间：</td>
                <td>
                    <input type="datetime-local" name="downtime" class="form-control"
                           value="${goodsById.downtime.replaceAll(' ','T')}" disabled>
                </td>
            </tr>
            <tr>
                <td>销售数量：</td>
                <td>
                    <input type="number" name="salenum" class="form-control" value="${goodsById.salenum}">
                </td>
                <td>回复数量：</td>
                <td>
                    <input type="number" name="remarknum" class="form-control" value="${goodsById.remarknum}">
                </td>
            </tr>
            <tr>
                <td>商品评分：</td>
                <td>
                    <input type="number" step="0.01" name="remarkscore" class="form-control"
                           value="${goodsById.remarkscore}">
                </td>
                <td>商品状态：</td>
                <td>
                    <select name="status" class="form-control">
                        <option value="0"
                                <c:if test="${goodsById.status eq '0'}">selected</c:if> >上架
                        </option>
                        <option value="1" <c:if test="${goodsById.status eq '1'}">selected</c:if>>下架</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="4" class="text-center">
                    <script id="container" name="content" type="text/plain">${goodsById.description}</script>
                </td>

            </tr>
            <tr>
                <td colspan="4" class="text-center">
                    <button type="submit" class="btn btn-success">修改</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>