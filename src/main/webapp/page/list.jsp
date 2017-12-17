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
	<title>软件中心</title>
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
		    <td width="2%"><div class="divAutoWidth"><input type="checkbox" name="allbox"  onclick='ckall(this)'/></div></td>
			<td width="5%"><div class="divAutoWidth">序号</div></td>
			<td width="13%"><div class="divAutoWidth">软件名称</div></td>
			<td width="62%"><div class="divAutoWidth">描述与更新</div></td>
			<td width="6%"><div class="divAutoWidth">软件大小</div></td>
			<td width="12%"><div class="divAutoWidth">操作</div></td>
		</tr>
		<s:iterator value="list" status="soft">
		<tr class="main_table_tr_1">
		    <td><div class="divAutoWidth"><input name="id" type="checkbox" class="idcheck" value="<s:property value='smid' />"/></div></td>
			<td><div class="divAutoWidth"><s:property value="#soft.index+1"/></div></td>
			<td><div class="divAutoWidth"><s:property value="softname"/></div></td>
			<td><div class="divAutoWidth"><s:property value="detail"/></div></td>
			<td><div class="divAutoWidth"><s:property value="size"/></div></td>
			<td><div class="divAutoWidth"><a href="${opt.showAction}?id=<s:property value='smid' />">详情</a>&nbsp;&nbsp;<a href="${opt.editAction}?id=<s:property value='smid' />">修改</a>&nbsp;&nbsp;<a href="javascript:deleteData('<s:property value='smid' />')">删除</a>&nbsp;&nbsp;<a href="soft_download.action?id=<s:property value='smid' />">点击下载</a></div></td>
		</tr>
		</s:iterator>
		<tr class="main_table_tr_2">
			
		<tr class="main_table_tr_i">
			<td colspan="4" style="text-align:left">&nbsp;
                         <label>
                         <input type="hidden" name="lx" id="lx" value="3"/>
                         <input type="button" name="button" id="id" value="删 除" onClick="formsubmit()" class="btn" />
                         <input name="button" type="button" onClick="location.href='<%=basePath%>${opt.addAction}'" value="新 增"/>
                         </label>
                     </td>
                     <td colspan="4" style="text-align:left">
					 <label> 
                         <div class="page">
                           <s:property value='pageString' escape='false'/>
                         </div>
					 </label>
					 </td>
		</tr>
	</tbody></table>
	<form action="${opt.delAllAction}" id="softform">
	<input name="ids" type="hidden" id="ids" value="" />
	</form>
</body>

<SCRIPT type="text/javascript">
function deleteData(id) {
	if (window.confirm("确定删除记录?")) {
		var action = '<%=basePath%>${opt.deleteAction}';
		action += "?id=" + id;
		location.href = action;
	}
}

<!--批量删除-->
function formsubmit(){
if( type = "")
{
	alert("请选择操作类型");
	return;
}
var type = $('#lx').val();
if(type = 3)
{
var ids = "";
	$('input[name=id]:checked:checked').each(function(){
			ids += $(this).val() + "#";
	});
	if(ids == ""){
	  	alert("请选择您要操作的数据");
		return ;
	  }
	//location.href = "soft_delAll.action?ids=" + ids;
	$('#ids').val(ids);
	$('#softform').submit();
}else
{
	//location.href = "soft_delAll.action?ids=" + ids;
	$('#softform').submit();
}		
}

function ckall(t){
var _a = document.getElementsByTagName('input');
var _l = _a.length;
var a =[];
for(var i=0;i<_l;i++){
	if(_a[i].type=='checkbox'){
		a.push(_a[i]);
	}
}
var l = a.length;
for(var j=0;j<l;j++){
	a[j].checked = t.checked;
	if(a[j]!=t){
		a[j].onclick = function(){
			if(!this.checked){
				t.checked = false;
			}
		}; 
	}
}
}
</SCRIPT>
</html>
