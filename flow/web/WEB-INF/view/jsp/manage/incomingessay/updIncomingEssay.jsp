<%@page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<%@include file="/commons/include/updAjax.jsp"%>
<script type="text/javascript">
$dswork.callback = function(){if($dswork.result.type == 1){
	location.href = "getIncomingEssay.htm?page=${page}";
}};
</script>
</head>
<body>
<table border="0" cellspacing="0" cellpadding="0" class="listLogo">
	<tr>
		<td class="title">修改</td>
		<td class="menuTool">
			<a class="save" id="dataFormSave" href="#">保存</a>
			<a class="back" href="getIncomingEssay.htm?page=${page}">返回</a>
		</td>
	</tr>
</table>
<div class="line"></div>
<form id="dataForm" method="post" action="updIncomingEssay2.htm">
<table border="0" cellspacing="1" cellpadding="0" class="listTable">
	<tr>
		<td class="form_title">业务流水号</td>
		<td class="form_input"><input type="text" name="ywlsh" maxlength="300" value="${fn:escapeXml(po.ywlsh)}" /></td>
	</tr>
	<tr>
		<td class="form_title">收文号</td>
		<td class="form_input"><input type="text" name="swbh" maxlength="300" value="${fn:escapeXml(po.swbh)}" /></td>
	</tr>
	<tr>
		<td class="form_title">收文日期</td>
		<td class="form_input"><input type="text" name="swdate" maxlength="300" value="${fn:escapeXml(po.swdate)}" /></td>
	</tr>
	<tr>
		<td class="form_title">来文单位</td>
		<td class="form_input"><input type="text" name="lwdw" maxlength="300" value="${fn:escapeXml(po.lwdw)}" /></td>
	</tr>
	<tr>
		<td class="form_title">原文日期</td>
		<td class="form_input"><input type="text" name="originaldate" maxlength="300" value="${fn:escapeXml(po.originaldate)}" /></td>
	</tr>
	<tr>
		<td class="form_title">来文号</td>
		<td class="form_input"><input type="text" name="lwbh" maxlength="300" value="${fn:escapeXml(po.lwbh)}" /></td>
	</tr>
	<tr>
		<td class="form_title">标题</td>
		<td class="form_input"><input type="text" name="title" maxlength="300" value="${fn:escapeXml(po.title)}" /></td>
	</tr>
	<tr>
		<td class="form_title">办复时限</td>
		<td class="form_input"><input type="text" name="bftime" maxlength="300" value="${fn:escapeXml(po.bftime)}" /></td>
	</tr>
	<tr>
		<td class="form_title">拟办意见</td>
		<td class="form_input"><input type="text" name="nbyj" maxlength="3000" value="${fn:escapeXml(po.nbyj)}" /></td>
	</tr>
	<tr>
		<td class="form_title">领导批示</td>
		<td class="form_input"><input type="text" name="ldps" maxlength="3000" value="${fn:escapeXml(po.ldps)}" /></td>
	</tr>
	<tr>
		<td class="form_title">阅文情况</td>
		<td class="form_input"><input type="text" name="ywqk" maxlength="3000" value="${fn:escapeXml(po.ywqk)}" /></td>
	</tr>
	<tr>
		<td class="form_title">办理情况及结果</td>
		<td class="form_input"><input type="text" name="blqkjjg" maxlength="3000" value="${fn:escapeXml(po.blqkjjg)}" /></td>
	</tr>
	<tr>
		<td class="form_title">紧急程度</td>
		<td class="form_input"><input type="text" name="emergency" maxlength="20" value="${fn:escapeXml(po.emergency)}" /></td>
	</tr>
	<tr>
		<td class="form_title">密级</td>
		<td class="form_input"><input type="text" name="mj" maxlength="300" value="${fn:escapeXml(po.mj)}" /></td>
	</tr>
</table>
<input type="hidden" name="id" value="${po.id}" />
</form>
</body>
</html>
