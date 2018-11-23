<%@page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<%@include file="/commons/include/getById.jsp"%>
</head>
<body>
<table border="0" cellspacing="0" cellpadding="0" class="listLogo">
	<tr>
		<td class="title">明细</td>
		<td class="menuTool">
			<a class="back" onclick="window.history.back();return false;" href="#">返回</a>
		</td>
	</tr>
</table>
<div class="line"></div>
<table border="0" cellspacing="1" cellpadding="0" class="listTable">
	<tr>
		<td class="form_title">主键id</td>
		<td class="form_input">${fn:escapeXml(po.id)}</td>
	</tr>
	<tr>
		<td class="form_title">业务流水号</td>
		<td class="form_input">${fn:escapeXml(po.ywlsh)}</td>
	</tr>
	<tr>
		<td class="form_title">自定义内容</td>
		<td class="form_input">${fn:escapeXml(po.content)}</td>
	</tr>
	<tr>
		<td class="form_title">操作人</td>
		<td class="form_input">${fn:escapeXml(po.operator)}</td>
	</tr>
	<tr>
		<td class="form_title">操作时间</td>
		<td class="form_input">${fn:escapeXml(po.operatortime)}</td>
	</tr>
	<tr>
		<td class="form_title">修改人</td>
		<td class="form_input">${fn:escapeXml(po.modifier)}</td>
	</tr>
	<tr>
		<td class="form_title">修改时间</td>
		<td class="form_input">${fn:escapeXml(po.changetime)}</td>
	</tr>
	<tr>
		<td class="form_title">业务摘要信息</td>
		<td class="form_input">${fn:escapeXml(po.digest)}</td>
	</tr>
	<tr>
		<td class="form_title">文档内容</td>
		<td class="form_input"><textarea class="readonlytext" style="width:400px;height:60px;">${fn:escapeXml(po.doccontent)}</textarea></td>
	</tr>
</table>
</body>
</html>
