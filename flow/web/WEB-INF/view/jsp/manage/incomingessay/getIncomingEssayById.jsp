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
		<td class="form_title">业务流水号</td>
		<td class="form_input">${fn:escapeXml(po.ywlsh)}</td>
	</tr>
	<tr>
		<td class="form_title">收文号</td>
		<td class="form_input">${fn:escapeXml(po.swbh)}</td>
	</tr>
	<tr>
		<td class="form_title">收文日期</td>
		<td class="form_input">${fn:escapeXml(po.swdate)}</td>
	</tr>
	<tr>
		<td class="form_title">来文单位</td>
		<td class="form_input">${fn:escapeXml(po.lwdw)}</td>
	</tr>
	<tr>
		<td class="form_title">原文日期</td>
		<td class="form_input">${fn:escapeXml(po.originaldate)}</td>
	</tr>
	<tr>
		<td class="form_title">来文号</td>
		<td class="form_input">${fn:escapeXml(po.lwbh)}</td>
	</tr>
	<tr>
		<td class="form_title">标题</td>
		<td class="form_input">${fn:escapeXml(po.title)}</td>
	</tr>
	<tr>
		<td class="form_title">办复时限</td>
		<td class="form_input">${fn:escapeXml(po.bftime)}</td>
	</tr>
	<tr>
		<td class="form_title">拟办意见</td>
		<td class="form_input">${fn:escapeXml(po.nbyj)}</td>
	</tr>
	<tr>
		<td class="form_title">领导批示</td>
		<td class="form_input">${fn:escapeXml(po.ldps)}</td>
	</tr>
	<tr>
		<td class="form_title">阅文情况</td>
		<td class="form_input">${fn:escapeXml(po.ywqk)}</td>
	</tr>
	<tr>
		<td class="form_title">办理情况及结果</td>
		<td class="form_input">${fn:escapeXml(po.blqkjjg)}</td>
	</tr>
	<tr>
		<td class="form_title">紧急程度</td>
		<td class="form_input">${fn:escapeXml(po.emergency)}</td>
	</tr>
	<tr>
		<td class="form_title">密级</td>
		<td class="form_input">${fn:escapeXml(po.mj)}</td>
	</tr>
</table>
</body>
</html>
