<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <base href="${pageContext.request.contextPath}/"/>
    <meta charset="UTF-8">
    <title>用户管理系统-用户列表</title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="layer/layer.js"></script>
    <script>
        //翻页
        function gotoPage(pageNum) {
            var pageSize = document.getElementById("pSize").value;
            document.getElementById("myform").querySelector("input[name=pageSize]").value = pageSize;
            document.getElementById("myform").querySelector("input[name=page]").value = pageNum;
            console.log(document.getElementById("myform").querySelector("input[name=pageSize]"))
            document.getElementById("myform").submit();
        }

        //根据条件查询
        function query(pageNum) {
            window.location.href = "admin/order?opr=getAll&page=" + 1 + "&pageSize=" + pageSize.value + "&typeid=" + typeid.value + "&status1=" + status1.value + "&title=" + title.value;
        }

        //清除条件
        function clearCondition() {
            document.getElementById("title").value = "";
            document.getElementById("typeid").value = "";
            document.getElementById("status1").value = "";
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
<img src="" id="BigImg" style="display: none;z-index: 10">
<div>
    <div>
        <!-- 路径导航  -->
        <ol class="breadcrumb">
            <li class="active">你现在的位置是：用户管理</li>
            <li><a href="admin/order?opr=getAll">用户列表</a></li>
        </ol>
    </div>
    <!-- 路径导航结束 -->
    <div style="padding-left: 10px; padding-right: 10px;">
        <!-- 多条件查询 -->
        <form class="form-inline" id="myform" action="admin/order">
            <input type="hidden" name="opr" value="getAll">
            <input type="hidden" name="pageSize" id="pSize" value="${OrderInfo.pageSize}">
            <input type="hidden" name="page" id="page" value="1">
            <div class="form-group">
                <label for="title">用户账号：</label> <input type="text"
                                                        class="form-control" name="title" id="title"
                                                        placeholder="请输入用户账号" value="${name}" style="width:150px" >
            </div>
            <div class="form-group">
                订单状态：
                <select name="status" id="status1" class="form-control">
                    <option value="">---请选择---</option>
                    <option value="0"
                            <c:if test="${status eq '0'}">selected</c:if>    >待发货
                    </option>
                    <option value="1"
                            <c:if test="${status eq '1'}">selected</c:if>    >待付款
                    </option>
                    <option value="2"
                            <c:if test="${status eq '2'}">selected</c:if>    >已关闭
                    </option>
                </select>
                订单类型：
                <input type="datetime-local" class="form-control" name="lowerTime" value="${lowerTime}">
                <input type="datetime-local" class="form-control" name="upperTime" value="${upperTime}">
                <button type="submit" id="btnQuery" class="btn btn-primary" onclick="query()">查询</button>
                <button type="button" class="btn btn-warning" onclick="clearCondition()">清空条件</button>
            </div>
        </form>
    </div>
    <!-- 多条件查询结束 -->
    <div style="padding-left: 10px; padding-right: 10px;">
        <!-- 数据列表 -->
        <table class="table table-bordered">
            <thead>
            <tr>
                <th class="col-md-1 text-center">订单编号</th>
                <th class="col-md-1 text-center">下单时间</th>
                <th class="col-md-1 text-center">用户账号</th>
                <th class="col-md-1 text-center">收货人</th>
                <th class="col-md-1 text-center">手机号码</th>
                <th class="col-md-1 text-center">收货地址</th>
                <th class="col-md-1 text-center">金额</th>
                <th class="col-md-1 text-center">订单状态</th>
                <th class="col-md-1 text-center">操作</th>
            </tr>
            </thead>
            <tbody id="tbd">
            <c:forEach var="order" items="${OrderInfo.list}" varStatus="vs">
                <tr class="text-center">
                    <td>${order.no}</td>
                    <td>${order.ordertime}</td>
                    <td>${order.username}</td>
                    <td>${order.accept}</td>
                    <td>${order.telephone}</td>
                    <td>${order.address}</td>
                    <td>${order.totalmoney}</td>
                    <td>
                        <c:if test="${order.status eq '0'}"><span style="color: green">待发货</span></c:if>
                        <c:if test="${order.status eq '1'}"><span style="color: yellow">待支付</span></c:if>
                        <c:if test="${order.status eq '2'}"><span style="color: red">关闭</span></c:if>
                        <c:if test="${order.status eq '3'}"><span style="color: red">已发货</span></c:if>
                    </td>
                    <td><a href="admin/order?opr=details&orderId=${order.id}" class="btn btn-warning btn-sm">查看</a> </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <tfoot>
        <!--分页组件-->
        <div style="margin:0px;text-align:center;margin-top:0px;border-top: 0px solid #CCCCCC;">
            <ul class="pagination">
                <li>
                    <a href="javascript:gotoPage(1)" title="首页">首页</a>
                </li>
                <li>
                    <a href="javascript:gotoPage(${OrderInfo.prePage})" title="上一页">上一页</a>
                </li>
                <c:forEach var="page" items="${OrderInfo.navigatepageNums}" varStatus="vs">
                    <li <c:if test="${page eq OrderInfo.pageNum}">class="active"</c:if>>
                        <a href="javascript:gotoPage(${page})">${page}</a></li>
                </c:forEach>
                <li>
                    <a href="javascript:gotoPage(${OrderInfo.nextPage})" title="下一页">下一页</a>
                </li>
                <li>
                    <a href="javascript:gotoPage(${OrderInfo.pages})" title="尾页">尾页</a>
                </li>
                <li>
                    总记录 ${OrderInfo.total} 总页数 ${OrderInfo.pages} 当前第 ${OrderInfo.pageNum} 页 转到
                    <input type="number" style="width:30px;text-align: center;" class="input" value="1" id="skipPage"/>
                    页
                    <input type="number" style="width:30px;text-align: center;" class="input" value="${pageSize}"
                           onchange="javascript:window.location.href='admin/order?opr=getAll&page=1&pageSize='+pageSize.value"
                           id="pageSize"/> 条记录
                    <button type="button" class="btn btn-primary active"
                            onclick="javascript:window.location.href='admin/order?opr=getAll&page='+skipPage.value">确定
                    </button>
                    <br>
                </li>
            </ul>
        </div>
        </tfoot>

<%--        <span>${msg}</span>--%>
<%--        <a href="admin/order?opr=addGoods" class="btn btn-success">添加用户</a>--%>
<%--        <a href="javascript:void(0)" onclick="shelves()" class="btn btn-primary">上架选中</a>--%>
<%--        <a href="javascript:void(0)" onclick="soldOut()" class="btn btn-warning">下架选中</a>--%>
<%--        <a href="javascript:void(0)" onclick="delChcked()" class="btn btn-danger">删除选中</a>--%>
    </div>
<%--    <div>${status1}</div>--%>
</div>
<script>
    function checkAll() {
        var checked = document.getElementById("checkAll").checked;
        var elementsByName = document.getElementsByName("goodsId");
        if (checked) {
            for (let i = 0; i < elementsByName.length; i++) {
                elementsByName[i].checked = true;
            }
        } else {
            for (let i = 0; i < elementsByName.length; i++) {
                elementsByName[i].checked = false;
            }
        }
    }

    //删除
    function delChcked() {
        var elementsByName = document.getElementsByName("goodsId");
        var url = "admin/order?opr=delChecked";
        var count = 0;
        for (let i = 0; i < elementsByName.length; i++) {
            if (elementsByName[i].checked) {
                url += ("&id=" + elementsByName[i].value);
                count++;
            }
        }
        if (count == 0) {
            layer.alert("您未选中任何用户");
            return;
        }
        //确认是否删除
        layer.confirm('您确定要删除此用户？', {
            title: "提示",
            icon: 2,
            btn: ['确定', '取消'] //按钮
        }, function () {
            window.location.href = url;
            return;
        }, function () {
        });
    }

    function showBigImg(smallImg) {
        //获取坐标
        let x = event.clientX + 20;
        let y = event.clientY + 20;
        var BigImgId = document.getElementById("BigImg");
        BigImgId.style.position = "absolute";
        BigImgId.style.left = x + "px";
        BigImgId.style.top = y + "px";
        BigImgId.src = smallImg.src;
        BigImgId.style.display = "block";
        // console.log("X轴："+x+" "+"Y轴："+y+" 图片路径："+);
    }

    function closeBigImg() {
        var BigImgId = document.getElementById("BigImg");
        BigImgId.style.display = "none";
    }

    //批量下架
    function soldOut() {
        var elementsByName = document.getElementsByName("goodsId");
        var url = "admin/order?opr=soldOut";
        var count = 0;
        for (let i = 0; i < elementsByName.length; i++) {
            if (elementsByName[i].checked) {
                url += ("&id=" + elementsByName[i].value);
                count++;
            }
        }
        if (count == 0) {
            layer.alert("您未选中任何用户");
            return;
        }
        //确认是否删除
        layer.confirm('您确定要下架选中用户？', {
            title: "提示",
            icon: 2,
            btn: ['确定', '取消'] //按钮
        }, function () {
            window.location.href = url;
            return;
        }, function () {
        });
    }

    function shelves() {
        var elementsByName = document.getElementsByName("goodsId");
        var url = "admin/order?opr=shelves";
        var count = 0;
        for (let i = 0; i < elementsByName.length; i++) {
            if (elementsByName[i].checked) {
                url += ("&id=" + elementsByName[i].value);
                count++;
            }
        }
        if (count == 0) {
            layer.alert("您未选中任何用户");
            return;
        }
        //确认是否删除
        layer.confirm('您确定要上架选中用户？', {
            title: "提示",
            icon: 2,
            btn: ['确定', '取消'] //按钮
        }, function () {
            window.location.href = url;
            return;
        }, function () {
        });
    }
</script>
</body>
</html>