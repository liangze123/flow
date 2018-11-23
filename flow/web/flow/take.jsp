<%@page language="java" pageEncoding="UTF-8" import="dswork.common.DsFactory, dswork.web.MyRequest"%><%
MyRequest req = new MyRequest(request);
long waitid = req.getLong("wid");
if(waitid > 0)
{
	String user = common.auth.AuthUtil.getLoginUser(request).getAccount();
	String name = common.auth.AuthUtil.getLoginUser(request).getName();
	DsFactory.getFlow().takeWaiting(waitid, user);
	response.sendRedirect("waiting.jsp");
}
%>