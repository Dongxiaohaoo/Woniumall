<%--
  Created by IntelliJ IDEA.
  User: Dongxiaohao
  Date: 2022/5/10
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="js/axios.min.js"></script>
<%--<script>--%>
<%--    window.onload = function () {--%>
<%--        var xhr = new XMLHttpRequest();--%>

<%--        function yibu() {--%>
<%--            let url = 'ajaxTest?qq=' + QQ.value;--%>
<%--            xhr.open('get', url, true);--%>
<%--            xhr.send(null);--%>
<%--            xhr.onreadystatechange = resp;--%>
<%--        }--%>

<%--        function resp() {--%>
<%--            // alert(xhr.responseText)--%>
<%--            //如果响应状态码 == 200 并且 完成响应 （4） 那么就--%>
<%--            if (xhr.status == "200" && xhr.readyState == 4) {--%>
<%--                // alert()--%>
<%--                let respText = xhr.responseText;--%>
<%--                let respArr = respText.split(",");--%>
<%--                name1.value = respArr[0];--%>
<%--                year.value = respArr[1];--%>
<%--            }--%>
<%--        }--%>

<%--        function inputLoad() {--%>
<%--            var input = document.getElementById("QQ");--%>
<%--            input.addEventListener("input", test, false); //绑定事件--%>
<%--        }--%>

<%--        function test() {--%>
<%--            yibu()--%>
<%--        }--%>

<%--        //最后调用监听事件--%>
<%--        inputLoad();--%>
<%--    }--%>
<%--</script>--%>
<script>
    // window.onload = function () {
    //     document.getElementById("QQ").addEventListener("blur", function () {
    //         //axios发送异步请求
    //         let qq = QQ.value;
    //         axios.get("ajaxTest?qq=" + qq).then(function (result) {
    //             //处理成功，收到响应，
    //             // then里面指定函数是一个处理成功的回调函数自动接收responseText
    //             let dataArr = result.data;
    //             console.log(dataArr);
    //             var split = dataArr.split(",");
    //             name1.value = split[0];
    //             year.value = split[1];
    //         }).catch(function () {
    //             alert("error")
    //         });
    //     });
    // }
</script>
<script>
    window.addEventListener("load",function (){
        // document.getElementById("QQ").addEventListener("blur",function () {
           var qq = QQ.value;
           axios.get("ajaxTest?qq="+qq).then(function (aaa) {
               var data2 = aaa.data;
               var split = data2.split(",");
               name1.value = split[0];
               year.value = split[1];
           }).catch(function () {
               alert("error")
           });
        // });
    document.getElementById("sec").addEventListener("change",function () {
       var elementById = document.getElementById("sec2");
       let Arr = [1,2,3,4,5];
        elementById.options.length = 0;
       if (sec.value == 1){

           for (let i = 0;i < Arr.length;i++){
                elementById.add(new Option("湖北",Arr[i]))
           }
       }
    });
    });
</script>
<body>
<input type="text" id="QQ"><br>
<input type="text" id="name1"><br>
<input type="text" id="year"><br>
<select id="sec">
    <option value="">请选择</option>
    <option value="1">一</option>
</select>
<select id="sec2"></select>
<input type="button" id="add">
</body>
</html>
