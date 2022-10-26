<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.beans.*" %>
<%
	int cnt = (Integer)request.getAttribute("result");
	CrapDTO dto = (CrapDTO)request.getAttribute("dto");
%>
<% if (cnt == 0) { %>
<script>
	alert("등록에 실패했습니다.");
	history.back();
</script>
<% } else { %>
<script>
	alert("등록에 성공했습니다.");
	location.href = "view.do?uid=<%=dto.getCR_UID()%>";
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