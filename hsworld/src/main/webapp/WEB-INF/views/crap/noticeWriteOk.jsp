<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.beans.*" %>
<%
	int cnt = (Integer)request.getAttribute("result");
	CrapDTO dto = (CrapDTO)request.getAttribute("dto");
%>
<% if (cnt == 0) { %>
<script>
	alert("등록 실패");
	history.back();
</script>
<% } else { %>
<script>
	alert("등록성공");
	location.href = "noticeView.do?uid=<%=dto.getNT_UID()%>"
</script>
<% } %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>