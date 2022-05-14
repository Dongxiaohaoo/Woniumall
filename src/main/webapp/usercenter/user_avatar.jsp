<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<base href="${pageContext.request.contextPath}/">
<script src="js/axios.min.js"></script>
<script src="js/jquery-3.5.1.js"></script>
<script src="layer/layer.js"></script>
<html>
<div class="uc_title m_10 tabs_menu">
	<label class="current node"><span>用户头像修改</span></label>
</div>
<form id="avatarForm" method="post" action="mall/user?opr=avatar" enctype="multipart/form-data">
<table class="form_table" width="100%" cellpadding="0" cellspacing="0">
	<col width="120px" />
	<col />
	<tr>
		<th>请选择头像：</th>
		<td><input type="file" id="avatar" name="avatar"/><label></label></td>
	</tr>
	<tr>
		<th></th>
		<td><label class="btn"><input type="button" id="save"
				value="保存" onclick="finish()"/></label> <label class="btn"><input type="button"
				id="cancel" value="取消" /></label></td>
	</tr>
</table>
</form>
<script>
	function finish() {
		let form = document.getElementById("avatarForm");
		if (form[0].value == ''){
			alert("请先上传头像！")
			return;
		}
		document.getElementById("avatarForm").submit();
		alert("修改成功")
		// window.location.href = "mall/user?opr=gotoUserCenter";
	}
</script>
</html>
