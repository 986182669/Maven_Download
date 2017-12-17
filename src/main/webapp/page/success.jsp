<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() 
			+ "://" 
			+ ( "xsaqjy".equals(request.getServerName()) ? "xsaqjy.ljgps.net" : request.getServerName() )
			+ ( request.getServerPort() == 80 ? "" : ":" + request.getServerPort() ) 
			+ path
			+ "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Expires" CONTENT="0">  
<meta http-equiv="Cache-Control" CONTENT="no-cache">
<meta http-equiv="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>结果</title>
</head>
<body>
<script type="text/javascript">
var mes = "${message}";
if(mes.indexOf("已存在") > 0){
	alert(mes);
	var at = '${action}';
	//判断新增时是否有传参数
	if(at.indexOf("?") > 0){
		location.href = "<%=basePath%>${action}&repeat=新增时名称存在";
	}else{
		location.href = "<%=basePath%>${action}?repeat=新增时名称存在";
	}
}else if(mes.indexOf("重复") > 0){
	alert(mes);
	location.href = "<%=basePath%>${action}&repeat=修改时名称重复";
}else{
	alert(mes);
	location.href = "<%=basePath%>${action}";
}

</script>
</body>
</html>