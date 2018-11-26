<%@page language="java" pageEncoding="UTF-8"%><%String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>广州市旅游局全域旅游政务业务协同系统</title>
<style type="text/css">
*{word-wrap:break-word;}
html,body,div{margin:0;padding:0;}
html,body{*position:static;height:100%;border:0;line-height:1.6;}
html{font-family:sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;}
body,a{font-family:"Microsoft Yahei","Hiragino Sans GB","Helvetica Neue",Helvetica,tahoma,arial,Verdana,sans-serif,"\5B8B\4F53";font-size:12px;color:#182a2d;-webkit-font-smoothing:antialiased;-moz-font-smoothing:antialiased;}
html{overflow:-moz-scrollbars-vertical;}
a{outline:none;text-decoration:none;cursor:pointer;text-decoration:none;}
a:link,a:visited,a:active{color:#182a2d;outline:none;}
a:hover{outline:none;color:#182a2d;text-decoration:none;}
a:focus{outline:none;}
a:hover,a:active{outline:none;}:focus{outline:none;}

label,a,a:link,a:visited,a:active{display:inline-block;font-size:14px;padding:3px 8px;line-height:1.4;}
label{border:solid 1px #bce8f1;color:#31708f;background-color:#d9edf7;}
a,a:link,a:visited,a:active{border:solid 1px #0f9ae0;color:#fff;background-color:#3bb4f2;}
a:hover {background-color:#0f9ae0;}
.level1 {margin:8px 0 0 8px;}
.level2 {margin:2px 0 0 38px;}
.level3 {margin:2px 0 0 68px;}
</style>
<script type="text/javascript">
var treedata = [
{id:11,name:'我的桌面', img:"", imgOpen:"", url:'', items:[]}
,{id:11,name:'公文管理', img:"", imgOpen:"", url:'', items:[
	{id:111,name:'公文类', img:"", imgOpen:"", url:'/manage/flow/getFlowCategoryTree.htm', items:[]}
	,{id:111,name:'行政类', img:"", imgOpen:"", url:'/manage/flow/getFlowCategoryTree1.htm', items:[]}
	,{id:111,name:'人事类', img:"", imgOpen:"", url:'/manage/flow/getFlowCategoryTree1.htm', items:[]}
]}
,{id:11,name:'个人中心', img:"", imgOpen:"", url:'', items:[
	{id:111,name:'通讯录', img:"", imgOpen:"", url:'/flow/waiting.htm', items:[]}
	,{id:111,name:'个人信息', img:"", imgOpen:"", url:'/flow/waiting.jsp', items:[
		{id:111,name:'我的信息', img:"", imgOpen:"", url:'/flow/waiting.jsp', items:[]}
		,{id:111,name:'我的考勤', img:"", imgOpen:"", url:'/flow/waiting.jsp', items:[]}
		,{id:111,name:'我的证照', img:"", imgOpen:"", url:'/flow/waiting.jsp', items:[]}
	]}
]}
,{id:11,name:'系统设置', img:"", imgOpen:"", url:'', items:[
	{id:111,name:'用户管理', img:"", imgOpen:"", url:'/flow/waiting.jsp', items:[]}
	,{id:200005,name:'流程管理', img:"", imgOpen:"", url:'/../DsCommon/ds/common/flow/getFlowCategoryTree.htm', items:[]}
	,{id:111,name:'权限管理', img:"", imgOpen:"", url:'/flow/waiting.jsp', items:[]}
	,{id:111,name:'日志查看', img:"", imgOpen:"", url:'/flow/waiting.jsp', items:[]}
	,{id:111,name:'单位信息管理', img:"", imgOpen:"", url:'/office/editFile1.jsp', items:[]}
	,{id:111,name:'常用名称管理', img:"", imgOpen:"", url:'/office/editFile2.jsp', items:[]}
	,{id:111,name:'常用名称管理1', img:"", imgOpen:"", url:'/office/webOffice.jsp', items:[]}
	,{id:111,name:'测试1', img:"", imgOpen:"", url:'/office/oword.jsp', items:[]}
]}
,{id:11,name:'流程示例', img:"", imgOpen:"", url:'', items:[
	{id:111,name:'流程测试', img:"", imgOpen:"", url:'/demo/up1.jsp', items:[]}
]}
,{id:11,name:'流程示例1', img:"", imgOpen:"", url:'', items:[
	{id:111,name:'流程测试1', img:"", imgOpen:"", url:'/manage/process/getFProcessPi.htm', items:[]}
	,{id:111,name:'流程测试2', img:"", imgOpen:"", url:'/manage/process/ceShi.htm', items:[]}
]}
,{id:11,name:'流程示例2', img:"", imgOpen:"", url:'', items:[
	{id:111,name:'流程测试3', img:"", imgOpen:"", url:'/manage/synergy/getSynergyProfession.htm', items:[]}
	,{id:111,name:'流程测试4', img:"", imgOpen:"", url:'/manage/incomingessay/getIncomingEssay.htm', items:[]}
	,{id:111,name:'流程测试4', img:"", imgOpen:"", url:'/manage/incomingessay/getIncomingEssay.htm', items:[]}
]}
,{id:113,name:'退出', img:"", imgOpen:"", url:'/manage/frame/logout.jsp', items:[]}
];
</script>
</head>
<body>
<div style="overflow:hidden;height:100%;width:100%;">
<div style="overflow:hidden;float:right;height:100%;width:80%;">
	<iframe id="main" name="main" style="height:100%;width:100%;" scrolling="auto" frameborder="0" src="about:blank"></iframe>
</div>
<div style="overflow:auto;float:left;height:100%;width:19.8%;border-right:1px solid #6ea5eb;">
<script type="text/javascript">
for(var i = 0; i < treedata.length; i++){
	var item = treedata[i];
	if(item.url == "" || item.url == "#"){
		document.write("<label class='level1'>" + item.name + "</label><br />");
	}
	else{
		document.write("<a class='level1' target='main' href='<%=path%>" + item.url + "'>" + item.name + "</a><br />");
	}
	for(var j = 0; j < item.items.length; j++){
		var m = item.items[j];
		if(m.url == "" || m.url == "#"){
			document.write("<label class='level2'>" + m.name + "</label><br />");
		}
		else{
			document.write("<a class='level2' target='main' href='<%=path%>" + m.url + "'>" + m.name + "</a><br />");
		}
		for(var k = 0; k < m.items.length; k++){
			var mm = m.items[k];
			document.write("<a class='level3' target='main' href='<%=path%>" + mm.url + "'>" + mm.name + "</a><br />");
		}
	}
}
</script>
<br /><br />
</div>
</div>
</body>
</html>