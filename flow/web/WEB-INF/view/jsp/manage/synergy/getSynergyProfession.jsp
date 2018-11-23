<%@page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<%@include file="/commons/include/get.jsp"%>
<script type="text/javascript">
$(function(){
	$dswork.page.menu("delSynergyProfession.htm", "updSynergyProfession1.htm", "getSynergyProfessionById.htm", "${pageModel.currentPage}");
});
$dswork.doAjax = true;
$dswork.callback = function(){if($dswork.result.type == 1){
	location.href = "getSynergyProfession.htm?page=${pageModel.currentPage}";
}};
</script>
</head> 
<body>
<table border="0" cellspacing="0" cellpadding="0" class="listLogo">
	<tr>
		<td class="title">列表</td>
		<td class="menuTool">
			<a class="insert" href="addSynergyProfession1.htm?page=${pageModel.currentPage}">添加</a>
			<a class="delete" id="listFormDelAll" href="#">删除所选</a>
		</td>
	</tr>
</table>
<div class="line"></div>
<form id="queryForm" method="post" action="getSynergyProfession.htm">
<table border="0" cellspacing="0" cellpadding="0" class="queryTable">
	<tr>
		<td class="input">
			&nbsp;主键id：<input type="text" class="text" name="id" value="${fn:escapeXml(param.id)}" />
			&nbsp;业务流水号 ：<input type="text" class="text" name="ywlsh" value="${fn:escapeXml(param.ywlsh)}" />
			&nbsp;流程实例id  ：<input type="text" class="text" name="flowPiId" value="${fn:escapeXml(param.flowPiId)}" />
			&nbsp;流程标识：<input type="text" class="text" name="alias" value="${fn:escapeXml(param.alias)}" />
			&nbsp;业务分类标识：<input type="text" class="text" name="differserv" value="${fn:escapeXml(param.differserv)}" />
			&nbsp;业务摘要信息：<input type="text" class="text" name="memo" value="${fn:escapeXml(param.memo)}" />
			&nbsp;业务发起人 ：<input type="text" class="text" name="initiator" value="${fn:escapeXml(param.initiator)}" />
			&nbsp;发起时间	       ：<input type="text" class="text" name="starttime" value="${fn:escapeXml(param.starttime)}" />
		</td>
		<td class="query"><input id="_querySubmit_" type="button" class="button" value="查询" /></td>
	</tr>
</table>
</form>
<div class="line"></div>
<form id="listForm" method="post" action="delSynergyProfession.htm">
<table id="dataTable" border="0" cellspacing="1" cellpadding="0" class="listTable">
	<tr class="list_title">
		<td style="width:2%"><input id="chkall" type="checkbox" /></td>
		<td style="width:5%">操作</td>
		<td>主键id</td>
		<td>业务流水号 </td>
		<td>流程实例id  </td>
		<td>流程标识</td>
		<td>业务分类标识</td>
		<td>业务摘要信息</td>
		<td>业务发起人 </td>
		<td>发起时间	       </td>
	</tr>
<c:forEach items="${pageModel.result}" var="d">
	<tr>
		<td><input name="keyIndex" type="checkbox" value="${d.id}" /></td>
		<td class="menuTool" keyIndex="${d.id}">&nbsp;</td>
		<td>${fn:escapeXml(d.id)}</td>
		<td>${fn:escapeXml(d.ywlsh)}</td>
		<td>${fn:escapeXml(d.flowPiId)}</td>
		<td>${fn:escapeXml(d.alias)}</td>
		<td>${fn:escapeXml(d.differserv)}</td>
		<td>${fn:escapeXml(d.memo)}</td>
		<td>${fn:escapeXml(d.initiator)}</td>
		<td>${fn:escapeXml(d.starttime)}</td>
	</tr>
</c:forEach>
</table>
<input name="page" type="hidden" value="${pageModel.currentPage}" />
</form>
<table border="0" cellspacing="0" cellpadding="0" class="bottomTable">
	<tr><td>${pageNav.page}</td></tr>
</table>
</body>
</html>
