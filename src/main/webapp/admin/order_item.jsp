<%--
  Created by IntelliJ IDEA.
  User: Dongxiaohao
  Date: 2022/5/11
  Time: 0:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<base href="${pageContext.request.contextPath}/">
<head>
    <title>订单详情</title>
</head>
<body>
<script src="js/jquery-3.5.1.js"></script>
<script src="layer/layer.js"></script>
<script src="js/axios.min.js"></script>
<input type="hidden" name="id"  id="id" value="${order.id}">
    订单详情：<br>
订单编号:${order.no};<br>下单时间:${order.ordertime};<br>用户账号:${order.username};<br>收货人:${order.accept};<br>
    手机号:${order.telephone};<br>收货地址:${order.address};<br>总金额${order.totalmoney};
    状态:<span id="status"><c:if test="${order.status eq '0'}">待发货;</c:if>
    <c:if test="${order.status eq '1'}">待付款;</c:if>
    <c:if test="${order.status eq '2'}">订单关闭;</c:if>
    <c:if test="${order.status eq '3'}">已发货;</c:if></span>
<table border="1" cellspacing="0">
 <tr>
     <th>序号</th>
     <th>商品名称</th>
     <th>商品图片</th>
     <th>数量</th>
     <th>价格</th>
     <th>小计</th>
 </tr>
    <c:if test="${orderItemListSize eq 0}"><tr align="center"><td colspan="6">暂无数据..</td></tr></c:if>
    <c:forEach var="orderItem" items="${orderItemList}" varStatus="vs">
        <tr>
            <td>${vs.count}</td>
            <td>${orderItem.goods.name}</td>
            <td><img src="${orderItem.goods.image}"></td>
            <td>${orderItem.num}</td>
            <td>${orderItem.goods.saleprice}</td>
            <td>${orderItem.price}</td>
        </tr>
    </c:forEach>
</table>
    <c:if test="${order.status eq '0' && orderItemListSize ne 0}"><input type="button" id="send" value="发货"></c:if>
</body>
<script>
    document.getElementById("send").addEventListener("click",function () {
        var value = id.value;
        console.log(value);
        axios.get("admin/order?opr=sendGoods&id="+value).then(function (res) {
            layer.msg("发货成功！")
            document.getElementById("status").innerText = "已发货";
        }).catch(function (error) {
            layer.msg("发货失败..")
        });
    });
</script>
</html>
