<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.beans.*" %>
<%@ page import="java.util.*" %>
<%
List<UserDTO> list = (List<UserDTO>) request.getAttribute("list");
%>
<!DOCTYPE html>
<%

%>

<html>
<head>
  <meta charset="UTF-8">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Cute+Font&family=Do+Hyeon&family=Dokdo&family=East+Sea+Dokdo&family=Gaegu&family=Gamja+Flower&family=Gothic+A1&family=Gugi&family=Hi+Melody&family=Jua&family=Kirang+Haerang&family=Nanum+Brush+Script&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Poor+Story&family=Single+Day&family=Song+Myung&family=Stylish&family=Sunflower:wght@300&family=Yeon+Sung&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<title>병원명 검색</title>

<body>
 <div style="height:45px; background-color: #0080FF"> 
   <h2 style="text-align:right; margin-top: 3px; color:white; font-family: 'Nanum Gothic', sans-serif; font-weight: 1000">세상의모든병원</h2>
</div>
 
 
<div style="margin-top: 60px; ">
<form action="hosSearchStep.do">
	<input type="text" name="hosName" style="width:60%; margin-left:150px" class="form-control rounded-pill" placeholder="병원명 혹은 지역을 입력하세요.">
	<input style="margin-top: 10px" type="submit" value="검색" class="btn btn-outline-primary btn-sm">
	<input style="margin-top: 10px" type="button" class="btn btn-danger btn-sm" onclick="window.close()" value="닫기" /><br>
</form>
</div>


<div style="margin-top: 40px">
<table>
	<tbody>
		<%
			if (list != null) {
				int cnt = 0;
				for (UserDTO dto : list) {
		%>
		<tr>
			<th></th>
			<td><%=dto.getSubject() %></td>
			<td><%=dto.getHsname() %></td>
			<td><%=dto.getLocation() %></td>
			<td><%=dto.getHsnum() %></td>
			<td><input type="hidden" id="hsname<%=cnt %>" value="<%=dto.getHsname() %>"></td>
			<td><input type="button" class="btn btn-warning btn-sm" onclick="sendValue<%=cnt%>()" value="사용하기" /></td>
		</tr>
		<%
		cnt += 1;
				}
			}
		%>
	</tbody>
</table>
</div>
<div class="board row justify-content-md-center">
<jsp:include page="/WEB-INF/views/crap/RHosPaging.jsp">
<jsp:param value="${paging.page}" name="page"/>
<jsp:param value="${paging.beginPage}" name="beginPage"/>
<jsp:param value="${paging.endPage}" name="endPage"/>
<jsp:param value="${paging.prev}" name="prev"/>
<jsp:param value="${paging.next}" name="next"/>
</jsp:include>

</div>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script type="text/javascript">
function sendValue0() {
	var openJoinfrm = opener.document.frm;
	var valueTest = document.getElementById("hsname0").value;
	openJoinfrm.Rhosname.value= valueTest;
	console.log(document.getElementById("hsname0").value);
	window.close();
}
function sendValue1() {
	var openJoinfrm = opener.document.frm;
	var valueTest = document.getElementById("hsname1").value;
	openJoinfrm.Rhosname.value= valueTest;
	console.log(document.getElementById("hsname1").value);
	window.close();
}
function sendValue2() {
	var openJoinfrm = opener.document.frm;
	var valueTest = document.getElementById("hsname2").value;
	openJoinfrm.Rhosname.value= valueTest;
	console.log(document.getElementById("hsname2").value);
	window.close();
}
function sendValue3() {
	var openJoinfrm = opener.document.frm;
	var valueTest = document.getElementById("hsname3").value;
	openJoinfrm.Rhosname.value= valueTest;
	console.log(document.getElementById("hsname3").value);
	window.close();
}
function sendValue4() {
	var openJoinfrm = opener.document.frm;
	var valueTest = document.getElementById("hsname4").value;
	openJoinfrm.Rhosname.value= valueTest;
	console.log(document.getElementById("hsname4").value);
	window.close();
}
function sendValue5() {
	var openJoinfrm = opener.document.frm;
	var valueTest = document.getElementById("hsname5").value;
	openJoinfrm.Rhosname.value= valueTest;
	console.log(document.getElementById("hsname5").value);
	window.close();
}
function sendValue6() {
	var openJoinfrm = opener.document.frm;
	var valueTest = document.getElementById("hsname6").value;
	openJoinfrm.Rhosname.value= valueTest;
	console.log(document.getElementById("hsname6").value);
	window.close();
}
function sendValue7() {
	var openJoinfrm = opener.document.frm;
	var valueTest = document.getElementById("hsname7").value;
	openJoinfrm.Rhosname.value= valueTest;
	console.log(document.getElementById("hsname7").value);
	window.close();
}
function sendValue8() {
	var openJoinfrm = opener.document.frm;
	var valueTest = document.getElementById("hsname8").value;
	openJoinfrm.Rhosname.value= valueTest;
	console.log(document.getElementById("hsname8").value);
	window.close();
}
function sendValue9() {
	var openJoinfrm = opener.document.frm;
	var valueTest = document.getElementById("hsname9").value;
	openJoinfrm.Rhosname.value= valueTest;
	console.log(document.getElementById("hsname9").value);
	window.close();
}
</script>
</body>
</html>