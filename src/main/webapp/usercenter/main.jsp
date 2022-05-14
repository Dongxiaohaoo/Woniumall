<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<base href="${pageContext.request.contextPath}/">
<html>
<script id="orderTpl" type="text/html">
    <tr>
        <%--			<td><a href="#" onclick="view({{order.id}})" class="orange" >{{order.orderNo}}</a></td>--%>
        <%--			<td>{{order.orderTime}}</td>--%>
        <%--			<td>{{order.accept}}</td>--%>
        <%--			<td>{{order.payType==1?"支付宝":"货到付款"}}</td>--%>
        <%--			<td>{{order.money}}</td>--%>
        <%--			<td>{{order.status.text}}</td>--%>
    <tr>
</script>
<div class="userinfo_bar">
    <b class="f14">您好，<span id="account">${user.username}</span>！欢迎回来!
    </b>
</div>
<div class="box clearfix">
    <h3>用户信息</h3>
    <dl class="userinfo_box">
        <dt>
            <a class="ico"><img id="user_ico_img" src="${user.avatar}" width="100" /></a>
        </dt>
        <dd>
            <table width="100%" cellpadding="0" cellspacing="0">
                <col width="350px"/>
                <tr>
                    <td>你的订单交易总数量：<b class="red2">${allOrderList} 笔</b>&nbsp;&nbsp;&nbsp;
                        <a class="blue orderlist" href="javascript:void(0)">进入订单列表</a></td>
                </tr>
                <tr>
                    <td>总消费额：<b class="red2">${cost}元</b></td>

                </tr>
            </table>

            <div class="stat">
				<span>待评价商品：<label>(<b class="red2">1</b>)
				</label></span> <span>待付款订单：<label>(<b class="red2">${waitPaymentSize}</b>)
				</label></span> <span>待确认收货：<label>(<b class="red2"><a href="">${sendsNum}</a></b>)
				</label></span>
            </div>
        </dd>
    </dl>
</div>
<h3 class="bg">我的订单</h3>
<div class="box m_10">
    <table class="list_table" width="100%" cellpadding="0" cellspacing="0">
        <col width="140px"/>
        <thead>
        <tr>
            <th>订单编号</th>
            <th>下单日期</th>
            <th>收货人</th>
            <th>支付方式</th>
            <th>总金额</th>
            <th>订单状态</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${allOrder}" varStatus="vs">
            <tr>
                <td>${order.no}</td>
                <td>${order.ordertime}</td>
                <td>${order.accept}</td>
                <td>
                    <c:if test="${order.paytype eq '0'}">余额支付</c:if>
                    <c:if test="${order.paytype eq '1'}">支付宝</c:if>
                    <c:if test="${order.paytype eq '2'}">货到付款</c:if>
                </td>
                <td>${order.totalmoney}</td>
                <td>
                    <c:if test="${order.status eq '0'}">待发货</c:if>
                    <c:if test="${order.status eq '1'}">待付款</c:if>
                    <c:if test="${order.status eq '2'}">订单关闭</c:if>
                    <c:if test="${order.status eq '3'}">已发货</c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
        <tbody id="orderData"></tbody>
        <tfoot>
        <tr>
            <td colspan="6" class="t_r"><a class="blue orderlist" href="mall/user?opr=gotoUserOrder">更多订单&gt;&gt;</a></td>
        </tr>
        </tfoot>
    </table>
</div>
</html>