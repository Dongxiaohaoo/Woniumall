<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"></meta>
    <base href="${base}/"/>
    <title>购物车_${site}</title>
    <jsp:include page="base.jsp"/>
    <script src="js/jquery-3.5.1.js"></script>
    <script src="layer/layer.js"></script>
    <script type="text/javascript">
        function finish() {
            let checkboxNode = document.getElementsByClassName("checkbox");
            let goodsNumNode = document.getElementsByClassName("tiny");
            let cartidNode = document.getElementsByClassName("cartid");
            // console.log(elementsByClassName)
            let count = 0;
            for (let i = 0;i < checkboxNode.length;i++) {
                //设置属性为disabled 不提交表单,因为表单中的disabled属性不会被提交
                if (checkboxNode[i].checked != true){
                    //不提交未勾选的id和数量
                    checkboxNode[i].parentNode.lastElementChild.disabled = true;
                    goodsNumNode[i].disabled = true;
                    cartidNode[i].disabled = true;
                }else {
                    count++;
                }
            }
                if (count == 0){
                    layer.msg("您还未选择任何商品...");
                    return;
                }
            $("#form1").submit();
        }
    </script>
    <script src="js/axios.min.js"></script>
    <script type="text/plain" id="goods">
	<tr>
<td><input type="checkbox"></td>
						<td><input type="hidden" name="orderDetails[{{index}}].goods.id" value="{{id}}"/>
						<img src="{{thumbnail}}" width="66px"
							height="66px" alt="{{name}}"
							title="{{name}}" /></td>
						<td class="t_l"><a href="" class="blue">{{name}}</a></td>
						<td>￥<b>{{price2}}</b></td>
						<td>
							<div class="num">
								<a class="reduce" href="javascript:void(0)" onclick=''>-</a> <input
									name="orderDetails[{{index}}].nums" class="tiny" value="{{goodsNum}}" onblur='' type="text" id="goods_count_3">
								<a class="add" href="javascript:void(0)" onclick=''>+</a>
							</div>
						</td>
						<td>￥<b class="red2" id="goods_sum_3">{{goodsNum*price2}}</b></td>
						<td><a href="">删除</a></td>
					</tr>

    </script>
</head>
<body class="second">
<div class="brand_list container_2">
    <jsp:include page="header.jsp"></jsp:include>
    <div class="wrapper clearfix">
        <div class="position mt_10">
            <span>您当前的位置：</span> <a href=""> 首页</a> » 购物车
        </div>
        <div class="myshopping m_10">
            <ul class="order_step">
                <li class="current"><span class="first">1、查看购物车</span></li>
                <li><span>2、填写核对订单信息</span></li>
                <li class="last"><span>3、成功提交订单</span></li>
            </ul>
        </div>
        <form action="order?opr=order_add" id="form1" method="post">
            <table width="100%" class="cart_table m_10">
                <col width="115px"/>
                <col width="400px"/>
                <col width="80px"/>
                <col width="80px"/>
                <col width="80px"/>
                <caption>查看购物车</caption>
                <thead>
                <tr>
                    <th><input type="checkbox" id="checkAll" onclick="checkAll1()">选择</th>
                    <th>图片</th>
                    <th>商品名称</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>小计</th>
                    <th class="last">操作</th>
                </tr>
                </thead>
                <tbody id="goodsList">
                <c:forEach var="cart" items="${cartList}" varStatus="vs">
                    <tr>
                        <td><input type="checkbox" onclick="total(${cart.id},this)" value="${cart.id}"
                                   <c:if test="${cart.ischecked eq '0'}">checked</c:if> class="checkbox">
                            <input type="hidden" name="goodsid" value="${cart.goods.id}" /></td>
                        <td><input type="hidden" name="" value="{{id}}"/>
                            <img src="${cart.goods.image}" width="66px"
                                 height="66px" alt=""
                                 title=""/></td>
                        <td class="t_l"><a href="frontGoods?opr=gotoDetil&amp;id=${cart.goods.id}" class="blue">${cart.goods.name}</a></td>
                        <td>￥<b class="saleprice">${cart.addprice}</b></td>
                        <td>
                            <div class="num"  value="${cart.id}">
                                <input type="hidden" name="cartid" class="cartid" value="${cart.id}">
                                <a class="reduce" href="javascript:void(0)" onclick='reduceNum(${vs.index})'>-</a>
                                <input
                                        name="goodsnum" class="tiny" value="${cart.num}" onblur='' type="text"
                                        id="goods_count_3">
                                <a class="add" href="javascript:void(0)" onclick='addNum(${vs.index})'>+</a>
                            </div>
                        </td>
                        <td>￥<b class="red2" id="goods_sum_3">${cart.num * cart.addprice}</b>
                        </td>
                        <td><a href="javascript:void(0)" onclick="delThis(this,${cart.id})">删除</a></td>
                    </tr>
                </c:forEach>
                <tr class="stats">
                    <td colspan="8">金额总计（不含运费）：￥<b class="orange" id='sum_price'></b></td>
                </tr>
                </tbody>
                <tfoot>
                <tr>
                    <td colspan="2" class="t_l"></td>
                    <td colspan="6" class="t_r"><a class="btn_continue" href="">继续购物</a>
                        <a class="btn_pay" href="javascript:finish();">去结算</a></td>
                </tr>
                </tfoot>
            </table>
        </form>
        <jsp:include page="footer.jsp"/>
    </div>
</body>
<%--载入购物车js组件--%>
<script src="js/cart.js"></script>
</html>
