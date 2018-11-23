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
	$dswork.page.menu("delFProcessPi.htm", "updFProcessPi1.htm", "getFProcessPiById.htm", "download.htm","${pageModel.currentPage}");
});
$dswork.doAjax = true;
$dswork.callback = function(){if($dswork.result.type == 1){
	location.href = "getFProcessPi.htm?page=${pageModel.currentPage}";
}};
</script>
<script>
$dswork.page.join = function(td, menu, id){
	$(menu).append($('<div iconCls="menuTool-download">下载文件</div>').bind("click", function(){
		location.href = "download.htm?page=${pageModel.currentPage}&keyIndex=" + id;
	}));

};
</script>
</head> 
<body>
<table border="0" cellspacing="0" cellpadding="0" class="listLogo">
	<tr>
		<td class="title">列表</td>
		<td class="menuTool">
			<a class="insert" href="addFProcessPi1.htm?page=${pageModel.currentPage}">添加</a>
			<a class="delete" id="listFormDelAll" href="#">删除所选</a>
		</td>
	</tr>
</table>
<div class="line"></div>
<form id="queryForm" method="post" action="getFProcessPi.htm">
<table border="0" cellspacing="0" cellpadding="0" class="queryTable">
	<tr>
		<td class="input">
<%-- 			&nbsp;主键id：<input type="text" class="text" name="id" value="${fn:escapeXml(param.id)}" /> --%>
			&nbsp;业务流水号：<input type="text" class="text" name="ywlsh" value="${fn:escapeXml(param.ywlsh)}" />
<%-- 			&nbsp;自定义内容：<input type="text" class="text" name="content" value="${fn:escapeXml(param.content)}" /> --%>
<%-- 			&nbsp;操作人：<input type="text" class="text" name="operator" value="${fn:escapeXml(param.operator)}" /> --%>
<%-- 			&nbsp;操作时间：<input type="text" class="text" name="operatortime" value="${fn:escapeXml(param.operatortime)}" /> --%>
<%-- 			&nbsp;修改人：<input type="text" class="text" name="modifier" value="${fn:escapeXml(param.modifier)}" /> --%>
<%-- 			&nbsp;修改时间：<input type="text" class="text" name="changetime" value="${fn:escapeXml(param.changetime)}" /> --%>
			&nbsp;业务摘要信息：<input type="text" class="text" name="digest" value="${fn:escapeXml(param.digest)}" />
<%-- 			&nbsp;文档内容：<input type="text" class="text" name="doccontent" value="${fn:escapeXml(param.doccontent)}" /> --%>
		</td>
		<td class="query"><input id="_querySubmit_" type="button" class="button" value="查询" /></td>
	</tr>
</table>
</form>
<div class="line"></div>
<form id="listForm" method="post" action="delFProcessPi.htm">
<table id="dataTable" border="0" cellspacing="1" cellpadding="0" class="listTable">
	<tr class="list_title">
		<td style="width:2%"><input id="chkall" type="checkbox" /></td>
		<td style="width:5%">操作</td>
<!-- 		<td>主键id</td> -->
		<td>业务流水号</td>
<!-- 		<td>自定义内容</td> -->
		<td>业务摘要信息</td>
		<td>操作人</td>
		<td>操作时间</td>
		<td>修改人</td>
		<td>修改时间</td>
<!-- 		<td>文档内容</td> -->
	</tr>
<c:forEach items="${pageModel.result}" var="d">
	<tr>
		<td><input name="keyIndex" type="checkbox" value="${d.id}" /></td>
		<td class="menuTool" keyIndex="${d.id}">&nbsp;</td>
<%-- 		<td>${fn:escapeXml(d.id)}</td> --%>
		<td>${fn:escapeXml(d.ywlsh)}</td>
<%-- 		<td>${fn:escapeXml(d.content)}</td> --%>
		<td>${fn:escapeXml(d.digest)}</td>
		<td>${fn:escapeXml(d.operator)}</td>
		<td>${fn:escapeXml(d.operatortime)}</td>
		<td>${fn:escapeXml(d.modifier)}</td>
		<td>${fn:escapeXml(d.changetime)}</td>
<%-- 		<td>${fn:escapeXml(d.doccontent)}</td> --%>
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
