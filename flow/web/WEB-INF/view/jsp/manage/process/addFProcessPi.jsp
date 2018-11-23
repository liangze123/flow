<%@page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<script type="text/javascript" src="/web/js/jquery/jquery.js"></script>
<script type="text/javascript" src="/web/js/dswork/dswork.js"></script>
<script type="text/javascript" src="/web/js/jskey/jskey_core.js"></script>
<script type="text/javascript" src="/web/js/jskey/jskey_upload.js"></script>
<script type="text/javascript">
var o = new $dswork.upload({io:true, name:"MYAPP", ext:""});
window.onload = function()
{
	o.init({id:"fjFile", vid:"doccontent", ext:"doc", });
};
</script>
<%@include file="/commons/include/addAjax.jsp"%>
<script type="text/javascript">
$dswork.callback = function(){if($dswork.result.type == 1){
	location.href = "getFProcessPi.htm";
}};
</script>
</head>
<body>
<table border="0" cellspacing="0" cellpadding="0" class="listLogo">
	<tr>
		<td class="title">添加</td>
		<td class="menuTool">
			<a class="save" id="dataFormSave" href="#">保存</a>
			<a class="back" href="getFProcessPi.htm?page=${fn:escapeXml(param.page)}">返回</a>
		</td>
	</tr>
</table>
<div class="line"></div>
<form id="dataForm" method="post" action="addFProcessPi2.htm">
<table border="0" cellspacing="1" cellpadding="0" class="listTable">
	<tr>
		<td class="form_title">主键id</td>
		<td class="form_input"><input type="text" name="id" maxlength="19" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">业务流水号</td>
		<td class="form_input"><input type="text" name="ywlsh" maxlength="300" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">自定义内容</td>
		<td class="form_input"><input type="text" name="content" maxlength="4000" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">操作人</td>
		<td class="form_input"><input type="text" name="operator" maxlength="300" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">操作时间</td>
		<td class="form_input"><input type="text" name="operatortime" maxlength="300" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">修改人</td>
		<td class="form_input"><input type="text" name="modifier" maxlength="300" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">修改时间</td>
		<td class="form_input"><input type="text" name="changetime" maxlength="300" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">业务摘要信息</td>
		<td class="form_input"><input type="text" name="digest" maxlength="300" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">文档内容</td>
		<td class="form_input"><span><input id="fjFile" name="fjFile" type="hidden" value="" datatype="UploadFile" /></span>
	<input id="doccontent" name="doccontent" type="hidden" value="" />
	</tr>
</table>
</form>
</body>
</html>
