<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<base href="${pageContext.request.contextPath}/">
<script src="js/axios.min.js"></script>
<script src="js/jquery-3.5.1.js"></script>
<script src="layer/layer.js"></script>
<html>
<script>
</script>
<div class='tabs'>
	<div class="uc_title m_10 tabs_menu">
		<label class="current node"><span>修改密码</span></label>
	</div>
</div>
<form>
<table class="form_table" width="100%" cellpadding="0" cellspacing="0">
	<col width="120px" />
	<col />
	<tr>
		<th>原密码：</th>
		<td><input id='oldpwd' class="normal" type="text" /><label></label></td>
	</tr>
	<tr>
		<th>新密码：</th>
		<td><input id='newpwd' class="normal" type="text" /><label></label></td>
	</tr>
	<tr>
		<th>确认密码：</th>
		<td><input id='cfmpwd' class="normal" type="text" /><label></label></td>
	</tr>
	<tr>
		<th></th>
		<td><label class="btn"><input type="button" id="updatepwd"
				value="保存" onclick="ValidateForm()"/></label> <label class="btn"><input type="button"
				id="cancel" value="取消" /></label></td>
	</tr>
</table>
</form>
<script>
	function ValidateForm() {
		let all = document.getElementsByClassName("normal");
		for (let i = 0; i < all.length; i++) {
			if (all[i].value == ''){
				alert("请完整填写数据")
				return ;
			}
		}

		let oldpwd = document.getElementById("oldpwd").value;
		let newpwd = document.getElementById("newpwd").value;
		let cfmpwd = document.getElementById("cfmpwd").value;
		if (newpwd != cfmpwd){
			alert("两次密码输入不一致！")
			return;
		}
		axios.get("mall/user?opr=updatepassword&oldpwd="+oldpwd+"&newpwd="+newpwd).then(function (result) {
			let res = result.data;
			if (res.status != 200){
				alert(res.msg);
				return;
			}else{
				alert(res.msg);
			}
			window.location.href = "login.jsp"
		});
		return true;
	}
</script>
</html>
