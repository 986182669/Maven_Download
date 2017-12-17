<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LDZ
  Date: 2017/11/28
  Time: 18:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach items="${list}" var="str" varStatus="s">
    <a href="/download/download?fileName=${str}">${str}</a><a href="/download/delete?fileName=${str}">删除</a><br/>
</c:forEach>

</body>
</html>
