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
	location.href = "getFProcessPi.htm?page=${page}";
}};
</script>
</head>
<body>
<table border="0" cellspacing="0" cellpadding="0" class="listLogo">
	<tr>
		<td class="title">修改</td>
		<td class="menuTool">
			<a class="save" id="dataFormSave" href="#">保存</a>
			<a class="back" href="getFProcessPi.htm?page=${page}">返回</a>
		</td>
	</tr>
</table>
<div class="line"></div>
<form id="dataForm" method="post" action="updFProcessPi2.htm">
<table border="0" cellspacing="1" cellpadding="0" class="listTable">
	<tr>
		<td class="form_title">主键id</td>
		<td class="form_input"><input type="text" name="id" maxlength="19" value="${fn:escapeXml(po.id)}" /></td>
	</tr>
	<tr>
		<td class="form_title">业务流水号</td>
		<td class="form_input"><input type="text" name="ywlsh" maxlength="300" value="${fn:escapeXml(po.ywlsh)}" /></td>
	</tr>
	<tr>
		<td class="form_title">自定义内容</td>
		<td class="form_input"><input type="text" name="content" maxlength="4000" value="${fn:escapeXml(po.content)}" /></td>
	</tr>
	<tr>
		<td class="form_title">操作人</td>
		<td class="form_input"><input type="text" name="operator" maxlength="300" value="${fn:escapeXml(po.operator)}" /></td>
	</tr>
	<tr>
		<td class="form_title">操作时间</td>
		<td class="form_input"><input type="text" name="operatortime" maxlength="300" value="${fn:escapeXml(po.operatortime)}" /></td>
	</tr>
	<tr>
		<td class="form_title">修改人</td>
		<td class="form_input"><input type="text" name="modifier" maxlength="300" value="${fn:escapeXml(po.modifier)}" /></td>
	</tr>
	<tr>
		<td class="form_title">修改时间</td>
		<td class="form_input"><input type="text" name="changetime" maxlength="300" value="${fn:escapeXml(po.changetime)}" /></td>
	</tr>
	<tr>
		<td class="form_title">业务摘要信息</td>
		<td class="form_input"><input type="text" name="digest" maxlength="300" value="${fn:escapeXml(po.digest)}" /></td>
	</tr>
	<tr>
		<td class="form_title">文档内容</td>
		<td class="form_input"><textarea name="doccontent" style="width:400px;height:60px;">${fn:escapeXml(po.doccontent)}</textarea></td>
	</tr>
</table>
</form>
</body>
</html>
