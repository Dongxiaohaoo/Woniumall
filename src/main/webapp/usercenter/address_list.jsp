<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<base href="${pageContext.request.contextPath}/">
<script src="js/axios.min.js"></script>
<script src="js/jquery-3.5.1.js"></script>
<script src="layer/layer.js"></script>
<html>
<%--<script type="text/javascript" src="../js/address.js"></script>--%>
<%--<script id="tpl" type="text/html">--%>

<%-- {{each list as address}}--%>
<%--<tr>--%>
<%--	<td>{{address.accept}}</td>--%>
<%--	<td>{{address.province}}{{address.city}}{{address.area}}</td>--%>
<%--	<td>{{address.address}}</td>--%>
<%--	<td>{{address.telphone}}</td>--%>
<%--	<td><a class="blue" href='javascript:void(0)' onclick='update({{address.id}})'>修改</a>|--%>
<%--		{{if address.type.value == 'y'}}--%>
<%--			默认地址--%>
<%--		{{/if}}--%>
<%--        {{if address.type.value == 'n'}}--%>
<%--			<a class="blue" href="javascript:void(0)" onclick="del({{address.id}},this)">删除</a>|--%>
<%--			<a class="blue" href="javascript:void(0)" onclick="setDefault({{address.id}})">设为默认</a>--%>
<%--		{{/if}}--%>
<%--     </td>--%>
<%--	</tr>--%>
<%--{{/each}} --%>
<%--</script>--%>

<div class='tabs'>
    <div class="uc_title m_10 tabs_menu">
        <label class="current node"><span>地址管理</span></label>
    </div>
    <div class='tabs_content'>
        <div id="address_list" class="form_content m_10 node">
            <div class="uc_title2 m_10">
                <strong>已保存的有效地址</strong>
            </div>
            <table class="list_table" width="100%" cellpadding="0"
                   cellspacing="0">
                <col width="120px"/>
                <col width="120px"/>
                <col width="240px"/>
                <col width="120px"/>
                <col width="150px"/>
                <col/>
                <thead>
                <tr>
                    <th>收货人</th>
                    <th>所在地区</th>
                    <th>街道地址</th>
                    <th>手机</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="addressdata">
                <c:forEach var="address" items="${userAddress}">
                    <tr>
                        <td>${address.accept}</td>
                        <td>${address.province}</td>
                        <td>${address.city}-${address.area}-${address.street}</td>
                        <td>${address.telephone}</td>
                        <td>
                            <a href="javascript:void(0);" onclick="del(this,${address.id})">删除</a> |
                            <a href="javascript:void(0);" onclick="setDefault(this,${address.id})">设为默认</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!--表单修改-->
<div class="orange_box" id='address_form'>
    <input type="hidden" id="id" value="">
    <form action="#" method="post">
        <table class="form_table" width="100%" cellpadding="0" cellspacing="0">
            <col width="120px"/>
            <col/>
            <caption>收货地址</caption>
            <tr>
                <th><span class="red">*</span> 收货人姓名：</th>
                <td><input id='accept' class="normal" type="text"/><label>收货人真实姓名，方便快递公司联系。</label></td>
            </tr>
            <tr>
                <th><span class="red">*</span> 所在地区：</th>
                <td>
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


                    <%--				<select name="province" id="province"></select> <select--%>
                    <%--				name="city" id="city"></select> <select name="area" id="area"></select>--%>

                </td>
            </tr>
            <tr>
                <th><span class="red">*</span> 街道地址：</th>
                <td><input name='address' id='address' class="normal"
                           type="text"/><label>真实详细收货地址，方便快递公司联系。</label></td>
            </tr>
            <tr>
                <th>手机号码：</th>
                <td><input name='telphone' id='telphone' class="normal"
                           type="text"/><label>手机号码，如：13588888888</label></td>
            </tr>
            <tr>
                <th>设为默认：</th>
                <td><label><input name="type" id="type"
                                  type='checkbox' value='Y'></label></td>
            </tr>
            <tr>
                <th></th>
                <td><label class="btn"><input type="button" id="save"
                                              value="保存" onclick="submitForm()"/></label> <label class="btn"><input
                        type="button" id="cancel"
                        value="取消"/></label></td>
            </tr>
        </table>
    </form>
</div>
<script>
    document.getElementById("pro").addEventListener("change", function () {
        var value = pro.value;
        // console.log(value);
        axios.get("address?superior=" + value).then(
            function (result) {
                var city = document.getElementById("city");
                city.options.length = 0;
                var res = result.data;
                console.log(res)
                var split = res.split(";");
                for (let i = 0; i < split.length - 1; i++) {
                    var split1 = split[i].split(",");
                    city.add(new Option(split1[0], split1[1]));
                }
            }
        );
    });

    document.getElementById("city").addEventListener("change", function () {
        var value = city.value;
        // console.log(value)
        axios.get("address?superior=" + value).then(
            function (result) {
                var city = document.getElementById("coun");
                city.options.length = 0;
                var res = result.data;
                console.log(res)
                var split = res.split(";");
                for (let i = 0; i < split.length - 1; i++) {
                    var split1 = split[i].split(",");
                    city.add(new Option(split1[0], split1[1]));
                }
            }
        );
    });

    function del(dom, index) {
        let tr = dom.parentNode.parentNode;
        let b = confirm("是否删除该地址？");
        if (b) {
            axios.get("mall/user?opr=delAddress&id=" + index).then(function (res) {
                tr.remove();
                alert("删除成功");
            }).catch(function (err) {
                alert("删除失败");
            });
        }
    }

    function setDefault(dom, index) {
        let tr = dom.parentNode.parentNode;
        let add = tr.children[2].innerText
        let b = confirm("是否将" + add + "设为默认地址？");
        if (b) {
            axios.get("mall/user?opr=defaultAddress&id=" + index).then(function (res) {
                alert("设置成功");
            }).catch(function (err) {
                alert("设置失败");
            });
        }
    }

    function submitForm() {
        var objPro = document.getElementById("pro"); //定位id
        var indexPro = objPro.selectedIndex; // 选中索引
        var pro = objPro.options[indexPro].text; // 选中文本

        var objCity = document.getElementById("city"); //定位id
        var indexCity = objCity.selectedIndex; // 选中索引
        var city = objCity.options[indexCity].text; // 选中文本

        var objCoun = document.getElementById("coun"); //定位id
        var indexCoun = objCoun.selectedIndex; // 选中索引
        var coun = objCoun.options[indexCoun].text; // 选中文本

        let street = document.getElementById("address").value;
        let accept = document.getElementById("accept").value;
        let telphone = document.getElementById("telphone").value;
        let ischecked = document.getElementById("type").checked;
        let type;
        if (ischecked) {
            type = 'Y';
        } else {
            type = 'N';
        }
        let url = "mall/user?opr=addAddress&accept=" + accept +
            "&telphone=" + telphone + "&pro=" + pro + "&city=" + city +
            "&coun=" + coun + "&street=" + street + "&type=" + type;
        axios.get(url).then(function (res) {
            alert("添加成功");
            location.reload();
        }).catch(function (err) {
            alert("添加失败，请查看数据是否填写完整；")
        });

        console.log(pro)
        console.log(city)
        console.log(coun)
        console.log(street)
        console.log(type)

        // var value = obj.options[index].value; // 选中值
    }

</script>

</html>