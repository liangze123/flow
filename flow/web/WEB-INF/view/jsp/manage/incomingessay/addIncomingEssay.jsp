<%@page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<%@include file="/commons/include/addAjax.jsp"%>
<script type="text/javascript">
$dswork.callback = function(){if($dswork.result.type == 1){
	location.href = "getIncomingEssay.htm";
}};
</script>
</head>
<body>
<table border="0" cellspacing="0" cellpadding="0" class="listLogo">
	<tr>
		<td class="title">添加</td>
		<td class="menuTool">
			<a class="save" id="dataFormSave" href="#">保存</a>
			<a class="back" href="getIncomingEssay.htm?page=${fn:escapeXml(param.page)}">返回</a>
		</td>
	</tr>
</table>
<div class="line"></div>
<form id="dataForm" method="post" action="addIncomingEssay2.htm">
<table border="0" cellspacing="1" cellpadding="0" class="listTable">
	<tr>
		<td class="form_title">业务流水号</td>
		<td class="form_input"><input type="text" name="ywlsh" maxlength="300" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">收文号</td>
		<td class="form_input"><input type="text" name="swbh" maxlength="300" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">收文日期</td>
		<td class="form_input"><input type="text" name="swdate" maxlength="300" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">来文单位</td>
		<td class="form_input"><input type="text" name="lwdw" maxlength="300" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">原文日期</td>
		<td class="form_input"><input type="text" name="originaldate" maxlength="300" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">来文号</td>
		<td class="form_input"><input type="text" name="lwbh" maxlength="300" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">标题</td>
		<td class="form_input"><input type="text" name="title" maxlength="300" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">办复时限</td>
		<td class="form_input"><input type="text" name="bftime" maxlength="300" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">拟办意见</td>
		<td class="form_input"><input type="text" name="nbyj" maxlength="3000" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">领导批示</td>
		<td class="form_input"><input type="text" name="ldps" maxlength="3000" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">阅文情况</td>
		<td class="form_input"><input type="text" name="ywqk" maxlength="3000" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">办理情况及结果</td>
		<td class="form_input"><input type="text" name="blqkjjg" maxlength="3000" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">紧急程度</td>
		<td class="form_input"><input type="text" name="emergency" maxlength="20" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">密级</td>
		<td class="form_input"><input type="text" name="mj" maxlength="300" value="" /></td>
	</tr>
</table>
</form>
</body>
</html>
