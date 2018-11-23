<%@page import="dswork.common.DsCommonFactoryOrg"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="dswork.common.DsFactory, dswork.web.MyRequest, dswork.common.model.*, java.util.*,dswork.common.org.*"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<%@include file="/commons/include/get.jsp"%>
<%@include file="/commons/include/ztree.jsp"%>
<script type="text/javascript">
var map = new $jskey.Map();
var isload = false;
$(function(){
	$("#mytree").css("display", "none");
// 	document.getElementById("refresh").checked = false;
	$("#orgname1").click(function(){
		var _show = $("#mytree").css("display");
		if(_show == "none"){
// 			document.getElementById("orgname1").checked = true;
			if(isload){
				$("#mytree").css("display", "");
				return;
			}
			$("#mytree").html("").css("display", "");
			isload = true;
			$.post("${ctx}/common/share/getJsonOrgTree.htm",{pid:"15420968759459"},function(data){
				alert(data);
				if(data == "[]"){
					alert("操作失败，请刷新重试");
					$("#mytree").html("").css("display", "none");
					//document.getElementById("refresh").checked = false;
					return;
				}
				$dswork.ztree.config.async.enable = false;
				$dswork.ztree.config.check.enable = true;
				$dswork.ztree.root = {id:0, pid:-1, isParent:true, name:"单位", checked:true};
				try{$dswork.ztree.nodeArray = eval(data);
				}
				catch(ex){$dswork.ztree.nodeArray = [];}
				$dswork.ztree.nodeArray.push($dswork.ztree.root);
				for(var i = ($dswork.ztree.nodeArray.length - 1); i >=0; i--){
					map.put($dswork.ztree.nodeArray[i].id, $dswork.ztree.nodeArray[i]);
				}
				var notRoot = true, pid = 0, node = null;
				for(var i = ($dswork.ztree.nodeArray.length - 1); i >=0; i--){
					node = $dswork.ztree.nodeArray[i];
					notRoot = true;
					if(node.checked){
						while(notRoot){
							if(node == null){notRoot = false;break;}
							pid = node.pid;
							if(pid == null || pid <= 0){notRoot = false;break;}
							node = map.get(pid);
							node.checked = true;
						}
					}
				}
				for(var i = ($dswork.ztree.nodeArray.length - 1); i >=0; i--){
					if(!$dswork.ztree.nodeArray[i].checked) $dswork.ztree.nodeArray.splice(i, 1);
				}
				$dswork.ztree.load();
				$dswork.ztree.expandAll(true);
			});
		}
		else{
			$("#mytree").css("display", "none");
		}
	});
});
$dswork.ztree.beforeCheck = function(treeId, treeNode){return false;};
// function loaddata(value, objectid, type, ename){
// 	$.post("${ctx}/common/share/getJsonDict.htm",{name:"SSXQ", value:value},function(data){
// 		var a = eval(data);
// 		var s = $("#" + objectid);
// 		if(type == "checkbox" || type == "radio"){
// 			for(var i=0; i<a.length; i++){
// 				s.append("<label><input name=\"" + ename + "\" type=\"" + type + "\" value=\"" + a[i].id + "\" " + (i==0?"checked":"") + " />"+a[i].name+"</label>");
// 			}
// 			s.append("<input name=\"" + ename + "\" type=\"" + type + "\" datatype=\"Group\" msg=\"必选\" value=\"\" style=\"display:none;\" />");
// 		}else{
// 			for(var i=0; i<a.length; i++){
// 				var o = $("<option></option>");
// 				o.text(a[i].name);
// 				o.attr("value", a[i].id);
// 				if(i == 0){o.prop("selected", true);}// 当下拉框size大于1时，默认不会有选中的值
// 				s.append(o);
// 			}
// 			s.change();
// 		}
// 	});
// }
// $(function(){
// 	$("#orgpname").bind("click", function(e){
// 		$dswork.showTree({id:"treeid1",width:400,height:200,root:{name:"选择单位"}
// 			,left:$(this).offset().left, top:$(this).offset().top+20
// 			,url:function(node){return "${ctx}/common/share/getJsonOrg.htm?pid="+node.id;}
// 			,check:function(id, node){if(node.id==0){return false;}else{$("#orgpname").val(node.name);$("#orgpid").val(node.id);$("#orgname").val();$("#orgid").val();}}
// 			,dataFilter:function(id, pnode, data){var d=[];for(var i =0; i < data.length; i++){if(data[i].status == 2){d.push(data[i]);}}return d;}
// 		});
// 	});
// 	$("#orgname").bind("click", function(e){
// 		var rootid = $("#orgpid").val();
// 		if(rootid == ""){alert("请先选择单位");return false;}
// 		$dswork.showTree({id:"treeid2",width:400,height:200,root:{id:rootid, name:"选择部门-"+$("#orgpname").val()}
// 			,left:$(this).offset().left, top:$(this).offset().top+20
// 			,url:function(node){return "${ctx}/common/share/getJsonOrg.htm?pid="+node.id;}
// 			,check:function(id, node){if(node.id==0 || node.status != 1){return false;}else{$("#orgname").val(node.name);$("#orgid").val(node.id);}}
// 			,dataFilter:function(id, pnode, data){var d=[];for(var i =0; i < data.length; i++){if(data[i].status == 1){d.push(data[i]);}}return d;}
// 		});
// 	});
// 	$("#orgname1").bind("click", function(e){
// 		var rootid = $("#orgid").val();
// 		if(rootid == ""){alert("请先选择部门");return false;}
// 		$dswork.showTree({id:"treeid3",width:400,height:200,root:{id:rootid, name:"选择岗位-"+$("#orgname").val()}
// 			,left:$(this).offset().left, top:$(this).offset().top+20
// 			,url:function(node){return "${ctx}/common/share/getJsonOrg.htm?pid="+node.id;}
// 			,check:function(id, node){if(node.id==0 || node.status != 0){return false;}else{$("#orgname1").val(node.name);$("#orgid1").val(node.id);}}
// 			,dataFilter:function(id, pnode, data){var d=[];for(var i =0; i < data.length; i++){if(data[i].status == 0){d.push(data[i]);}}return d;}
// 		});
// 	});
	
// 	$("#v1").bind("change", function(e){
// 		document.getElementById("v2").options.length = 0;
// 		document.getElementById("v3").options.length = 0;
// 		loaddata($(this).val(), "v2");
// 	});
// 	$("#v2").bind("change", function(e){
// 		document.getElementById("v3").options.length = 0;
// 		loaddata($(this).val(), "v3");
// 		e.stopPropagation();
// 	});
// // 	$("#v3").bind("change", function(e){
// // 		document.getElementById("v4").options.length = 0;
// // 		loaddata($(this).val(), "v4");
// // 		e.stopPropagation();
// // 	});
// 	loaddata("", "v1");
// });
</script>
</head>
<body>
<table border="0" cellspacing="1" cellpadding="0" class="listTable">
	<tr>
		<td class="form_title">所属单位</td>
		<td class="form_input"><input type="text" id="orgpname" name="orgpname" readonly="readonly" value="" /><input type="text" id="orgpid" name="orgpid" readonly="readonly" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">所属部门</td>
		<td class="form_input"><input type="text" id="orgname" name="orgname" readonly="readonly" value="" /><input type="text" id="orgid" name="orgid" readonly="readonly" value="" /></td>
	</tr>
	<tr>
		<td class="form_title" id="orgname1">岗位</td>
		<td class="form_input">
		<ul id="mytree" class="ztree" style="display:none;"   />
		</td>
	</tr>
	<tr>
		<td class="form_title">已选人员</td>
		<td class="form_input"><textarea name="resultMen" style="width:400px;"></textarea>
		</td>
	</tr>
</table>
</form>
<br />
</body>
</html>