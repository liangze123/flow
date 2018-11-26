<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="dswork.common.DsFactory"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<%@include file="/commons/include/get.jsp"%>
</head>
<body>
<table border="0" cellspacing="0" cellpadding="0" class="listLogo">
	<tr>
		<td class="title">流程测试</td>
		<td class="menuTool">
			<a class="back" href="waiting.jsp">返回待办任务</a>
		</td>
	</tr>
</table>
<% String a = request.getParameter("alias");
Object o=request.getParameterMap();
%>
<%
String user = common.auth.AuthUtil.getLoginUser(request).getAccount();
String name = common.auth.AuthUtil.getLoginUser(request).getName();
//String user =request.getSession().getValue("Account").toString();
%>
<% 
String piid = DsFactory.getFlow().start(request.getParameter("alias") , "1000","0", user, name, 0, true);
%>
<%=piid.equals("")?a:piid%>
<br />
</body>
</html>