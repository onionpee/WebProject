<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Object result = request.getAttribute("result");
	if (result.equals(0)) {
		out.println("<script>");
		out.println("alert('회원 정보가 없습니다.')");
		out.println("history.back()");
		out.println("</script>");
	}
	if (result.equals(1)) {
		out.println("<script>");
		out.println("location.href = 'main.do'");
		out.println("</script>");
	}
	if (result.equals(0)) {
		out.println("<script>");
		out.println("alert('중복된 아이디입니다.')");
		out.println("history.back()");
		out.println("</script>");
	}
%>
</body>
</html>