<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"></meta>
<base href="${base}/" />
<title>首页_${site}</title>
<jsp:include page="base.jsp" />
</head>
<%--<link rel="stylesheet" href="bootstrap/css/bootstrap.css">--%>
<script src="js/jquery-3.5.1.js"></script>
<script src="layer/layer.js"></script>
<body class="index">
	<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="navbar.jsp"></jsp:include>
		<jsp:include page="search.jsp"></jsp:include>

		<div class="wrapper clearfix">
			<div class="sidebar f_r">
				<!--热卖商品-->
				<div class="hot box m_10">
					<div class="title">
						<h2>热卖商品</h2>
					</div>
					<div class="cont clearfix">
						<ul class="prolist">
							<c:forEach var="Goods" items="${HotGoodsList}" varStatus="vs">
								<li><a href="frontGoods?opr=gotoDetil&id=${Goods.id}"><img src="${Goods.image}"
										width="85" height="85" alt="${Goods.name}" /></a>
									<p class="pro_title">
										<a href="frontGoods?opr=gotoDetil&id=${Goods.id}">${Goods.name}</a>
									</p>
									<p class="brown">
										<b>￥${Goods.saleprice}</b>
									</p></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!--热卖商品-->

			</div>

			<div class="main f_l">
				<!--最新商品-->
				<div class="box yellow m_10">
					<div class="title title3">
						<h2>
							<img src="images/front/new_product.gif" alt="最新商品" width="160"
								height="36" />
						</h2>
					</div>
					<div class="cont clearfix">
						<ul class="prolist">
							<c:forEach var="Goods" items="${NewGoodsList}" varStatus="vs">
								<li style="overflow: hidden"><a href="frontGoods?opr=gotoDetil&id=${Goods.id}" target="_blank"><img
										src="${Goods.image}" width="175" height="175" alt="" /></a>
									<p class="pro_title">
										<a title="" href="index">${Goods.name}</a>
									</p>
									<p class="brown">
										惊喜价：<b>￥${Goods.saleprice}</b>
									</p>
									<p class="light_gray">
										市场价：<s>￥${Goods.marketprice}</s>
									</p></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!--最新商品-->
				<c:forEach items="${categories}" var="category">
					<div class="box m_10 green" name="showGoods">
						<div class="title title3">
							<h2>
								<a href=""><strong>${category.name}</strong></a>
							</h2>
							<a class="more" href="">更多商品...</a>
						</div>

						<div class="cont clearfix">
							<ul class="prolist">
								<c:forEach items="${category.goodses}" var="goods">
									<li style="overflow: hidden"><a href=""><img
											src="${goods.thumbnail}" width="175" height="175" alt=""
											title=""></a>
										<p class="pro_title">
											<a title="" href="">${goods.name}</a>
										</p>
										<p class="brown">
											惊喜价：<b>￥${goods.price2}</b>
										</p>
										<p class="light_gray">
											市场价：<s>￥${goods.price1}</s>
										</p></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<a href="javascript:gotoPage(${goodsPageInfo.prePage})" title="上一页">上一页</a>
		<c:forEach var="pageInfo" items="${goodsPageInfo.navigatepageNums}" varStatus="vs">
			<a href="javascript:gotoPage(${pageInfo})">第${vs.count}页</a>
		</c:forEach>
		<a href="javascript:gotoPage(${goodsPageInfo.nextPage})" title="下一页">下一页</a>
		<jsp:include page="help.jsp"></jsp:include>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
<script>
	function gotoPage(pageNum) {
		var pageSize = document.getElementById("pSize").value;
		var pageSize = document.getElementById("pSize").value;
		var word = document.getElementById("word").value;
		document.getElementById("myform").querySelector("input[name=pageSize]").value = pageSize;
		document.getElementById("myform").querySelector("input[name=pageNun]").value = pageNum;
		document.getElementById("myform").querySelector("input[name=word]").value = word;
		document.getElementById("myform").submit();
	}
</script>
</html>