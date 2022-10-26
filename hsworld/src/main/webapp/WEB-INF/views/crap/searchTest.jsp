<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

String sW = (String)request.getParameter("searchWord");




%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setAttribute("searchWord", sW);

%>
<script>
location.href="searchOk.do";
</script>
</body>
</html>