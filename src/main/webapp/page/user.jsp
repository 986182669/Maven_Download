<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<base href="<%=basePath%>">
	<title>软件下载中心</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>	

<style>
* {
	font-family:Verdana, Arial, Helvetica, sans-serif;
    font-size:13px;
	color:#444444;
    text-decoration:none;
    margin:0;
	padding:0;
}

.main_table {
	border-top:1px solid #cccccc;
    border-left:1px solid #cccccc;
	border-right:1px solid #cccccc;
	border-bottom:1px solid #cccccc;
	padding:0px;
	background-color:#ffffff;
	table-layout: fixed;
	width:100%;
}

.main_table_tr_i {
	background-color:#BDD0D7;
	color:#cccccc;
	font-size:13px;
	font-weight:bold;
	height:24px;
	text-align:center;
}

.main_table_tr_1 {
	background:#FDFDFD;
	height:20px;
	cursor:pointer;
	text-indent:10px;
}

.main_table_tr_1:hover {
	background:#C5E0E4;
	height:20px;
	cursor:pointer;
	text-indent:10px;
}

.main_table_tr_2 {
	background: #f6f7f9;
	height:20px;
	cursor:pointer;
	text-indent:10px;
}

.main_table_tr_2:hover {
	background:#C5E0E4;
	height:20px;
	cursor:pointer;
	text-indent:10px;
}

a:link,a:visited {font-size:13px;text-decoration: none;color: #444;}
a:hover{color: #0000ff;}

.divAutoWidth {
	overflow:hidden;
	text-overflow:ellipsis;
	white-space:nowrap;
}
</style>
</head>

	<body>
	<table class="main_table" width="100%" border="0">
		<tbody><tr class="main_table_tr_i">
			<td width="5%"><div class="divAutoWidth">序号</div></td>
			<td width="15%"><div class="divAutoWidth">软件名称</div></td>
			<td width="62%"><div class="divAutoWidth">描述与更新</div></td>
			<td width="10%"><div class="divAutoWidth">软件大小</div></td>
			<td width="10%"><div class="divAutoWidth">操作</div></td>
		</tr>
		<s:iterator value="list" status="soft">
		<tr class="main_table_tr_1">
			<td><div class="divAutoWidth"><s:property value="#soft.index+1"/></div></td>
			<td><div class="divAutoWidth"><s:property value="softname"/></div></td>
			<td><div class="divAutoWidth"><s:property value="detail"/></div></td>
			<td><div class="divAutoWidth"><s:property value="size"/></div></td>
			<td><div class="divAutoWidth">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="soft_userdownload.action?id=<s:property value='smid' />">点击下载</a></div></td>
		</tr>
		</s:iterator>
		<tr class="main_table_tr_2">
			
		<tr class="main_table_tr_i">
                     <td colspan="8" style="text-align:center">
					 <label> 
                         <div class="page">
                           <s:property value='pageString' escape='false'/>
                         </div>
					 </label>
					 </td>
		</tr>
	</tbody></table>
</body>
</html>
