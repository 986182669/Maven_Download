<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
   <script src="js/jquery.js"></script>
    <script src="js/testDownload.js"></script>

<%--    <script src="ajaxfileupload.js" type="text/javascript"></script>--%>
</head>
<body>
<h2>Hello World!</h2>
<div>
<form id="myform" method="post" enctype="multipart/form-data">

    上传用户<input type="text" name="username" id="username" ><span id="error"></span><br/>
    上传文件<input type="file" name="file" id="file"/><br/>
    <span id="msg"></span>
   <input type="button" id="button" onclick="upload();" value="上传"/><br/>
    <%--<a href="javascript:upload();">上传
    </a>
    <span id="msg"></span>--%>
</form>

</div>
<a href="/download/list">下载</a>
<a href="/"></a>
</body>
</html>
