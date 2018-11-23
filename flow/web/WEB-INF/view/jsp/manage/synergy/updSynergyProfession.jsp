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
	location.href = "getSynergyProfession.htm?page=${page}";
}};
</script>
</head>
<body>
<table border="0" cellspacing="0" cellpadding="0" class="listLogo">
	<tr>
		<td class="title">修改</td>
		<td class="menuTool">
			<a class="save" id="dataFormSave" href="#">保存</a>
			<a class="back" href="getSynergyProfession.htm?page=${page}">返回</a>
		</td>
	</tr>
</table>
<div class="line"></div>
<form id="dataForm" method="post" action="updSynergyProfession2.htm">
<table border="0" cellspacing="1" cellpadding="0" class="listTable">
	<tr>
		<td class="form_title">主键id</td>
		<td class="form_input"><input type="text" name="id" maxlength="19" value="${fn:escapeXml(po.id)}" /></td>
	</tr>
	<tr>
		<td class="form_title">业务流水号 </td>
		<td class="form_input"><input type="text" name="ywlsh" maxlength="300" value="${fn:escapeXml(po.ywlsh)}" /></td>
	</tr>
	<tr>
		<td class="form_title">流程实例id  </td>
		<td class="form_input"><input type="text" name="flowPiId" maxlength="19" value="${fn:escapeXml(po.flowPiId)}" /></td>
	</tr>
	<tr>
		<td class="form_title">流程标识</td>
		<td class="form_input"><input type="text" name="alias" maxlength="300" value="${fn:escapeXml(po.alias)}" /></td>
	</tr>
	<tr>
		<td class="form_title">业务分类标识</td>
		<td class="form_input"><input type="text" name="differserv" maxlength="300" value="${fn:escapeXml(po.differserv)}" /></td>
	</tr>
	<tr>
		<td class="form_title">业务摘要信息</td>
		<td class="form_input"><input type="text" name="memo" maxlength="300" value="${fn:escapeXml(po.memo)}" /></td>
	</tr>
	<tr>
		<td class="form_title">业务发起人 </td>
		<td class="form_input"><input type="text" name="initiator" maxlength="300" value="${fn:escapeXml(po.initiator)}" /></td>
	</tr>
	<tr>
		<td class="form_title">发起时间	       </td>
		<td class="form_input"><input type="text" name="starttime" maxlength="300" value="${fn:escapeXml(po.starttime)}" /></td>
	</tr>
</table>
</form>
</body>
</html>
