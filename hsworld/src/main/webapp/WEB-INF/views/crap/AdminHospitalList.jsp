<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.beans.*" %>
<%@ page import="java.util.*" %>
<%
List<UserDTO> list = (List<UserDTO>) request.getAttribute("hosList");

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
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Cute+Font&family=Do+Hyeon&family=Dokdo&family=East+Sea+Dokdo&family=Gaegu&family=Gamja+Flower&family=Gothic+A1&family=Gugi&family=Hi+Melody&family=Jua&family=Kirang+Haerang&family=Nanum+Brush+Script&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Poor+Story&family=Single+Day&family=Song+Myung&family=Stylish&family=Sunflower:wght@300&family=Yeon+Sung&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  <title>관리자_병원목록</title>
  

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
    
    #paging{
    text-align: center;
    float: left;
    position: relative;
    
    }


  </style>

</head>
<body>
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
<%-- 병원목록조회_관리자 title --%>
<div class="title" style="text-align: center; margin-top:40px" >
    <h3 style="font-family: 'Nanum Gothic', sans-serif; font-weight: 1000;">
    병원목록조회</h3>
    <h5 style="font-family: 'Nanum Gothic', sans-serif; font-weight: 1000; color: grey;">수정하실 병원의 이름 클릭하시면 수정화면으로 넘어갑니다.</h5>
</div>

<%-- 병원목록 --%>
<div class="board row justify-content-md-center">
  <table class="table table-hover" style="width: 900px; text-align:center">
    <thead>
		<tr>
			<th>진료과목</th>
			<th>병원명</th>
			<th>상세주소</th>
			<th>전화번호</th>
		</tr>
	</thead>
		<%
		if (list != null) {
			for (UserDTO dto : list) {
		%>
		<tbody>
      		<tr style="text-align:center">
		        <td><%=dto.getSubject() %></td>
		        <td><a href="AdminHospitalInfo.do?hsname=<%=dto.getLocation() %>"><%=dto.getLocation() %></a></td>
		        <td><%=dto.getHsname()%></td>
		        <td><%=dto.getHsnum() %></td>
		    </tr>
		</tbody>
		<%
			}
		}
		%>
	</table>
	
	 <%-- 검색창 --%>
  <div style="margin-left: 50px; margin-top: 40px">  
  <form action="searchAdminHsListStep.do" class="d-flex mt-3 mt-lg-0" role="search">
			  <select name=column style="text-align: center">
				    <option class="dropdown-item" value="hsname">병원명</option>
				    <option class="dropdown-item" value="hslocal">주소</option>
			  </select>
            <input style="margin-left: 15px;margin-right: 15px" name="searchWord" value="${param.searchWord}" class="form-control me-2" type="text" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
  </form>
</div>
</div>
<div style="text-align: center; margin-left:37%;">
<jsp:include page="/WEB-INF/views/crap/AdminHosPaging.jsp">
<jsp:param value="${paging.page}" name="page"/>
<jsp:param value="${paging.beginPage}" name="beginPage"/>
<jsp:param value="${paging.endPage}" name="endPage"/>
<jsp:param value="${paging.prev}" name="prev"/>
<jsp:param value="${paging.next}" name="next"/>
</jsp:include>
</div>

<br><br>



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