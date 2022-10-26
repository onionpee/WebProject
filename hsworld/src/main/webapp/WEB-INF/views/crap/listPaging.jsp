<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Cute+Font&family=Do+Hyeon&family=Dokdo&family=East+Sea+Dokdo&family=Gaegu&family=Gamja+Flower&family=Gothic+A1&family=Gugi&family=Hi+Melody&family=Jua&family=Kirang+Haerang&family=Nanum+Brush+Script&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Poor+Story&family=Single+Day&family=Song+Myung&family=Stylish&family=Sunflower:wght@300&family=Yeon+Sung&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	
<title>Insert title here</title>
<style type="text/css">
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
	body {
	text-align: center;
	}
	#paging {
	font-size: 12pt;
	}
</style>
</head>
<body>
<div id="paging">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col">
				<nav>
					<ul class="pagination">
						<c:url var="action" value=""/>
						<c:if test="${param.prev}">
								<a href="${action}?page=${param.beginPage-1}"> ◀ </a>
						</c:if>
							<c:forEach begin="${param.beginPage}" end="${param.endPage}" step="1" var="index">
					        <c:choose>
					            <c:when test="${param.page==index}">
					            	<li class="page-item active"><a href="${action}?page=${index}" class="page-link">${index}</a></li>
					            </c:when>
					            <c:otherwise>
					            	<li class ="page-item">
					                <a href="${action}?page=${index}" class="page-link">${index}</a>
					                </li>
					            </c:otherwise>
					        </c:choose>
					    </c:forEach>
					    	<c:if test="${param.next}">
								<a href="${action}?page=${param.endPage+1}"> ▶ </a>
							</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<%-- value값을 비우면 최신순/오래된순/조회순에서 페이지 넘김 처리 원활 --%> 
	<%--
		<c:url var="action" value=""/> 
	<c:if test="${param.prev}">
		<a href="${action}?page=${param.beginPage+1}">next</a>
	</c:if>
	
	<c:forEach begin="${param.beginPage}" end="${param.endPage}" step="1" var="index">
        <c:choose>
            <c:when test="${param.page==index}">
                <strong onclick="fnPaging(${index});">${index}</strong>
            </c:when>
            <c:otherwise>
                <a href="${action}?page=${index}">${index}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
	 --%>

</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>