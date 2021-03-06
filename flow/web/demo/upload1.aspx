﻿<%@Page Language="C#"%>
<%@Import Namespace="Dswork.Webio" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>文件上传</title>
<script type="text/javascript" src="/web/js/jquery/jquery.js"></script>
<script type="text/javascript" src="/web/js/dswork/dswork.js"></script>
<script type="text/javascript" src="/web/js/jskey/jskey_core.js"></script>
<script type="text/javascript" src="/web/js/jskey/jskey_upload.js"></script>
<script type="text/javascript">
$dswork.dotnet = true;
var o = new $dswork.upload({sessionKey:<%=WebioTempUtil.GetSessionKey(Request)%>, fileKey:<%=DateTime.Now.Ticks %>, ext:"file"});
window.onload = function(){
	o.init({id:"fjFile", vid:"fjFileNames", ext:"image", 
		// 这是自定义回调函数
		success:function(p){
			alert($("#" + p.id).val());
			alert($("#" + p.vid).val());
		}
	});//, uploadone:"false"
};
</script>
</head>
<body>
<center>
<form id="dateForm" action="upload2.aspx" method="post">
<%--key--%>
<span><input id="fjFile" name="fjFile" type="hidden" value="" dataType="UploadFile" /></span>
<input id="fjFileNames" name="fjFileNames" type="hidden" value="" /><%--newname:oldname|newname:oldname--%>
<br /><br />
<input type="submit" class="button" id="_submit_" value="提交" />
</form>
</center>
</body>
</html>
