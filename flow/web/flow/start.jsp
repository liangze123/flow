<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="dswork.common.DsFactory,flow.util.DsCommonIFlowUtil,dswork.common.model.*, java.util.List,dswork.common.auth.*,common.auth.*" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
<%@include file="/commons/include/get.jsp"%>
</script>
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
<% 
String msg = "";
DsCommonIFlowUtil f =new DsCommonIFlowUtil();
String id = f.getFlowWaitingId(piid,"","");
%>
<%=piid.equals("")?"启动失败":piid%>


<% 
 try
 {
   long wid = Long.parseLong(id.toString());
   if(wid > 0){
 	  IFlowWaiting po = DsFactory.getFlow().getWaiting(wid);
 	    String[] taskList =po.getTnext().split("\\|", -1);//下级任务的流程标识
 		String resultType = "1";//处理类型
 		String resultMsg = "无";//处理意见
 		String formdata = "[]";
 		java.util.Map<String, String> map = DsFactory.getFlow().getTaskList(po.getFlowid());
 		if(DsFactory.getFlow().process(po.getId(), taskList, user, name, resultType, resultMsg, formdata))
 			{msg = "处理成功";
 			String id1 = f.getFlowWaitingId(piid,"","");
//  			response.sendRedirect(request.getContextPath()+"/flow/do.jsp?wid="+id1);
 				response.sendRedirect(request.getContextPath()+"/manage/synergy/addSynergyProfession1.htm?wid="+id1);
			}
		else
			{msg = "处理失败";}
	  }else{msg = "处理失败";}
}catch(Exception ex){
 	msg = "处理失败";
}
 %> 

<br />
</body>
</html>