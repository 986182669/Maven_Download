<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="s" uri="/struts-tags" %>--%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
	String repeat = request.getParameter("repeat");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	
<head>
	<base href="<%=basePath%>">
	<title>软件中心</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
   <script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>	
   <script type="text/javascript" src="<%=basePath%>js/ajaxfileupload.js"></script>	
   <script type="text/javascript" src="<%=basePath%>js/jquery-html5Validate.js"></script>		

</head>

<body>
	<form action="${action}" method="post">
		<table align="center" width="50%">
                 <tr style="height:45px;"><td>软件名称</td><td><input style="width:300px;" name="dom.softname" type="text" value="${dom.softname}" required="true" />&nbsp;<font color="red">*</font></td></tr>
                 <tr style="height:45px;"><td>软件详情</td><td><textarea style="width:300px;" name="dom.detail">${dom.detail}</textarea></td></tr>
                 <tr style="height:45px;"><td>软件上传</td><td><input type="file" name="upload" id="uploadId" onChange="$('#filename').val(this.value)" <s:if test="dom == null">required="true"</s:if> value="${dom.filename}"/>&nbsp;<font color="red">*</font>
                 <input type="hidden"  id="filename" name="dom.filename" value="${dom.filename}"/><input type="button" value="上传" onclick="fileupload()" required="true"/></td></tr>
                 <tr style="height:45px;"><td>软件地址</td><td><input style="width:300px;" name="dom.path" type="text" id="path" value="${dom.path}" required="true" readonly="readonly">
                 <input name="dom.size" value="${dom.size }" type="hidden" id="size"/></td></tr>
                 <tr style="height:45px;"><td><input id="qw" value="提交" type="submit"></td><td><input value="重置" type="reset" ></td></tr>
		</table>
	</form>
</body>
<script type="text/javascript">
//获取录入的信息
var repeat = '<%=repeat%>';
if(repeat != "" && repeat != "null"){
	history.back();
}
function fileupload(){
	if($("#uploadId").val()==""){
		alert("请选择文件!");
		return;
	}
	$.ajaxFileUpload({
            url:'fileUpload.action',//用于文件上传的服务器端请求地址
            secureuri:false,//一般设置为false
			dataType:'json',
            fileElementId:'uploadId',//文件上传空间的id属
            success: function(data,status)  //服务器成功响应处理函数
            {
				obj = eval("("+ data+")");
				$('#path').val(obj.url);
				$('#size').val(obj.size);
				alert(obj.message);
            },
			error: function(data,status,e){
				alert("上传失败");
			}
        }
    );
}
</script>
</html>
