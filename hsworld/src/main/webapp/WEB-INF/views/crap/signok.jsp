<%@page import="java.io.PrintWriter"%>
<%@page import="com.beans.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>


<%
	UserDAO userDAO = new UserDAO();
	Object result = request.getAttribute("result");
	if (result.equals(0)) {
		out.println("<script>");
		out.println("alert('date base error')");
		out.println("history.back()");
		out.println("</script>");
	}
	if (result.equals(1)) {
		out.println("<script>");
		out.println("alert('회원가입이 완료되었습니다')");
		out.println("location.href = 'index.do'");
		out.println("</script>");
	}
	if (result.equals(0)) {
		out.println("<script>");
		out.println("alert('아이디가 중복됩니다.')");
		out.println("history.back()");
		out.println("</script>");
	}
	
%>
</body>
</html>