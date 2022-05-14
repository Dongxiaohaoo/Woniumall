<%--
  Created by IntelliJ IDEA.
  User: Dongxiaohao
  Date: 2022/5/13
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>${msg}</h1>

<h3><span style="color: red">订单购买错误</span><span id="time">5</span><font color="red">秒后返回首页...</font> </h3>
<script>
    let count = 0;
    let time;
    function daojishi(){
        clearInterval(time);
        let timeNode = document.getElementById("time");
        let number = parseInt(timeNode.innerText);
        console.log(number)
        number -=  1;
        timeNode.innerText = number;
        count ++;
        if (count == 5){
            window.location.href = "index";
        }
        time = setInterval(daojishi,1000);
    }
    daojishi();
</script>
</body>
</html>
