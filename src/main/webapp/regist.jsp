<%--
   Created by IntelliJ IDEA.
   User: Administrator
   Date: 2018/10/14
   Time: 15:43
   To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
          <title>注册</title>
          <style>
              
                img { cursor: pointer}
          </style>
</head>
<body>
<form action="/regist" method="post">
          <img src="/captcha.png" onclick="changeImg(this)">
          输入验证码：<input type="text" name="cap">
          <input type="submit" value="提交">
</form>
  
<script>

    function changeImg(img) {
        // 浏览器有一个缓存特性,
        // 第一次从服务器获取图片，浏览器第二次发送请求时发现地址没有改变，就会使用第一次的图片，而不会真正发送请求
        // 为了让浏览器每次都把请求发送给服务器，给一个时间参数
        img.src = "captcha.png?t="+new Date().getTime(); // 给src赋一个新值，就会向新值的地址发送一次请求
    }
    document.getElementsByTagName("img")[0].src = "captcha.png?t="+new Date().getTime();
</script>
</body>
</html>