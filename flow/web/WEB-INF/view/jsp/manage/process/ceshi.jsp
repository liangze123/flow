<%@page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<%@include file="/commons/include/get.jsp"%>
<script src="${pageContext.request.contextPath}/js/calendar-lunar.js"></script>

</head>
<body>
	</form>
	<form>
		<table border="0" cellspacing="1" cellpadding="0" class="listTable"
			id="contactTable">
			<tr>
			 <td>111</td>
			 <td>222</td>
			</tr>
			<tr>
				<td>111</td>
				<td width="8%" id="term">
				<script type="text/javascript">
					var v = calendar.getTerm(2017,6).toString();
					$("#term").html(v);
				</script>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
