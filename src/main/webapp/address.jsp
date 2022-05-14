<%--
  Created by IntelliJ IDEA.
  User: Dongxiaohao
  Date: 2022/5/10
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<base href="${pageContext.request.contextPath}/">
<script src="js/axios.min.js"></script>
<html>
<head>
    <title>address</title>
</head>
<script>
    window.addEventListener("load",function () {
       document.getElementById("pro").addEventListener("change",function () {
            var value = pro.value;
            axios.get("address?superior="+value).then(
                function (result) {
                    var city = document.getElementById("city");
                    city.options.length = 0;
                    var res = result.data;
                    var split = res.split(";");
                    for (let i = 0; i < split.length-1;i++){
                        var split1 = split[i].split(",");
                        city.add(new Option(split1[0],split1[1]));
                    }
                }
            );
       });

        document.getElementById("city").addEventListener("change",function () {
            var value = city.value;
            axios.get("address?superior="+value).then(
                function (result) {
                    var city = document.getElementById("coun");
                    city.options.length = 0;
                    var res = result.data;
                    var split = res.split(";");
                    for (let i = 0; i < split.length-1;i++){
                        var split1 = split[i].split(",");
                        city.add(new Option(split1[0],split1[1]));
                    }
                }
            );
        });
    });
</script>
<body>
    <select name="pro" id="pro">
        <option value="">--请选择--</option>
        <option value="410000">湖南省</option>
        <option value="420000">湖北省</option>
    </select>
    <select name="city" id="city">
<%--        <option value="">--请选择--</option>--%>
    </select>
    <select name="coun" id="coun">
<%--        <option value="">--请选择--</option>--%>
    </select>
<br>
请输入账号:<input type="text" name="username" id="username"><span id="isExist"></span>
</body>
<script>
    window.addEventListener("change",function () {
       // var value = username.value;
       // var span = document.getElementById("isExist");
       //  axios.get("address?username="+value).then(function (aaa) {
       //      span.innerText = "恭喜，账号可用！";
       //      span.style.color = "green";
       //  }).catch(function (bbb) {
       //      span.innerText = "用户名已被使用！！";
       //      span.style.color = "red";
       //  });
        axios({
            url:'address',
            // baseURL:'http://47.93.206.13:8002',
            method:'post',
            // params:    用于get请求
            data:{    //用于post请求
                username:username.value,
                // password:'123321'
            }
        }).then((res) => {
            console.log(res);
        })
    });
</script>
</html>
