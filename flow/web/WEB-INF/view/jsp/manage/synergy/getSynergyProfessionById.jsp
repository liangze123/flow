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
		<td class="form_title">业务流水号 </td>
		<td class="form_input">${fn:escapeXml(po.ywlsh)}</td>
	</tr>
	<tr>
		<td class="form_title">流程实例id  </td>
		<td class="form_input">${fn:escapeXml(po.flowPiId)}</td>
	</tr>
	<tr>
		<td class="form_title">流程标识</td>
		<td class="form_input">${fn:escapeXml(po.alias)}</td>
	</tr>
	<tr>
		<td class="form_title">业务分类标识</td>
		<td class="form_input">${fn:escapeXml(po.differserv)}</td>
	</tr>
	<tr>
		<td class="form_title">业务摘要信息</td>
		<td class="form_input">${fn:escapeXml(po.memo)}</td>
	</tr>
	<tr>
		<td class="form_title">业务发起人 </td>
		<td class="form_input">${fn:escapeXml(po.initiator)}</td>
	</tr>
	<tr>
		<td class="form_title">发起时间	       </td>
		<td class="form_input">${fn:escapeXml(po.starttime)}</td>
	</tr>
</table>
</body>
</html>
