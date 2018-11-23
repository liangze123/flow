<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="dswork.common.DsFactory, dswork.web.MyRequest, dswork.common.model.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
</script>
<title></title>
<%@include file="/commons/include/upd.jsp"%>
<style type="text/css">
body {line-height:2em;}
</style>
</head>
<body>
<table border="0" cellspacing="0" cellpadding="0" class="listLogo">
	<tr>
		<td class="title">任务处理</td>
		<td class="menuTool">
			<a class="save" id="dataFormSave" href="#">保存</a>
			<a class="back" href="waiting.jsp">返回待办列表</a>
		</td>
	</tr>
</table>
<form id="dataForm" method="post" action="doAction.jsp">
<%
String msg = "";
MyRequest req = new MyRequest(request);
long wid = req.getLong("wid");
try
{
  if(wid > 0){
	IFlowWaiting po = DsFactory.getFlow().getWaiting(wid);
	request.setAttribute("po", po);
	java.util.Map<String, String> map = DsFactory.getFlow().getTaskList(po.getFlowid());
	String datatable = po.getDatatable().replaceAll("\\\\", "");;
	List<IFlowDataRow> dt = new com.google.gson.GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().fromJson(datatable, List.class);
	request.setAttribute("dt", dt);
	/* Map<String, String> dtMap = new com.google.gson.GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().fromJson(datatable, Map.class);
	String rwxJson = dtMap.get(po.getTalias());
	if(!"".equals(rwxJson))
	{
		List<IFlowDataRow> dt = new com.google.gson.GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().fromJson(rwxJson, List.class);
		request.setAttribute("dt", dt);
	} */
%>
<table  border="1">
	<tr>
		<td>流程名称：</td>
		<td>${po.flowname}</td>
	</tr>
	<tr>
		<td>当前任务：</td>
		<td>${po.talias}&nbsp;${po.tname}</td>
	</tr>
    <tr>
		<td>下级任务：</td>
		<td>
		<%
			String[] arr = po.getTnext().split("\\|", -1);
			for(String s : arr)
			{
				%><select name="taskList"><%
				for(String m : s.split(",", -1)){%><option value="<%=m%>"><%=map.get(m)%></option><%}
				%></select>&nbsp;<%
			}
		%>
		</td>
	</tr>
	<tr>
		<td>已选人员</td>
		<td id="map1",name="map1">
			
		</td>
		<td>发送给：</td>
		<td>
			<input type="button" value="人员选择"  onclick="$jskey.dialog.showDialog({width:'500', height:'500',title:'我的标题', url:'/flow/flow/orglist.jsp'});" />
			
		</td>
	</tr>
	<tr>
		<td>状态：</td>
		<td><label><input type="radio"  name="resultType" value="1" checked="checked" />拟同意</label>
		&nbsp;<label><input type="radio"  name="resultType" value="0" />拟拒绝</label>
		&nbsp;<label><input type="radio"  name="resultType" value="-1" />拟作废</label>
		</td>
	</tr>
	<tr>
		<td>意见：</td>
		<td><textarea name="resultMsg" style="width:400px;">无</textarea><br /></td>
	</tr>
	<%-- 数据结构：${po.datatable} --%>
<input type="hidden" name="wid" value="<%=wid%>" />
<input type="hidden" id="datatable" name="datatable" value="" />
</table>
</form>

<form id="formdata" method="post" action="">
<table border="1">
	<tr>
		<td style="width:100px">
			事项摘要
		</td>
			
		<td>
			<input name="MEMO" datatype="varchar" />
		</td>
	</div>
<c:forEach items="${dt}" var="dt">
	<%-- <c:if test="${dt.rwx!='001'}"> --%>
	<%-- ${fn:escapeXml(dt.talias)}：<input name="${fn:escapeXml(dt.tname)}" datatype="${fn:escapeXml(dt.datatype)}" ${fn:escapeXml(dt.rwx=='400'?'readonly':'')} /><br /> --%>
	<%-- </c:if> --%>
	<tr>
	<div ${fn:escapeXml(dt.rwx=='001'?'style=display:none;':'')}>
	<td style="width:100px"
	>${fn:escapeXml(dt.talias)}：</td><td><input name="${fn:escapeXml(dt.tname)}" datatype="${fn:escapeXml(dt.datatype)}" ${fn:escapeXml(dt.rwx=='400'?'readonly':'')} value="${fn:escapeXml(dt.value)}"/></td>
	</div>
	</tr>
</c:forEach>
<!-- <input type="button" onclick="getFormData()" value="获取表单数据" /> -->
</table>
</form>
<script type="text/javascript">
var map = new $jskey.Map();
var array = [];
function getFormData(){
	array = [];
	var d = {};
	var formdata = $("#formdata").serializeArray();
	$.each(formdata, function(){
		var m = map.get(this.name);
		if(m.rwx == "420"){
			m.value = this.value.replace(/\"/g,"&quot;");
		}
		map.put(this.name, m);
		array.push(m);
	});
	$("#datatable").val(JSON.stringify(array));
}
function init(){
<c:forEach items="${dt}" var="d">
	var row = {};
	row.datatype = "${d.datatype}";
	row.tname = "${d.tname}";
	row.talias = "${d.talias}";
	row.rwx = "${d.rwx}";
	row.value = "";
	map.put(row.tname, row);
</c:forEach>
}
$(function(){
	init();
})
$dswork.readySubmit = function(){
	getFormData();
}
</script>

<%
  }else{msg = "处理失败";}
}catch(Exception ex){
	ex.printStackTrace();
	msg = "处理失败";
}%>
<%=msg%>
<br />
</body>
</html>