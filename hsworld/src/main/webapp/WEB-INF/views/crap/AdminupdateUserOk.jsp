<%@page import="com.beans.UserDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
gdgdgdgdg

<%
List<UserDTO> list = (List<UserDTO>) request.getAttribute("list");

if (list == null || list.size() == 0) {
	return;

}
UserDTO dto = list.get(0);
String name = dto.getUser_name();
String userid = dto.getUser_id();
String email = dto.getUser_mail();
String phone = dto.getUser_Num();
int admin = dto.getAdmin();



%>
</body>
</html>