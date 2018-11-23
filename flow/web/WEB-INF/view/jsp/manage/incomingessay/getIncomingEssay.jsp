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
	$dswork.page.menu("delIncomingEssay.htm", "updIncomingEssay1.htm", "getIncomingEssayById.htm", "${pageModel.currentPage}");
});
$dswork.doAjax = true;
$dswork.callback = function(){if($dswork.result.type == 1){
	location.href = "getIncomingEssay.htm?page=${pageModel.currentPage}";
}};
</script>
</head> 
<body>
<table border="0" cellspacing="0" cellpadding="0" class="listLogo">
	<tr>
		<td class="title">列表</td>
		<td class="menuTool">
			<a class="insert" href="addIncomingEssay1.htm?page=${pageModel.currentPage}">添加</a>
			<a class="delete" id="listFormDelAll" href="#">删除所选</a>
		</td>
	</tr>
</table>
<div class="line"></div>
<form id="queryForm" method="post" action="getIncomingEssay.htm">
<table border="0" cellspacing="0" cellpadding="0" class="queryTable">
	<tr>
		<td class="input">
			&nbsp;业务流水号：<input type="text" class="text" name="ywlsh" value="${fn:escapeXml(param.ywlsh)}" />
			&nbsp;收文号：<input type="text" class="text" name="swbh" value="${fn:escapeXml(param.swbh)}" />
			&nbsp;收文日期：<input type="text" class="text" name="swdate" value="${fn:escapeXml(param.swdate)}" />
			&nbsp;来文单位：<input type="text" class="text" name="lwdw" value="${fn:escapeXml(param.lwdw)}" />
			&nbsp;原文日期：<input type="text" class="text" name="originaldate" value="${fn:escapeXml(param.originaldate)}" />
			&nbsp;来文号：<input type="text" class="text" name="lwbh" value="${fn:escapeXml(param.lwbh)}" />
			&nbsp;标题：<input type="text" class="text" name="title" value="${fn:escapeXml(param.title)}" />
			&nbsp;办复时限：<input type="text" class="text" name="bftime" value="${fn:escapeXml(param.bftime)}" />
			&nbsp;拟办意见：<input type="text" class="text" name="nbyj" value="${fn:escapeXml(param.nbyj)}" />
			&nbsp;领导批示：<input type="text" class="text" name="ldps" value="${fn:escapeXml(param.ldps)}" />
			&nbsp;阅文情况：<input type="text" class="text" name="ywqk" value="${fn:escapeXml(param.ywqk)}" />
			&nbsp;办理情况及结果：<input type="text" class="text" name="blqkjjg" value="${fn:escapeXml(param.blqkjjg)}" />
			&nbsp;紧急程度：<input type="text" class="text" name="emergency" value="${fn:escapeXml(param.emergency)}" />
			&nbsp;密级：<input type="text" class="text" name="mj" value="${fn:escapeXml(param.mj)}" />
		</td>
		<td class="query"><input id="_querySubmit_" type="button" class="button" value="查询" /></td>
	</tr>
</table>
</form>
<div class="line"></div>
<form id="listForm" method="post" action="delIncomingEssay.htm">
<table id="dataTable" border="0" cellspacing="1" cellpadding="0" class="listTable">
	<tr class="list_title">
		<td style="width:2%"><input id="chkall" type="checkbox" /></td>
		<td style="width:5%">操作</td>
		<td>业务流水号</td>
		<td>收文号</td>
		<td>收文日期</td>
		<td>来文单位</td>
		<td>原文日期</td>
		<td>来文号</td>
		<td>标题</td>
		<td>办复时限</td>
		<td>拟办意见</td>
		<td>领导批示</td>
		<td>阅文情况</td>
		<td>办理情况及结果</td>
		<td>紧急程度</td>
		<td>密级</td>
	</tr>
<c:forEach items="${pageModel.result}" var="d">
	<tr>
		<td><input name="keyIndex" type="checkbox" value="${d.id}" /></td>
		<td class="menuTool" keyIndex="${d.id}">&nbsp;</td>
		<td>${fn:escapeXml(d.ywlsh)}</td>
		<td>${fn:escapeXml(d.swbh)}</td>
		<td>${fn:escapeXml(d.swdate)}</td>
		<td>${fn:escapeXml(d.lwdw)}</td>
		<td>${fn:escapeXml(d.originaldate)}</td>
		<td>${fn:escapeXml(d.lwbh)}</td>
		<td>${fn:escapeXml(d.title)}</td>
		<td>${fn:escapeXml(d.bftime)}</td>
		<td>${fn:escapeXml(d.nbyj)}</td>
		<td>${fn:escapeXml(d.ldps)}</td>
		<td>${fn:escapeXml(d.ywqk)}</td>
		<td>${fn:escapeXml(d.blqkjjg)}</td>
		<td>${fn:escapeXml(d.emergency)}</td>
		<td>${fn:escapeXml(d.mj)}</td>
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
