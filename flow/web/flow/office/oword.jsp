<%@ page language="java" pageEncoding="UTF-8"%><%
	String mHttpUrl = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<script language="javascript">
function openOffice(obj){
	var piid = $(obj).parent().find(".piid").val();
	var recordid = $(obj).parent().find(".recordid").val();
	console.log("piid=" + piid);
	console.log("recordid=" + recordid);
	var aurl = "flow/office/openAndSave_Word.jsp?piid=" + piid;
	var username = "admin";
	if(recordid == ""){
		recordid = "<%=dswork.core.util.UniqueId.genId()%>";
		$(obj).parent().find(".recordid").val(recordid);
	}
	aurl = aurl + "&recordid=" + recordid + "&username=" + username;
	var filename = $(obj).parent().find(".filename").val();
	var filetype = $(obj).parent().find(".filetype").val();
	if(filename != ""){
		aurl = aurl + "&filename=" + filename;
	}
	if(filetype != ""){
		aurl = aurl + "&filetype=" + filetype;
	}
	StartBrowserBeforeCheck(aurl);
}

//弹窗应用主要功能 弹窗应用跳转
function StartBrowserBeforeCheck(aurl) {
    $.ajax({
        type: "get",
        async: false,
        url: "http://127.0.0.1:9588/LongListen?id=111",
        jsonp: "hookback",
        dataType: "jsonp",
        success: function (data) {
            Link(aurl, 4);  // skin  0灰色 1蓝色 2黄色 3绿色 4红色   
        },
        error: function () {
             var answer = confirm("未安装支持多浏览器应用程序是否点击安装\n提示：安装的时候360全部点击允许程序所有操作");
            if (answer) {//判断是否点击确定
                window.location.href = "<%=mHttpUrl%>" + "KGBrowserSetup.exe"; //安装KGBrower
            }
        }
    });

    // ie 8+, chrome and some other browsers
    var head = document.head || $('head')[0] || document.documentElement; // code from jquery
    var script = $(head).find('script')[0];
    script.onerror = function (evt) {
         var answer = confirm("未安装支持多浏览器应用程序是否点击安装\n提示：安装的时候360全部点击允许程序所有操作");
            if (answer) {//判断是否点击确定
                window.location.href = "<%=mHttpUrl%>" + "KGBrowserSetup.exe"; //安装KGBrower
            }
        // do some clean  
        // delete script node  
        if (script.parentNode) {
            script.parentNode.removeChild(script);
        }
        // delete jsonCallback global function
        var src = script.src || '';
        var idx = src.indexOf('hookback=');
        if (idx != -1) {
            var idx2 = src.indexOf('&');
            if (idx2 == -1) {
                idx2 = src.length;
            }
            var hookback = src.substring(idx + 13, idx2);
            delete window[hookback];
        }
    };
}
   
function Link(url, skin) {
    var link = "KGBrowser://$link:<%=mHttpUrl%>" + url + "$skin=" + skin + "$tabshow=1" + "$cookie=" + document.cookie; // skin  0灰色 1蓝色 2黄色 3绿色 4红色 
	location.href = link;
	connect();
}

//与弹窗应用页面通讯使用
function connect() {
	$.ajax({
		type : "get",
		async : false,
		url : "http://127.0.0.1:9588/LongListen?id=111", //此代码ip固定，端口号与Edit页面该方法一致，其他固定。
		jsonp : "hookback",
		dataType : "jsonp",
		success : function(data) {
			var jsonobj = eval(data);
			if (jsonobj.ret == "save") { //此判断处理Edit页面Msg传过来的值，判断之后下面做响应处理即可
				alert("save");
				setTimeout("location.reload();", 100);
			}
			if (jsonobj.ret == "returnlist") { //此判断处理Edit页面Msg传过来的值，判断之后下面做响应处理即可
				//alert("returnlist");
				setTimeout("location.reload();", 100);
			}
			if (jsonobj.ret != "none") {
				alert("接收上个页面传输的数据为：" + jsonobj.ret);
			} else if (jsonobj.ret == "none") {
				setTimeout("connect();", 500); //这里一定要调用，不可删除
			}
		},
		error : function(a, b, c) {}
	});
}
</script>