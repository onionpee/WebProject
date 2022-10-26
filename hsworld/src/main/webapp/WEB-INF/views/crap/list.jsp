<%@page import="com.beans.CrapDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
List<CrapDTO> list = (List<CrapDTO>) request.getAttribute("list");
List<CrapDTO> notice_List = (List<CrapDTO>) request.getAttribute("notice_List");
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
  <title>후기 게시판</title>
  
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
        <h3 style="font-family: 'Nanum Gothic', sans-serif; font-weight: 1000;">후기 게시판</h3>
    </div>


<%-- 최신순/오래된순/조회순 선택 --%>
<div style=" float:right; margin-right:250px; font-weight: 1000;">
	<form action="" method="post">
        <select style="text-align: center;" name="" onchange="window.open(value,'_self');">
          <option value="list.do" >선택</option>
          <option value="list.do">최신순</option>
          <option value="listOld.do">오래된순</option>
          <option value="listBest.do" >조회순</option>
        </select>
</form>
</div>


<div class="board row justify-content-center">
  <table class="table table-hover" style="width: 900px;">
    <thead>
      <tr>
        <th scope="col">No.</th>
        <th style = "width:50%; text-align: center" scope="col">제목</th>
        <th style = "width:10%; text-align: center" scope="col">조회수</th>
        <th style = "width:20%; text-align: center" scope="col">작성자</th>
        <th scope="col">작성일</th>
      </tr>
    </thead>
    <tbody>
    	<%
    	if (notice_List != null) {
    		for (CrapDTO dto : notice_List) {
    	%>
    	<tr>
			<th>공지사항</th>
			<td style = "width:50%; text-align: center"><a href="noticeView.do?uid=<%=dto.getNT_UID() %>"><%=dto.getNT_TITLE() %></a></td>
			<td style = "width:10%; text-align: center"><%=dto.getNT_VIEWCNT() %></td>
			<td style = "width:10%; text-align: center">관리자</td>
			<td><%=dto.getNT_DATE() %></td>
		</tr>
		<%
        	}
    	}
		%>
    </tbody>
    <tbody>
		<%
		if (list != null) {
			for (CrapDTO dto : list) {
		%>
		<tr>
			<th><%=dto.getCR_UID()%></th>
			<td style = "width:50%; text-align: center"><a href="view.do?uid=<%=dto.getCR_UID() %>"><%=dto.getCR_TITLE() %></a></td>

			<td style = "width:10%; text-align: center"><%=dto.getCR_VIEWCNT() %></td>
			<td style = "width:20%; text-align: center" ><%=dto.getCR_USER() %></td>	
			<td><%=dto.getCR_DATE() %></td>
		</tr>
		<%
			}
		}
		%>
    </tbody>
  </table>
  
  	          <%-- 검색창 --%>
<div style="margin-left: 280px; margin-top: 40px">  	          
  <form action="searchReviewListStep.do" class="d-flex mt-3 mt-lg-0" role="search">
			  <select name=column >
				    <option class="dropdown-item" value="title">제목</option>
				    <option class="dropdown-item" value="name">작성자</option>
			  </select>
            <input style="margin-left: 15px;margin-right: 15px" name="searchWord" class="form-control me-2" type="text" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
			

  </form>
</div>
<button type ="submit" style="width:10%; margin-top:50px; margin-left:150px;" onclick="location.href='write.do'" class="btn btn-outline-primary btn-block my-3" >글쓰기</button>	

</div>

<!--목록표시바-->

	<div class="board row justify-content-md-center">
	    <jsp:include page="/WEB-INF/views/crap/listPaging.jsp">
		<jsp:param value="${paging.page}" name="page"/>
		<jsp:param value="${paging.beginPage}" name="beginPage"/>
		<jsp:param value="${paging.endPage}" name="endPage"/>
		<jsp:param value="${paging.prev}" name="prev"/>
		<jsp:param value="${paging.next}" name="next"/>
		</jsp:include>
	  </div>
	  


	<br>
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