<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
 int result = (Integer)request.getAttribute("result");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
<% 
	if (result==1) {
%>
alert('탈퇴에 성공!!!');
location.href = "deleteUserOk2.do";
<%
	} else {

%>
alert('정보가 잘못되었씀!!!!');
location.href = "deleteUser.do";
<%
	}
%>


</script>

</head>

<body>



</body>