<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<base href="${pageContext.request.contextPath}/">
<script src="js/axios.min.js"></script>
<script src="js/jquery-3.5.1.js"></script>
<script src="layer/layer.js"></script>
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<html>
<script>
</script>
<%--<script id="orderTpl" type="text/html">--%>
<%--	{{each data as order}}--%>
<%--		<tr>--%>
<%--			<td><a href="#" onclick="view({{order.id}})" class="orange" >{{order.orderNo}}</a></td>--%>
<%--			<td>{{order.orderTime}}</td>--%>
<%--			<td>{{order.accept}}</td>--%>
<%--			<td>{{order.payType==1?"支付宝":"货到付款"}}</td>--%>
<%--			<td>{{order.money}}</td>--%>
<%--			<td>{{order.status.text}}</td>--%>
<%--		<tr>--%>
<%--     {{/each}}--%>
<%--</script>--%>
<%--<script id="pagesTpl" type="text/html">--%>
<%--	<a href='javascript:void(0)' id="firstPage">首页</a>--%>
<%--	 {{each totalPages as p}}--%>
<%--		<a  href='javascript:void(0)' {{if p==currPage}} class="current_page" {{/if}} onclick="goPage({{p}})">{{p}}</a>--%>
<%--     {{/each}}--%>
<%--	<a href='javascript:void(0)' id="lastPage">尾页</a>--%>
<%--   <span>当前第{{currPage}}页/共{{totalPages.length}}页</span>--%>
<%--</script>--%>
<div class="uc_title m_10">
    <label class="current"><span>我的订单</span></label>
</div>
<div class="box m_10">
    <table class="list_table" width="100%" cellpadding="0" cellspacing="0">
        <col width="250px"/>
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
        <tbody id="orderData">
        </tbody>
        <tfoot>
        <tr>
            <td colspan="6" class="t_l">
                <div class='pages_bar' id='pages_bar'>
                    <c:forEach var="order" items="${allOrder}">
        <tr>
            <td><a href="order?opr=getDetail&id=${order.id}&orderno=${order.no}" onclick="" class="orange">${order.no}</a></td>
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
        <tr>
            </c:forEach>
</div>
</td>
</tr>
</tfoot>
</table>
</div>
</html>