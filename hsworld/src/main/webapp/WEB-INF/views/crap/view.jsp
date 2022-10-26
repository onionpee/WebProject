<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.beans.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
List<CrapDTO> list = (List<CrapDTO>) request.getAttribute("list");

if (list == null || list.size() == 0) {
%>
<script>
	alert("해당 정보가 삭제되었거나 존재하지 않음");
	history.back();
</script>
<%
	return;
}
%>
<%
	CrapDTO dto = list.get(0);
	int uid = dto.getCR_UID();
	String title = dto.getCR_TITLE();
	String content = dto.getCR_CONTENT();
	int viewCnt = dto.getCR_VIEWCNT();
	String regDate = dto.getCR_DATE();
	String user = dto.getCR_USER();
    String checkId = (String)session.getAttribute("id");
    
    
    String hsname = dto.getCR_HOSNAME();
    
%>

<%
	pageContext.setAttribute("br", "\n");
%>


<!DOCTYPE html>
<%
String id = (String)session.getAttribute("id1");
int admin = (Integer)session.getAttribute("admin");
String workgroup = null;
request.setAttribute("userid", id);
request.setAttribute("admin", admin);


%>
<html>
<head>
 <meta charset="UTF-8">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Cute+Font&family=Do+Hyeon&family=Dokdo&family=East+Sea+Dokdo&family=Gaegu&family=Gamja+Flower&family=Gothic+A1&family=Gugi&family=Hi+Melody&family=Jua&family=Kirang+Haerang&family=Nanum+Brush+Script&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Poor+Story&family=Single+Day&family=Song+Myung&family=Stylish&family=Sunflower:wght@300&family=Yeon+Sung&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  <title>후기상세페이지</title>
  
<style>
    h1 {
        font-family: 'Black Han Sans', sans-serif;
        text-align: center;
        margin-top: 10px;
        margin-bottom: 0px;
        font-size: 90px;
    }
    h1 span:nth-child(1) {
        color:#4285f4;
    }
    h1 span:nth-child(2) {
        color:#ea4335;
    }
    h1 span:nth-child(3) {
        color:#fbbc05;
    }
    h1 span:nth-child(4) {
        color:#4285f4;
    }
    h1 span:nth-child(5) {
        color:#34a853;
    }
    h1 span:nth-child(6) {
        color:#ea4335;
    }
    h1 span:nth-child(7) {
        color:#fbbc05;
    }
    
    h5 {
       font-family: 'Nanum Gothic', sans-serif;
        text-align: center;
		margin-top: 8px;
        font-size: 15px;
    }
    .search-bar {
      width: 500px;
    }
    .board{
        margin: 50px;
    }
    .registerBt{
        margin: 50px;
    }
    .top-title{

        justify-content: space-between;
        align-items: center;
    }
    
    .board{
      font-family: 'Nanum Gothic', sans-serif;

    }


  </style>
  <header>
  <div class="top-title">
    <a href="main.do" style="text-decoration: none;">
	    <h1>
	        <span>세</span><span>상</span><span>의</span><span>모</span><span>든</span><span>병</span><span>원</span>
	    </h1>
    </a>
  </div>
   <nav class="navbar navbar-expand-lg navbar-dark bg-primary" aria-label="Tenth navbar example">
    <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="notice.do">공지사항</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="search.do">병원검색</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="contactUs.do">contact us</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="dropdown08" data-bs-toggle="dropdown" aria-expanded="false">회원전용</a>
            <ul class="dropdown-menu" aria-labelledby="dropdown08">
              <li><a class="dropdown-item" href="updateUser.do?userid=${id}">회원정보수정</a></li>
              <li><a class="dropdown-item" href="list.do">후기게시판</a></li>
              <li><a class="dropdown-item" href="logout.do">로그아웃</a></li>
            </ul>
          </li>
          
<%

	 if(admin==0){%>
	 		<li class="nav-item dropdown">
				          	<a class="nav-link dropdown-toggle row justify-content-start" href="#" id="dropdown08" 
				          	data-bs-toggle="dropdown" aria-expanded="false">관리자전용</a>
				         	<ul class="dropdown-menu" aria-labelledby="dropdown08">
				          	<li><a class="dropdown-item" href="AdminHospitalList.do">병원목록조회</a></li>
				          	<li><a class="dropdown-item" href="memList.do">회원목록조회</a></li>
				        		<li><a class="dropdown-item" href="logout.do">로그아웃</a></li>
				         	</ul>
				       </li>
<%
	 }
 
%>
					
			</ul>
      </div>
    </div>
  </nav>
</header>
</head>
<body>

	<div class="title" style="text-align: center; margin-top:40px" >
        <h3 style="font-family: 'Nanum Gothic', sans-serif; font-weight: 1000;">후기 작성</h3><br>
    </div>


	<table id="board" border="1" style="margin: 20px 150px 10px 220px; width:65%; height:650px; text-align:center;">
				
		<tr>
			<th class="table-primary" style="width:20%; height:10%"><h5>제목</h5></th>
			<td style="width:50%; text-align: left;"><h5 style="text-align:left; margin-left: 20px"><%=title %></h5></td>
			<th class="table-primary" colspan="2" ><h5>작성자</h5></th>
			<td colspan="2"><%=user %></td>	
		</tr>

		<tr>
			<th class="table-primary" style="width:20%; height:10%"><h5>병원명</h5></th>
			<td style="width:50%; text-align: left;"><h5 style="text-align:left; margin-left: 20px"><%=hsname %></h5></td>
			<th class="table-primary"><h5>조회수</h5></th> 	
			<td style="width:5%"><%=viewCnt %></td>
			<th class="table-primary"><h5>등록일</h5></th>
			<td><%=regDate %></td>
		</tr>

		<tr>
			<th class="table-primary" style="height:86%"><h5>내용</h5></th>
			<td style="width:50%; text-align: left; vertical-align: top; margin-top: 40px" rowspan="2" colspan="5"><h5 style="text-align:left; margin-left: 20px;"><%=content %></h5></td>
		</tr>
	</table>
	
      <div class="board-number">
          <ul class="pagination justify-content-center" style="margin-top: 45px">
            <li class="page-item"><a class="page-link" onclick="location.href='list.do'">이전글</a></li>
            <li class="page-item"><a class="page-link" onclick="location.href='list.do'">다음글</a></li>
          </ul>
      </div>
	
	<div style="margin-top: 35px; text-align: center;">
	
		<button type ="submit" style="width:10%; display: inline-block; " class="btn btn-primary btn-block my-3" onclick="location.href='list.do'">목록으로</button>
		<button type="button" style="width:10%; display: inline-block;" class="btn btn-primary btn-block my-3" onclick="location.href='update.do?uid=<%=uid %>'">수정하기</button>
		<button type="button" style="width:10%; display: inline-block;" class="btn btn-primary btn-block my-3" onclick="location.href='write.do'">신규등록</button>
		<button type ="submit" style="width:10%; display: inline-block;" class="btn btn-danger" onclick="chkDelete(<%=uid %>)">삭제하기</button>
	
	</div>

<footer class="py-3 my-4">
  <ul class="nav justify-content-center border-bottom pb-3 mb-3">
    <li class="nav-item"><a href="main.do" class="nav-link px-2 text-muted">Home</a></li>
    <li class="nav-item"><a href="notice.do" class="nav-link px-2 text-muted">Notice</a></li>
    <li class="nav-item"><a href="list.do" class="nav-link px-2 text-muted">Review</a></li>
    <li class="nav-item"><a href="updateUser.do?userid=${id}" class="nav-link px-2 text-muted">MyPage</a></li>
    <li class="nav-item"><a href="logout.do" class="nav-link px-2 text-muted">LogOut</a></li>
  </ul>
  <p class="text-center text-muted">© 2022 Company, Inc</p>
</footer>
</body>

<script>
function chkDelete(uid) {

<%
   if (user.equals(checkId)) {
%>
let r = confirm("삭제하시겠습니까?");
if(r) {

   location.href = "deleteOk.do?uid=" + uid;
}
<%
} else {
%>
   alert('권한이 없습니다');

<%
}
%>
   }
</script>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</html>