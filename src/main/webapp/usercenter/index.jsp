<%--
  Created by IntelliJ IDEA.
  User: Dongxiaohao
  Date: 2022/5/13
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<base href="${pageContext.request.contextPath}/">
<html>
<meta charset="UTF-8" />
<title>个人中心</title>
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script type="text/javascript" src="js/jquery-3.5.1.js"></script>
<script type="text/javascript">
    $(function(){
        $("#main").load("usercenter/main.jsp");
        $(".menu").click(function(e){
            $("#main").load($(this).attr("href"));
            e.preventDefault();
        });
    });
</script>
<script id="navTpl" type="text/html">
    <li><a href="">首页</a></li>
    {{each data as category}}
    <li><a href="../goods?opr=list&categoryid={{category.id}}">{{category.name}}</a></li>
    {{/each}}
</script>
<script id="loginfoTpl" type="text/html">
    {{user.account}}！您好，欢迎您来到购物！[<a href="../user?opr=logout" class="reg">安全退出</a>]
</script>
</head>
<body class="index">
<div class="ucenter container">
    <div class="header">
        <h1 class="logo">
            <a title="" style="background: url(images/logo.png)" href="index">电子商务平台</a>
        </h1>
        <ul class="shortcut">
            <li class="first"><a href="javascript:$('#main').load('usercenter/main.jsp');">个人中心</a></li>
            <li><a href="mall/user?opr=gotoUserOrder">我的订单</a></li>
        </ul>
        <p class="loginfo" id="loginfo">

        </p>
    </div>
    <jsp:include page="../navbar.jsp"></jsp:include>
    <div class="searchbar">
        <div class="allsort">
            <a href="javascript:void(0);"
               onmouseover="$('#div_allsort').css('display','block')"
               onmouseout="$('#div_allsort').css('display','none')">全部商品分类</a>
            <!--总的商品分类-开始-->
            <ul class="sortlist" id='div_allsort' style="display: none">
                <li>
                    <h2>
                        <a href="">科技</a>
                    </h2>
                </li>
            </ul>
        </div>

        <div class="searchbox">
            <form method='get' action='/search'>
                <input class="text" type="text" name='q' autocomplete="off"
                       placeholder="输入关键字..." /> <input class="btn" type="submit"
                                                        value="商品搜索" />
            </form>
        </div>
        <div class="hotwords">
            热门搜索：<a href="/search?q=Java">Java</a>
        </div>
    </div>
    <div class="wrapper clearfix">
        <div class="sidebar f_l">
            <img src="images/front/ucenter/ucenter.gif" width="180"
                 height="40" />
            <div class="box">
                <div class="title">
                    <h2>交易记录</h2>
                </div>
                <div class="cont">
                    <ul class="list">
                        <li><a href="usercenter/order_list.jsp" class="menu">我的订单</a></li>
                    </ul>
                </div>
            </div>
            <div class="box">
                <div class="title">
                    <h2 class='bg5'>个人设置</h2>
                </div>
                <div class="cont">
                    <ul class="list">
                        <li><a href="usercenter/address_list.jsp" class="menu">地址管理</a></li>
                    </ul>
                    <ul class="list">
                        <li><a href="usercenter/user_avatar.jsp" target="myframe" class="menu">修改头像</a></li>
                    </ul>
                    <ul class="list">
                        <li><a href="usercenter/password_update.jsp" target="myframe" class="menu">修改密码</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="main f_r" id="main">
            <iframe name="myframe" src="usercenter/password_update.jsp" width="100%" height="100%" frameborder="no"></iframe>
        </div>
    </div>
    <div class="help m_10">
        <div class="cont clearfix">
            <dl>
                <dt>
                    <a href="">购物指南</a>
                </dt>
                <dd>
                    <a href="">订单状态</a>
                </dd>
                <dd>
                    <a href="">购物流程</a>
                </dd>
            </dl>
            <dl>
                <dt>
                    <a href="">支付帮助</a>
                </dt>
                <dd>
                    <a href="">支付帮助</a>
                </dd>
                <dd>
                    <a href="">在线支付</a>
                </dd>
                <dd>
                    <a href="">货到付款</a>
                </dd>
            </dl>
            <dl>
                <dt>
                    <a href="">配送帮助</a>
                </dt>
                <dd>
                    <a href="">EMS/邮政普包</a>
                </dd>
                <dd>
                    <a href="">商品验货与签收</a>
                </dd>
                <dd>
                    <a href="">配送范围及运费</a>
                </dd>
            </dl>
            <dl>
                <dt>
                    <a href="">售后服务</a>
                </dt>
                <dd>
                    <a href="">售后服务</a>
                </dd>
                <dd>
                    <a href="">发票制度</a>
                </dd>
                <dd>
                    <a href="">退货说明</a>
                </dd>
                <dd>
                    <a href="">换货说明</a>
                </dd>
            </dl>
            <dl>
                <dt>
                    <a href="">帮助信息</a>
                </dt>
                <dd>
                    <a href="">友情链接</a>
                </dd>
                <dd>
                    <a href="">联系客服</a>
                </dd>
                <dd>
                    <a href="">找回密码</a>
                </dd>
                <dd>
                    <a href="">关于我们</a>
                </dd>
            </dl>
        </div>
    </div>
    <div class="footer">
        <p class="links">
            <a href="">关于我们</a>|<a href="">常见问题</a>|<a href="">安全交易</a>|<a
                href="">购买流程</a>|<a href="">如何付款</a>|<a href="">联系我们</a>|<a href="">合作提案</a>
        </p>
        Copyright © 2015-2021 <a class="copyys" target="_blank" href="">蜀ICP备01000010号</a>
    </div>
</div>
</body>
</html>
