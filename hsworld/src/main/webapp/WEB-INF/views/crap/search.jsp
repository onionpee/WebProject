<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.beans.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<%
List<UserDTO> list = (List<UserDTO>) request.getAttribute("list");
%>
<%
String id = (String)session.getAttribute("id1");
int admin = (Integer)session.getAttribute("admin");
String workgroup = null;
request.setAttribute("userid", id);
request.setAttribute("admin", admin);

String sW = (String)request.getAttribute("searchWord");

%>
<html>
<head>
<meta charset="UTF-8">
<title>세상의 모든 병원 검색</title>
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Cute+Font&family=Do+Hyeon&family=Dokdo&family=East+Sea+Dokdo&family=Gaegu&family=Gamja+Flower&family=Gothic+A1&family=Gugi&family=Hi+Melody&family=Jua&family=Kirang+Haerang&family=Nanum+Brush+Script&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Poor+Story&family=Single+Day&family=Song+Myung&family=Stylish&family=Sunflower:wght@300&family=Yeon+Sung&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <title>검색메인</title>
</head>


<%
request.setCharacterEncoding("UTF-8");
%>

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

  
  
  <body>
  <br>
  <!--검색창-->
  <form action="searchTest.do" method="post">
    <div class="mx-auto mt-5 search-bar input-group mb-3">
	  <img src="https://cdn-icons-png.flaticon.com/512/71/71403.png" style="width:7%"/>&nbsp;
      <input name="searchWord"  type="text" class="form-control rounded-pill" placeholder="병원명 혹은 지역을 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2">
      <div class="input-group-append">
      </div>
    </div>
  </form>

  <!--제목-->
  <div class="search-main-title">
    <h2 style="margin: 70px 10px 10px 10px">현재 뜨고있는 병원을 확인해보세요!</h2>
  </div>
  
  
  <!--메인 이미지슬라이드 영역-->
 <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-label="Slide 1" aria-current="true"></button>
    <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2" class=""></button>
    <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3" class=""></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img  class="bd-placeholder-img" style ="width:80%; height:40%; margin: 40px 10px 10px 130px;" 
      src="https://img.freepik.com/premium-photo/long-hospital-corridor-with-empty-seats_117023-1679.jpg?w=2000" class="d-block w-100" alt="hs1">
      <div class="container">
        <div class="carousel-caption">
          <p style="color: black;"> </p>
            <p><a class="btn btn-lg btn-primary" href="search.do">more view</a></p>
        </div>
      </div>
    </div>
    <div class="carousel-item" data-bs-ride="">
      <img  class="bd-placeholder-img" style ="width:80%; height:40%; margin: 40px 10px 10px 130px;" 
      src="https://www.bonebest.co.kr/images/hospital-inside-mobile/waiting-room/waiting-room1.jpg" class="d-block w-100" alt="hs2">
      <div class="container">
        <div class="carousel-caption">
          <p style="color: black;"> </p>
          <p><a class="btn btn-lg btn-primary" href="search.do">more view</a></p>
        </div>
      </div>
    </div>
    <div class="carousel-item">
      <img  class="bd-placeholder-img" style ="width:80%; height:40%; margin: 40px 10px 10px 130px;" 
      src="https://freight.cargo.site/t/original/i/fa6dbd0830661739dee7be56c4bdd5f1113eb4032ce48cfdd3c04fd34478598f/_-2.jpg" class="d-block w-100" alt="hs3">
      
      <div class="container">
        <div class="carousel-caption">
          <p style="color: black;"> </p>
          <p><a class="btn btn-lg btn-primary" href="search.do">more view</a></p>
        </div>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
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
    .search-main-title{
      font-family: 'Black Han Sans', sans-serif;
        text-align: center;
    }


</style>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<%-- 
	<form action="searchOk.do" method="post">
		<select name = "subject">
			<option value = "치과">치과</option>
			<option value = "내과">내과</option>
			<option value = "안과">안과</option>
			<option value = "정형외과">정형외과</option>
			<option value = "피부과">피부과</option>
		</select>
		<input type="text" name = "location">
		<input type="text" name = "hsname">
		<input type="submit" value = "전송">
	</form>
<%
String id = (String)session.getAttribute("id");

if (id == null) {
	out.println("<script>");
	out.println("alert('비 정상적인 접근입니다.');");
	out.println("history.back()");
	out.println("</script>");
}
--%>

</html>