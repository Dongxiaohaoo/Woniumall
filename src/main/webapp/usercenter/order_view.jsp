<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<base href="${pageContext.request.contextPath}/">
<style href="css/index.css"></style>
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<script src="js/axios.min.js"></script>
<script src="js/jquery-3.5.1.js"></script>
<script src="layer/layer.js"></script>
<html>
<%--<script id="orderItemTpl" type="text/html">--%>
<%--{{each data as orderItem}}--%>
<%--	<tr >--%>
<%--			<td><img class="pro_pic"--%>
<%--						src="../{{orderItem.goods.image}}" width="50px"--%>
<%--						height="50px" /></td>--%>
<%--			<td class="t_l"><a class="blue"--%>
<%--						href="../goods?opr=view&id={{orderItem.goods.id}}" target='_blank'>{{orderItem.goods.name}}</a></td>--%>
<%--			<td class="red2">{{orderItem.price}}</td>--%>
<%--			<td>{{orderItem.nums}}</td>--%>
<%--			<td class="red2 bold">{{orderItem.price*orderItem.nums}}</td>--%>
<%--		</tr>--%>
<%--{{/each}}--%>
<%--</script>--%>
<%--<script id="orderOprTpl" type="text/html">--%>
<%--  {{if data==1}}--%>
<%--			<label class="btn_orange"> <input type="button" value="取消订单" id="cancelOrder" /></label>--%>
<%--			<label class="btn_green"><input type="button" value="立即付款" /></label>--%>
<%--  {{/if}}--%>
<%--  {{if data==3}}--%>
<%--			<label class="btn_green"><input type="button" value="确认收货" id="finishOrder" /></label>--%>
<%--  {{/if}}--%>
<%--</script>--%>
<div class="uc_title m_10">
    <label class="current"><span>订单详情</span></label>
</div>
<div class="prompt_2 m_10">
    <p>
        <b>订单号：</b><span id="orderNo">${order.no}</span><b>下单日期：</b> <span id="orderTime">${order.ordertime}</span>
        <b>状态：</b> <span class="red2" id="status">
                <c:if test="${order.status eq '0'}">待发货</c:if>
                <c:if test="${order.status eq '1'}">待付款</c:if>
                <c:if test="${order.status eq '2'}">订单关闭</c:if>
                <c:if test="${order.status eq '3'}">已发货</c:if>
	</span>
    </p>
    <p id="order_opr">

    </p>
</div>
<div class="box m_10">
    <div class="title">
        <h2>
            <span class="orange">收件人信息</span>
        </h2>
    </div>

    <!--收获信息展示-->
    <div class="cont clearfix" id="acceptShow">
        <table class="dotted_table f_l" width="100%" cellpadding="0"
               cellspacing="0">
            <col width="130px"/>
            <col/>
            <tr>
                <th>收货人：</th>
                <td id="accept">${order.accept}</td>
            </tr>
            <tr>
                <th>地址：</th>
                <td id="address">${order.address}</td>
            </tr>
            <tr>
                <th>手机号码：</th>
                <td id="telphone">${order.telephone}</td>
            </tr>
        </table>
    </div>
</div>

<!--支付和配送-->
<div class="box m_10">
    <div class="title">
        <h2>
            <span class="orange">支付及配送方式</span>
        </h2>
    </div>
    <div class="cont clearfix">
        <table class="dotted_table f_l" width="100%" cellpadding="0"
               cellspacing="0">
            <col width="130px"/>
            <col/>
            <tr>
                <th>支付方式：</th>
                <td id="paytype">
                    <c:if test="${order.paytype eq '0'}">余额支付</c:if>
                    <c:if test="${order.paytype eq '1'}">支付宝</c:if>
                    <c:if test="${order.paytype eq '2'}">货到付款</c:if>
                </td>
            </tr>
        </table>
    </div>
</div>

<!--物品清单-->
<div class="box m_10">
    <div class="title">
        <h2>
            <span class="orange">商品清单</span>
        </h2>
    </div>
    <div class="cont clearfix">
        <table class="list_table f_l" width="100%" cellpadding="0"
               cellspacing="0">
            <thead>
            <tr>
                <th>图片</th>
                <th>商品名称</th>
                <th>商品价格</th>
                <th>商品数量</th>
                <th>小计</th>
            </tr>
            </thead>
            <tbody id="orderItems">
            <c:forEach var="ois" items="${orderItemList}">
                <tr>
                <td><img src="${ois.goods.image}"></td>
                <td>${ois.goods.name}</td>
                <td>${ois.goods.saleprice}</td>
                <td>${ois.num}</td>
                <td>${ois.price}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<div class="gray_box">
    <p>
        订单支付金额：<span class="red2">￥${order.totalmoney}<label id="order_amount"></label></span>
    </p>
</div>
</html>
