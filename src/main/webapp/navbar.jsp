<%@ page import="java.math.BigDecimal" %>
<%@ page import="com.woniu.mall.entity.Cart" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<script src="js/axios.min.js"></script>
<script>
    $(function () {
        $('.mycart').hover(
            function () {
                $('#div_mycart').show('slow');
                var innerHTML = document.getElementById("cartTemplete").innerHTML;
                document.getElementById("div_mycart").innerHTML = innerHTML;
            },
            function () {
                $('#div_mycart').hide('slow');
                // document.getElementById("div_mycart").
            }
        );
    });


</script>

<%!
    //封装计算方法
    public BigDecimal getBigDecimal(BigDecimal num, BigDecimal price) {
        BigDecimal result = price.multiply(num);
        return result;
    }
%>
<%
    //计算购物车总价
    BigDecimal total = new BigDecimal("0");
    List<Cart> cartList = (List<Cart>) request.getSession().getAttribute("cartList");
    try {


        for (Cart cart : cartList) {
            BigDecimal addprice = cart.getAddprice();
            BigDecimal num = new BigDecimal(String.valueOf(cart.getNum()));
            total = total.add(getBigDecimal(addprice, num));
        }
    }catch (Exception e){

    }
%>
<div class="navbar">
    <ul>
        <li><a href="index">首页</a></li>
        <c:forEach var="Category" items="${allCategory}">
            <li><a href="frontGoods?opr=category&id=${Category.id}">${Category.name}</a></li>
        </c:forEach>
    </ul>
    <div class="mycart">
        <dl>
            <dt>
                <a href="javascript:void(0)" name="gotoCart">购物车<b name="mycart_count">
                    <%--					如果未登录，那么就显示0--%>
                    <c:if test="${empty user}">0</c:if>
                    <c:if test="${!empty user}">
                        ${cartNums}
                    </c:if>
                </b>件
                </a>
            </dt>
            <dd>
                <a href="javascript:void(0)" name="gotoCart" onclick="gotoCart()">去结算</a>
            </dd>
        </dl>

        <!--购物车浮动div 开始 如果没登陆 不显示加载-->
        <c:if test="${!empty user}">
            <div class="shopping" id='div_mycart' style='display:none;'></div>
            <!--购物车浮动div 结束-->
            <script type='text/html' id='cartTemplete'>
                <dl class="cartlist">
                    <c:forEach var="cart" items="${cartList}">
                        <dd id="site_cart_dd_{{index}}">
                            <div class="pic f_l"><img width="55" height="55" src="${cart.goods.image}"></div>
                            <h3 class="title f_l"><a href="{{data['goods_id']}}">${cart.goods.name}</a></h3>
                            <div class="price f_r t_r">
                                    <%--						<b class="block">￥{{data['sell_price']}} x {{data['count']}}</b>--%>
                                <b class="block">￥${cart.addprice} X ${cart.num}</b>
                                <input class="del" type="button" onclick="delCart(this)" value="删除"/>
<%--                                        onclick="removeCart('');$('#site_cart_dd_{{item}}').hide('slow');"--%>
                            </div>
                        </dd>
                    </c:forEach>
                    <dd class="static"><span>共<b name="mycart_count">${cartNums}</b>件商品</span>金额总计：<b name="mycart_sum">￥<%=total%>
                    </b></dd>
                    <dd class="static">
                        <label class="btn_orange"><input type="button" value="去购物车结算" onclick="gotoCart()"/></label>
                    </dd>
                </dl>
            </script>
        </c:if>
        <!--购物车模板 结束-->
    </div>
    <script>
        let ele1 = document.getElementsByName("gotoCart")[0];
        let ele2 = document.getElementsByName("gotoCart")[1];

        function gotoCart() {
            axios.get("cart?opr=gotoCart").then(function (res){
                let status = res.data;
                if (status.status == 1){
                    window.location.href = "login.jsp";
                    return;
                }
                window.location.href = "cart?opr=gotoCart";
            });
        }

        ele1.addEventListener("click",gotoCart);
        ele2.addEventListener("click",gotoCart);
    </script>
    <script>
        function delCart(dom) {
            let count = document.getElementsByName("mycart_count");
            console.log(dom.parentNode.parentNode.parentNode.removeChild(dom.parentNode.parentNode));
            console.log();
        }
    </script>
</div>