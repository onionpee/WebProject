<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.beans.*" %>
<%@ page import="java.util.*" %>
<%
List<UserDTO> list = (List<UserDTO>) request.getAttribute("list");
%>
<!DOCTYPE html>
<%
String id = (String)session.getAttribute("id1");
int admin = (Integer)session.getAttribute("admin");
String workgroup = null;
request.setAttribute("userid", id);
request.setAttribute("admin", admin);

request.setAttribute("searchWord", session.getAttribute("searchWord"));


%>
<html>
<head>
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Cute+Font&family=Do+Hyeon&family=Dokdo&family=East+Sea+Dokdo&family=Gaegu&family=Gamja+Flower&family=Gothic+A1&family=Gugi&family=Hi+Melody&family=Jua&family=Kirang+Haerang&family=Nanum+Brush+Script&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Poor+Story&family=Single+Day&family=Song+Myung&family=Stylish&family=Sunflower:wght@300&family=Yeon+Sung&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <title>검색결과 리스트</title>
  

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
 
  
  <!--검색창-->
<form action="searchTest.do" method="post">
    <div class="mx-auto mt-5 search-bar input-group mb-3">
	  <img src="https://cdn-icons-png.flaticon.com/512/71/71403.png" style="width:7%"/>&nbsp;
      <input name="searchWord"  type="text" class="form-control rounded-pill" placeholder="병원명 혹은 지역을 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2">
      <div class="input-group-append">
      </div>
    </div>
  </form>

  <%
  String searchWord = (String)request.getAttribute("searchWord");
  %>
  <!--제목-->
  <div class="search-main-title">
    <h2 style="color: rgb(221, 62, 62);"> " <%=searchWord %> "</h2><h2> 검색 결과 입니다.</h2>
  </div>
  <!--검색 결과 리스트-->
  <%
request.setCharacterEncoding("UTF-8");
%>
<%

if(list != null) {
	int cnt = 1;
	for(UserDTO dto : list) {
%>
<input type="hidden" id="chkValue" name="chkValue">
<form action="searchResult.do" action="post">
    <div class="card mb-3" style="max-width: 540px; margin-left: 30%;">
      <div class="row g-0">
        <div class="col-md-8">
        <!-- 숫자표기 -->
        <div style="float: left; margin-left: 4px; font-weight: 900;"> <%=cnt%> </div>
          <div class="card-body">
            <input class="card-title" style="width: 500px; height: 32px; font-weight:900; font-size:15px; border: 0; border-radius: 15px;
            outline: none; padding-left: 10px; background-color: rgb(233, 233, 233);" name="hosName" value="<%=dto.getHsname()%>">  </div>
            <input class="card-text" style="margin-left:20px; font-size:12px; border: 0; width: 500px; outline: none;" name="hosSubject" value="<%=dto.getSubject() %>"></div>
            <input class="card-text" style="margin-left:20px; font-size:12px; border: 0; width: 500px; outline: none;" name="hosLoc" value="<%=dto.getLocation() %>" ></div>
                   <div>
                <hr style="width: 480px; align-content: center; margin-left: 20px">
            </div>
            <div class="card-text"><input class="card-text" style="font-size:12px; border: 0; width: 500px; outline: none;" 
            name="hosNum" value="<%= dto.getHsnum() %>" ></div>
          
      <input type="submit" id="detailGo" value="상세화면으로 이동" style="outline: none; border: 0; width: 200px; background-color: rgb(178, 235, 244);">
    </div>
	
	

</form>
	<% 
cnt += 1;
	}

	} %>

<div id="result">

</div>
<div style="margin-left:600px; margin-top: 40px; margin-bottom: 30px">
<jsp:include page="/WEB-INF/views/crap/HosPaging.jsp">
<jsp:param value="${paging.page}" name="page"/>
<jsp:param value="${paging.beginPage}" name="beginPage"/>
<jsp:param value="${paging.endPage}" name="endPage"/>
<jsp:param value="${paging.prev}" name="prev"/>
<jsp:param value="${paging.next}" name="next"/>
</jsp:include>
</div>

</body>

<hr>

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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>